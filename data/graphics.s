	.section gfx_data, "aw", %progbits

gBattleTextboxTiles:: @ 8D00000
	.incbin "baserom.gba", 0xD00000, 0x4D8

gBattleTextboxPalette:: @ 8D004D8
	.incbin "baserom.gba", 0xD004D8, 0x44

	.align 2
gFile_graphics_interface_menu_map_tilemap:: @ 8D0051C
	.incbin "graphics/interface/menu_map.bin.lz"

	.align 2
gUnknown_8D00748:: @ 8D00748
	.incbin "baserom.gba", 0xD00748, 0x244
	
gUnknown_8D0098C:: @ 8D0098C
	.incbin "baserom.gba", 0xD0098C, 0x244

	.align 2
gFile_graphics_pokemon_palettes_circled_question_mark_palette:: @ 8D00BD0
	.incbin "graphics/pokemon/question_mark/circled/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_palettes_circled_question_mark_shiny_palette:: @ 8D00BE8
	.incbin "graphics/pokemon/question_mark/circled/shiny.gbapal.lz"

	.align 2
gFile_graphics_unused_old_charmap_sheet:: @ 8D00C00
	.incbin "graphics/unused/old_charmap.4bpp.lz" @from ruby

	.align 2
gFile_graphics_unused_old_charmap_tilemap:: @ 8D013D8
	.incbin "graphics/unused/old_charmap.bin.lz" @from ruby

	.align 2
gFile_graphics_unused_old_charmap_palette:: @ 8D01604
	.incbin "graphics/unused/old_charmap.gbapal.lz" @from ruby

	.align 2
gFile_graphics_battle_anims_sprites_smokescreen_impact_sheet:: @ 8D0162C
	.incbin "graphics/battle_anims/sprites/smokescreen_impact.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_smokescreen_impact_palette:: @ 8D0170C
	.incbin "graphics/battle_anims/sprites/smokescreen_impact.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Poke_sheet:: @ 8D01724
	.incbin "graphics/interface/ball/poke.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Poke_palette:: @ 8D017E0
	.incbin "graphics/interface/ball/poke.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Great_sheet:: @ 8D01800
	.incbin "graphics/interface/ball/great.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Great_palette:: @ 8D018BC
	.incbin "graphics/interface/ball/great.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Safari_sheet:: @ 8D018E0
	.incbin "graphics/interface/ball/safari.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Safari_palette:: @ 8D019A4
	.incbin "graphics/interface/ball/safari.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Ultra_sheet:: @ 8D019C8
	.incbin "graphics/interface/ball/ultra.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Ultra_palette:: @ 8D01A7C
	.incbin "graphics/interface/ball/ultra.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Master_sheet:: @ 8D01A9C
	.incbin "graphics/interface/ball/master.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Master_palette:: @ 8D01B5C
	.incbin "graphics/interface/ball/master.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Net_sheet:: @ 8D01B80
	.incbin "graphics/interface/ball/net.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Net_palette:: @ 8D01C40
	.incbin "graphics/interface/ball/net.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Dive_sheet:: @ 8D01C60
	.incbin "graphics/interface/ball/dive.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Dive_palette:: @ 8D01D74
	.incbin "graphics/interface/ball/dive.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Nest_sheet:: @ 8D01D9C
	.incbin "graphics/interface/ball/nest.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Nest_palette:: @ 8D01E60
	.incbin "graphics/interface/ball/nest.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Repeat_sheet:: @ 8D01E84
	.incbin "graphics/interface/ball/repeat.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Repeat_palette:: @ 8D01F44
	.incbin "graphics/interface/ball/repeat.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Timer_sheet:: @ 8D01F68
	.incbin "graphics/interface/ball/timer.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Timer_palette:: @ 8D02060
	.incbin "graphics/interface/ball/timer.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Luxury_sheet:: @ 8D02084
	.incbin "graphics/interface/ball/luxury.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Luxury_palette:: @ 8D021B0
	.incbin "graphics/interface/ball/luxury.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Premier_sheet:: @ 8D021D8
	.incbin "graphics/interface/ball/premier.4bpp.lz"

	.align 2
gFile_graphics_interface_ball_Premier_palette:: @ 8D022C8
	.incbin "graphics/interface/ball/premier.gbapal.lz"

	.align 2
gFile_graphics_interface_ball_Open_sheet:: @ 8D022E8
	.incbin "graphics/interface/ball_open.4bpp.lz"

	.align 2
gFile_graphics_interface_blank_sheet:: @ 8D02364
	.incbin "graphics/interface/blank.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_146_sheet:: @ 8D02460
	.incbin "graphics/battle_anims/sprites/146.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_000_sheet:: @ 8D02520
	.incbin "graphics/battle_anims/sprites/000.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_003_sheet:: @ 8D025D0
	.incbin "graphics/battle_anims/sprites/003.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_004_sheet:: @ 8D02644
	.incbin "graphics/battle_anims/sprites/004.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_005_sheet:: @ 8D026F4
	.incbin "graphics/battle_anims/sprites/005.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_006_sheet:: @ 8D027C8
	.incbin "graphics/battle_anims/sprites/006.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_115_palette:: @ 8D02894
	.incbin "graphics/battle_anims/sprites/115.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_000_palette:: @ 8D028B4
	.incbin "graphics/battle_anims/sprites/000.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_003_palette:: @ 8D028D8
	.incbin "graphics/battle_anims/sprites/003.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_004_palette:: @ 8D02900
	.incbin "graphics/battle_anims/sprites/004.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_005_palette:: @ 8D02914
	.incbin "graphics/battle_anims/sprites/005.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_006_palette:: @ 8D0293C
	.incbin "graphics/battle_anims/sprites/006.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_161_sheet:: @ 8D02964
	.incbin "graphics/battle_anims/sprites/161.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_161_palette:: @ 8D0298C
	.incbin "graphics/battle_anims/sprites/161.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_007_sheet:: @ 8D029B4
	.incbin "graphics/battle_anims/sprites/007.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_007_palette:: @ 8D02B30
	.incbin "graphics/battle_anims/sprites/007.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_008_sheet:: @ 8D02B50
	.incbin "graphics/battle_anims/sprites/008.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_008_palette:: @ 8D02B70
	.incbin "graphics/battle_anims/sprites/008.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_010_palette:: @ 8D02B8C
	.incbin "graphics/battle_anims/sprites/010.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_010_sheet:: @ 8D02BAC
	.incbin "graphics/battle_anims/sprites/010.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_009_sheet:: @ 8D02F8C
	.incbin "graphics/battle_anims/sprites/009.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_009_palette:: @ 8D03274
	.incbin "graphics/battle_anims/sprites/009.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_011_sheet:: @ 8D03294
	.incbin "graphics/battle_anims/sprites/011.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_011_palette:: @ 8D0330C
	.incbin "graphics/battle_anims/sprites/011.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_012_sheet:: @ 8D03334
	.incbin "graphics/battle_anims/sprites/012.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_012_palette:: @ 8D0339C
	.incbin "graphics/battle_anims/sprites/012.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_152_sheet:: @ 8D033B4
	.incbin "graphics/battle_anims/sprites/152.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_152_palette:: @ 8D033FC
	.incbin "graphics/battle_anims/sprites/152.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_013_sheet:: @ 8D03420
	.incbin "graphics/battle_anims/sprites/013.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_013_palette:: @ 8D03454
	.incbin "graphics/battle_anims/sprites/013.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_015_sheet:: @ 8D0346C
	.incbin "graphics/battle_anims/sprites/015.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_015_palette:: @ 8D034D8
	.incbin "graphics/battle_anims/sprites/015.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_016_sheet:: @ 8D03500
	.incbin "graphics/battle_anims/sprites/016.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_016_palette:: @ 8D03570
	.incbin "graphics/battle_anims/sprites/016.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_017_sheet:: @ 8D03580
	.incbin "graphics/battle_anims/sprites/017.4bpp.lz"

	.align 2
gFile_graphics_unknown_Unknown_8D035A0_sheet:: @ 8D035A0
	.incbin "graphics/unknown/unknown_D035A0.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_019_palette:: @ 8D035C4
	.incbin "graphics/battle_anims/sprites/019.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_019_sheet:: @ 8D035E0
	.incbin "graphics/battle_anims/sprites/019.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_020_sheet:: @ 8D036A0
	.incbin "graphics/battle_anims/sprites/020.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_020_palette:: @ 8D0376C
	.incbin "graphics/battle_anims/sprites/020.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_023_palette:: @ 8D03794
	.incbin "graphics/battle_anims/sprites/023.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_023_sheet:: @ 8D037BC
	.incbin "graphics/battle_anims/sprites/023.4bpp.lz"

	.align 2
gFile_graphics_unused_battle_anim_023_palette:: @ 8D038C4
	.incbin "graphics/unused/battle_anim_023.gbapal.lz"

	.align 2
gFile_graphics_unused_music_notes_sheet:: @ 8D038EC
	.incbin "graphics/unused/music_notes.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_021_palette:: @ 8D039E8
	.incbin "graphics/battle_anims/sprites/021.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_021_sheet:: @ 8D03A10
	.incbin "graphics/battle_anims/sprites/021.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_022_palette:: @ 8D03D48
	.incbin "graphics/battle_anims/sprites/022.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_025_palette:: @ 8D03D70
	.incbin "graphics/battle_anims/sprites/025.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_025_sheet:: @ 8D03D98
	.incbin "graphics/battle_anims/sprites/025.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_024_sheet:: @ 8D03E88
	.incbin "graphics/battle_anims/sprites/024.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_024_palette:: @ 8D03F54
	.incbin "graphics/battle_anims/sprites/024.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_031_sheet:: @ 8D03F68
	.incbin "graphics/battle_anims/sprites/031.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_031_palette:: @ 8D04348
	.incbin "graphics/battle_anims/sprites/031.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_032_palette:: @ 8D04368
	.incbin "graphics/battle_anims/sprites/032.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_032_sheet:: @ 8D04390
	.incbin "graphics/battle_anims/sprites/032.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_026_sheet:: @ 8D0447C
	.incbin "graphics/battle_anims/sprites/026.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_026_palette:: @ 8D047B4
	.incbin "graphics/battle_anims/sprites/026.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_027_palette:: @ 8D047DC
	.incbin "graphics/battle_anims/sprites/027.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_027_sheet:: @ 8D04804
	.incbin "graphics/battle_anims/sprites/027.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_028_palette:: @ 8D04B00
	.incbin "graphics/battle_anims/sprites/028.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_028_sheet:: @ 8D04B28
	.incbin "graphics/battle_anims/sprites/028.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_029_sheet:: @ 8D04E78
	.incbin "graphics/battle_anims/sprites/029.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_029_palette:: @ 8D05130
	.incbin "graphics/battle_anims/sprites/029.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_030_sheet:: @ 8D05158
	.incbin "graphics/battle_anims/sprites/030.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_030_palette:: @ 8D05518
	.incbin "graphics/battle_anims/sprites/030.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_033_palette:: @ 8D0553C
	.incbin "graphics/battle_anims/sprites/033.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_033_sheet:: @ 8D05564
	.incbin "graphics/battle_anims/sprites/033.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_034_sheet:: @ 8D05ED4
	.incbin "graphics/battle_anims/sprites/034.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_035_sheet:: @ 8D062A0
	.incbin "graphics/battle_anims/sprites/035.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_036_palette:: @ 8D06638
	.incbin "graphics/battle_anims/sprites/036.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_036_sheet:: @ 8D06660
	.incbin "graphics/battle_anims/sprites/036.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_037_sheet:: @ 8D06A34
	.incbin "graphics/battle_anims/sprites/037.4bpp.lz"

	.align 2
gFile_graphics_unknown_unknown_D06D80_sheet:: @ 8D06D80
	.incbin "graphics/unknown/unknown_D06D80.4bpp.lz"

	.align 2
gFile_graphics_unknown_unknown_D06D80_palette:: @ 8D06DC4
	.incbin "graphics/unknown/unknown_D06D80.gbapal.lz"

	.align 2
gFile_graphics_unknown_unknown_D06D80_2_palette:: @ 8D06DD8
	.incbin "graphics/unknown/unknown_D06D80_2.gbapal.lz"

	.align 2
gFile_graphics_unused_obi1_sheet:: @ 8D06E0C
	.incbin "graphics/unused/obi1.4bpp.lz"

	.align 2
gFile_graphics_unused_obi_palpak1_palette:: @ 8D07170
	.incbin "graphics/unused/obi_palpak1.gbapal.lz"

	.align 2
gFile_graphics_unused_old_pal4_palette:: @ 8D071B4
	.incbin "graphics/unused/old_pal4.gbapal.lz"

	.align 2
gFile_graphics_unused_obi_palpak3_palette:: @ 8D071CC
	.incbin "graphics/unused/obi_palpak3.gbapal.lz"

	.align 2
gFile_graphics_unused_obi2_sheet:: @ 8D07224
	.incbin "graphics/unused/obi2.4bpp.lz"

	.align 2
gFile_graphics_unused_old_battle_interface_tilemap:: @ 8D077EC
	.incbin "graphics/unused/old_battle_interface_tilemap.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_038_palette:: @ 8D078FC
	.incbin "graphics/battle_anims/sprites/038.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_039_palette:: @ 8D07924
	.incbin "graphics/battle_anims/sprites/039.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_038_sheet:: @ 8D0794C
	.incbin "graphics/battle_anims/sprites/038.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_039_sheet:: @ 8D07B70
	.incbin "graphics/battle_anims/sprites/039.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_040_sheet:: @ 8D07E6C
	.incbin "graphics/battle_anims/sprites/040.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_041_sheet:: @ 8D08078
	.incbin "graphics/battle_anims/sprites/041.4bpp.lz"

	.align 2
gFile_graphics_interface_party_menu_hpbar_sheet:: @ 8D08218
	.incbin "graphics/interface/party_menu_hpbar.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_042_sheet:: @ 8D082AC
	.incbin "graphics/battle_anims/sprites/042.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_042_palette:: @ 8D0857C
	.incbin "graphics/battle_anims/sprites/042.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_043_sheet:: @ 8D085A4
	.incbin "graphics/battle_anims/sprites/043.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_043_palette:: @ 8D089A4
	.incbin "graphics/battle_anims/sprites/043.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_044_palette:: @ 8D089CC
	.incbin "graphics/battle_anims/sprites/044.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_044_sheet:: @ 8D089F4
	.incbin "graphics/battle_anims/sprites/044.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_045_palette:: @ 8D08C60
	.incbin "graphics/battle_anims/sprites/045.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_045_sheet:: @ 8D08C88
	.incbin "graphics/battle_anims/sprites/045.4bpp.lz"

	.align 2
gFile_graphics_battle_interface_unused_window_sheet:: @ 8D08EF4
	.incbin "graphics/battle_interface/unused_window.4bpp.lz"

	.align 2
gFile_graphics_battle_interface_unused_window_palette:: @ 8D093B0
	.incbin "graphics/battle_interface/unused_window.gbapal.lz"

	.align 2
gFile_graphics_interface_hp_numbers:: @ 8D093D8
	.incbin "graphics/interface/hp_numbers.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_046:: @ 8D095EC
	.incbin "graphics/battle_anims/sprites/046.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_046_palette:: @ 8D099CC
	.incbin "graphics/battle_anims/sprites/046.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_047_palette:: @ 8D099EC
	.incbin "graphics/battle_anims/sprites/047.gbapal.lz"

	.align 2
gFile_graphics_battle_interface_unused_window2_sheet:: @ 8D09A10
	.incbin "graphics/battle_interface/unused_window2.4bpp.lz"

	.align 2
gFile_graphics_battle_interface_unused_window2bar_sheet:: @ 8D09CAC
	.incbin "graphics/battle_interface/unused_window2bar.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_048_sheet:: @ 8D09CD8
	.incbin "graphics/battle_anims/sprites/048.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_048_palette:: @ 8D09F70
	.incbin "graphics/battle_anims/sprites/048.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_049_palette:: @ 8D09F98
	.incbin "graphics/battle_anims/sprites/049.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_050_palette:: @ 8D09FC0
	.incbin "graphics/battle_anims/sprites/050.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_050_sheet:: @ 8D09FE4
	.incbin "graphics/battle_anims/sprites/050.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_051_sheet:: @ 8D0A084
	.incbin "graphics/battle_anims/sprites/051.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_052_sheet:: @ 8D0A130
	.incbin "graphics/battle_anims/sprites/052.4bpp.lz"

	.align 2
gFile_graphics_unused_line_sketch_sheet:: @ 8D0A1FC
	.incbin "graphics/unused/line_sketch.4bpp.lz"

	.align 2
gFile_graphics_unused_line_sketch_palette:: @ 8D0A380
	.incbin "graphics/unused/line_sketch.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_054_sheet:: @ 8D0A390
	.incbin "graphics/battle_anims/sprites/054.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_054_palette:: @ 8D0A3BC
	.incbin "graphics/battle_anims/sprites/054.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_056_sheet:: @ 8D0A3D4
	.incbin "graphics/battle_anims/sprites/056.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_056_palette:: @ 8D0A87C
	.incbin "graphics/battle_anims/sprites/056.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_055_sheet:: @ 8D0A8A4
	.incbin "graphics/battle_anims/sprites/055.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_057_sheet:: @ 8D0A968
	.incbin "graphics/battle_anims/sprites/057.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_057_palette:: @ 8D0A9F0
	.incbin "graphics/battle_anims/sprites/057.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_058_sheet:: @ 8D0AA14
	.incbin "graphics/battle_anims/sprites/058.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_058_palette:: @ 8D0AE7C
	.incbin "graphics/battle_anims/sprites/058.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_059_sheet:: @ 8D0AEA4
	.incbin "graphics/battle_anims/sprites/059.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_059_palette:: @ 8D0AF04
	.incbin "graphics/battle_anims/sprites/059.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_060_sheet:: @ 8D0AF20
	.incbin "graphics/battle_anims/sprites/060.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_060_palette:: @ 8D0AF48
	.incbin "graphics/battle_anims/sprites/060.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_061_sheet:: @ 8D0AF64
	.incbin "graphics/battle_anims/sprites/061.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_061_palette:: @ 8D0B014
	.incbin "graphics/battle_anims/sprites/061.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_062_sheet:: @ 8D0B034
	.incbin "graphics/battle_anims/sprites/062.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_062_palette:: @ 8D0B404
	.incbin "graphics/battle_anims/sprites/062.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_063_sheet:: @ 8D0B42C
	.incbin "graphics/battle_anims/sprites/063.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_063_palette:: @ 8D0B5E8
	.incbin "graphics/battle_anims/sprites/063.gbapal.lz"

	.align 2
gFile_graphics_unused_metronome_hand_small_sheet:: @ 8D0B610
	.incbin "graphics/unused/metronome_hand_small.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_091_palette:: @ 8D0B680
	.incbin "graphics/battle_anims/sprites/091.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_065_sheet:: @ 8D0B6A4
	.incbin "graphics/battle_anims/sprites/065.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_065_palette:: @ 8D0B7B8
	.incbin "graphics/battle_anims/sprites/065.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_066_sheet:: @ 8D0B7D8
	.incbin "graphics/battle_anims/sprites/066.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_066_palette:: @ 8D0B824
	.incbin "graphics/battle_anims/sprites/066.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_070_sheet:: @ 8D0B84C
	.incbin "graphics/battle_anims/sprites/070.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_070_palette:: @ 8D0B8CC
	.incbin "graphics/battle_anims/sprites/070.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_071_sheet:: @ 8D0B8F4
	.incbin "graphics/battle_anims/sprites/071.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_072_sheet:: @ 8D0BB20
	.incbin "graphics/battle_anims/sprites/072.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_072_palette:: @ 8D0BBF0
	.incbin "graphics/battle_anims/sprites/072.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_073_sheet:: @ 8D0BC08
	.incbin "graphics/battle_anims/sprites/073.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_073_palette:: @ 8D0BD24
	.incbin "graphics/battle_anims/sprites/073.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_075_sheet:: @ 8D0BD44
	.incbin "graphics/battle_anims/sprites/075.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_075_palette:: @ 8D0BFC0
	.incbin "graphics/battle_anims/sprites/075.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_078_sheet:: @ 8D0BFE4
	.incbin "graphics/battle_anims/sprites/078.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_078_palette:: @ 8D0C17C
	.incbin "graphics/battle_anims/sprites/078.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_079_sheet:: @ 8D0C1A4
	.incbin "graphics/battle_anims/sprites/079.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_080_sheet:: @ 8D0C5D4
	.incbin "graphics/battle_anims/sprites/080.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_080_palette:: @ 8D0C938
	.incbin "graphics/battle_anims/sprites/080.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_081_sheet:: @ 8D0C95C
	.incbin "graphics/battle_anims/sprites/081.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_081_palette:: @ 8D0C9E0
	.incbin "graphics/battle_anims/sprites/081.gbapal.lz"

	.align 2
gFile_graphics_unknown_unknown_D0CA04:: @ 8D0CA04
	.incbin "graphics/unknown/unknown_D0CA04.bin"

	.align 2
gFile_graphics_unknown_unknown_D0CA28:: @ 8D0CA28
	.incbin "graphics/unknown/unknown_D0CA28.bin"

	.align 2
gFile_graphics_unknown_unknown_D0CA4C:: @ 8D0CA4C
	.incbin "graphics/unknown/unknown_D0CA4C.bin"

	.align 2
gFile_graphics_unused_line_sketch_2_sheet:: @ 8D0CA70
	.incbin "graphics/unused/line_sketch_2.8bpp.lz"

	.align 2
gFile_graphics_unknown_unknown_D0CAC8:: @ 8D0CAC8
	.incbin "graphics/unknown/unknown_D0CAC8.bin"

	.align 2
gFile_graphics_unused_line_sketch_2_tilemap:: @ 8D0CAE8
	.incbin "graphics/unused/line_sketch_2.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_082_sheet:: @ 8D0CB78
	.incbin "graphics/battle_anims/sprites/082.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_082_palette:: @ 8D0CB9C
	.incbin "graphics/battle_anims/sprites/082.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_083_palette:: @ 8D0CBB0
	.incbin "graphics/battle_anims/sprites/083.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_084_palette:: @ 8D0CBD8
	.incbin "graphics/battle_anims/sprites/084.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_085_palette:: @ 8D0CC00
	.incbin "graphics/battle_anims/sprites/085.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_086_palette:: @ 8D0CC18
	.incbin "graphics/battle_anims/sprites/086.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_088_palette:: @ 8D0CC40
	.incbin "graphics/battle_anims/sprites/088.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_089_palette:: @ 8D0CC5C
	.incbin "graphics/battle_anims/sprites/089.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_090_palette:: @ 8D0CC84
	.incbin "graphics/battle_anims/sprites/090.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_092_palette:: @ 8D0CCA8
	.incbin "graphics/battle_anims/sprites/092.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_093_palette:: @ 8D0CCC4
	.incbin "graphics/battle_anims/sprites/093.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_094_palette:: @ 8D0CCEC
	.incbin "graphics/battle_anims/sprites/094.gbapal.lz"

	.align 2
gFile_graphics_unknown_unknown_D0CD0C:: @ 8D0CD0C
	.incbin "graphics/unknown/unknown_D0CD0C.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_095_palette:: @ 8D0CD2C
	.incbin "graphics/battle_anims/sprites/095.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_096_palette:: @ 8D0CD54
	.incbin "graphics/battle_anims/sprites/096.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_097_palette:: @ 8D0CD70
	.incbin "graphics/battle_anims/sprites/097.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_100_palette:: @ 8D0CD98
	.incbin "graphics/battle_anims/sprites/100.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_101_palette:: @ 8D0CDB4
	.incbin "graphics/battle_anims/sprites/101.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_103_palette:: @ 8D0CDDC
	.incbin "graphics/battle_anims/sprites/103.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_083_sheet:: @ 8D0CE00
	.incbin "graphics/battle_anims/sprites/083.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_084_sheet:: @ 8D0D2A4
	.incbin "graphics/battle_anims/sprites/084.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_085_sheet:: @ 8D0D668
	.incbin "graphics/battle_anims/sprites/085.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_086_sheet:: @ 8D0D720
	.incbin "graphics/battle_anims/sprites/086.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_088_sheet:: @ 8D0D890
	.incbin "graphics/battle_anims/sprites/088.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_089_sheet:: @ 8D0D8E0
	.incbin "graphics/battle_anims/sprites/089.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_090_sheet:: @ 8D0DB54
	.incbin "graphics/battle_anims/sprites/090.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_091_sheet:: @ 8D0DBE4
	.incbin "graphics/battle_anims/sprites/091.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_092_sheet:: @ 8D0DD18
	.incbin "graphics/battle_anims/sprites/092.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_093_sheet:: @ 8D0DD94
	.incbin "graphics/battle_anims/sprites/093.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_094_sheet:: @ 8D0E464
	.incbin "graphics/battle_anims/sprites/094.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_095_sheet:: @ 8D0E608
	.incbin "graphics/battle_anims/sprites/095.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_096_sheet:: @ 8D0E6B8
	.incbin "graphics/battle_anims/sprites/096.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_097_sheet:: @ 8D0E828
	.incbin "graphics/battle_anims/sprites/097.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_098_sheet:: @ 8D0EA08
	.incbin "graphics/battle_anims/sprites/098.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_100_sheet:: @ 8D0EB40
	.incbin "graphics/battle_anims/sprites/100.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_101_sheet:: @ 8D0EC40
	.incbin "graphics/battle_anims/sprites/101.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_102_sheet:: @ 8D0ED70
	.incbin "graphics/battle_anims/sprites/102.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_103_sheet:: @ 8D0EF08
	.incbin "graphics/battle_anims/sprites/103.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_104_sheet:: @ 8D0EF74
	.incbin "graphics/battle_anims/sprites/104.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_104_palette:: @ 8D0F134
	.incbin "graphics/battle_anims/sprites/104.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_105_sheet:: @ 8D0F15C
	.incbin "graphics/battle_anims/sprites/105.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_105_palette:: @ 8D0F6E0
	.incbin "graphics/battle_anims/sprites/105.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_106_sheet:: @ 8D0F708
	.incbin "graphics/battle_anims/sprites/106.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_107_sheet:: @ 8D0F7F8
	.incbin "graphics/battle_anims/sprites/107.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_107_palette:: @ 8D0FBA4
	.incbin "graphics/battle_anims/sprites/107.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_108_sheet:: @ 8D0FBCC
	.incbin "graphics/battle_anims/sprites/108.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_109_sheet:: @ 8D0FF50
	.incbin "graphics/battle_anims/sprites/109.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_109_palette:: @ 8D0FF78
	.incbin "graphics/battle_anims/sprites/109.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_110_sheet:: @ 8D0FFA0
	.incbin "graphics/battle_anims/sprites/110.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_111_sheet:: @ 8D10384
	.incbin "graphics/battle_anims/sprites/111.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_111_palette:: @ 8D103C8
	.incbin "graphics/battle_anims/sprites/111.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_112_sheet:: @ 8D103EC
	.incbin "graphics/battle_anims/sprites/112.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_112_palette:: @ 8D10714
	.incbin "graphics/battle_anims/sprites/112.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_113_sheet:: @ 8D1073C
	.incbin "graphics/battle_anims/sprites/113.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_113_palette:: @ 8D109A8
	.incbin "graphics/battle_anims/sprites/113.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_114_sheet:: @ 8D109D0
	.incbin "graphics/battle_anims/sprites/114.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_114_palette:: @ 8D10AC4
	.incbin "graphics/battle_anims/sprites/114.gbapal.lz"

	.align 2
gFile_graphics_unused_blue_frame_tilemap:: @ 8D10AEC
	.incbin "graphics/unused/blue_frame.bin.lz"

	.align 2
gFile_graphics_unused_redyellowgreen_frame_tilemap:: @ 8D10C04
	.incbin "graphics/unused/redyellowgreen_frame.bin.lz"

	.align 2
gFile_graphics_unused_color_frames_sheet:: @ 8D11004
	.incbin "graphics/unused/color_frames.4bpp.lz"

	.align 2
gFile_graphics_unused_color_frames_palette:: @ 8D115A4
	.incbin "graphics/unused/color_frames.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_115_sheet:: @ 8D115CC
	.incbin "graphics/battle_anims/sprites/115.4bpp.lz"

	.align 2
gFile_graphics_unused_water_splash_sheet:: @ 8D116FC
	.incbin "graphics/unused/water_splash.8bpp.lz"

	.align 2
gFile_graphics_unused_water_splash_tilemap:: @ 8D11884
	.incbin "graphics/unused/water_splash.bin.lz"

	.align 2
gFile_graphics_unused_water_splash_palette:: @ 8D11964
	.incbin "graphics/unused/water_splash.gbapal.lz"

	.align 2
gFile_graphics_unused_basic_frame_sheet:: @ 8D119C4
	.incbin "graphics/unused/basic_frame.4bpp.lz"

	.align 2
gFile_graphics_unused_basic_frame_palette:: @ 8D11A50
	.incbin "graphics/unused/basic_frame.gbapal.lz"

	.align 2
gFile_graphics_unused_basic_frame_tilemap:: @ 8D11A78
	.incbin "graphics/unused/basic_frame.bin.lz"

	.align 2
gUnknown_8D11B84:: @ 8D11B84
	.incbin "baserom.gba", 0xD11B84, 0x40

gUnknown_8D11BC4:: @ 8D11BC4
	.incbin "baserom.gba", 0xD11BC4, 0xF00
	
	.align 2
gFile_graphics_battle_interface_unused_window3_sheet:: @ 8D12AC4
	.incbin "graphics/battle_interface/unused_window3.4bpp.lz"

	.align 2
gFile_graphics_battle_interface_unused_window4_sheet:: @ 8D12C00
	.incbin "graphics/battle_interface/unused_window4.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_116_sheet:: @ 8D12EB0
	.incbin "graphics/battle_anims/sprites/116.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_116_palette:: @ 8D1315C
	.incbin "graphics/battle_anims/sprites/116.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_117_sheet:: @ 8D13184
	.incbin "graphics/battle_anims/sprites/117.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_117_palette:: @ 8D133C0
	.incbin "graphics/battle_anims/sprites/117.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_118_sheet:: @ 8D133DC
	.incbin "graphics/battle_anims/sprites/118.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_118_palette:: @ 8D13574
	.incbin "graphics/battle_anims/sprites/118.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_119_sheet:: @ 8D13590
	.incbin "graphics/battle_anims/sprites/119.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_119_palette:: @ 8D13820
	.incbin "graphics/battle_anims/sprites/119.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_120_sheet:: @ 8D13848
	.incbin "graphics/battle_anims/sprites/120.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_120_palette:: @ 8D1393C
	.incbin "graphics/battle_anims/sprites/120.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_121_sheet:: @ 8D13964
	.incbin "graphics/battle_anims/sprites/121.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_121_palette:: @ 8D13990
	.incbin "graphics/battle_anims/sprites/121.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_122_sheet:: @ 8D139B4
	.incbin "graphics/battle_anims/sprites/122.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_122_palette:: @ 8D13AB0
	.incbin "graphics/battle_anims/sprites/122.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_123_sheet:: @ 8D13ACC
	.incbin "graphics/battle_anims/sprites/123.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_124_sheet:: @ 8D13C08
	.incbin "graphics/battle_anims/sprites/124.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_124_palette:: @ 8D13EA0
	.incbin "graphics/battle_anims/sprites/124.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_125_sheet:: @ 8D13EC8
	.incbin "graphics/battle_anims/sprites/125.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_125_palette:: @ 8D13FB4
	.incbin "graphics/battle_anims/sprites/125.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_126_sheet:: @ 8D13FDC
	.incbin "graphics/battle_anims/sprites/126.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_126_palette:: @ 8D14044
	.incbin "graphics/battle_anims/sprites/126.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_127_sheet:: @ 8D14064
	.incbin "graphics/battle_anims/sprites/127.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_127_palette:: @ 8D14204
	.incbin "graphics/battle_anims/sprites/127.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_128_sheet:: @ 8D14228
	.incbin "graphics/battle_anims/sprites/128.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_128_palette:: @ 8D14494
	.incbin "graphics/battle_anims/sprites/128.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_129_sheet:: @ 8D144B4
	.incbin "graphics/battle_anims/sprites/129.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_130_sheet:: @ 8D14518
	.incbin "graphics/battle_anims/sprites/130.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_130_palette:: @ 8D148E8
	.incbin "graphics/battle_anims/sprites/130.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_131_sheet:: @ 8D14910
	.incbin "graphics/battle_anims/sprites/131.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_132_sheet:: @ 8D14A80
	.incbin "graphics/battle_anims/sprites/132.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_132_palette:: @ 8D14B80
	.incbin "graphics/battle_anims/sprites/132.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_133_sheet:: @ 8D14BA0
	.incbin "graphics/battle_anims/sprites/133.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_133_palette:: @ 8D14C1C
	.incbin "graphics/battle_anims/sprites/133.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_134_sheet:: @ 8D14C44
	.incbin "graphics/battle_anims/sprites/134.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_076_sheet:: @ 8D14D14
	.incbin "graphics/battle_anims/sprites/076.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_076_palette:: @ 8D14F50
	.incbin "graphics/battle_anims/sprites/076.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_077_sheet:: @ 8D14F78
	.incbin "graphics/battle_anims/sprites/077.4bpp.lz"

	.align 2
gFile_graphics_unused_old_contest_sheet:: @ 8D1504C
	.incbin "graphics/unused/old_contest.4bpp.lz"

	.align 2
gFile_graphics_unused_old_contest_palette:: @ 8D15960
	.incbin "graphics/unused/old_contest.gbapal.lz"

	.align 2
gFile_graphics_unused_old_contest_tilemap:: @ 8D15A64
	.incbin "graphics/unused/old_contest.bin.lz"

	.align 2
gFile_graphics_unknown_unknown_D15BE8_tilemap:: @ 8D15BE8
	.incbin "graphics/unknown/unknown_D15BE8.bin.lz"

	.align 2
gFile_graphics_unused_numbers_sheet:: @ 8D15EA8
	.incbin "graphics/unused/numbers.4bpp.lz" @from ruby

	.align 2
gFile_graphics_unused_numbers_palette:: @ 8D15F98
	.incbin "graphics/unused/numbers.gbapal.lz" @from ruby

	.align 2
gFile_graphics_unused_old_contest_2_sheet:: @ 8D15FB8
	.incbin "graphics/unused/old_contest_2.4bpp.lz"

	.align 2
gFile_graphics_unused_old_contest_2_palette:: @ 8D16FC8
	.incbin "graphics/unused/old_contest_2.gbapal.lz"

	.align 2
gFile_graphics_unused_old_contest_2_tilemap:: @ 8D170E0
	.incbin "graphics/unused/old_contest_2.bin.lz"

	.align 2
gFile_graphics_unknown_unknown_D172A8_tilemap:: @ 8D172A8
	.incbin "graphics/unknown/unknown_D172A8.bin.lz"

	.align 2
gFile_graphics_unknown_unknown_D17548_tilemap:: @ 8D17548
	.incbin "graphics/unknown/unknown_D17548.bin.lz"

	.align 2
gFile_graphics_unknown_unknown_D17654_tilemap:: @ 8D17654
	.incbin "graphics/unknown/unknown_D17654.bin.lz"

	.align 2
gFile_graphics_unknown_unknown_D17AB8_tilemap:: @ 8D17AB8
	.incbin "graphics/unknown/unknown_D17AB8.bin.lz"

	.align 2
gUnknown_8D17BE8:: @ 8D17BE8
	.incbin "baserom.gba", 0xD17BE8, 0xB98
	
	.align 2
gFile_graphics_contest_audience_sheet:: @ 8D18780
	.incbin "graphics/contest/audience.4bpp.lz"

	.align 2
gFile_graphics_contest_faces_sheet:: @ 8D193DC
	.incbin "graphics/contest/faces.4bpp.lz"

	.align 2
gFile_graphics_contest_judge_symbols_sheet:: @ 8D194F8
	.incbin "graphics/contest/judge_symbols.4bpp.lz"

	.align 2
gFile_graphics_contest_judge_symbols_palette:: @ 8D1969C
	.incbin "graphics/contest/judge_symbols.gbapal.lz"

	.align 2
gFile_graphics_contest_heart:: @ 8D196C4
	.incbin "graphics/contest/heart.4bpp"

	.align 2
gFile_graphics_unknown_unknown_D196E4_sheet:: @ 8D196E4
	.incbin "graphics/unknown/unknown_D196E4.4bpp.lz"

	.align 2
gFile_graphics_unknown_unknown_D196E4_palette:: @ 8D197D4
	.incbin "graphics/unknown/unknown_D196E4.gbapal.lz"

	.align 2
gUnknown_8D197FC:: @ 8D197FC
	.incbin "baserom.gba", 0xD197FC, 0x868
	
	.align 2
gFile_graphics_contest_misc_2_tilemap_1_tilemap:: @ 8D1A064
	.incbin "graphics/contest/misc_2_tilemap_1.bin.lz"

	.align 2
gFile_graphics_contest_misc_2_tilemap_2_tilemap:: @ 8D1A178
	.incbin "graphics/contest/misc_2_tilemap_2.bin.lz"

	.align 2
gFile_graphics_contest_misc_2_tilemap_3_tilemap:: @ 8D1A2A4
	.incbin "graphics/contest/misc_2_tilemap_3.bin.lz"

	.align 2
gFile_graphics_contest_misc_2_palette:: @ 8D1A42C
	.incbin "graphics/contest/misc_2.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_135_sheet:: @ 8D1A518
	.incbin "graphics/battle_anims/sprites/135.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_135_palette:: @ 8D1A5F0
	.incbin "graphics/battle_anims/sprites/135.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_particles_sheet:: @ 8D1A608
	.incbin "graphics/battle_anims/sprites/particles.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_136_sheet:: @ 8D1A6B8
	.incbin "graphics/battle_anims/sprites/136.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_136_palette:: @ 8D1A6DC
	.incbin "graphics/battle_anims/sprites/136.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_137_sheet:: @ 8D1A704
	.incbin "graphics/battle_anims/sprites/137.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_139_sheet:: @ 8D1A908
	.incbin "graphics/battle_anims/sprites/139.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_139_palette:: @ 8D1AAF8
	.incbin "graphics/battle_anims/sprites/139.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_145_sheet:: @ 8D1AB18
	.incbin "graphics/battle_anims/sprites/145.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_138_sheet:: @ 8D1ACB8
	.incbin "graphics/battle_anims/sprites/138.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_140_sheet:: @ 8D1AE04
	.incbin "graphics/battle_anims/sprites/140.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_140_palette:: @ 8D1AE84
	.incbin "graphics/battle_anims/sprites/140.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_141_sheet:: @ 8D1AEA4
	.incbin "graphics/battle_anims/sprites/141.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_141_palette:: @ 8D1AFAC
	.incbin "graphics/battle_anims/sprites/141.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_142_sheet:: @ 8D1AFCC
	.incbin "graphics/battle_anims/sprites/142.4bpp.lz"

	.align 2
gFile_graphics_unused_old_beatup_sheet:: @ 8D1B02C
	.incbin "graphics/unused/old_beatup.4bpp.lz"

	.align 2
gFile_graphics_unused_old_beatup_palette:: @ 8D1B0C8
	.incbin "graphics/unused/old_beatup.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_147_sheet:: @ 8D1B0E4
	.incbin "graphics/battle_anims/sprites/147.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_147_palette:: @ 8D1B1F8
	.incbin "graphics/battle_anims/sprites/147.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_149_sheet:: @ 8D1B220
	.incbin "graphics/battle_anims/sprites/149.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_148_sheet:: @ 8D1B2F0
	.incbin "graphics/battle_anims/sprites/148.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_148_palette:: @ 8D1B3D4
	.incbin "graphics/battle_anims/sprites/148.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_259_palette:: @ 8D1B3F4
	.incbin "graphics/battle_anims/sprites/259.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_074_sheet:: @ 8D1B414
	.incbin "graphics/battle_anims/sprites/074.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_074_palette:: @ 8D1B47C
	.incbin "graphics/battle_anims/sprites/074.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_150_sheet:: @ 8D1B4A0
	.incbin "graphics/battle_anims/sprites/150.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_150_palette:: @ 8D1B574
	.incbin "graphics/battle_anims/sprites/150.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_151_sheet:: @ 8D1B590
	.incbin "graphics/battle_anims/sprites/151.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_153_sheet:: @ 8D1B688
	.incbin "graphics/battle_anims/sprites/153.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_153_palette:: @ 8D1B6F4
	.incbin "graphics/battle_anims/sprites/153.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_154_sheet:: @ 8D1B70C
	.incbin "graphics/battle_anims/sprites/154.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_154_palette:: @ 8D1B7B8
	.incbin "graphics/battle_anims/sprites/154.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_155_sheet:: @ 8D1B7D8
	.incbin "graphics/battle_anims/sprites/155.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_155_palette:: @ 8D1B8A0
	.incbin "graphics/battle_anims/sprites/155.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_156_sheet:: @ 8D1B8C0
	.incbin "graphics/battle_anims/sprites/156.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_156_palette:: @ 8D1BAD8
	.incbin "graphics/battle_anims/sprites/156.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_157_sheet:: @ 8D1BB00
	.incbin "graphics/battle_anims/sprites/157.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_157_palette:: @ 8D1BB64
	.incbin "graphics/battle_anims/sprites/157.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_158_sheet:: @ 8D1BB7C
	.incbin "graphics/battle_anims/sprites/158.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_158_palette:: @ 8D1BC44
	.incbin "graphics/battle_anims/sprites/158.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_159_sheet:: @ 8D1BC68
	.incbin "graphics/battle_anims/sprites/159.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_159_palette:: @ 8D1BCE4
	.incbin "graphics/battle_anims/sprites/159.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_160_sheet:: @ 8D1BD0C
	.incbin "graphics/battle_anims/sprites/160.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_160_palette:: @ 8D1BDB4
	.incbin "graphics/battle_anims/sprites/160.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_144_sheet:: @ 8D1BDDC
	.incbin "graphics/battle_anims/sprites/144.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_144_palette:: @ 8D1BE54
	.incbin "graphics/battle_anims/sprites/144.gbapal.lz"

	.align 2
gFile_graphics_unknown_unknown_D1BE74_sheet:: @ 8D1BE74
	.incbin "graphics/unknown/unknown_D1BE74.4bpp.lz"

	.align 2
gFile_graphics_unknown_unknown_D1BE74_palette:: @ 8D1BE9C
	.incbin "graphics/unknown/unknown_D1BE74.gbapal.lz"

	.align 2
gFile_graphics_unknown_unknown_D1BE74_tilemap:: @ 8D1BEB4
	.incbin "graphics/unknown/unknown_D1BE74.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_162_sheet:: @ 8D1BFB8
	.incbin "graphics/battle_anims/sprites/162.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_162_palette:: @ 8D1C03C
	.incbin "graphics/battle_anims/sprites/162.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_163_sheet:: @ 8D1C05C
	.incbin "graphics/battle_anims/sprites/163.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_163_palette:: @ 8D1C0BC
	.incbin "graphics/battle_anims/sprites/163.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_288_palette:: @ 8D1C0D4
	.incbin "graphics/battle_anims/sprites/288.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_164_palette:: @ 8D1C0EC
	.incbin "graphics/battle_anims/sprites/164.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_165_palette:: @ 8D1C104
	.incbin "graphics/battle_anims/sprites/165.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_166_sheet:: @ 8D1C11C
	.incbin "graphics/battle_anims/sprites/166.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_166_palette:: @ 8D1C428
	.incbin "graphics/battle_anims/sprites/166.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_167_palette:: @ 8D1C448
	.incbin "graphics/battle_anims/sprites/167.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_168_palette:: @ 8D1C468
	.incbin "graphics/battle_anims/sprites/168.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_169_palette:: @ 8D1C488
	.incbin "graphics/battle_anims/sprites/169.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_170_palette:: @ 8D1C4A8
	.incbin "graphics/battle_anims/sprites/170.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_171_sheet:: @ 8D1C4C8
	.incbin "graphics/battle_anims/sprites/171.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_171_palette:: @ 8D1C514
	.incbin "graphics/battle_anims/sprites/171.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_172_palette:: @ 8D1C53C
	.incbin "graphics/battle_anims/sprites/172.gbapal.lz"

	.align 2
gFile_graphics_contest_judge_sheet:: @ 8D1C55C
	.incbin "graphics/contest/judge.4bpp.lz"

	.align 2
gFile_graphics_contest_judge_palette:: @ 8D1C830
	.incbin "graphics/contest/judge.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_001_sheet:: @ 8D1C858
	.incbin "graphics/battle_anims/sprites/001.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_001_palette:: @ 8D1C90C
	.incbin "graphics/battle_anims/sprites/001.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_173_sheet:: @ 8D1C934
	.incbin "graphics/battle_anims/sprites/173.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_00_sheet:: @ 8D1C9BC
	.incbin "graphics/battle_anims/backgrounds/00.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_00_palette:: @ 8D1CFB4
	.incbin "graphics/battle_anims/backgrounds/00.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_00_tilemap:: @ 8D1CFD4
	.incbin "graphics/battle_anims/backgrounds/00.bin.lz"

	.align 2
gFile_graphics_battle_anims_masks_metal_shine_sheet:: @ 8D1D224
	.incbin "graphics/battle_anims/masks/metal_shine.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_masks_metal_shine_palette:: @ 8D1D360
	.incbin "graphics/battle_anims/masks/metal_shine.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_metal_shine_tilemap:: @ 8D1D388
	.incbin "graphics/battle_anims/masks/metal_shine.bin.lz"

	.align 2
gFile_graphics_unused_goosuto_sheet:: @ 8D1D4FC
	.incbin "graphics/unused/goosuto.4bpp.lz"

	.align 2
gFile_graphics_unused_goosuto_palette:: @ 8D1D60C
	.incbin "graphics/unused/goosuto.gbapal.lz"

	.align 2
gFile_graphics_unused_goosuto_tilemap:: @ 8D1D624
	.incbin "graphics/unused/goosuto.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_174_sheet:: @ 8D1D774
	.incbin "graphics/battle_anims/sprites/174.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_174_palette:: @ 8D1D814
	.incbin "graphics/battle_anims/sprites/174.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_175_sheet:: @ 8D1D83C
	.incbin "graphics/battle_anims/sprites/175.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_175_palette:: @ 8D1D8A0
	.incbin "graphics/battle_anims/sprites/175.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_176_sheet:: @ 8D1D8C8
	.incbin "graphics/battle_anims/sprites/176.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_176_palette:: @ 8D1DA20
	.incbin "graphics/battle_anims/sprites/176.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_177_sheet:: @ 8D1DA48
	.incbin "graphics/battle_anims/sprites/177.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_177_palette:: @ 8D1DB0C
	.incbin "graphics/battle_anims/sprites/177.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_178_sheet:: @ 8D1DB24
	.incbin "graphics/battle_anims/sprites/178.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_178_palette:: @ 8D1DC8C
	.incbin "graphics/battle_anims/sprites/178.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_179_palette:: @ 8D1DCB4
	.incbin "graphics/battle_anims/sprites/179.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_179_sheet:: @ 8D1DCDC
	.incbin "graphics/battle_anims/sprites/179.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_180_sheet:: @ 8D1DDB8
	.incbin "graphics/battle_anims/sprites/180.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_181_sheet:: @ 8D1DDD0
	.incbin "graphics/battle_anims/sprites/181.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_182_sheet:: @ 8D1E160
	.incbin "graphics/battle_anims/sprites/182.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_182_palette:: @ 8D1E204
	.incbin "graphics/battle_anims/sprites/182.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_183_sheet:: @ 8D1E22C
	.incbin "graphics/battle_anims/sprites/183.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_183_palette:: @ 8D1E4A4
	.incbin "graphics/battle_anims/sprites/183.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_184_sheet:: @ 8D1E4CC
	.incbin "graphics/battle_anims/sprites/184.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_184_palette:: @ 8D1E620
	.incbin "graphics/battle_anims/sprites/184.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_185_sheet:: @ 8D1E648
	.incbin "graphics/battle_anims/sprites/185.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_185_palette:: @ 8D1EA5C
	.incbin "graphics/battle_anims/sprites/185.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_03_sheet:: @ 8D1EA84
	.incbin "graphics/battle_anims/backgrounds/03.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_03_palette:: @ 8D1EC54
	.incbin "graphics/battle_anims/backgrounds/03.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_03_tilemap:: @ 8D1EC78
	.incbin "graphics/battle_anims/backgrounds/03.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_187_sheet:: @ 8D1ED40
	.incbin "graphics/battle_anims/sprites/187.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_187_palette:: @ 8D1EF30
	.incbin "graphics/battle_anims/sprites/187.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_186_sheet:: @ 8D1EF50
	.incbin "graphics/battle_anims/sprites/186.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_186_palette:: @ 8D1F31C
	.incbin "graphics/battle_anims/sprites/186.gbapal.lz"
	
	.align 2
gUnknown_8D1F340:: @ 8D1F340
	.incbin "baserom.gba", 0xD1F340, 0x2C4
	
	.align 2
gUnknown_8D1F604:: @ 8D1F604
	.incbin "baserom.gba", 0xD1F604, 0x190
	
	.align 2
gUnknown_8D1F794:: @ 8D1F794
	.incbin "baserom.gba", 0xD1F794, 0x194
	
	.align 2
gUnknown_8D1F928:: @ 8D1F928
	.incbin "baserom.gba", 0xD1F928, 0x194
	
	.align 2
gFile_graphics_battle_interface_healthbox_safari_sheet:: @ 8D1FABC
	.incbin "graphics/battle_interface/healthbox_safari.4bpp.lz"

	.align 2
gFile_graphics_unused_shadow_sheet:: @ 8D1FD34
	.incbin "graphics/unused/shadow.4bpp.lz"

	.align 2
gFile_graphics_unused_shadow_palette:: @ 8D1FD94
	.incbin "graphics/unused/shadow.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_014_sheet:: @ 8D1FDA8
	.incbin "graphics/battle_anims/sprites/014.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_014_palette:: @ 8D1FE3C
	.incbin "graphics/battle_anims/sprites/014.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_190_sheet:: @ 8D1FE58
	.incbin "graphics/battle_anims/sprites/190.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_190_palette:: @ 8D200B4
	.incbin "graphics/battle_anims/sprites/190.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_191_sheet:: @ 8D200D8
	.incbin "graphics/battle_anims/sprites/191.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_191_palette:: @ 8D20344
	.incbin "graphics/battle_anims/sprites/191.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_189_sheet:: @ 8D2036C
	.incbin "graphics/battle_anims/sprites/189.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_189_palette:: @ 8D203F0
	.incbin "graphics/battle_anims/sprites/189.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_192_sheet:: @ 8D20410
	.incbin "graphics/battle_anims/sprites/192.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_192_palette:: @ 8D20690
	.incbin "graphics/battle_anims/sprites/192.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_193_sheet:: @ 8D206B8
	.incbin "graphics/battle_anims/sprites/193.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_193_palette:: @ 8D20814
	.incbin "graphics/battle_anims/sprites/193.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_curse_sheet:: @ 8D2083C
	.incbin "graphics/battle_anims/masks/curse.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_masks_curse_tilemap:: @ 8D20858
	.incbin "graphics/battle_anims/masks/curse.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_002_sheet:: @ 8D20958
	.incbin "graphics/battle_anims/sprites/002.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_002_palette:: @ 8D20A3C
	.incbin "graphics/battle_anims/sprites/002.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_196_sheet:: @ 8D20A64
	.incbin "graphics/battle_anims/sprites/196.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_196_palette:: @ 8D20E08
	.incbin "graphics/battle_anims/sprites/196.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_194_sheet:: @ 8D20E20
	.incbin "graphics/battle_anims/sprites/194.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_194_palette:: @ 8D21158
	.incbin "graphics/battle_anims/sprites/194.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_195_sheet:: @ 8D21180
	.incbin "graphics/battle_anims/sprites/195.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_195_palette:: @ 8D21238
	.incbin "graphics/battle_anims/sprites/195.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_197_sheet:: @ 8D21258
	.incbin "graphics/battle_anims/sprites/197.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_197_palette:: @ 8D213C8
	.incbin "graphics/battle_anims/sprites/197.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_198_sheet:: @ 8D213F0
	.incbin "graphics/battle_anims/sprites/198.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_198_palette:: @ 8D217E0
	.incbin "graphics/battle_anims/sprites/198.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_199_sheet:: @ 8D21808
	.incbin "graphics/battle_anims/sprites/199.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_199_palette:: @ 8D218D0
	.incbin "graphics/battle_anims/sprites/199.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_200_sheet:: @ 8D218EC
	.incbin "graphics/battle_anims/sprites/200.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_200_palette:: @ 8D21A2C
	.incbin "graphics/battle_anims/sprites/200.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_201_sheet:: @ 8D21A48
	.incbin "graphics/battle_anims/sprites/201.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_201_palette:: @ 8D220B8
	.incbin "graphics/battle_anims/sprites/201.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_204_sheet:: @ 8D220E0
	.incbin "graphics/battle_anims/sprites/204.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_204_palette:: @ 8D22254
	.incbin "graphics/battle_anims/sprites/204.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_202_sheet:: @ 8D2227C
	.incbin "graphics/battle_anims/sprites/202.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_202_palette:: @ 8D223E4
	.incbin "graphics/battle_anims/sprites/202.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_203_sheet:: @ 8D22408
	.incbin "graphics/battle_anims/sprites/203.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_203_palette:: @ 8D225B4
	.incbin "graphics/battle_anims/sprites/203.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_206_sheet:: @ 8D225D8
	.incbin "graphics/battle_anims/sprites/206.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_206_palette:: @ 8D227E4
	.incbin "graphics/battle_anims/sprites/206.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_205_sheet:: @ 8D22878
	.incbin "graphics/battle_anims/sprites/205.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_205_palette:: @ 8D22AAC
	.incbin "graphics/battle_anims/sprites/205.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_207_sheet:: @ 8D22AD0
	.incbin "graphics/battle_anims/sprites/207.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_207_palette:: @ 8D22B9C
	.incbin "graphics/battle_anims/sprites/207.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_208_sheet:: @ 8D22BC0
	.incbin "graphics/battle_anims/sprites/208.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_209_sheet:: @ 8D22FB0
	.incbin "graphics/battle_anims/sprites/209.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_209_palette:: @ 8D232B8
	.incbin "graphics/battle_anims/sprites/209.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_064_sheet:: @ 8D232D8
	.incbin "graphics/battle_anims/sprites/064.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_064_palette:: @ 8D233C8
	.incbin "graphics/battle_anims/sprites/064.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_210_sheet:: @ 8D233EC
	.incbin "graphics/battle_anims/sprites/210.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_219_palette:: @ 8D23454
	.incbin "graphics/battle_anims/sprites/219.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_210_palette:: @ 8D23474
	.incbin "graphics/battle_anims/sprites/210.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_216_palette:: @ 8D23494
	.incbin "graphics/battle_anims/sprites/216.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_attract_sheet:: @ 8D234B4
	.incbin "graphics/battle_anims/backgrounds/attract.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_attract_palette:: @ 8D23F24
	.incbin "graphics/battle_anims/backgrounds/attract.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_attract_tilemap:: @ 8D23F4C
	.incbin "graphics/battle_anims/backgrounds/attract.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_217_sheet:: @ 8D241C8
	.incbin "graphics/battle_anims/sprites/217.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_217_palette:: @ 8D24230
	.incbin "graphics/battle_anims/sprites/217.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_212_sheet:: @ 8D24250
	.incbin "graphics/battle_anims/sprites/212.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_211_sheet:: @ 8D24484
	.incbin "graphics/battle_anims/sprites/211.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_213_sheet:: @ 8D244D4
	.incbin "graphics/battle_anims/sprites/213.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_211_palette:: @ 8D24740
	.incbin "graphics/battle_anims/sprites/211.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_214_sheet:: @ 8D24764
	.incbin "graphics/battle_anims/sprites/214.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_215_sheet:: @ 8D249F4
	.incbin "graphics/battle_anims/sprites/215.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_215_palette:: @ 8D24B80
	.incbin "graphics/battle_anims/sprites/215.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_scary_face_palette:: @ 8D24BA4
	.incbin "graphics/battle_anims/backgrounds/scary_face.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_scary_face_sheet:: @ 8D24BCC
	.incbin "graphics/battle_anims/backgrounds/scary_face.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_218_palette:: @ 8D24DFC
	.incbin "graphics/battle_anims/sprites/218.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_218_sheet:: @ 8D24E24
	.incbin "graphics/battle_anims/sprites/218.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_087_sheet:: @ 8D24ED0
	.incbin "graphics/battle_anims/sprites/087.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_087_palette:: @ 8D24F28
	.incbin "graphics/battle_anims/sprites/087.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_018_sheet:: @ 8D24F50
	.incbin "graphics/battle_anims/sprites/018.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_018_palette:: @ 8D24F8C
	.incbin "graphics/battle_anims/sprites/018.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_220_palette:: @ 8D24FA8
	.incbin "graphics/battle_anims/sprites/220.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_220_sheet:: @ 8D24FD0
	.incbin "graphics/battle_anims/sprites/220.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_221_palette:: @ 8D250FC
	.incbin "graphics/battle_anims/sprites/221.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_221_sheet:: @ 8D2511C
	.incbin "graphics/battle_anims/sprites/221.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_222_sheet:: @ 8D25380
	.incbin "graphics/battle_anims/sprites/222.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_222_palette:: @ 8D2566C
	.incbin "graphics/battle_anims/sprites/222.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_223_palette:: @ 8D25694
	.incbin "graphics/battle_anims/sprites/223.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_223_sheet:: @ 8D256B4
	.incbin "graphics/battle_anims/sprites/223.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_224_palette:: @ 8D25948
	.incbin "graphics/battle_anims/sprites/224.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_224_sheet:: @ 8D25968
	.incbin "graphics/battle_anims/sprites/224.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_230_palette:: @ 8D25A64
	.incbin "graphics/battle_anims/sprites/230.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_230_sheet:: @ 8D25A8C
	.incbin "graphics/battle_anims/sprites/230.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_228_palette:: @ 8D25CD0
	.incbin "graphics/battle_anims/sprites/228.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_228_sheet:: @ 8D25CF0
	.incbin "graphics/battle_anims/sprites/228.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_04_palette:: @ 8D25D98
	.incbin "graphics/battle_anims/backgrounds/04.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_04_sheet:: @ 8D25DC0
	.incbin "graphics/battle_anims/backgrounds/04.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_04_tilemap:: @ 8D26B2C
	.incbin "graphics/battle_anims/backgrounds/04.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_05_tilemap:: @ 8D27028
	.incbin "graphics/battle_anims/backgrounds/05.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_06_tilemap:: @ 8D274F8
	.incbin "graphics/battle_anims/backgrounds/06.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_225_sheet:: @ 8D27938
	.incbin "graphics/battle_anims/sprites/225.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_225_palette:: @ 8D27ABC
	.incbin "graphics/battle_anims/sprites/225.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_227_sheet:: @ 8D27AE4
	.incbin "graphics/battle_anims/sprites/227.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_226_sheet:: @ 8D27C2C
	.incbin "graphics/battle_anims/sprites/226.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_226_palette:: @ 8D27CB8
	.incbin "graphics/battle_anims/sprites/226.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_229_sheet:: @ 8D27CDC
	.incbin "graphics/battle_anims/sprites/229.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_229_palette:: @ 8D27E98
	.incbin "graphics/battle_anims/sprites/229.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_099_sheet:: @ 8D27EC0
	.incbin "graphics/battle_anims/sprites/099.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_099_palette:: @ 8D27FE0
	.incbin "graphics/battle_anims/sprites/099.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_232_sheet:: @ 8D28008
	.incbin "graphics/battle_anims/sprites/232.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_231_palette:: @ 8D28540
	.incbin "graphics/battle_anims/sprites/231.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_231_sheet:: @ 8D28568
	.incbin "graphics/battle_anims/sprites/231.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_233_sheet:: @ 8D28738
	.incbin "graphics/battle_anims/sprites/233.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_233_palette:: @ 8D287BC
	.incbin "graphics/battle_anims/sprites/233.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_234_sheet:: @ 8D287E4
	.incbin "graphics/battle_anims/sprites/234.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_234_palette:: @ 8D289A4
	.incbin "graphics/battle_anims/sprites/234.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_238_sheet:: @ 8D289C8
	.incbin "graphics/battle_anims/sprites/238.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_238_palette:: @ 8D28A30
	.incbin "graphics/battle_anims/sprites/238.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_235_sheet:: @ 8D28A54
	.incbin "graphics/battle_anims/sprites/235.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_235_palette:: @ 8D28AA4
	.incbin "graphics/battle_anims/sprites/235.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_236_palette:: @ 8D28AC0
	.incbin "graphics/battle_anims/sprites/236.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_237_palette:: @ 8D28ADC
	.incbin "graphics/battle_anims/sprites/237.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_07_sheet:: @ 8D28AF8
	.incbin "graphics/battle_anims/backgrounds/07.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_07_palette:: @ 8D28CA0
	.incbin "graphics/battle_anims/backgrounds/07.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_18_palette:: @ 8D28CC8
	.incbin "graphics/battle_anims/backgrounds/18.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_07_tilemap:: @ 8D28CF0
	.incbin "graphics/battle_anims/backgrounds/07.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_08_tilemap:: @ 8D28E80
	.incbin "graphics/battle_anims/backgrounds/08.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_20_sheet:: @ 8D2900C
	.incbin "graphics/battle_anims/backgrounds/20.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_20_palette:: @ 8D29A34
	.incbin "graphics/battle_anims/backgrounds/20.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_20_tilemap:: @ 8D29A54
	.incbin "graphics/battle_anims/backgrounds/20.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_09_tilemap:: @ 8D29C58
	.incbin "graphics/battle_anims/backgrounds/09.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_09_palette:: @ 8D29F50
	.incbin "graphics/battle_anims/backgrounds/09.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_22_palette:: @ 8D29F70
	.incbin "graphics/battle_anims/backgrounds/22.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_09_sheet:: @ 8D29F90
	.incbin "graphics/battle_anims/backgrounds/09.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_10_tilemap:: @ 8D2A510
	.incbin "graphics/battle_anims/backgrounds/10.bin.lz"

	.align 2
gFile_graphics_battle_anims_masks_morning_sun_sheet:: @ 8D2A808
	.incbin "graphics/battle_anims/masks/morning_sun.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_masks_morning_sun_palette:: @ 8D2A8A8
	.incbin "graphics/battle_anims/masks/morning_sun.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_morning_sun_tilemap:: @ 8D2A8C0
	.incbin "graphics/battle_anims/masks/morning_sun.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_12_tilemap:: @ 8D2A9DC
	.incbin "graphics/battle_anims/backgrounds/12.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_13_tilemap:: @ 8D2ACA4
	.incbin "graphics/battle_anims/backgrounds/13.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_14_tilemap:: @ 8D2AFA0
	.incbin "graphics/battle_anims/backgrounds/14.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_12_sheet:: @ 8D2B230
	.incbin "graphics/battle_anims/backgrounds/12.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_12_palette:: @ 8D2BF98
	.incbin "graphics/battle_anims/backgrounds/12.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_11_sheet:: @ 8D2BFB8
	.incbin "graphics/battle_anims/backgrounds/11.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_11_palette:: @ 8D2C954
	.incbin "graphics/battle_anims/backgrounds/11.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_11_tilemap:: @ 8D2C97C
	.incbin "graphics/battle_anims/backgrounds/11.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_239_sheet:: @ 8D2CC74
	.incbin "graphics/battle_anims/sprites/239.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_239_palette:: @ 8D2CD58
	.incbin "graphics/battle_anims/sprites/239.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_143_sheet:: @ 8D2CD80
	.incbin "graphics/battle_anims/sprites/143.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_143_palette:: @ 8D2CFB0
	.incbin "graphics/battle_anims/sprites/143.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_240_sheet:: @ 8D2CFC8
	.incbin "graphics/battle_anims/sprites/240.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_240_palette:: @ 8D2D068
	.incbin "graphics/battle_anims/sprites/240.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_substitute_palette:: @ 8D2D090
	.incbin "graphics/battle_anims/sprites/substitute.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_substitute_sheet:: @ 8D2D0B4
	.incbin "graphics/battle_anims/sprites/substitute.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_substitute_tilemap:: @ 8D2D2F4
	.incbin "graphics/battle_anims/sprites/substitute.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_241_sheet:: @ 8D2D51C
	.incbin "graphics/battle_anims/sprites/241.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_241_palette:: @ 8D2D5E0
	.incbin "graphics/battle_anims/sprites/241.gbapal.lz"

	.align 2
gFile_graphics_misc_confetti_sheet:: @ 8D2D5FC
	.incbin "graphics/misc/confetti.4bpp.lz"

	.align 2
gFile_graphics_misc_confetti_palette:: @ 8D2D71C
	.incbin "graphics/misc/confetti.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_242_sheet:: @ 8D2D744
	.incbin "graphics/battle_anims/sprites/242.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_242_palette:: @ 8D2D880
	.incbin "graphics/battle_anims/sprites/242.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_243_sheet:: @ 8D2D8A4
	.incbin "graphics/battle_anims/sprites/243.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_243_palette:: @ 8D2D8CC
	.incbin "graphics/battle_anims/sprites/243.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat_sheet:: @ 8D2D8F4
	.incbin "graphics/battle_anims/masks/stat.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat_tilemap_1_tilemap:: @ 8D2DB04
	.incbin "graphics/battle_anims/masks/stat_tilemap_1.bin.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat_tilemap_2_tilemap:: @ 8D2DC20
	.incbin "graphics/battle_anims/masks/stat_tilemap_2.bin.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat1_palette:: @ 8D2DD3C
	.incbin "graphics/battle_anims/masks/stat1.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat2_palette:: @ 8D2DD5C
	.incbin "graphics/battle_anims/masks/stat2.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat3_palette:: @ 8D2DD7C
	.incbin "graphics/battle_anims/masks/stat3.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat4_palette:: @ 8D2DD9C
	.incbin "graphics/battle_anims/masks/stat4.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat5_palette:: @ 8D2DDBC
	.incbin "graphics/battle_anims/masks/stat5.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat6_palette:: @ 8D2DDDC
	.incbin "graphics/battle_anims/masks/stat6.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat7_palette:: @ 8D2DDFC
	.incbin "graphics/battle_anims/masks/stat7.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_stat8_palette:: @ 8D2DE1C
	.incbin "graphics/battle_anims/masks/stat8.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_cure_bubbles_sheet:: @ 8D2DE3C
	.incbin "graphics/battle_anims/masks/cure_bubbles.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_masks_cure_bubbles_palette:: @ 8D2DF78
	.incbin "graphics/battle_anims/masks/cure_bubbles.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_masks_cure_bubbles_tilemap:: @ 8D2DF98
	.incbin "graphics/battle_anims/masks/cure_bubbles.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_245_palette:: @ 8D2E0B4
	.incbin "graphics/battle_anims/sprites/245.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_245_sheet:: @ 8D2E0DC
	.incbin "graphics/battle_anims/sprites/245.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_246_sheet:: @ 8D2E280
	.incbin "graphics/battle_anims/sprites/246.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_244_sheet:: @ 8D2E728
	.incbin "graphics/battle_anims/sprites/244.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_244_palette:: @ 8D2E804
	.incbin "graphics/battle_anims/sprites/244.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_247_sheet:: @ 8D2E820
	.incbin "graphics/battle_anims/sprites/247.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_053_sheet:: @ 8D2EA04
	.incbin "graphics/battle_anims/sprites/053.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_masks_unknown_D2EC24_sheet:: @ 8D2EC24
	.incbin "graphics/battle_anims/masks/unknown_D2EC24.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_masks_unknown_D2EC24_tilemap:: @ 8D2EC70
	.incbin "graphics/battle_anims/masks/unknown_D2EC24.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_248_sheet:: @ 8D2ED78
	.incbin "graphics/battle_anims/sprites/248.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_248_palette:: @ 8D2ED90
	.incbin "graphics/battle_anims/sprites/248.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_249_sheet:: @ 8D2EDA8
	.incbin "graphics/battle_anims/sprites/249.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_249_palette:: @ 8D2EDF8
	.incbin "graphics/battle_anims/sprites/249.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_250_sheet:: @ 8D2EE18
	.incbin "graphics/battle_anims/sprites/250.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_251_sheet:: @ 8D2F00C
	.incbin "graphics/battle_anims/sprites/251.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_251_palette:: @ 8D2F070
	.incbin "graphics/battle_anims/sprites/251.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_252_sheet:: @ 8D2F088
	.incbin "graphics/battle_anims/sprites/252.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_252_palette:: @ 8D2F1A0
	.incbin "graphics/battle_anims/sprites/252.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_253_sheet:: @ 8D2F1C4
	.incbin "graphics/battle_anims/sprites/253.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_253_palette:: @ 8D2F3A0
	.incbin "graphics/battle_anims/sprites/253.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_254_sheet:: @ 8D2F3C8
	.incbin "graphics/battle_anims/sprites/254.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_254_palette:: @ 8D2F500
	.incbin "graphics/battle_anims/sprites/254.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_255_sheet:: @ 8D2F528
	.incbin "graphics/battle_anims/sprites/255.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_255_palette:: @ 8D2F5A0
	.incbin "graphics/battle_anims/sprites/255.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_258_sheet:: @ 8D2F5B4
	.incbin "graphics/battle_anims/sprites/258.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_258_palette:: @ 8D2F69C
	.incbin "graphics/battle_anims/sprites/258.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_256_sheet:: @ 8D2F6C4
	.incbin "graphics/battle_anims/sprites/256.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_256_palette:: @ 8D2FA50
	.incbin "graphics/battle_anims/sprites/256.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_257_sheet:: @ 8D2FA78
	.incbin "graphics/battle_anims/sprites/257.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_257_palette:: @ 8D2FB94
	.incbin "graphics/battle_anims/sprites/257.gbapal.lz"

	.align 2
gUnknown_8D2FBB4:: @ 8D2FBB4
	.incbin "baserom.gba", 0xD2FBB4, 0x20

	.align 2
gFile_graphics_pokemon_front_pics_bulbasaur_still_front_pic:: @ 8D2FBD4
	.incbin "graphics/pokemon/bulbasaur/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_bulbasaur_palette:: @ 8D2FE78
	.incbin "graphics/pokemon/bulbasaur/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_bulbasaur_back_pic:: @ 8D2FEA0
	.incbin "graphics/pokemon/bulbasaur/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_bulbasaur_shiny_palette:: @ 8D30164
	.incbin "graphics/pokemon/bulbasaur/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_bulbasaur_icon:: @ 8D3018C
	.incbin "graphics/pokemon/bulbasaur/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_bulbasaur_footprint:: @ 8D3058C
	.incbin "graphics/pokemon/bulbasaur/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ivysaur_still_front_pic:: @ 8D305AC
	.incbin "graphics/pokemon/ivysaur/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ivysaur_palette:: @ 8D308E8
	.incbin "graphics/pokemon/ivysaur/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ivysaur_back_pic:: @ 8D30910
	.incbin "graphics/pokemon/ivysaur/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ivysaur_shiny_palette:: @ 8D30C64
	.incbin "graphics/pokemon/ivysaur/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ivysaur_icon:: @ 8D30C8C
	.incbin "graphics/pokemon/ivysaur/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ivysaur_footprint:: @ 8D3108C
	.incbin "graphics/pokemon/ivysaur/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_venusaur_still_front_pic:: @ 8D310AC
	.incbin "graphics/pokemon/venusaur/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_venusaur_palette:: @ 8D315EC
	.incbin "graphics/pokemon/venusaur/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_venusaur_back_pic:: @ 8D31614
	.incbin "graphics/pokemon/venusaur/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_venusaur_shiny_palette:: @ 8D31ADC
	.incbin "graphics/pokemon/venusaur/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_venusaur_icon:: @ 8D31B04
	.incbin "graphics/pokemon/venusaur/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_venusaur_footprint:: @ 8D31F04
	.incbin "graphics/pokemon/venusaur/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_charmander_still_front_pic:: @ 8D31F24
	.incbin "graphics/pokemon/charmander/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_charmander_palette:: @ 8D321C4
	.incbin "graphics/pokemon/charmander/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_charmander_back_pic:: @ 8D321EC
	.incbin "graphics/pokemon/charmander/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_charmander_shiny_palette:: @ 8D32470
	.incbin "graphics/pokemon/charmander/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_charmander_icon:: @ 8D32498
	.incbin "graphics/pokemon/charmander/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_charmander_footprint:: @ 8D32898
	.incbin "graphics/pokemon/charmander/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_charmeleon_still_front_pic:: @ 8D328B8
	.incbin "graphics/pokemon/charmeleon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_charmeleon_palette:: @ 8D32C64
	.incbin "graphics/pokemon/charmeleon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_charmeleon_back_pic:: @ 8D32C8C
	.incbin "graphics/pokemon/charmeleon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_charmeleon_shiny_palette:: @ 8D32F80
	.incbin "graphics/pokemon/charmeleon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_charmeleon_icon:: @ 8D32FA8
	.incbin "graphics/pokemon/charmeleon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_charmeleon_footprint:: @ 8D333A8
	.incbin "graphics/pokemon/charmeleon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_charizard_still_front_pic:: @ 8D333C8
	.incbin "graphics/pokemon/charizard/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_charizard_palette:: @ 8D338C4
	.incbin "graphics/pokemon/charizard/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_charizard_back_pic:: @ 8D338EC
	.incbin "graphics/pokemon/charizard/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_charizard_shiny_palette:: @ 8D33CF8
	.incbin "graphics/pokemon/charizard/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_charizard_icon:: @ 8D33D20
	.incbin "graphics/pokemon/charizard/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_charizard_footprint:: @ 8D34120
	.incbin "graphics/pokemon/charizard/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_squirtle_still_front_pic:: @ 8D34140
	.incbin "graphics/pokemon/squirtle/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_squirtle_palette:: @ 8D343DC
	.incbin "graphics/pokemon/squirtle/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_squirtle_back_pic:: @ 8D34404
	.incbin "graphics/pokemon/squirtle/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_squirtle_shiny_palette:: @ 8D3468C
	.incbin "graphics/pokemon/squirtle/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_squirtle_icon:: @ 8D346B4
	.incbin "graphics/pokemon/squirtle/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_squirtle_footprint:: @ 8D34AB4
	.incbin "graphics/pokemon/squirtle/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_wartortle_still_front_pic:: @ 8D34AD4
	.incbin "graphics/pokemon/wartortle/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wartortle_palette:: @ 8D34E80
	.incbin "graphics/pokemon/wartortle/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_wartortle_back_pic:: @ 8D34EA8
	.incbin "graphics/pokemon/wartortle/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wartortle_shiny_palette:: @ 8D351F0
	.incbin "graphics/pokemon/wartortle/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_wartortle_icon:: @ 8D35218
	.incbin "graphics/pokemon/wartortle/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_wartortle_footprint:: @ 8D35618
	.incbin "graphics/pokemon/wartortle/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_blastoise_still_front_pic:: @ 8D35638
	.incbin "graphics/pokemon/blastoise/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_blastoise_palette:: @ 8D35B3C
	.incbin "graphics/pokemon/blastoise/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_blastoise_back_pic:: @ 8D35B64
	.incbin "graphics/pokemon/blastoise/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_blastoise_shiny_palette:: @ 8D35F78
	.incbin "graphics/pokemon/blastoise/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_blastoise_icon:: @ 8D35FA0
	.incbin "graphics/pokemon/blastoise/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_blastoise_footprint:: @ 8D363A0
	.incbin "graphics/pokemon/blastoise/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_caterpie_still_front_pic:: @ 8D363C0
	.incbin "graphics/pokemon/caterpie/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_caterpie_palette:: @ 8D36618
	.incbin "graphics/pokemon/caterpie/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_caterpie_back_pic:: @ 8D36640
	.incbin "graphics/pokemon/caterpie/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_caterpie_shiny_palette:: @ 8D368C8
	.incbin "graphics/pokemon/caterpie/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_caterpie_icon:: @ 8D368F0
	.incbin "graphics/pokemon/caterpie/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_caterpie_footprint:: @ 8D36CF0
	.incbin "graphics/pokemon/caterpie/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_metapod_still_front_pic:: @ 8D36D10
	.incbin "graphics/pokemon/metapod/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_metapod_palette:: @ 8D36F2C
	.incbin "graphics/pokemon/metapod/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_metapod_back_pic:: @ 8D36F4C
	.incbin "graphics/pokemon/metapod/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_metapod_shiny_palette:: @ 8D37168
	.incbin "graphics/pokemon/metapod/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_metapod_icon:: @ 8D37188
	.incbin "graphics/pokemon/metapod/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_metapod_footprint:: @ 8D37588
	.incbin "graphics/pokemon/metapod/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_butterfree_still_front_pic:: @ 8D375A8
	.incbin "graphics/pokemon/butterfree/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_butterfree_palette:: @ 8D37920
	.incbin "graphics/pokemon/butterfree/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_butterfree_back_pic:: @ 8D37948
	.incbin "graphics/pokemon/butterfree/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_butterfree_shiny_palette:: @ 8D37D4C
	.incbin "graphics/pokemon/butterfree/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_butterfree_icon:: @ 8D37D74
	.incbin "graphics/pokemon/butterfree/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_butterfree_footprint:: @ 8D38174
	.incbin "graphics/pokemon/butterfree/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_weedle_still_front_pic:: @ 8D38194
	.incbin "graphics/pokemon/weedle/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_weedle_palette:: @ 8D383D0
	.incbin "graphics/pokemon/weedle/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_weedle_back_pic:: @ 8D383F8
	.incbin "graphics/pokemon/weedle/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_weedle_shiny_palette:: @ 8D38660
	.incbin "graphics/pokemon/weedle/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_weedle_icon:: @ 8D38688
	.incbin "graphics/pokemon/weedle/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_weedle_footprint:: @ 8D38A88
	.incbin "graphics/pokemon/weedle/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_kakuna_still_front_pic:: @ 8D38AA8
	.incbin "graphics/pokemon/kakuna/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kakuna_palette:: @ 8D38CE8
	.incbin "graphics/pokemon/kakuna/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_kakuna_back_pic:: @ 8D38D0C
	.incbin "graphics/pokemon/kakuna/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kakuna_shiny_palette:: @ 8D38F90
	.incbin "graphics/pokemon/kakuna/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_kakuna_icon:: @ 8D38FB4
	.incbin "graphics/pokemon/kakuna/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_kakuna_footprint:: @ 8D393B4
	.incbin "graphics/pokemon/kakuna/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_beedrill_still_front_pic:: @ 8D393D4
	.incbin "graphics/pokemon/beedrill/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_beedrill_palette:: @ 8D397F4
	.incbin "graphics/pokemon/beedrill/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_beedrill_back_pic:: @ 8D3981C
	.incbin "graphics/pokemon/beedrill/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_beedrill_shiny_palette:: @ 8D39B90
	.incbin "graphics/pokemon/beedrill/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_beedrill_icon:: @ 8D39BB8
	.incbin "graphics/pokemon/beedrill/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_beedrill_footprint:: @ 8D39FB8
	.incbin "graphics/pokemon/beedrill/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_pidgey_still_front_pic:: @ 8D39FD8
	.incbin "graphics/pokemon/pidgey/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pidgey_palette:: @ 8D3A250
	.incbin "graphics/pokemon/pidgey/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_pidgey_back_pic:: @ 8D3A278
	.incbin "graphics/pokemon/pidgey/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pidgey_shiny_palette:: @ 8D3A5CC
	.incbin "graphics/pokemon/pidgey/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_pidgey_icon:: @ 8D3A5F4
	.incbin "graphics/pokemon/pidgey/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_pidgey_footprint:: @ 8D3A9F4
	.incbin "graphics/pokemon/pidgey/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_pidgeotto_still_front_pic:: @ 8D3AA14
	.incbin "graphics/pokemon/pidgeotto/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pidgeotto_palette:: @ 8D3ADAC
	.incbin "graphics/pokemon/pidgeotto/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_pidgeotto_back_pic:: @ 8D3ADD4
	.incbin "graphics/pokemon/pidgeotto/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pidgeotto_shiny_palette:: @ 8D3B120
	.incbin "graphics/pokemon/pidgeotto/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_pidgeotto_icon:: @ 8D3B148
	.incbin "graphics/pokemon/pidgeotto/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_pidgeotto_footprint:: @ 8D3B548
	.incbin "graphics/pokemon/pidgeotto/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_pidgeot_still_front_pic:: @ 8D3B568
	.incbin "graphics/pokemon/pidgeot/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pidgeot_palette:: @ 8D3BA54
	.incbin "graphics/pokemon/pidgeot/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_pidgeot_back_pic:: @ 8D3BA7C
	.incbin "graphics/pokemon/pidgeot/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pidgeot_shiny_palette:: @ 8D3BE64
	.incbin "graphics/pokemon/pidgeot/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_pidgeot_icon:: @ 8D3BE8C
	.incbin "graphics/pokemon/pidgeot/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_pidgeot_footprint:: @ 8D3C28C
	.incbin "graphics/pokemon/pidgeot/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_rattata_still_front_pic:: @ 8D3C2AC
	.incbin "graphics/pokemon/rattata/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_rattata_palette:: @ 8D3C504
	.incbin "graphics/pokemon/rattata/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_rattata_back_pic:: @ 8D3C52C
	.incbin "graphics/pokemon/rattata/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_rattata_shiny_palette:: @ 8D3C7E4
	.incbin "graphics/pokemon/rattata/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_rattata_icon:: @ 8D3C80C
	.incbin "graphics/pokemon/rattata/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_rattata_footprint:: @ 8D3CC0C
	.incbin "graphics/pokemon/rattata/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_raticate_still_front_pic:: @ 8D3CC2C
	.incbin "graphics/pokemon/raticate/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_raticate_palette:: @ 8D3CFBC
	.incbin "graphics/pokemon/raticate/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_raticate_back_pic:: @ 8D3CFE4
	.incbin "graphics/pokemon/raticate/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_raticate_shiny_palette:: @ 8D3D2F4
	.incbin "graphics/pokemon/raticate/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_raticate_icon:: @ 8D3D31C
	.incbin "graphics/pokemon/raticate/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_raticate_footprint:: @ 8D3D71C
	.incbin "graphics/pokemon/raticate/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_spearow_still_front_pic:: @ 8D3D73C
	.incbin "graphics/pokemon/spearow/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_spearow_palette:: @ 8D3D9FC
	.incbin "graphics/pokemon/spearow/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_spearow_back_pic:: @ 8D3DA24
	.incbin "graphics/pokemon/spearow/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_spearow_shiny_palette:: @ 8D3DD00
	.incbin "graphics/pokemon/spearow/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_spearow_icon:: @ 8D3DD28
	.incbin "graphics/pokemon/spearow/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_spearow_footprint:: @ 8D3E128
	.incbin "graphics/pokemon/spearow/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_fearow_still_front_pic:: @ 8D3E148
	.incbin "graphics/pokemon/fearow/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_fearow_palette:: @ 8D3E604
	.incbin "graphics/pokemon/fearow/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_fearow_back_pic:: @ 8D3E62C
	.incbin "graphics/pokemon/fearow/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_fearow_shiny_palette:: @ 8D3E924
	.incbin "graphics/pokemon/fearow/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_fearow_icon:: @ 8D3E94C
	.incbin "graphics/pokemon/fearow/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_fearow_footprint:: @ 8D3ED4C
	.incbin "graphics/pokemon/fearow/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ekans_still_front_pic:: @ 8D3ED6C
	.incbin "graphics/pokemon/ekans/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ekans_palette:: @ 8D3F034
	.incbin "graphics/pokemon/ekans/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ekans_back_pic:: @ 8D3F05C
	.incbin "graphics/pokemon/ekans/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ekans_shiny_palette:: @ 8D3F34C
	.incbin "graphics/pokemon/ekans/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ekans_icon:: @ 8D3F374
	.incbin "graphics/pokemon/ekans/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ekans_footprint:: @ 8D3F774
	.incbin "graphics/pokemon/ekans/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_arbok_still_front_pic:: @ 8D3F794
	.incbin "graphics/pokemon/arbok/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_arbok_palette:: @ 8D3FC08
	.incbin "graphics/pokemon/arbok/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_arbok_back_pic:: @ 8D3FC30
	.incbin "graphics/pokemon/arbok/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_arbok_shiny_palette:: @ 8D3FEB8
	.incbin "graphics/pokemon/arbok/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_arbok_icon:: @ 8D3FEE0
	.incbin "graphics/pokemon/arbok/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_arbok_footprint:: @ 8D402E0
	.incbin "graphics/pokemon/arbok/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_pikachu_still_front_pic:: @ 8D40300
	.incbin "graphics/pokemon/pikachu/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pikachu_palette:: @ 8D405D0
	.incbin "graphics/pokemon/pikachu/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_pikachu_back_pic:: @ 8D405F8
	.incbin "graphics/pokemon/pikachu/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pikachu_shiny_palette:: @ 8D408D0
	.incbin "graphics/pokemon/pikachu/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_pikachu_icon:: @ 8D408F8
	.incbin "graphics/pokemon/pikachu/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_pikachu_footprint:: @ 8D40CF8
	.incbin "graphics/pokemon/pikachu/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_raichu_still_front_pic:: @ 8D40D18
	.incbin "graphics/pokemon/raichu/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_raichu_palette:: @ 8D41110
	.incbin "graphics/pokemon/raichu/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_raichu_back_pic:: @ 8D41138
	.incbin "graphics/pokemon/raichu/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_raichu_shiny_palette:: @ 8D41458
	.incbin "graphics/pokemon/raichu/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_raichu_icon:: @ 8D41480
	.incbin "graphics/pokemon/raichu/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_raichu_footprint:: @ 8D41880
	.incbin "graphics/pokemon/raichu/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sandshrew_still_front_pic:: @ 8D418A0
	.incbin "graphics/pokemon/sandshrew/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sandshrew_palette:: @ 8D41B7C
	.incbin "graphics/pokemon/sandshrew/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sandshrew_back_pic:: @ 8D41BA4
	.incbin "graphics/pokemon/sandshrew/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sandshrew_shiny_palette:: @ 8D41ECC
	.incbin "graphics/pokemon/sandshrew/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sandshrew_icon:: @ 8D41EF4
	.incbin "graphics/pokemon/sandshrew/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sandshrew_footprint:: @ 8D422F4
	.incbin "graphics/pokemon/sandshrew/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sandslash_still_front_pic:: @ 8D42314
	.incbin "graphics/pokemon/sandslash/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sandslash_palette:: @ 8D4272C
	.incbin "graphics/pokemon/sandslash/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sandslash_back_pic:: @ 8D42754
	.incbin "graphics/pokemon/sandslash/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sandslash_shiny_palette:: @ 8D42B70
	.incbin "graphics/pokemon/sandslash/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sandslash_icon:: @ 8D42B98
	.incbin "graphics/pokemon/sandslash/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sandslash_footprint:: @ 8D42F98
	.incbin "graphics/pokemon/sandslash/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_nidoran_f_still_front_pic:: @ 8D42FB8
	.incbin "graphics/pokemon/nidoran_f/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidoran_f_palette:: @ 8D4321C
	.incbin "graphics/pokemon/nidoran_f/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_nidoran_f_back_pic:: @ 8D43244
	.incbin "graphics/pokemon/nidoran_f/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidoran_f_shiny_palette:: @ 8D43524
	.incbin "graphics/pokemon/nidoran_f/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_nidoran_f_icon:: @ 8D4354C
	.incbin "graphics/pokemon/nidoran_f/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_nidoran_f_footprint:: @ 8D4394C
	.incbin "graphics/pokemon/nidoran_f/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_nidorina_still_front_pic:: @ 8D4396C
	.incbin "graphics/pokemon/nidorina/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidorina_palette:: @ 8D43C8C
	.incbin "graphics/pokemon/nidorina/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_nidorina_back_pic:: @ 8D43CB4
	.incbin "graphics/pokemon/nidorina/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidorina_shiny_palette:: @ 8D44048
	.incbin "graphics/pokemon/nidorina/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_nidorina_icon:: @ 8D44070
	.incbin "graphics/pokemon/nidorina/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_nidorina_footprint:: @ 8D44470
	.incbin "graphics/pokemon/nidorina/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_nidoqueen_still_front_pic:: @ 8D44490
	.incbin "graphics/pokemon/nidoqueen/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidoqueen_palette:: @ 8D448BC
	.incbin "graphics/pokemon/nidoqueen/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_nidoqueen_back_pic:: @ 8D448E4
	.incbin "graphics/pokemon/nidoqueen/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidoqueen_shiny_palette:: @ 8D44CA8
	.incbin "graphics/pokemon/nidoqueen/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_nidoqueen_icon:: @ 8D44CD0
	.incbin "graphics/pokemon/nidoqueen/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_nidoqueen_footprint:: @ 8D450D0
	.incbin "graphics/pokemon/nidoqueen/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_nidoran_m_still_front_pic:: @ 8D450F0
	.incbin "graphics/pokemon/nidoran_m/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidoran_m_palette:: @ 8D4537C
	.incbin "graphics/pokemon/nidoran_m/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_nidoran_m_back_pic:: @ 8D453A4
	.incbin "graphics/pokemon/nidoran_m/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidoran_m_shiny_palette:: @ 8D456D8
	.incbin "graphics/pokemon/nidoran_m/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_nidoran_m_icon:: @ 8D45700
	.incbin "graphics/pokemon/nidoran_m/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_nidoran_m_footprint:: @ 8D45B00
	.incbin "graphics/pokemon/nidoran_m/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_nidorino_still_front_pic:: @ 8D45B20
	.incbin "graphics/pokemon/nidorino/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidorino_palette:: @ 8D45EA4
	.incbin "graphics/pokemon/nidorino/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_nidorino_back_pic:: @ 8D45ECC
	.incbin "graphics/pokemon/nidorino/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidorino_shiny_palette:: @ 8D46288
	.incbin "graphics/pokemon/nidorino/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_nidorino_icon:: @ 8D462B0
	.incbin "graphics/pokemon/nidorino/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_nidorino_footprint:: @ 8D466B0
	.incbin "graphics/pokemon/nidorino/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_nidoking_still_front_pic:: @ 8D466D0
	.incbin "graphics/pokemon/nidoking/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidoking_palette:: @ 8D46C0C
	.incbin "graphics/pokemon/nidoking/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_nidoking_back_pic:: @ 8D46C34
	.incbin "graphics/pokemon/nidoking/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nidoking_shiny_palette:: @ 8D47070
	.incbin "graphics/pokemon/nidoking/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_nidoking_icon:: @ 8D47098
	.incbin "graphics/pokemon/nidoking/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_nidoking_footprint:: @ 8D47498
	.incbin "graphics/pokemon/nidoking/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_clefairy_still_front_pic:: @ 8D474B8
	.incbin "graphics/pokemon/clefairy/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_clefairy_palette:: @ 8D47754
	.incbin "graphics/pokemon/clefairy/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_clefairy_back_pic:: @ 8D4777C
	.incbin "graphics/pokemon/clefairy/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_clefairy_shiny_palette:: @ 8D47A4C
	.incbin "graphics/pokemon/clefairy/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_clefairy_icon:: @ 8D47A74
	.incbin "graphics/pokemon/clefairy/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_clefairy_footprint:: @ 8D47E74
	.incbin "graphics/pokemon/clefairy/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_clefable_still_front_pic:: @ 8D47E94
	.incbin "graphics/pokemon/clefable/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_clefable_palette:: @ 8D481D4
	.incbin "graphics/pokemon/clefable/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_clefable_back_pic:: @ 8D481FC
	.incbin "graphics/pokemon/clefable/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_clefable_shiny_palette:: @ 8D48534
	.incbin "graphics/pokemon/clefable/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_clefable_icon:: @ 8D4855C
	.incbin "graphics/pokemon/clefable/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_clefable_footprint:: @ 8D4895C
	.incbin "graphics/pokemon/clefable/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_vulpix_still_front_pic:: @ 8D4897C
	.incbin "graphics/pokemon/vulpix/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_vulpix_palette:: @ 8D48CA8
	.incbin "graphics/pokemon/vulpix/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_vulpix_back_pic:: @ 8D48CD0
	.incbin "graphics/pokemon/vulpix/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_vulpix_shiny_palette:: @ 8D48FD4
	.incbin "graphics/pokemon/vulpix/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_vulpix_icon:: @ 8D48FFC
	.incbin "graphics/pokemon/vulpix/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_vulpix_footprint:: @ 8D493FC
	.incbin "graphics/pokemon/vulpix/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ninetales_still_front_pic:: @ 8D4941C
	.incbin "graphics/pokemon/ninetales/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ninetales_palette:: @ 8D49870
	.incbin "graphics/pokemon/ninetales/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ninetales_back_pic:: @ 8D49894
	.incbin "graphics/pokemon/ninetales/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ninetales_shiny_palette:: @ 8D49C84
	.incbin "graphics/pokemon/ninetales/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ninetales_icon:: @ 8D49CA8
	.incbin "graphics/pokemon/ninetales/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ninetales_footprint:: @ 8D4A0A8
	.incbin "graphics/pokemon/ninetales/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_jigglypuff_still_front_pic:: @ 8D4A0C8
	.incbin "graphics/pokemon/jigglypuff/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_jigglypuff_palette:: @ 8D4A34C
	.incbin "graphics/pokemon/jigglypuff/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_jigglypuff_back_pic:: @ 8D4A374
	.incbin "graphics/pokemon/jigglypuff/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_jigglypuff_shiny_palette:: @ 8D4A5D0
	.incbin "graphics/pokemon/jigglypuff/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_jigglypuff_icon:: @ 8D4A5F8
	.incbin "graphics/pokemon/jigglypuff/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_jigglypuff_footprint:: @ 8D4A9F8
	.incbin "graphics/pokemon/jigglypuff/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_wigglytuff_still_front_pic:: @ 8D4AA18
	.incbin "graphics/pokemon/wigglytuff/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wigglytuff_palette:: @ 8D4AD8C
	.incbin "graphics/pokemon/wigglytuff/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_wigglytuff_back_pic:: @ 8D4ADB4
	.incbin "graphics/pokemon/wigglytuff/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wigglytuff_shiny_palette:: @ 8D4B04C
	.incbin "graphics/pokemon/wigglytuff/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_wigglytuff_icon:: @ 8D4B074
	.incbin "graphics/pokemon/wigglytuff/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_wigglytuff_footprint:: @ 8D4B474
	.incbin "graphics/pokemon/wigglytuff/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_zubat_still_front_pic:: @ 8D4B494
	.incbin "graphics/pokemon/zubat/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_zubat_palette:: @ 8D4B750
	.incbin "graphics/pokemon/zubat/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_zubat_back_pic:: @ 8D4B778
	.incbin "graphics/pokemon/zubat/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_zubat_shiny_palette:: @ 8D4BA34
	.incbin "graphics/pokemon/zubat/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_zubat_icon:: @ 8D4BA5C
	.incbin "graphics/pokemon/zubat/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_zubat_footprint:: @ 8D4BE5C
	.incbin "graphics/pokemon/zubat/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_golbat_still_front_pic:: @ 8D4BE7C
	.incbin "graphics/pokemon/golbat/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_golbat_palette:: @ 8D4C21C
	.incbin "graphics/pokemon/golbat/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_golbat_back_pic:: @ 8D4C244
	.incbin "graphics/pokemon/golbat/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_golbat_shiny_palette:: @ 8D4C500
	.incbin "graphics/pokemon/golbat/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_golbat_icon:: @ 8D4C528
	.incbin "graphics/pokemon/golbat/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_golbat_footprint:: @ 8D4C928
	.incbin "graphics/pokemon/golbat/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_oddish_still_front_pic:: @ 8D4C948
	.incbin "graphics/pokemon/oddish/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_oddish_palette:: @ 8D4CB88
	.incbin "graphics/pokemon/oddish/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_oddish_back_pic:: @ 8D4CBB0
	.incbin "graphics/pokemon/oddish/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_oddish_shiny_palette:: @ 8D4CE74
	.incbin "graphics/pokemon/oddish/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_oddish_icon:: @ 8D4CE9C
	.incbin "graphics/pokemon/oddish/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_oddish_footprint:: @ 8D4D29C
	.incbin "graphics/pokemon/oddish/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_gloom_still_front_pic:: @ 8D4D2BC
	.incbin "graphics/pokemon/gloom/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gloom_palette:: @ 8D4D624
	.incbin "graphics/pokemon/gloom/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_gloom_back_pic:: @ 8D4D64C
	.incbin "graphics/pokemon/gloom/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gloom_shiny_palette:: @ 8D4D9CC
	.incbin "graphics/pokemon/gloom/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_gloom_icon:: @ 8D4D9F4
	.incbin "graphics/pokemon/gloom/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_gloom_footprint:: @ 8D4DDF4
	.incbin "graphics/pokemon/gloom/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_vileplume_still_front_pic:: @ 8D4DE14
	.incbin "graphics/pokemon/vileplume/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_vileplume_palette:: @ 8D4E168
	.incbin "graphics/pokemon/vileplume/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_vileplume_back_pic:: @ 8D4E190
	.incbin "graphics/pokemon/vileplume/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_vileplume_shiny_palette:: @ 8D4E5DC
	.incbin "graphics/pokemon/vileplume/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_vileplume_icon:: @ 8D4E604
	.incbin "graphics/pokemon/vileplume/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_vileplume_footprint:: @ 8D4EA04
	.incbin "graphics/pokemon/vileplume/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_paras_still_front_pic:: @ 8D4EA24
	.incbin "graphics/pokemon/paras/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_paras_palette:: @ 8D4EC90
	.incbin "graphics/pokemon/paras/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_paras_back_pic:: @ 8D4ECB8
	.incbin "graphics/pokemon/paras/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_paras_shiny_palette:: @ 8D4EF58
	.incbin "graphics/pokemon/paras/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_paras_icon:: @ 8D4EF80
	.incbin "graphics/pokemon/paras/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_paras_footprint:: @ 8D4F380
	.incbin "graphics/pokemon/paras/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_parasect_still_front_pic:: @ 8D4F3A0
	.incbin "graphics/pokemon/parasect/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_parasect_palette:: @ 8D4F730
	.incbin "graphics/pokemon/parasect/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_parasect_back_pic:: @ 8D4F758
	.incbin "graphics/pokemon/parasect/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_parasect_shiny_palette:: @ 8D4FA54
	.incbin "graphics/pokemon/parasect/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_parasect_icon:: @ 8D4FA7C
	.incbin "graphics/pokemon/parasect/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_parasect_footprint:: @ 8D4FE7C
	.incbin "graphics/pokemon/parasect/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_venonat_still_front_pic:: @ 8D4FE9C
	.incbin "graphics/pokemon/venonat/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_venonat_palette:: @ 8D501BC
	.incbin "graphics/pokemon/venonat/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_venonat_back_pic:: @ 8D501E4
	.incbin "graphics/pokemon/venonat/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_venonat_shiny_palette:: @ 8D50514
	.incbin "graphics/pokemon/venonat/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_venonat_icon:: @ 8D5053C
	.incbin "graphics/pokemon/venonat/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_venonat_footprint:: @ 8D5093C
	.incbin "graphics/pokemon/venonat/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_venomoth_still_front_pic:: @ 8D5095C
	.incbin "graphics/pokemon/venomoth/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_venomoth_palette:: @ 8D50D60
	.incbin "graphics/pokemon/venomoth/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_venomoth_back_pic:: @ 8D50D88
	.incbin "graphics/pokemon/venomoth/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_venomoth_shiny_palette:: @ 8D5112C
	.incbin "graphics/pokemon/venomoth/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_venomoth_icon:: @ 8D51154
	.incbin "graphics/pokemon/venomoth/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_venomoth_footprint:: @ 8D51554
	.incbin "graphics/pokemon/venomoth/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_diglett_still_front_pic:: @ 8D51574
	.incbin "graphics/pokemon/diglett/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_diglett_palette:: @ 8D51784
	.incbin "graphics/pokemon/diglett/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_diglett_back_pic:: @ 8D517AC
	.incbin "graphics/pokemon/diglett/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_diglett_shiny_palette:: @ 8D519B8
	.incbin "graphics/pokemon/diglett/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_diglett_icon:: @ 8D519E0
	.incbin "graphics/pokemon/diglett/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_diglett_footprint:: @ 8D51DE0
	.incbin "graphics/pokemon/diglett/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_dugtrio_still_front_pic:: @ 8D51E00
	.incbin "graphics/pokemon/dugtrio/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dugtrio_palette:: @ 8D5212C
	.incbin "graphics/pokemon/dugtrio/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_dugtrio_back_pic:: @ 8D52154
	.incbin "graphics/pokemon/dugtrio/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dugtrio_shiny_palette:: @ 8D52400
	.incbin "graphics/pokemon/dugtrio/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_dugtrio_icon:: @ 8D52428
	.incbin "graphics/pokemon/dugtrio/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_dugtrio_footprint:: @ 8D52828
	.incbin "graphics/pokemon/dugtrio/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_meowth_still_front_pic:: @ 8D52848
	.incbin "graphics/pokemon/meowth/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_meowth_palette:: @ 8D52B34
	.incbin "graphics/pokemon/meowth/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_meowth_back_pic:: @ 8D52B5C
	.incbin "graphics/pokemon/meowth/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_meowth_shiny_palette:: @ 8D52E40
	.incbin "graphics/pokemon/meowth/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_meowth_icon:: @ 8D52E68
	.incbin "graphics/pokemon/meowth/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_meowth_footprint:: @ 8D53268
	.incbin "graphics/pokemon/meowth/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_persian_still_front_pic:: @ 8D53288
	.incbin "graphics/pokemon/persian/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_persian_palette:: @ 8D53600
	.incbin "graphics/pokemon/persian/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_persian_back_pic:: @ 8D53628
	.incbin "graphics/pokemon/persian/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_persian_shiny_palette:: @ 8D53968
	.incbin "graphics/pokemon/persian/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_persian_icon:: @ 8D53990
	.incbin "graphics/pokemon/persian/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_persian_footprint:: @ 8D53D90
	.incbin "graphics/pokemon/persian/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_psyduck_still_front_pic:: @ 8D53DB0
	.incbin "graphics/pokemon/psyduck/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_psyduck_palette:: @ 8D54094
	.incbin "graphics/pokemon/psyduck/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_psyduck_back_pic:: @ 8D540BC
	.incbin "graphics/pokemon/psyduck/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_psyduck_shiny_palette:: @ 8D54358
	.incbin "graphics/pokemon/psyduck/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_psyduck_icon:: @ 8D54380
	.incbin "graphics/pokemon/psyduck/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_psyduck_footprint:: @ 8D54780
	.incbin "graphics/pokemon/psyduck/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_golduck_still_front_pic:: @ 8D547A0
	.incbin "graphics/pokemon/golduck/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_golduck_palette:: @ 8D54B58
	.incbin "graphics/pokemon/golduck/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_golduck_back_pic:: @ 8D54B80
	.incbin "graphics/pokemon/golduck/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_golduck_shiny_palette:: @ 8D54EAC
	.incbin "graphics/pokemon/golduck/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_golduck_icon:: @ 8D54ED4
	.incbin "graphics/pokemon/golduck/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_golduck_footprint:: @ 8D552D4
	.incbin "graphics/pokemon/golduck/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_mankey_still_front_pic:: @ 8D552F4
	.incbin "graphics/pokemon/mankey/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mankey_palette:: @ 8D555EC
	.incbin "graphics/pokemon/mankey/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_mankey_back_pic:: @ 8D55614
	.incbin "graphics/pokemon/mankey/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mankey_shiny_palette:: @ 8D5597C
	.incbin "graphics/pokemon/mankey/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_mankey_icon:: @ 8D559A4
	.incbin "graphics/pokemon/mankey/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_mankey_footprint:: @ 8D55DA4
	.incbin "graphics/pokemon/mankey/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_primeape_still_front_pic:: @ 8D55DC4
	.incbin "graphics/pokemon/primeape/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_primeape_palette:: @ 8D56150
	.incbin "graphics/pokemon/primeape/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_primeape_back_pic:: @ 8D56178
	.incbin "graphics/pokemon/primeape/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_primeape_shiny_palette:: @ 8D564E8
	.incbin "graphics/pokemon/primeape/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_primeape_icon:: @ 8D56510
	.incbin "graphics/pokemon/primeape/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_primeape_footprint:: @ 8D56910
	.incbin "graphics/pokemon/primeape/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_growlithe_still_front_pic:: @ 8D56930
	.incbin "graphics/pokemon/growlithe/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_growlithe_palette:: @ 8D56C58
	.incbin "graphics/pokemon/growlithe/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_growlithe_back_pic:: @ 8D56C80
	.incbin "graphics/pokemon/growlithe/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_growlithe_shiny_palette:: @ 8D56FBC
	.incbin "graphics/pokemon/growlithe/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_growlithe_icon:: @ 8D56FE4
	.incbin "graphics/pokemon/growlithe/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_growlithe_footprint:: @ 8D573E4
	.incbin "graphics/pokemon/growlithe/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_arcanine_still_front_pic:: @ 8D57404
	.incbin "graphics/pokemon/arcanine/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_arcanine_palette:: @ 8D57900
	.incbin "graphics/pokemon/arcanine/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_arcanine_back_pic:: @ 8D57928
	.incbin "graphics/pokemon/arcanine/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_arcanine_shiny_palette:: @ 8D57D08
	.incbin "graphics/pokemon/arcanine/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_arcanine_icon:: @ 8D57D30
	.incbin "graphics/pokemon/arcanine/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_arcanine_footprint:: @ 8D58130
	.incbin "graphics/pokemon/arcanine/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_poliwag_still_front_pic:: @ 8D58150
	.incbin "graphics/pokemon/poliwag/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_poliwag_palette:: @ 8D583EC
	.incbin "graphics/pokemon/poliwag/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_poliwag_back_pic:: @ 8D58414
	.incbin "graphics/pokemon/poliwag/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_poliwag_shiny_palette:: @ 8D58678
	.incbin "graphics/pokemon/poliwag/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_poliwag_icon:: @ 8D586A0
	.incbin "graphics/pokemon/poliwag/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_poliwag_footprint:: @ 8D58AA0
	.incbin "graphics/pokemon/poliwag/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_poliwhirl_still_front_pic:: @ 8D58AC0
	.incbin "graphics/pokemon/poliwhirl/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_poliwhirl_palette:: @ 8D58E40
	.incbin "graphics/pokemon/poliwhirl/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_poliwhirl_back_pic:: @ 8D58E68
	.incbin "graphics/pokemon/poliwhirl/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_poliwhirl_shiny_palette:: @ 8D590E4
	.incbin "graphics/pokemon/poliwhirl/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_poliwhirl_icon:: @ 8D5910C
	.incbin "graphics/pokemon/poliwhirl/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_poliwhirl_footprint:: @ 8D5950C
	.incbin "graphics/pokemon/poliwhirl/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_poliwrath_still_front_pic:: @ 8D5952C
	.incbin "graphics/pokemon/poliwrath/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_poliwrath_palette:: @ 8D598F0
	.incbin "graphics/pokemon/poliwrath/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_poliwrath_back_pic:: @ 8D59918
	.incbin "graphics/pokemon/poliwrath/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_poliwrath_shiny_palette:: @ 8D59C0C
	.incbin "graphics/pokemon/poliwrath/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_poliwrath_icon:: @ 8D59C34
	.incbin "graphics/pokemon/poliwrath/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_poliwrath_footprint:: @ 8D5A034
	.incbin "graphics/pokemon/poliwrath/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_abra_still_front_pic:: @ 8D5A054
	.incbin "graphics/pokemon/abra/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_abra_palette:: @ 8D5A328
	.incbin "graphics/pokemon/abra/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_abra_back_pic:: @ 8D5A34C
	.incbin "graphics/pokemon/abra/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_abra_shiny_palette:: @ 8D5A620
	.incbin "graphics/pokemon/abra/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_abra_icon:: @ 8D5A644
	.incbin "graphics/pokemon/abra/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_abra_footprint:: @ 8D5AA44
	.incbin "graphics/pokemon/abra/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_kadabra_still_front_pic:: @ 8D5AA64
	.incbin "graphics/pokemon/kadabra/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kadabra_palette:: @ 8D5AF2C
	.incbin "graphics/pokemon/kadabra/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_kadabra_back_pic:: @ 8D5AF54
	.incbin "graphics/pokemon/kadabra/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kadabra_shiny_palette:: @ 8D5B300
	.incbin "graphics/pokemon/kadabra/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_kadabra_icon:: @ 8D5B328
	.incbin "graphics/pokemon/kadabra/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_kadabra_footprint:: @ 8D5B728
	.incbin "graphics/pokemon/kadabra/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_alakazam_still_front_pic:: @ 8D5B748
	.incbin "graphics/pokemon/alakazam/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_alakazam_palette:: @ 8D5BBE0
	.incbin "graphics/pokemon/alakazam/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_alakazam_back_pic:: @ 8D5BC08
	.incbin "graphics/pokemon/alakazam/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_alakazam_shiny_palette:: @ 8D5BF88
	.incbin "graphics/pokemon/alakazam/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_alakazam_icon:: @ 8D5BFB0
	.incbin "graphics/pokemon/alakazam/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_alakazam_footprint:: @ 8D5C3B0
	.incbin "graphics/pokemon/alakazam/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_machop_still_front_pic:: @ 8D5C3D0
	.incbin "graphics/pokemon/machop/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_machop_palette:: @ 8D5C65C
	.incbin "graphics/pokemon/machop/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_machop_back_pic:: @ 8D5C684
	.incbin "graphics/pokemon/machop/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_machop_shiny_palette:: @ 8D5C964
	.incbin "graphics/pokemon/machop/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_machop_icon:: @ 8D5C98C
	.incbin "graphics/pokemon/machop/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_machop_footprint:: @ 8D5CD8C
	.incbin "graphics/pokemon/machop/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_machoke_still_front_pic:: @ 8D5CDAC
	.incbin "graphics/pokemon/machoke/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_machoke_palette:: @ 8D5D178
	.incbin "graphics/pokemon/machoke/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_machoke_back_pic:: @ 8D5D1A0
	.incbin "graphics/pokemon/machoke/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_machoke_shiny_palette:: @ 8D5D4F0
	.incbin "graphics/pokemon/machoke/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_machoke_icon:: @ 8D5D518
	.incbin "graphics/pokemon/machoke/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_machoke_footprint:: @ 8D5D918
	.incbin "graphics/pokemon/machoke/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_machamp_still_front_pic:: @ 8D5D938
	.incbin "graphics/pokemon/machamp/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_machamp_palette:: @ 8D5DE24
	.incbin "graphics/pokemon/machamp/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_machamp_back_pic:: @ 8D5DE4C
	.incbin "graphics/pokemon/machamp/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_machamp_shiny_palette:: @ 8D5E2A8
	.incbin "graphics/pokemon/machamp/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_machamp_icon:: @ 8D5E2D0
	.incbin "graphics/pokemon/machamp/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_machamp_footprint:: @ 8D5E6D0
	.incbin "graphics/pokemon/machamp/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_bellsprout_still_front_pic:: @ 8D5E6F0
	.incbin "graphics/pokemon/bellsprout/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_bellsprout_palette:: @ 8D5E97C
	.incbin "graphics/pokemon/bellsprout/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_bellsprout_back_pic:: @ 8D5E9A4
	.incbin "graphics/pokemon/bellsprout/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_bellsprout_shiny_palette:: @ 8D5EC40
	.incbin "graphics/pokemon/bellsprout/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_bellsprout_icon:: @ 8D5EC68
	.incbin "graphics/pokemon/bellsprout/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_bellsprout_footprint:: @ 8D5F068
	.incbin "graphics/pokemon/bellsprout/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_weepinbell_still_front_pic:: @ 8D5F088
	.incbin "graphics/pokemon/weepinbell/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_weepinbell_palette:: @ 8D5F3AC
	.incbin "graphics/pokemon/weepinbell/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_weepinbell_back_pic:: @ 8D5F3D4
	.incbin "graphics/pokemon/weepinbell/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_weepinbell_shiny_palette:: @ 8D5F6D0
	.incbin "graphics/pokemon/weepinbell/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_weepinbell_icon:: @ 8D5F6F8
	.incbin "graphics/pokemon/weepinbell/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_weepinbell_footprint:: @ 8D5FAF8
	.incbin "graphics/pokemon/weepinbell/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_victreebel_still_front_pic:: @ 8D5FB18
	.incbin "graphics/pokemon/victreebel/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_victreebel_palette:: @ 8D5FF44
	.incbin "graphics/pokemon/victreebel/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_victreebel_back_pic:: @ 8D5FF6C
	.incbin "graphics/pokemon/victreebel/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_victreebel_shiny_palette:: @ 8D60304
	.incbin "graphics/pokemon/victreebel/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_victreebel_icon:: @ 8D6032C
	.incbin "graphics/pokemon/victreebel/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_victreebel_footprint:: @ 8D6072C
	.incbin "graphics/pokemon/victreebel/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_tentacool_still_front_pic:: @ 8D6074C
	.incbin "graphics/pokemon/tentacool/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tentacool_palette:: @ 8D609F4
	.incbin "graphics/pokemon/tentacool/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_tentacool_back_pic:: @ 8D60A1C
	.incbin "graphics/pokemon/tentacool/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tentacool_shiny_palette:: @ 8D60CE8
	.incbin "graphics/pokemon/tentacool/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_tentacool_icon:: @ 8D60D10
	.incbin "graphics/pokemon/tentacool/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_tentacool_footprint:: @ 8D61110
	.incbin "graphics/pokemon/tentacool/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_tentacruel_still_front_pic:: @ 8D61130
	.incbin "graphics/pokemon/tentacruel/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tentacruel_palette:: @ 8D61624
	.incbin "graphics/pokemon/tentacruel/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_tentacruel_back_pic:: @ 8D6164C
	.incbin "graphics/pokemon/tentacruel/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tentacruel_shiny_palette:: @ 8D619E8
	.incbin "graphics/pokemon/tentacruel/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_tentacruel_icon:: @ 8D61A10
	.incbin "graphics/pokemon/tentacruel/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_tentacruel_footprint:: @ 8D61E10
	.incbin "graphics/pokemon/tentacruel/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_geodude_still_front_pic:: @ 8D61E30
	.incbin "graphics/pokemon/geodude/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_geodude_palette:: @ 8D620C4
	.incbin "graphics/pokemon/geodude/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_geodude_back_pic:: @ 8D620E0
	.incbin "graphics/pokemon/geodude/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_geodude_shiny_palette:: @ 8D62374
	.incbin "graphics/pokemon/geodude/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_geodude_icon:: @ 8D62390
	.incbin "graphics/pokemon/geodude/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_geodude_footprint:: @ 8D62790
	.incbin "graphics/pokemon/geodude/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_graveler_still_front_pic:: @ 8D627B0
	.incbin "graphics/pokemon/graveler/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_graveler_palette:: @ 8D62BAC
	.incbin "graphics/pokemon/graveler/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_graveler_back_pic:: @ 8D62BD0
	.incbin "graphics/pokemon/graveler/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_graveler_shiny_palette:: @ 8D62E4C
	.incbin "graphics/pokemon/graveler/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_graveler_icon:: @ 8D62E70
	.incbin "graphics/pokemon/graveler/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_graveler_footprint:: @ 8D63270
	.incbin "graphics/pokemon/graveler/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_golem_still_front_pic:: @ 8D63290
	.incbin "graphics/pokemon/golem/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_golem_palette:: @ 8D636C0
	.incbin "graphics/pokemon/golem/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_golem_back_pic:: @ 8D636E8
	.incbin "graphics/pokemon/golem/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_golem_shiny_palette:: @ 8D639A8
	.incbin "graphics/pokemon/golem/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_golem_icon:: @ 8D639D0
	.incbin "graphics/pokemon/golem/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_golem_footprint:: @ 8D63DD0
	.incbin "graphics/pokemon/golem/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ponyta_still_front_pic:: @ 8D63DF0
	.incbin "graphics/pokemon/ponyta/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ponyta_palette:: @ 8D64180
	.incbin "graphics/pokemon/ponyta/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ponyta_back_pic:: @ 8D641A8
	.incbin "graphics/pokemon/ponyta/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ponyta_shiny_palette:: @ 8D644E4
	.incbin "graphics/pokemon/ponyta/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ponyta_icon:: @ 8D6450C
	.incbin "graphics/pokemon/ponyta/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ponyta_footprint:: @ 8D6490C
	.incbin "graphics/pokemon/ponyta/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_rapidash_still_front_pic:: @ 8D6492C
	.incbin "graphics/pokemon/rapidash/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_rapidash_palette:: @ 8D64DB4
	.incbin "graphics/pokemon/rapidash/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_rapidash_back_pic:: @ 8D64DDC
	.incbin "graphics/pokemon/rapidash/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_rapidash_shiny_palette:: @ 8D651EC
	.incbin "graphics/pokemon/rapidash/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_rapidash_icon:: @ 8D65214
	.incbin "graphics/pokemon/rapidash/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_rapidash_footprint:: @ 8D65614
	.incbin "graphics/pokemon/rapidash/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_slowpoke_still_front_pic:: @ 8D65634
	.incbin "graphics/pokemon/slowpoke/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slowpoke_palette:: @ 8D65908
	.incbin "graphics/pokemon/slowpoke/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_slowpoke_back_pic:: @ 8D65930
	.incbin "graphics/pokemon/slowpoke/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slowpoke_shiny_palette:: @ 8D65B94
	.incbin "graphics/pokemon/slowpoke/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_slowpoke_icon:: @ 8D65BBC
	.incbin "graphics/pokemon/slowpoke/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_slowpoke_footprint:: @ 8D65FBC
	.incbin "graphics/pokemon/slowpoke/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_slowbro_still_front_pic:: @ 8D65FDC
	.incbin "graphics/pokemon/slowbro/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slowbro_palette:: @ 8D6647C
	.incbin "graphics/pokemon/slowbro/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_slowbro_back_pic:: @ 8D664A4
	.incbin "graphics/pokemon/slowbro/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slowbro_shiny_palette:: @ 8D66840
	.incbin "graphics/pokemon/slowbro/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_slowbro_icon:: @ 8D66868
	.incbin "graphics/pokemon/slowbro/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_slowbro_footprint:: @ 8D66C68
	.incbin "graphics/pokemon/slowbro/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_magnemite_still_front_pic:: @ 8D66C88
	.incbin "graphics/pokemon/magnemite/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magnemite_palette:: @ 8D66E60
	.incbin "graphics/pokemon/magnemite/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_magnemite_back_pic:: @ 8D66E88
	.incbin "graphics/pokemon/magnemite/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magnemite_shiny_palette:: @ 8D67070
	.incbin "graphics/pokemon/magnemite/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_magnemite_icon:: @ 8D67094
	.incbin "graphics/pokemon/magnemite/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_magnemite_footprint:: @ 8D67494
	.incbin "graphics/pokemon/magnemite/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_magneton_still_front_pic:: @ 8D674B4
	.incbin "graphics/pokemon/magneton/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magneton_palette:: @ 8D677F0
	.incbin "graphics/pokemon/magneton/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_magneton_back_pic:: @ 8D67818
	.incbin "graphics/pokemon/magneton/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magneton_shiny_palette:: @ 8D67B98
	.incbin "graphics/pokemon/magneton/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_magneton_icon:: @ 8D67BC0
	.incbin "graphics/pokemon/magneton/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_magneton_footprint:: @ 8D67FC0
	.incbin "graphics/pokemon/magneton/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_farfetch_d_still_front_pic:: @ 8D67FE0
	.incbin "graphics/pokemon/farfetch_d/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_farfetch_d_palette:: @ 8D68334
	.incbin "graphics/pokemon/farfetch_d/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_farfetch_d_back_pic:: @ 8D6835C
	.incbin "graphics/pokemon/farfetch_d/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_farfetch_d_shiny_palette:: @ 8D686C8
	.incbin "graphics/pokemon/farfetch_d/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_farfetch_d_icon:: @ 8D686F0
	.incbin "graphics/pokemon/farfetch_d/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_farfetch_d_footprint:: @ 8D68AF0
	.incbin "graphics/pokemon/farfetch_d/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_doduo_still_front_pic:: @ 8D68B10
	.incbin "graphics/pokemon/doduo/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_doduo_palette:: @ 8D68DFC
	.incbin "graphics/pokemon/doduo/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_doduo_back_pic:: @ 8D68E20
	.incbin "graphics/pokemon/doduo/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_doduo_shiny_palette:: @ 8D69138
	.incbin "graphics/pokemon/doduo/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_doduo_icon:: @ 8D6915C
	.incbin "graphics/pokemon/doduo/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_doduo_footprint:: @ 8D6955C
	.incbin "graphics/pokemon/doduo/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_dodrio_still_front_pic:: @ 8D6957C
	.incbin "graphics/pokemon/dodrio/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dodrio_palette:: @ 8D699BC
	.incbin "graphics/pokemon/dodrio/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_dodrio_back_pic:: @ 8D699E4
	.incbin "graphics/pokemon/dodrio/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dodrio_shiny_palette:: @ 8D69E48
	.incbin "graphics/pokemon/dodrio/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_dodrio_icon:: @ 8D69E70
	.incbin "graphics/pokemon/dodrio/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_dodrio_footprint:: @ 8D6A270
	.incbin "graphics/pokemon/dodrio/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_seel_still_front_pic:: @ 8D6A290
	.incbin "graphics/pokemon/seel/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_seel_palette:: @ 8D6A5B4
	.incbin "graphics/pokemon/seel/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_seel_back_pic:: @ 8D6A5DC
	.incbin "graphics/pokemon/seel/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_seel_shiny_palette:: @ 8D6A8C8
	.incbin "graphics/pokemon/seel/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_seel_icon:: @ 8D6A8F0
	.incbin "graphics/pokemon/seel/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_seel_footprint:: @ 8D6ACF0
	.incbin "graphics/pokemon/seel/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_dewgong_still_front_pic:: @ 8D6AD10
	.incbin "graphics/pokemon/dewgong/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dewgong_palette:: @ 8D6B0E0
	.incbin "graphics/pokemon/dewgong/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_dewgong_back_pic:: @ 8D6B104
	.incbin "graphics/pokemon/dewgong/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dewgong_shiny_palette:: @ 8D6B398
	.incbin "graphics/pokemon/dewgong/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_dewgong_icon:: @ 8D6B3BC
	.incbin "graphics/pokemon/dewgong/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_dewgong_footprint:: @ 8D6B7BC
	.incbin "graphics/pokemon/dewgong/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_grimer_still_front_pic:: @ 8D6B7DC
	.incbin "graphics/pokemon/grimer/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_grimer_palette:: @ 8D6BB04
	.incbin "graphics/pokemon/grimer/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_grimer_back_pic:: @ 8D6BB28
	.incbin "graphics/pokemon/grimer/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_grimer_shiny_palette:: @ 8D6BDEC
	.incbin "graphics/pokemon/grimer/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_grimer_icon:: @ 8D6BE10
	.incbin "graphics/pokemon/grimer/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_grimer_footprint:: @ 8D6C210
	.incbin "graphics/pokemon/grimer/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_muk_still_front_pic:: @ 8D6C230
	.incbin "graphics/pokemon/muk/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_muk_palette:: @ 8D6C5C0
	.incbin "graphics/pokemon/muk/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_muk_back_pic:: @ 8D6C5E4
	.incbin "graphics/pokemon/muk/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_muk_shiny_palette:: @ 8D6C8DC
	.incbin "graphics/pokemon/muk/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_muk_icon:: @ 8D6C900
	.incbin "graphics/pokemon/muk/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_muk_footprint:: @ 8D6CD00
	.incbin "graphics/pokemon/muk/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_shellder_still_front_pic:: @ 8D6CD20
	.incbin "graphics/pokemon/shellder/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shellder_palette:: @ 8D6CF94
	.incbin "graphics/pokemon/shellder/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_shellder_back_pic:: @ 8D6CFB8
	.incbin "graphics/pokemon/shellder/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shellder_shiny_palette:: @ 8D6D2CC
	.incbin "graphics/pokemon/shellder/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_shellder_icon:: @ 8D6D2F0
	.incbin "graphics/pokemon/shellder/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_shellder_footprint:: @ 8D6D6F0
	.incbin "graphics/pokemon/shellder/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_cloyster_still_front_pic:: @ 8D6D710
	.incbin "graphics/pokemon/cloyster/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cloyster_palette:: @ 8D6DB4C
	.incbin "graphics/pokemon/cloyster/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_cloyster_back_pic:: @ 8D6DB70
	.incbin "graphics/pokemon/cloyster/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cloyster_shiny_palette:: @ 8D6DF7C
	.incbin "graphics/pokemon/cloyster/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_cloyster_icon:: @ 8D6DFA0
	.incbin "graphics/pokemon/cloyster/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_cloyster_footprint:: @ 8D6E3A0
	.incbin "graphics/pokemon/cloyster/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_gastly_still_front_pic:: @ 8D6E3C0
	.incbin "graphics/pokemon/gastly/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gastly_palette:: @ 8D6E778
	.incbin "graphics/pokemon/gastly/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_gastly_back_pic:: @ 8D6E7A0
	.incbin "graphics/pokemon/gastly/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gastly_shiny_palette:: @ 8D6EAC4
	.incbin "graphics/pokemon/gastly/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_gastly_icon:: @ 8D6EAEC
	.incbin "graphics/pokemon/gastly/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_gastly_footprint:: @ 8D6EEEC
	.incbin "graphics/pokemon/gastly/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_haunter_still_front_pic:: @ 8D6EF0C
	.incbin "graphics/pokemon/haunter/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_haunter_palette:: @ 8D6F2F4
	.incbin "graphics/pokemon/haunter/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_haunter_back_pic:: @ 8D6F318
	.incbin "graphics/pokemon/haunter/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_haunter_shiny_palette:: @ 8D6F5FC
	.incbin "graphics/pokemon/haunter/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_haunter_icon:: @ 8D6F620
	.incbin "graphics/pokemon/haunter/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_haunter_footprint:: @ 8D6FA20
	.incbin "graphics/pokemon/haunter/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_gengar_still_front_pic:: @ 8D6FA40
	.incbin "graphics/pokemon/gengar/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gengar_palette:: @ 8D6FD9C
	.incbin "graphics/pokemon/gengar/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_gengar_back_pic:: @ 8D6FDC0
	.incbin "graphics/pokemon/gengar/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gengar_shiny_palette:: @ 8D70104
	.incbin "graphics/pokemon/gengar/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_gengar_icon:: @ 8D70128
	.incbin "graphics/pokemon/gengar/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_gengar_footprint:: @ 8D70528
	.incbin "graphics/pokemon/gengar/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_onix_still_front_pic:: @ 8D70548
	.incbin "graphics/pokemon/onix/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_onix_palette:: @ 8D70A18
	.incbin "graphics/pokemon/onix/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_onix_back_pic:: @ 8D70A34
	.incbin "graphics/pokemon/onix/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_onix_shiny_palette:: @ 8D70DB0
	.incbin "graphics/pokemon/onix/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_onix_icon:: @ 8D70DCC
	.incbin "graphics/pokemon/onix/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_onix_footprint:: @ 8D711CC
	.incbin "graphics/pokemon/onix/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_drowzee_still_front_pic:: @ 8D711EC
	.incbin "graphics/pokemon/drowzee/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_drowzee_palette:: @ 8D7152C
	.incbin "graphics/pokemon/drowzee/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_drowzee_back_pic:: @ 8D71550
	.incbin "graphics/pokemon/drowzee/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_drowzee_shiny_palette:: @ 8D7178C
	.incbin "graphics/pokemon/drowzee/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_drowzee_icon:: @ 8D717B0
	.incbin "graphics/pokemon/drowzee/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_drowzee_footprint:: @ 8D71BB0
	.incbin "graphics/pokemon/drowzee/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_hypno_still_front_pic:: @ 8D71BD0
	.incbin "graphics/pokemon/hypno/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hypno_palette:: @ 8D72008
	.incbin "graphics/pokemon/hypno/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_hypno_back_pic:: @ 8D7202C
	.incbin "graphics/pokemon/hypno/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hypno_shiny_palette:: @ 8D7235C
	.incbin "graphics/pokemon/hypno/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_hypno_icon:: @ 8D72380
	.incbin "graphics/pokemon/hypno/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_hypno_footprint:: @ 8D72780
	.incbin "graphics/pokemon/hypno/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_krabby_still_front_pic:: @ 8D727A0
	.incbin "graphics/pokemon/krabby/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_krabby_palette:: @ 8D72AC4
	.incbin "graphics/pokemon/krabby/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_krabby_back_pic:: @ 8D72AEC
	.incbin "graphics/pokemon/krabby/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_krabby_shiny_palette:: @ 8D72E78
	.incbin "graphics/pokemon/krabby/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_krabby_icon:: @ 8D72EA0
	.incbin "graphics/pokemon/krabby/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_krabby_footprint:: @ 8D732A0
	.incbin "graphics/pokemon/krabby/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_kingler_still_front_pic:: @ 8D732C0
	.incbin "graphics/pokemon/kingler/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kingler_palette:: @ 8D73740
	.incbin "graphics/pokemon/kingler/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_kingler_back_pic:: @ 8D73768
	.incbin "graphics/pokemon/kingler/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kingler_shiny_palette:: @ 8D73AEC
	.incbin "graphics/pokemon/kingler/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_kingler_icon:: @ 8D73B14
	.incbin "graphics/pokemon/kingler/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_kingler_footprint:: @ 8D73F14
	.incbin "graphics/pokemon/kingler/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_voltorb_still_front_pic:: @ 8D73F34
	.incbin "graphics/pokemon/voltorb/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_voltorb_palette:: @ 8D7413C
	.incbin "graphics/pokemon/voltorb/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_voltorb_back_pic:: @ 8D74160
	.incbin "graphics/pokemon/voltorb/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_voltorb_shiny_palette:: @ 8D743D4
	.incbin "graphics/pokemon/voltorb/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_voltorb_icon:: @ 8D743F8
	.incbin "graphics/pokemon/voltorb/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_voltorb_footprint:: @ 8D747F8
	.incbin "graphics/pokemon/voltorb/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_electrode_still_front_pic:: @ 8D74818
	.incbin "graphics/pokemon/electrode/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_electrode_palette:: @ 8D74A84
	.incbin "graphics/pokemon/electrode/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_electrode_back_pic:: @ 8D74AA8
	.incbin "graphics/pokemon/electrode/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_electrode_shiny_palette:: @ 8D74D18
	.incbin "graphics/pokemon/electrode/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_electrode_icon:: @ 8D74D3C
	.incbin "graphics/pokemon/electrode/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_electrode_footprint:: @ 8D7513C
	.incbin "graphics/pokemon/electrode/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_exeggcute_still_front_pic:: @ 8D7515C
	.incbin "graphics/pokemon/exeggcute/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_exeggcute_palette:: @ 8D754EC
	.incbin "graphics/pokemon/exeggcute/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_exeggcute_back_pic:: @ 8D75510
	.incbin "graphics/pokemon/exeggcute/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_exeggcute_shiny_palette:: @ 8D75818
	.incbin "graphics/pokemon/exeggcute/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_exeggcute_icon:: @ 8D7583C
	.incbin "graphics/pokemon/exeggcute/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_exeggcute_footprint:: @ 8D75C3C
	.incbin "graphics/pokemon/exeggcute/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_exeggutor_still_front_pic:: @ 8D75C5C
	.incbin "graphics/pokemon/exeggutor/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_exeggutor_palette:: @ 8D760AC
	.incbin "graphics/pokemon/exeggutor/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_exeggutor_back_pic:: @ 8D760D4
	.incbin "graphics/pokemon/exeggutor/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_exeggutor_shiny_palette:: @ 8D764A0
	.incbin "graphics/pokemon/exeggutor/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_exeggutor_icon:: @ 8D764C8
	.incbin "graphics/pokemon/exeggutor/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_exeggutor_footprint:: @ 8D768C8
	.incbin "graphics/pokemon/exeggutor/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_cubone_still_front_pic:: @ 8D768E8
	.incbin "graphics/pokemon/cubone/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cubone_palette:: @ 8D76BA4
	.incbin "graphics/pokemon/cubone/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_cubone_back_pic:: @ 8D76BCC
	.incbin "graphics/pokemon/cubone/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cubone_shiny_palette:: @ 8D76F0C
	.incbin "graphics/pokemon/cubone/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_cubone_icon:: @ 8D76F34
	.incbin "graphics/pokemon/cubone/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_cubone_footprint:: @ 8D77334
	.incbin "graphics/pokemon/cubone/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_marowak_still_front_pic:: @ 8D77354
	.incbin "graphics/pokemon/marowak/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_marowak_palette:: @ 8D776D4
	.incbin "graphics/pokemon/marowak/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_marowak_back_pic:: @ 8D776FC
	.incbin "graphics/pokemon/marowak/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_marowak_shiny_palette:: @ 8D77A10
	.incbin "graphics/pokemon/marowak/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_marowak_icon:: @ 8D77A38
	.incbin "graphics/pokemon/marowak/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_marowak_footprint:: @ 8D77E38
	.incbin "graphics/pokemon/marowak/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_hitmonlee_still_front_pic:: @ 8D77E58
	.incbin "graphics/pokemon/hitmonlee/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hitmonlee_palette:: @ 8D781CC
	.incbin "graphics/pokemon/hitmonlee/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_hitmonlee_back_pic:: @ 8D781F4
	.incbin "graphics/pokemon/hitmonlee/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hitmonlee_shiny_palette:: @ 8D78498
	.incbin "graphics/pokemon/hitmonlee/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_hitmonlee_icon:: @ 8D784C0
	.incbin "graphics/pokemon/hitmonlee/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_hitmonlee_footprint:: @ 8D788C0
	.incbin "graphics/pokemon/hitmonlee/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_hitmonchan_still_front_pic:: @ 8D788E0
	.incbin "graphics/pokemon/hitmonchan/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hitmonchan_palette:: @ 8D78C20
	.incbin "graphics/pokemon/hitmonchan/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_hitmonchan_back_pic:: @ 8D78C48
	.incbin "graphics/pokemon/hitmonchan/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hitmonchan_shiny_palette:: @ 8D78F8C
	.incbin "graphics/pokemon/hitmonchan/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_hitmonchan_icon:: @ 8D78FB4
	.incbin "graphics/pokemon/hitmonchan/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_hitmonchan_footprint:: @ 8D793B4
	.incbin "graphics/pokemon/hitmonchan/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_lickitung_still_front_pic:: @ 8D793D4
	.incbin "graphics/pokemon/lickitung/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lickitung_palette:: @ 8D797AC
	.incbin "graphics/pokemon/lickitung/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_lickitung_back_pic:: @ 8D797D4
	.incbin "graphics/pokemon/lickitung/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lickitung_shiny_palette:: @ 8D79A78
	.incbin "graphics/pokemon/lickitung/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_lickitung_icon:: @ 8D79AA0
	.incbin "graphics/pokemon/lickitung/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_lickitung_footprint:: @ 8D79EA0
	.incbin "graphics/pokemon/lickitung/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_koffing_still_front_pic:: @ 8D79EC0
	.incbin "graphics/pokemon/koffing/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_koffing_palette:: @ 8D7A1C0
	.incbin "graphics/pokemon/koffing/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_koffing_back_pic:: @ 8D7A1E8
	.incbin "graphics/pokemon/koffing/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_koffing_shiny_palette:: @ 8D7A4E8
	.incbin "graphics/pokemon/koffing/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_koffing_icon:: @ 8D7A510
	.incbin "graphics/pokemon/koffing/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_koffing_footprint:: @ 8D7A910
	.incbin "graphics/pokemon/koffing/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_weezing_still_front_pic:: @ 8D7A930
	.incbin "graphics/pokemon/weezing/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_weezing_palette:: @ 8D7ADEC
	.incbin "graphics/pokemon/weezing/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_weezing_back_pic:: @ 8D7AE14
	.incbin "graphics/pokemon/weezing/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_weezing_shiny_palette:: @ 8D7B198
	.incbin "graphics/pokemon/weezing/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_weezing_icon:: @ 8D7B1C0
	.incbin "graphics/pokemon/weezing/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_weezing_footprint:: @ 8D7B5C0
	.incbin "graphics/pokemon/weezing/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_rhyhorn_still_front_pic:: @ 8D7B5E0
	.incbin "graphics/pokemon/rhyhorn/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_rhyhorn_palette:: @ 8D7B9DC
	.incbin "graphics/pokemon/rhyhorn/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_rhyhorn_back_pic:: @ 8D7B9FC
	.incbin "graphics/pokemon/rhyhorn/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_rhyhorn_shiny_palette:: @ 8D7BD44
	.incbin "graphics/pokemon/rhyhorn/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_rhyhorn_icon:: @ 8D7BD64
	.incbin "graphics/pokemon/rhyhorn/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_rhyhorn_footprint:: @ 8D7C164
	.incbin "graphics/pokemon/rhyhorn/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_rhydon_still_front_pic:: @ 8D7C184
	.incbin "graphics/pokemon/rhydon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_rhydon_palette:: @ 8D7C678
	.incbin "graphics/pokemon/rhydon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_rhydon_back_pic:: @ 8D7C6A0
	.incbin "graphics/pokemon/rhydon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_rhydon_shiny_palette:: @ 8D7CAF0
	.incbin "graphics/pokemon/rhydon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_rhydon_icon:: @ 8D7CB18
	.incbin "graphics/pokemon/rhydon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_rhydon_footprint:: @ 8D7CF18
	.incbin "graphics/pokemon/rhydon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_chansey_still_front_pic:: @ 8D7CF38
	.incbin "graphics/pokemon/chansey/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_chansey_palette:: @ 8D7D274
	.incbin "graphics/pokemon/chansey/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_chansey_back_pic:: @ 8D7D298
	.incbin "graphics/pokemon/chansey/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_chansey_shiny_palette:: @ 8D7D4E8
	.incbin "graphics/pokemon/chansey/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_chansey_icon:: @ 8D7D50C
	.incbin "graphics/pokemon/chansey/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_chansey_footprint:: @ 8D7D90C
	.incbin "graphics/pokemon/chansey/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_tangela_still_front_pic:: @ 8D7D92C
	.incbin "graphics/pokemon/tangela/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tangela_palette:: @ 8D7DD00
	.incbin "graphics/pokemon/tangela/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_tangela_back_pic:: @ 8D7DD24
	.incbin "graphics/pokemon/tangela/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tangela_shiny_palette:: @ 8D7E0D0
	.incbin "graphics/pokemon/tangela/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_tangela_icon:: @ 8D7E0F4
	.incbin "graphics/pokemon/tangela/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_tangela_footprint:: @ 8D7E4F4
	.incbin "graphics/pokemon/tangela/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_kangaskhan_still_front_pic:: @ 8D7E514
	.incbin "graphics/pokemon/kangaskhan/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kangaskhan_palette:: @ 8D7E9BC
	.incbin "graphics/pokemon/kangaskhan/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_kangaskhan_back_pic:: @ 8D7E9E4
	.incbin "graphics/pokemon/kangaskhan/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kangaskhan_shiny_palette:: @ 8D7EE14
	.incbin "graphics/pokemon/kangaskhan/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_kangaskhan_icon:: @ 8D7EE3C
	.incbin "graphics/pokemon/kangaskhan/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_kangaskhan_footprint:: @ 8D7F23C
	.incbin "graphics/pokemon/kangaskhan/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_horsea_still_front_pic:: @ 8D7F25C
	.incbin "graphics/pokemon/horsea/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_horsea_palette:: @ 8D7F4C8
	.incbin "graphics/pokemon/horsea/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_horsea_back_pic:: @ 8D7F4F0
	.incbin "graphics/pokemon/horsea/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_horsea_shiny_palette:: @ 8D7F7D0
	.incbin "graphics/pokemon/horsea/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_horsea_icon:: @ 8D7F7F8
	.incbin "graphics/pokemon/horsea/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_horsea_footprint:: @ 8D7FBF8
	.incbin "graphics/pokemon/horsea/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_seadra_still_front_pic:: @ 8D7FC18
	.incbin "graphics/pokemon/seadra/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_seadra_palette:: @ 8D7FFA0
	.incbin "graphics/pokemon/seadra/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_seadra_back_pic:: @ 8D7FFC8
	.incbin "graphics/pokemon/seadra/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_seadra_shiny_palette:: @ 8D80368
	.incbin "graphics/pokemon/seadra/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_seadra_icon:: @ 8D80390
	.incbin "graphics/pokemon/seadra/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_seadra_footprint:: @ 8D80790
	.incbin "graphics/pokemon/seadra/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_goldeen_still_front_pic:: @ 8D807B0
	.incbin "graphics/pokemon/goldeen/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_goldeen_palette:: @ 8D80B18
	.incbin "graphics/pokemon/goldeen/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_goldeen_back_pic:: @ 8D80B40
	.incbin "graphics/pokemon/goldeen/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_goldeen_shiny_palette:: @ 8D80EB0
	.incbin "graphics/pokemon/goldeen/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_goldeen_icon:: @ 8D80ED8
	.incbin "graphics/pokemon/goldeen/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_goldeen_footprint:: @ 8D812D8
	.incbin "graphics/pokemon/goldeen/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_seaking_still_front_pic:: @ 8D812F8
	.incbin "graphics/pokemon/seaking/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_seaking_palette:: @ 8D8176C
	.incbin "graphics/pokemon/seaking/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_seaking_back_pic:: @ 8D81794
	.incbin "graphics/pokemon/seaking/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_seaking_shiny_palette:: @ 8D81AE4
	.incbin "graphics/pokemon/seaking/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_seaking_icon:: @ 8D81B0C
	.incbin "graphics/pokemon/seaking/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_seaking_footprint:: @ 8D81F0C
	.incbin "graphics/pokemon/seaking/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_staryu_still_front_pic:: @ 8D81F2C
	.incbin "graphics/pokemon/staryu/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_staryu_palette:: @ 8D821DC
	.incbin "graphics/pokemon/staryu/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_staryu_back_pic:: @ 8D82204
	.incbin "graphics/pokemon/staryu/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_staryu_shiny_palette:: @ 8D8246C
	.incbin "graphics/pokemon/staryu/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_staryu_icon:: @ 8D82494
	.incbin "graphics/pokemon/staryu/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_staryu_footprint:: @ 8D82894
	.incbin "graphics/pokemon/staryu/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_starmie_still_front_pic:: @ 8D828B4
	.incbin "graphics/pokemon/starmie/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_starmie_palette:: @ 8D82C54
	.incbin "graphics/pokemon/starmie/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_starmie_back_pic:: @ 8D82C7C
	.incbin "graphics/pokemon/starmie/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_starmie_shiny_palette:: @ 8D82F20
	.incbin "graphics/pokemon/starmie/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_starmie_icon:: @ 8D82F48
	.incbin "graphics/pokemon/starmie/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_starmie_footprint:: @ 8D83348
	.incbin "graphics/pokemon/starmie/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_mr_mime_still_front_pic:: @ 8D83368
	.incbin "graphics/pokemon/mr_mime/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mr_mime_palette:: @ 8D83724
	.incbin "graphics/pokemon/mr_mime/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_mr_mime_back_pic:: @ 8D8374C
	.incbin "graphics/pokemon/mr_mime/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mr_mime_shiny_palette:: @ 8D83A80
	.incbin "graphics/pokemon/mr_mime/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_mr_mime_icon:: @ 8D83AA8
	.incbin "graphics/pokemon/mr_mime/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_mr_mime_footprint:: @ 8D83EA8
	.incbin "graphics/pokemon/mr_mime/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_scyther_still_front_pic:: @ 8D83EC8
	.incbin "graphics/pokemon/scyther/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_scyther_palette:: @ 8D842F0
	.incbin "graphics/pokemon/scyther/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_scyther_back_pic:: @ 8D84318
	.incbin "graphics/pokemon/scyther/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_scyther_shiny_palette:: @ 8D84730
	.incbin "graphics/pokemon/scyther/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_scyther_icon:: @ 8D84758
	.incbin "graphics/pokemon/scyther/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_scyther_footprint:: @ 8D84B58
	.incbin "graphics/pokemon/scyther/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_jynx_still_front_pic:: @ 8D84B78
	.incbin "graphics/pokemon/jynx/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_jynx_palette:: @ 8D84F44
	.incbin "graphics/pokemon/jynx/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_jynx_back_pic:: @ 8D84F6C
	.incbin "graphics/pokemon/jynx/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_jynx_shiny_palette:: @ 8D85258
	.incbin "graphics/pokemon/jynx/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_jynx_icon:: @ 8D85280
	.incbin "graphics/pokemon/jynx/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_jynx_footprint:: @ 8D85680
	.incbin "graphics/pokemon/jynx/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_electabuzz_still_front_pic:: @ 8D856A0
	.incbin "graphics/pokemon/electabuzz/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_electabuzz_palette:: @ 8D85AF8
	.incbin "graphics/pokemon/electabuzz/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_electabuzz_back_pic:: @ 8D85B20
	.incbin "graphics/pokemon/electabuzz/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_electabuzz_shiny_palette:: @ 8D85E30
	.incbin "graphics/pokemon/electabuzz/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_electabuzz_icon:: @ 8D85E58
	.incbin "graphics/pokemon/electabuzz/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_electabuzz_footprint:: @ 8D86258
	.incbin "graphics/pokemon/electabuzz/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_magmar_still_front_pic:: @ 8D86278
	.incbin "graphics/pokemon/magmar/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magmar_palette:: @ 8D866A8
	.incbin "graphics/pokemon/magmar/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_magmar_back_pic:: @ 8D866D0
	.incbin "graphics/pokemon/magmar/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magmar_shiny_palette:: @ 8D86A08
	.incbin "graphics/pokemon/magmar/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_magmar_icon:: @ 8D86A30
	.incbin "graphics/pokemon/magmar/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_magmar_footprint:: @ 8D86E30
	.incbin "graphics/pokemon/magmar/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_pinsir_still_front_pic:: @ 8D86E50
	.incbin "graphics/pokemon/pinsir/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pinsir_palette:: @ 8D87280
	.incbin "graphics/pokemon/pinsir/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_pinsir_back_pic:: @ 8D872A4
	.incbin "graphics/pokemon/pinsir/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pinsir_shiny_palette:: @ 8D875F8
	.incbin "graphics/pokemon/pinsir/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_pinsir_icon:: @ 8D8761C
	.incbin "graphics/pokemon/pinsir/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_pinsir_footprint:: @ 8D87A1C
	.incbin "graphics/pokemon/pinsir/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_tauros_still_front_pic:: @ 8D87A3C
	.incbin "graphics/pokemon/tauros/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tauros_palette:: @ 8D87E9C
	.incbin "graphics/pokemon/tauros/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_tauros_back_pic:: @ 8D87EC4
	.incbin "graphics/pokemon/tauros/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tauros_shiny_palette:: @ 8D88178
	.incbin "graphics/pokemon/tauros/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_tauros_icon:: @ 8D881A0
	.incbin "graphics/pokemon/tauros/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_tauros_footprint:: @ 8D885A0
	.incbin "graphics/pokemon/tauros/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_magikarp_still_front_pic:: @ 8D885C0
	.incbin "graphics/pokemon/magikarp/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magikarp_palette:: @ 8D88908
	.incbin "graphics/pokemon/magikarp/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_magikarp_back_pic:: @ 8D88930
	.incbin "graphics/pokemon/magikarp/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magikarp_shiny_palette:: @ 8D88C60
	.incbin "graphics/pokemon/magikarp/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_magikarp_icon:: @ 8D88C88
	.incbin "graphics/pokemon/magikarp/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_magikarp_footprint:: @ 8D89088
	.incbin "graphics/pokemon/magikarp/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_gyarados_still_front_pic:: @ 8D890A8
	.incbin "graphics/pokemon/gyarados/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gyarados_palette:: @ 8D8964C
	.incbin "graphics/pokemon/gyarados/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_gyarados_back_pic:: @ 8D89674
	.incbin "graphics/pokemon/gyarados/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gyarados_shiny_palette:: @ 8D89B2C
	.incbin "graphics/pokemon/gyarados/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_gyarados_icon:: @ 8D89B54
	.incbin "graphics/pokemon/gyarados/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_gyarados_footprint:: @ 8D89F54
	.incbin "graphics/pokemon/gyarados/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_lapras_still_front_pic:: @ 8D89F74
	.incbin "graphics/pokemon/lapras/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lapras_palette:: @ 8D8A354
	.incbin "graphics/pokemon/lapras/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_lapras_back_pic:: @ 8D8A37C
	.incbin "graphics/pokemon/lapras/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lapras_shiny_palette:: @ 8D8A6C0
	.incbin "graphics/pokemon/lapras/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_lapras_icon:: @ 8D8A6E8
	.incbin "graphics/pokemon/lapras/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_lapras_footprint:: @ 8D8AAE8
	.incbin "graphics/pokemon/lapras/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ditto_still_front_pic:: @ 8D8AB08
	.incbin "graphics/pokemon/ditto/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ditto_palette:: @ 8D8ACF8
	.incbin "graphics/pokemon/ditto/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ditto_back_pic:: @ 8D8AD18
	.incbin "graphics/pokemon/ditto/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ditto_shiny_palette:: @ 8D8AF18
	.incbin "graphics/pokemon/ditto/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ditto_icon:: @ 8D8AF38
	.incbin "graphics/pokemon/ditto/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ditto_footprint:: @ 8D8B338
	.incbin "graphics/pokemon/ditto/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_eevee_still_front_pic:: @ 8D8B358
	.incbin "graphics/pokemon/eevee/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_eevee_palette:: @ 8D8B644
	.incbin "graphics/pokemon/eevee/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_eevee_back_pic:: @ 8D8B66C
	.incbin "graphics/pokemon/eevee/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_eevee_shiny_palette:: @ 8D8B994
	.incbin "graphics/pokemon/eevee/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_eevee_icon:: @ 8D8B9BC
	.incbin "graphics/pokemon/eevee/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_eevee_footprint:: @ 8D8BDBC
	.incbin "graphics/pokemon/eevee/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_vaporeon_still_front_pic:: @ 8D8BDDC
	.incbin "graphics/pokemon/vaporeon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_vaporeon_palette:: @ 8D8C170
	.incbin "graphics/pokemon/vaporeon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_vaporeon_back_pic:: @ 8D8C198
	.incbin "graphics/pokemon/vaporeon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_vaporeon_shiny_palette:: @ 8D8C460
	.incbin "graphics/pokemon/vaporeon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_vaporeon_icon:: @ 8D8C488
	.incbin "graphics/pokemon/vaporeon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_vaporeon_footprint:: @ 8D8C888
	.incbin "graphics/pokemon/vaporeon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_jolteon_still_front_pic:: @ 8D8C8A8
	.incbin "graphics/pokemon/jolteon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_jolteon_palette:: @ 8D8CBF8
	.incbin "graphics/pokemon/jolteon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_jolteon_back_pic:: @ 8D8CC20
	.incbin "graphics/pokemon/jolteon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_jolteon_shiny_palette:: @ 8D8CFCC
	.incbin "graphics/pokemon/jolteon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_jolteon_icon:: @ 8D8CFF4
	.incbin "graphics/pokemon/jolteon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_jolteon_footprint:: @ 8D8D3F4
	.incbin "graphics/pokemon/jolteon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_flareon_still_front_pic:: @ 8D8D414
	.incbin "graphics/pokemon/flareon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_flareon_palette:: @ 8D8D798
	.incbin "graphics/pokemon/flareon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_flareon_back_pic:: @ 8D8D7C0
	.incbin "graphics/pokemon/flareon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_flareon_shiny_palette:: @ 8D8DB50
	.incbin "graphics/pokemon/flareon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_flareon_icon:: @ 8D8DB78
	.incbin "graphics/pokemon/flareon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_flareon_footprint:: @ 8D8DF78
	.incbin "graphics/pokemon/flareon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_porygon_still_front_pic:: @ 8D8DF98
	.incbin "graphics/pokemon/porygon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_porygon_palette:: @ 8D8E250
	.incbin "graphics/pokemon/porygon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_porygon_back_pic:: @ 8D8E274
	.incbin "graphics/pokemon/porygon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_porygon_shiny_palette:: @ 8D8E52C
	.incbin "graphics/pokemon/porygon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_porygon_icon:: @ 8D8E550
	.incbin "graphics/pokemon/porygon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_porygon_footprint:: @ 8D8E950
	.incbin "graphics/pokemon/porygon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_omanyte_still_front_pic:: @ 8D8E970
	.incbin "graphics/pokemon/omanyte/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_omanyte_palette:: @ 8D8EC00
	.incbin "graphics/pokemon/omanyte/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_omanyte_back_pic:: @ 8D8EC28
	.incbin "graphics/pokemon/omanyte/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_omanyte_shiny_palette:: @ 8D8EF74
	.incbin "graphics/pokemon/omanyte/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_omanyte_icon:: @ 8D8EF9C
	.incbin "graphics/pokemon/omanyte/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_omanyte_footprint:: @ 8D8F39C
	.incbin "graphics/pokemon/omanyte/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_omastar_still_front_pic:: @ 8D8F3BC
	.incbin "graphics/pokemon/omastar/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_omastar_palette:: @ 8D8F77C
	.incbin "graphics/pokemon/omastar/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_omastar_back_pic:: @ 8D8F7A4
	.incbin "graphics/pokemon/omastar/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_omastar_shiny_palette:: @ 8D8FAE4
	.incbin "graphics/pokemon/omastar/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_omastar_icon:: @ 8D8FB0C
	.incbin "graphics/pokemon/omastar/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_omastar_footprint:: @ 8D8FF0C
	.incbin "graphics/pokemon/omastar/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_kabuto_still_front_pic:: @ 8D8FF2C
	.incbin "graphics/pokemon/kabuto/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kabuto_palette:: @ 8D90154
	.incbin "graphics/pokemon/kabuto/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_kabuto_back_pic:: @ 8D9017C
	.incbin "graphics/pokemon/kabuto/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kabuto_shiny_palette:: @ 8D90414
	.incbin "graphics/pokemon/kabuto/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_kabuto_icon:: @ 8D9043C
	.incbin "graphics/pokemon/kabuto/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_kabuto_footprint:: @ 8D9083C
	.incbin "graphics/pokemon/kabuto/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_kabutops_still_front_pic:: @ 8D9085C
	.incbin "graphics/pokemon/kabutops/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kabutops_palette:: @ 8D90C6C
	.incbin "graphics/pokemon/kabutops/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_kabutops_back_pic:: @ 8D90C90
	.incbin "graphics/pokemon/kabutops/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kabutops_shiny_palette:: @ 8D91034
	.incbin "graphics/pokemon/kabutops/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_kabutops_icon:: @ 8D91058
	.incbin "graphics/pokemon/kabutops/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_kabutops_footprint:: @ 8D91458
	.incbin "graphics/pokemon/kabutops/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_aerodactyl_still_front_pic:: @ 8D91478
	.incbin "graphics/pokemon/aerodactyl/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_aerodactyl_palette:: @ 8D918C8
	.incbin "graphics/pokemon/aerodactyl/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_aerodactyl_back_pic:: @ 8D918F0
	.incbin "graphics/pokemon/aerodactyl/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_aerodactyl_shiny_palette:: @ 8D91BF4
	.incbin "graphics/pokemon/aerodactyl/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_aerodactyl_icon:: @ 8D91C1C
	.incbin "graphics/pokemon/aerodactyl/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_aerodactyl_footprint:: @ 8D9201C
	.incbin "graphics/pokemon/aerodactyl/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_snorlax_still_front_pic:: @ 8D9203C
	.incbin "graphics/pokemon/snorlax/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_snorlax_palette:: @ 8D92410
	.incbin "graphics/pokemon/snorlax/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_snorlax_back_pic:: @ 8D92438
	.incbin "graphics/pokemon/snorlax/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_snorlax_shiny_palette:: @ 8D92654
	.incbin "graphics/pokemon/snorlax/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_snorlax_icon:: @ 8D9267C
	.incbin "graphics/pokemon/snorlax/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_snorlax_footprint:: @ 8D92A7C
	.incbin "graphics/pokemon/snorlax/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_articuno_still_front_pic:: @ 8D92A9C
	.incbin "graphics/pokemon/articuno/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_articuno_palette:: @ 8D92F94
	.incbin "graphics/pokemon/articuno/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_articuno_back_pic:: @ 8D92FBC
	.incbin "graphics/pokemon/articuno/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_articuno_shiny_palette:: @ 8D93218
	.incbin "graphics/pokemon/articuno/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_articuno_icon:: @ 8D93240
	.incbin "graphics/pokemon/articuno/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_articuno_footprint:: @ 8D93640
	.incbin "graphics/pokemon/articuno/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_zapdos_still_front_pic:: @ 8D93660
	.incbin "graphics/pokemon/zapdos/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_zapdos_palette:: @ 8D93AB0
	.incbin "graphics/pokemon/zapdos/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_zapdos_back_pic:: @ 8D93AD8
	.incbin "graphics/pokemon/zapdos/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_zapdos_shiny_palette:: @ 8D93E14
	.incbin "graphics/pokemon/zapdos/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_zapdos_icon:: @ 8D93E3C
	.incbin "graphics/pokemon/zapdos/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_zapdos_footprint:: @ 8D9423C
	.incbin "graphics/pokemon/zapdos/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_moltres_still_front_pic:: @ 8D9425C
	.incbin "graphics/pokemon/moltres/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_moltres_palette:: @ 8D94728
	.incbin "graphics/pokemon/moltres/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_moltres_back_pic:: @ 8D94750
	.incbin "graphics/pokemon/moltres/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_moltres_shiny_palette:: @ 8D94A8C
	.incbin "graphics/pokemon/moltres/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_moltres_icon:: @ 8D94AB4
	.incbin "graphics/pokemon/moltres/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_moltres_footprint:: @ 8D94EB4
	.incbin "graphics/pokemon/moltres/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_dratini_still_front_pic:: @ 8D94ED4
	.incbin "graphics/pokemon/dratini/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dratini_palette:: @ 8D95190
	.incbin "graphics/pokemon/dratini/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_dratini_back_pic:: @ 8D951B4
	.incbin "graphics/pokemon/dratini/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dratini_shiny_palette:: @ 8D95444
	.incbin "graphics/pokemon/dratini/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_dratini_icon:: @ 8D95468
	.incbin "graphics/pokemon/dratini/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_dratini_footprint:: @ 8D95868
	.incbin "graphics/pokemon/dratini/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_dragonair_still_front_pic:: @ 8D95888
	.incbin "graphics/pokemon/dragonair/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dragonair_palette:: @ 8D95C20
	.incbin "graphics/pokemon/dragonair/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_dragonair_back_pic:: @ 8D95C48
	.incbin "graphics/pokemon/dragonair/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dragonair_shiny_palette:: @ 8D95F58
	.incbin "graphics/pokemon/dragonair/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_dragonair_icon:: @ 8D95F80
	.incbin "graphics/pokemon/dragonair/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_dragonair_footprint:: @ 8D96380
	.incbin "graphics/pokemon/dragonair/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_dragonite_still_front_pic:: @ 8D963A0
	.incbin "graphics/pokemon/dragonite/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dragonite_palette:: @ 8D968F0
	.incbin "graphics/pokemon/dragonite/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_dragonite_back_pic:: @ 8D96918
	.incbin "graphics/pokemon/dragonite/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dragonite_shiny_palette:: @ 8D96C10
	.incbin "graphics/pokemon/dragonite/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_dragonite_icon:: @ 8D96C38
	.incbin "graphics/pokemon/dragonite/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_dragonite_footprint:: @ 8D97038
	.incbin "graphics/pokemon/dragonite/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_mewtwo_still_front_pic:: @ 8D97058
	.incbin "graphics/pokemon/mewtwo/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mewtwo_palette:: @ 8D97494
	.incbin "graphics/pokemon/mewtwo/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_mewtwo_back_pic:: @ 8D974B8
	.incbin "graphics/pokemon/mewtwo/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mewtwo_shiny_palette:: @ 8D97884
	.incbin "graphics/pokemon/mewtwo/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_mewtwo_icon:: @ 8D978A8
	.incbin "graphics/pokemon/mewtwo/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_mewtwo_footprint:: @ 8D97CA8
	.incbin "graphics/pokemon/mewtwo/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_mew_still_front_pic:: @ 8D97CC8
	.incbin "graphics/pokemon/mew/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mew_palette:: @ 8D97F88
	.incbin "graphics/pokemon/mew/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_mew_back_pic:: @ 8D97FAC
	.incbin "graphics/pokemon/mew/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mew_shiny_palette:: @ 8D982FC
	.incbin "graphics/pokemon/mew/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_mew_icon:: @ 8D98320
	.incbin "graphics/pokemon/mew/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_mew_footprint:: @ 8D98720
	.incbin "graphics/pokemon/mew/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_chikorita_still_front_pic:: @ 8D98740
	.incbin "graphics/pokemon/chikorita/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_chikorita_palette:: @ 8D989A8
	.incbin "graphics/pokemon/chikorita/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_chikorita_back_pic:: @ 8D989D0
	.incbin "graphics/pokemon/chikorita/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_chikorita_shiny_palette:: @ 8D98C94
	.incbin "graphics/pokemon/chikorita/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_chikorita_icon:: @ 8D98CBC
	.incbin "graphics/pokemon/chikorita/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_chikorita_footprint:: @ 8D990BC
	.incbin "graphics/pokemon/chikorita/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_bayleef_still_front_pic:: @ 8D990DC
	.incbin "graphics/pokemon/bayleef/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_bayleef_palette:: @ 8D994B0
	.incbin "graphics/pokemon/bayleef/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_bayleef_back_pic:: @ 8D994D8
	.incbin "graphics/pokemon/bayleef/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_bayleef_shiny_palette:: @ 8D99868
	.incbin "graphics/pokemon/bayleef/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_bayleef_icon:: @ 8D99890
	.incbin "graphics/pokemon/bayleef/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_bayleef_footprint:: @ 8D99C90
	.incbin "graphics/pokemon/bayleef/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_meganium_still_front_pic:: @ 8D99CB0
	.incbin "graphics/pokemon/meganium/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_meganium_palette:: @ 8D9A20C
	.incbin "graphics/pokemon/meganium/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_meganium_back_pic:: @ 8D9A234
	.incbin "graphics/pokemon/meganium/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_meganium_shiny_palette:: @ 8D9A584
	.incbin "graphics/pokemon/meganium/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_meganium_icon:: @ 8D9A5AC
	.incbin "graphics/pokemon/meganium/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_meganium_footprint:: @ 8D9A9AC
	.incbin "graphics/pokemon/meganium/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_cyndaquil_still_front_pic:: @ 8D9A9CC
	.incbin "graphics/pokemon/cyndaquil/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cyndaquil_palette:: @ 8D9AC58
	.incbin "graphics/pokemon/cyndaquil/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_cyndaquil_back_pic:: @ 8D9AC80
	.incbin "graphics/pokemon/cyndaquil/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cyndaquil_shiny_palette:: @ 8D9AFAC
	.incbin "graphics/pokemon/cyndaquil/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_cyndaquil_icon:: @ 8D9AFD4
	.incbin "graphics/pokemon/cyndaquil/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_cyndaquil_footprint:: @ 8D9B3D4
	.incbin "graphics/pokemon/cyndaquil/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_quilava_still_front_pic:: @ 8D9B3F4
	.incbin "graphics/pokemon/quilava/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_quilava_palette:: @ 8D9B710
	.incbin "graphics/pokemon/quilava/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_quilava_back_pic:: @ 8D9B738
	.incbin "graphics/pokemon/quilava/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_quilava_shiny_palette:: @ 8D9BAAC
	.incbin "graphics/pokemon/quilava/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_quilava_icon:: @ 8D9BAD4
	.incbin "graphics/pokemon/quilava/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_quilava_footprint:: @ 8D9BED4
	.incbin "graphics/pokemon/quilava/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_typhlosion_still_front_pic:: @ 8D9BEF4
	.incbin "graphics/pokemon/typhlosion/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_typhlosion_palette:: @ 8D9C31C
	.incbin "graphics/pokemon/typhlosion/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_typhlosion_back_pic:: @ 8D9C344
	.incbin "graphics/pokemon/typhlosion/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_typhlosion_shiny_palette:: @ 8D9C748
	.incbin "graphics/pokemon/typhlosion/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_typhlosion_icon:: @ 8D9C770
	.incbin "graphics/pokemon/typhlosion/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_typhlosion_footprint:: @ 8D9CB70
	.incbin "graphics/pokemon/typhlosion/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_totodile_still_front_pic:: @ 8D9CB90
	.incbin "graphics/pokemon/totodile/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_totodile_palette:: @ 8D9CE34
	.incbin "graphics/pokemon/totodile/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_totodile_back_pic:: @ 8D9CE5C
	.incbin "graphics/pokemon/totodile/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_totodile_shiny_palette:: @ 8D9D13C
	.incbin "graphics/pokemon/totodile/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_totodile_icon:: @ 8D9D164
	.incbin "graphics/pokemon/totodile/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_totodile_footprint:: @ 8D9D564
	.incbin "graphics/pokemon/totodile/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_croconaw_still_front_pic:: @ 8D9D584
	.incbin "graphics/pokemon/croconaw/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_croconaw_palette:: @ 8D9D8EC
	.incbin "graphics/pokemon/croconaw/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_croconaw_back_pic:: @ 8D9D914
	.incbin "graphics/pokemon/croconaw/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_croconaw_shiny_palette:: @ 8D9DC64
	.incbin "graphics/pokemon/croconaw/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_croconaw_icon:: @ 8D9DC8C
	.incbin "graphics/pokemon/croconaw/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_croconaw_footprint:: @ 8D9E08C
	.incbin "graphics/pokemon/croconaw/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_feraligatr_still_front_pic:: @ 8D9E0AC
	.incbin "graphics/pokemon/feraligatr/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_feraligatr_palette:: @ 8D9E618
	.incbin "graphics/pokemon/feraligatr/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_feraligatr_back_pic:: @ 8D9E640
	.incbin "graphics/pokemon/feraligatr/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_feraligatr_shiny_palette:: @ 8D9EB0C
	.incbin "graphics/pokemon/feraligatr/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_feraligatr_icon:: @ 8D9EB34
	.incbin "graphics/pokemon/feraligatr/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_feraligatr_footprint:: @ 8D9EF34
	.incbin "graphics/pokemon/feraligatr/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sentret_still_front_pic:: @ 8D9EF54
	.incbin "graphics/pokemon/sentret/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sentret_palette:: @ 8D9F230
	.incbin "graphics/pokemon/sentret/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sentret_back_pic:: @ 8D9F258
	.incbin "graphics/pokemon/sentret/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sentret_shiny_palette:: @ 8D9F4FC
	.incbin "graphics/pokemon/sentret/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sentret_icon:: @ 8D9F524
	.incbin "graphics/pokemon/sentret/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sentret_footprint:: @ 8D9F924
	.incbin "graphics/pokemon/sentret/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_furret_still_front_pic:: @ 8D9F944
	.incbin "graphics/pokemon/furret/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_furret_palette:: @ 8D9FC78
	.incbin "graphics/pokemon/furret/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_furret_back_pic:: @ 8D9FCA0
	.incbin "graphics/pokemon/furret/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_furret_shiny_palette:: @ 8D9FFC8
	.incbin "graphics/pokemon/furret/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_furret_icon:: @ 8D9FFF0
	.incbin "graphics/pokemon/furret/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_furret_footprint:: @ 8DA03F0
	.incbin "graphics/pokemon/furret/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_hoothoot_still_front_pic:: @ 8DA0410
	.incbin "graphics/pokemon/hoothoot/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hoothoot_palette:: @ 8DA0694
	.incbin "graphics/pokemon/hoothoot/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_hoothoot_back_pic:: @ 8DA06BC
	.incbin "graphics/pokemon/hoothoot/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hoothoot_shiny_palette:: @ 8DA09C4
	.incbin "graphics/pokemon/hoothoot/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_hoothoot_icon:: @ 8DA09EC
	.incbin "graphics/pokemon/hoothoot/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_hoothoot_footprint:: @ 8DA0DEC
	.incbin "graphics/pokemon/hoothoot/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_noctowl_still_front_pic:: @ 8DA0E0C
	.incbin "graphics/pokemon/noctowl/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_noctowl_palette:: @ 8DA1160
	.incbin "graphics/pokemon/noctowl/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_noctowl_back_pic:: @ 8DA1188
	.incbin "graphics/pokemon/noctowl/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_noctowl_shiny_palette:: @ 8DA14E4
	.incbin "graphics/pokemon/noctowl/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_noctowl_icon:: @ 8DA150C
	.incbin "graphics/pokemon/noctowl/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_noctowl_footprint:: @ 8DA190C
	.incbin "graphics/pokemon/noctowl/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ledyba_still_front_pic:: @ 8DA192C
	.incbin "graphics/pokemon/ledyba/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ledyba_palette:: @ 8DA1C20
	.incbin "graphics/pokemon/ledyba/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ledyba_back_pic:: @ 8DA1C48
	.incbin "graphics/pokemon/ledyba/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ledyba_shiny_palette:: @ 8DA1F78
	.incbin "graphics/pokemon/ledyba/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ledyba_icon:: @ 8DA1FA0
	.incbin "graphics/pokemon/ledyba/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ledyba_footprint:: @ 8DA23A0
	.incbin "graphics/pokemon/ledyba/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ledian_still_front_pic:: @ 8DA23C0
	.incbin "graphics/pokemon/ledian/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ledian_palette:: @ 8DA2748
	.incbin "graphics/pokemon/ledian/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ledian_back_pic:: @ 8DA2770
	.incbin "graphics/pokemon/ledian/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ledian_shiny_palette:: @ 8DA2AC8
	.incbin "graphics/pokemon/ledian/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ledian_icon:: @ 8DA2AF0
	.incbin "graphics/pokemon/ledian/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ledian_footprint:: @ 8DA2EF0
	.incbin "graphics/pokemon/ledian/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_spinarak_still_front_pic:: @ 8DA2F10
	.incbin "graphics/pokemon/spinarak/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_spinarak_palette:: @ 8DA3184
	.incbin "graphics/pokemon/spinarak/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_spinarak_back_pic:: @ 8DA31AC
	.incbin "graphics/pokemon/spinarak/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_spinarak_shiny_palette:: @ 8DA3410
	.incbin "graphics/pokemon/spinarak/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_spinarak_icon:: @ 8DA3438
	.incbin "graphics/pokemon/spinarak/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_spinarak_footprint:: @ 8DA3838
	.incbin "graphics/pokemon/spinarak/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ariados_still_front_pic:: @ 8DA3858
	.incbin "graphics/pokemon/ariados/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ariados_palette:: @ 8DA3C18
	.incbin "graphics/pokemon/ariados/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ariados_back_pic:: @ 8DA3C40
	.incbin "graphics/pokemon/ariados/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ariados_shiny_palette:: @ 8DA3FB8
	.incbin "graphics/pokemon/ariados/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ariados_icon:: @ 8DA3FE0
	.incbin "graphics/pokemon/ariados/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ariados_footprint:: @ 8DA43E0
	.incbin "graphics/pokemon/ariados/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_crobat_still_front_pic:: @ 8DA4400
	.incbin "graphics/pokemon/crobat/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_crobat_palette:: @ 8DA47B0
	.incbin "graphics/pokemon/crobat/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_crobat_back_pic:: @ 8DA47D8
	.incbin "graphics/pokemon/crobat/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_crobat_shiny_palette:: @ 8DA4AE0
	.incbin "graphics/pokemon/crobat/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_crobat_icon:: @ 8DA4B08
	.incbin "graphics/pokemon/crobat/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_crobat_footprint:: @ 8DA4F08
	.incbin "graphics/pokemon/crobat/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_chinchou_still_front_pic:: @ 8DA4F28
	.incbin "graphics/pokemon/chinchou/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_chinchou_palette:: @ 8DA5200
	.incbin "graphics/pokemon/chinchou/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_chinchou_back_pic:: @ 8DA5228
	.incbin "graphics/pokemon/chinchou/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_chinchou_shiny_palette:: @ 8DA5520
	.incbin "graphics/pokemon/chinchou/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_chinchou_icon:: @ 8DA5548
	.incbin "graphics/pokemon/chinchou/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_chinchou_footprint:: @ 8DA5948
	.incbin "graphics/pokemon/chinchou/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_lanturn_still_front_pic:: @ 8DA5968
	.incbin "graphics/pokemon/lanturn/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lanturn_palette:: @ 8DA5CD8
	.incbin "graphics/pokemon/lanturn/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_lanturn_back_pic:: @ 8DA5D00
	.incbin "graphics/pokemon/lanturn/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lanturn_shiny_palette:: @ 8DA6000
	.incbin "graphics/pokemon/lanturn/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_lanturn_icon:: @ 8DA6028
	.incbin "graphics/pokemon/lanturn/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_lanturn_footprint:: @ 8DA6428
	.incbin "graphics/pokemon/lanturn/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_pichu_still_front_pic:: @ 8DA6448
	.incbin "graphics/pokemon/pichu/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pichu_palette:: @ 8DA6664
	.incbin "graphics/pokemon/pichu/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_pichu_back_pic:: @ 8DA668C
	.incbin "graphics/pokemon/pichu/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pichu_shiny_palette:: @ 8DA68E8
	.incbin "graphics/pokemon/pichu/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_pichu_icon:: @ 8DA6910
	.incbin "graphics/pokemon/pichu/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_pichu_footprint:: @ 8DA6D10
	.incbin "graphics/pokemon/pichu/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_cleffa_still_front_pic:: @ 8DA6D30
	.incbin "graphics/pokemon/cleffa/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cleffa_palette:: @ 8DA6F10
	.incbin "graphics/pokemon/cleffa/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_cleffa_back_pic:: @ 8DA6F38
	.incbin "graphics/pokemon/cleffa/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cleffa_shiny_palette:: @ 8DA7174
	.incbin "graphics/pokemon/cleffa/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_cleffa_icon:: @ 8DA719C
	.incbin "graphics/pokemon/cleffa/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_cleffa_footprint:: @ 8DA759C
	.incbin "graphics/pokemon/cleffa/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_igglybuff_still_front_pic:: @ 8DA75BC
	.incbin "graphics/pokemon/igglybuff/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_igglybuff_palette:: @ 8DA77A4
	.incbin "graphics/pokemon/igglybuff/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_igglybuff_back_pic:: @ 8DA77CC
	.incbin "graphics/pokemon/igglybuff/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_igglybuff_shiny_palette:: @ 8DA7A08
	.incbin "graphics/pokemon/igglybuff/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_igglybuff_icon:: @ 8DA7A30
	.incbin "graphics/pokemon/igglybuff/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_igglybuff_footprint:: @ 8DA7E30
	.incbin "graphics/pokemon/igglybuff/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_togepi_still_front_pic:: @ 8DA7E50
	.incbin "graphics/pokemon/togepi/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_togepi_palette:: @ 8DA8024
	.incbin "graphics/pokemon/togepi/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_togepi_back_pic:: @ 8DA804C
	.incbin "graphics/pokemon/togepi/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_togepi_shiny_palette:: @ 8DA82C0
	.incbin "graphics/pokemon/togepi/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_togepi_icon:: @ 8DA82E8
	.incbin "graphics/pokemon/togepi/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_togepi_footprint:: @ 8DA86E8
	.incbin "graphics/pokemon/togepi/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_togetic_still_front_pic:: @ 8DA8708
	.incbin "graphics/pokemon/togetic/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_togetic_palette:: @ 8DA897C
	.incbin "graphics/pokemon/togetic/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_togetic_back_pic:: @ 8DA89A4
	.incbin "graphics/pokemon/togetic/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_togetic_shiny_palette:: @ 8DA8CD0
	.incbin "graphics/pokemon/togetic/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_togetic_icon:: @ 8DA8CF8
	.incbin "graphics/pokemon/togetic/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_togetic_footprint:: @ 8DA90F8
	.incbin "graphics/pokemon/togetic/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_natu_still_front_pic:: @ 8DA9118
	.incbin "graphics/pokemon/natu/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_natu_palette:: @ 8DA92E4
	.incbin "graphics/pokemon/natu/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_natu_back_pic:: @ 8DA930C
	.incbin "graphics/pokemon/natu/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_natu_shiny_palette:: @ 8DA9520
	.incbin "graphics/pokemon/natu/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_natu_icon:: @ 8DA9548
	.incbin "graphics/pokemon/natu/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_natu_footprint:: @ 8DA9948
	.incbin "graphics/pokemon/natu/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_xatu_still_front_pic:: @ 8DA9968
	.incbin "graphics/pokemon/xatu/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_xatu_palette:: @ 8DA9C44
	.incbin "graphics/pokemon/xatu/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_xatu_back_pic:: @ 8DA9C6C
	.incbin "graphics/pokemon/xatu/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_xatu_shiny_palette:: @ 8DA9FE4
	.incbin "graphics/pokemon/xatu/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_xatu_icon:: @ 8DAA00C
	.incbin "graphics/pokemon/xatu/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_xatu_footprint:: @ 8DAA40C
	.incbin "graphics/pokemon/xatu/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_mareep_still_front_pic:: @ 8DAA42C
	.incbin "graphics/pokemon/mareep/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mareep_palette:: @ 8DAA6E0
	.incbin "graphics/pokemon/mareep/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_mareep_back_pic:: @ 8DAA708
	.incbin "graphics/pokemon/mareep/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mareep_shiny_palette:: @ 8DAA9FC
	.incbin "graphics/pokemon/mareep/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_mareep_icon:: @ 8DAAA24
	.incbin "graphics/pokemon/mareep/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_mareep_footprint:: @ 8DAAE24
	.incbin "graphics/pokemon/mareep/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_flaaffy_still_front_pic:: @ 8DAAE44
	.incbin "graphics/pokemon/flaaffy/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_flaaffy_palette:: @ 8DAB144
	.incbin "graphics/pokemon/flaaffy/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_flaaffy_back_pic:: @ 8DAB16C
	.incbin "graphics/pokemon/flaaffy/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_flaaffy_shiny_palette:: @ 8DAB488
	.incbin "graphics/pokemon/flaaffy/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_flaaffy_icon:: @ 8DAB4B0
	.incbin "graphics/pokemon/flaaffy/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_flaaffy_footprint:: @ 8DAB8B0
	.incbin "graphics/pokemon/flaaffy/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ampharos_still_front_pic:: @ 8DAB8D0
	.incbin "graphics/pokemon/ampharos/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ampharos_palette:: @ 8DABC2C
	.incbin "graphics/pokemon/ampharos/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ampharos_back_pic:: @ 8DABC54
	.incbin "graphics/pokemon/ampharos/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ampharos_shiny_palette:: @ 8DABFCC
	.incbin "graphics/pokemon/ampharos/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ampharos_icon:: @ 8DABFF4
	.incbin "graphics/pokemon/ampharos/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ampharos_footprint:: @ 8DAC3F4
	.incbin "graphics/pokemon/ampharos/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_bellossom_still_front_pic:: @ 8DAC414
	.incbin "graphics/pokemon/bellossom/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_bellossom_palette:: @ 8DAC684
	.incbin "graphics/pokemon/bellossom/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_bellossom_back_pic:: @ 8DAC6AC
	.incbin "graphics/pokemon/bellossom/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_bellossom_shiny_palette:: @ 8DAC9D0
	.incbin "graphics/pokemon/bellossom/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_bellossom_icon:: @ 8DAC9F8
	.incbin "graphics/pokemon/bellossom/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_bellossom_footprint:: @ 8DACDF8
	.incbin "graphics/pokemon/bellossom/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_marill_still_front_pic:: @ 8DACE18
	.incbin "graphics/pokemon/marill/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_marill_palette:: @ 8DAD0DC
	.incbin "graphics/pokemon/marill/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_marill_back_pic:: @ 8DAD104
	.incbin "graphics/pokemon/marill/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_marill_shiny_palette:: @ 8DAD3B0
	.incbin "graphics/pokemon/marill/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_marill_icon:: @ 8DAD3D8
	.incbin "graphics/pokemon/marill/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_marill_footprint:: @ 8DAD7D8
	.incbin "graphics/pokemon/marill/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_azumarill_still_front_pic:: @ 8DAD7F8
	.incbin "graphics/pokemon/azumarill/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_azumarill_palette:: @ 8DADAF8
	.incbin "graphics/pokemon/azumarill/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_azumarill_back_pic:: @ 8DADB20
	.incbin "graphics/pokemon/azumarill/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_azumarill_shiny_palette:: @ 8DADDDC
	.incbin "graphics/pokemon/azumarill/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_azumarill_icon:: @ 8DADE04
	.incbin "graphics/pokemon/azumarill/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_azumarill_footprint:: @ 8DAE204
	.incbin "graphics/pokemon/azumarill/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sudowoodo_still_front_pic:: @ 8DAE224
	.incbin "graphics/pokemon/sudowoodo/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sudowoodo_palette:: @ 8DAE53C
	.incbin "graphics/pokemon/sudowoodo/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sudowoodo_back_pic:: @ 8DAE564
	.incbin "graphics/pokemon/sudowoodo/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sudowoodo_shiny_palette:: @ 8DAE8C0
	.incbin "graphics/pokemon/sudowoodo/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sudowoodo_icon:: @ 8DAE8E8
	.incbin "graphics/pokemon/sudowoodo/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sudowoodo_footprint:: @ 8DAECE8
	.incbin "graphics/pokemon/sudowoodo/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_politoed_still_front_pic:: @ 8DAED08
	.incbin "graphics/pokemon/politoed/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_politoed_palette:: @ 8DAF044
	.incbin "graphics/pokemon/politoed/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_politoed_back_pic:: @ 8DAF06C
	.incbin "graphics/pokemon/politoed/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_politoed_shiny_palette:: @ 8DAF328
	.incbin "graphics/pokemon/politoed/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_politoed_icon:: @ 8DAF350
	.incbin "graphics/pokemon/politoed/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_politoed_footprint:: @ 8DAF750
	.incbin "graphics/pokemon/politoed/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_hoppip_still_front_pic:: @ 8DAF770
	.incbin "graphics/pokemon/hoppip/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hoppip_palette:: @ 8DAFA24
	.incbin "graphics/pokemon/hoppip/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_hoppip_back_pic:: @ 8DAFA4C
	.incbin "graphics/pokemon/hoppip/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hoppip_shiny_palette:: @ 8DAFD2C
	.incbin "graphics/pokemon/hoppip/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_hoppip_icon:: @ 8DAFD54
	.incbin "graphics/pokemon/hoppip/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_hoppip_footprint:: @ 8DB0154
	.incbin "graphics/pokemon/hoppip/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_skiploom_still_front_pic:: @ 8DB0174
	.incbin "graphics/pokemon/skiploom/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_skiploom_palette:: @ 8DB03FC
	.incbin "graphics/pokemon/skiploom/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_skiploom_back_pic:: @ 8DB0424
	.incbin "graphics/pokemon/skiploom/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_skiploom_shiny_palette:: @ 8DB0704
	.incbin "graphics/pokemon/skiploom/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_skiploom_icon:: @ 8DB072C
	.incbin "graphics/pokemon/skiploom/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_skiploom_footprint:: @ 8DB0B2C
	.incbin "graphics/pokemon/skiploom/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_jumpluff_still_front_pic:: @ 8DB0B4C
	.incbin "graphics/pokemon/jumpluff/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_jumpluff_palette:: @ 8DB0EB8
	.incbin "graphics/pokemon/jumpluff/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_jumpluff_back_pic:: @ 8DB0EE0
	.incbin "graphics/pokemon/jumpluff/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_jumpluff_shiny_palette:: @ 8DB12D8
	.incbin "graphics/pokemon/jumpluff/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_jumpluff_icon:: @ 8DB1300
	.incbin "graphics/pokemon/jumpluff/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_jumpluff_footprint:: @ 8DB1700
	.incbin "graphics/pokemon/jumpluff/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_aipom_still_front_pic:: @ 8DB1720
	.incbin "graphics/pokemon/aipom/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_aipom_palette:: @ 8DB1A1C
	.incbin "graphics/pokemon/aipom/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_aipom_back_pic:: @ 8DB1A44
	.incbin "graphics/pokemon/aipom/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_aipom_shiny_palette:: @ 8DB1D38
	.incbin "graphics/pokemon/aipom/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_aipom_icon:: @ 8DB1D60
	.incbin "graphics/pokemon/aipom/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_aipom_footprint:: @ 8DB2160
	.incbin "graphics/pokemon/aipom/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sunkern_still_front_pic:: @ 8DB2180
	.incbin "graphics/pokemon/sunkern/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sunkern_palette:: @ 8DB23B8
	.incbin "graphics/pokemon/sunkern/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sunkern_back_pic:: @ 8DB23E0
	.incbin "graphics/pokemon/sunkern/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sunkern_shiny_palette:: @ 8DB26A4
	.incbin "graphics/pokemon/sunkern/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sunkern_icon:: @ 8DB26CC
	.incbin "graphics/pokemon/sunkern/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sunkern_footprint:: @ 8DB2ACC
	.incbin "graphics/pokemon/sunkern/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sunflora_still_front_pic:: @ 8DB2AEC
	.incbin "graphics/pokemon/sunflora/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sunflora_palette:: @ 8DB2E44
	.incbin "graphics/pokemon/sunflora/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sunflora_back_pic:: @ 8DB2E6C
	.incbin "graphics/pokemon/sunflora/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sunflora_shiny_palette:: @ 8DB320C
	.incbin "graphics/pokemon/sunflora/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sunflora_icon:: @ 8DB3234
	.incbin "graphics/pokemon/sunflora/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sunflora_footprint:: @ 8DB3634
	.incbin "graphics/pokemon/sunflora/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_yanma_still_front_pic:: @ 8DB3654
	.incbin "graphics/pokemon/yanma/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_yanma_palette:: @ 8DB39D8
	.incbin "graphics/pokemon/yanma/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_yanma_back_pic:: @ 8DB3A00
	.incbin "graphics/pokemon/yanma/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_yanma_shiny_palette:: @ 8DB3DB4
	.incbin "graphics/pokemon/yanma/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_yanma_icon:: @ 8DB3DDC
	.incbin "graphics/pokemon/yanma/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_yanma_footprint:: @ 8DB41DC
	.incbin "graphics/pokemon/yanma/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_wooper_still_front_pic:: @ 8DB41FC
	.incbin "graphics/pokemon/wooper/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wooper_palette:: @ 8DB443C
	.incbin "graphics/pokemon/wooper/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_wooper_back_pic:: @ 8DB4464
	.incbin "graphics/pokemon/wooper/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wooper_shiny_palette:: @ 8DB46F0
	.incbin "graphics/pokemon/wooper/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_wooper_icon:: @ 8DB4718
	.incbin "graphics/pokemon/wooper/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_wooper_footprint:: @ 8DB4B18
	.incbin "graphics/pokemon/wooper/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_quagsire_still_front_pic:: @ 8DB4B38
	.incbin "graphics/pokemon/quagsire/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_quagsire_palette:: @ 8DB4EAC
	.incbin "graphics/pokemon/quagsire/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_quagsire_back_pic:: @ 8DB4ED4
	.incbin "graphics/pokemon/quagsire/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_quagsire_shiny_palette:: @ 8DB51D0
	.incbin "graphics/pokemon/quagsire/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_quagsire_icon:: @ 8DB51F8
	.incbin "graphics/pokemon/quagsire/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_quagsire_footprint:: @ 8DB55F8
	.incbin "graphics/pokemon/quagsire/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_espeon_still_front_pic:: @ 8DB5618
	.incbin "graphics/pokemon/espeon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_espeon_palette:: @ 8DB5958
	.incbin "graphics/pokemon/espeon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_espeon_back_pic:: @ 8DB597C
	.incbin "graphics/pokemon/espeon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_espeon_shiny_palette:: @ 8DB5C58
	.incbin "graphics/pokemon/espeon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_espeon_icon:: @ 8DB5C7C
	.incbin "graphics/pokemon/espeon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_espeon_footprint:: @ 8DB607C
	.incbin "graphics/pokemon/espeon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_umbreon_still_front_pic:: @ 8DB609C
	.incbin "graphics/pokemon/umbreon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_umbreon_palette:: @ 8DB63B0
	.incbin "graphics/pokemon/umbreon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_umbreon_back_pic:: @ 8DB63D8
	.incbin "graphics/pokemon/umbreon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_umbreon_shiny_palette:: @ 8DB66EC
	.incbin "graphics/pokemon/umbreon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_umbreon_icon:: @ 8DB6714
	.incbin "graphics/pokemon/umbreon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_umbreon_footprint:: @ 8DB6B14
	.incbin "graphics/pokemon/umbreon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_murkrow_still_front_pic:: @ 8DB6B34
	.incbin "graphics/pokemon/murkrow/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_murkrow_palette:: @ 8DB6E14
	.incbin "graphics/pokemon/murkrow/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_murkrow_back_pic:: @ 8DB6E3C
	.incbin "graphics/pokemon/murkrow/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_murkrow_shiny_palette:: @ 8DB7154
	.incbin "graphics/pokemon/murkrow/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_murkrow_icon:: @ 8DB717C
	.incbin "graphics/pokemon/murkrow/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_murkrow_footprint:: @ 8DB757C
	.incbin "graphics/pokemon/murkrow/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_slowking_still_front_pic:: @ 8DB759C
	.incbin "graphics/pokemon/slowking/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slowking_palette:: @ 8DB7950
	.incbin "graphics/pokemon/slowking/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_slowking_back_pic:: @ 8DB7978
	.incbin "graphics/pokemon/slowking/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slowking_shiny_palette:: @ 8DB7D04
	.incbin "graphics/pokemon/slowking/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_slowking_icon:: @ 8DB7D2C
	.incbin "graphics/pokemon/slowking/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_slowking_footprint:: @ 8DB812C
	.incbin "graphics/pokemon/slowking/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_misdreavus_still_front_pic:: @ 8DB814C
	.incbin "graphics/pokemon/misdreavus/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_misdreavus_palette:: @ 8DB840C
	.incbin "graphics/pokemon/misdreavus/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_misdreavus_back_pic:: @ 8DB8434
	.incbin "graphics/pokemon/misdreavus/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_misdreavus_shiny_palette:: @ 8DB8758
	.incbin "graphics/pokemon/misdreavus/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_misdreavus_icon:: @ 8DB8780
	.incbin "graphics/pokemon/misdreavus/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_misdreavus_footprint:: @ 8DB8B80
	.incbin "graphics/pokemon/misdreavus/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_a_still_front_pic:: @ 8DB8BA0
	.incbin "graphics/pokemon/unown/a/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_unown_palette:: @ 8DB8D74
	.incbin "graphics/pokemon/unown/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_a_back_pic:: @ 8DB8D94
	.incbin "graphics/pokemon/unown/a/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_unown_shiny_palette:: @ 8DB8F94
	.incbin "graphics/pokemon/unown/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_a_icon:: @ 8DB8FB4
	.incbin "graphics/pokemon/unown/a/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_unown_footprint:: @ 8DB93B4
	.incbin "graphics/pokemon/unown/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_wobbuffet_still_front_pic:: @ 8DB93D4
	.incbin "graphics/pokemon/wobbuffet/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wobbuffet_palette:: @ 8DB9724
	.incbin "graphics/pokemon/wobbuffet/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_wobbuffet_back_pic:: @ 8DB974C
	.incbin "graphics/pokemon/wobbuffet/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wobbuffet_shiny_palette:: @ 8DB9990
	.incbin "graphics/pokemon/wobbuffet/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_wobbuffet_icon:: @ 8DB99B8
	.incbin "graphics/pokemon/wobbuffet/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_wobbuffet_footprint:: @ 8DB9DB8
	.incbin "graphics/pokemon/wobbuffet/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_girafarig_still_front_pic:: @ 8DB9DD8
	.incbin "graphics/pokemon/girafarig/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_girafarig_palette:: @ 8DBA1DC
	.incbin "graphics/pokemon/girafarig/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_girafarig_back_pic:: @ 8DBA204
	.incbin "graphics/pokemon/girafarig/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_girafarig_shiny_palette:: @ 8DBA5B0
	.incbin "graphics/pokemon/girafarig/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_girafarig_icon:: @ 8DBA5D8
	.incbin "graphics/pokemon/girafarig/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_girafarig_footprint:: @ 8DBA9D8
	.incbin "graphics/pokemon/girafarig/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_pineco_still_front_pic:: @ 8DBA9F8
	.incbin "graphics/pokemon/pineco/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pineco_palette:: @ 8DBAD38
	.incbin "graphics/pokemon/pineco/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_pineco_back_pic:: @ 8DBAD5C
	.incbin "graphics/pokemon/pineco/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pineco_shiny_palette:: @ 8DBB034
	.incbin "graphics/pokemon/pineco/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_pineco_icon:: @ 8DBB058
	.incbin "graphics/pokemon/pineco/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_pineco_footprint:: @ 8DBB458
	.incbin "graphics/pokemon/pineco/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_forretress_still_front_pic:: @ 8DBB478
	.incbin "graphics/pokemon/forretress/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_forretress_palette:: @ 8DBB894
	.incbin "graphics/pokemon/forretress/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_forretress_back_pic:: @ 8DBB8BC
	.incbin "graphics/pokemon/forretress/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_forretress_shiny_palette:: @ 8DBBB7C
	.incbin "graphics/pokemon/forretress/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_forretress_icon:: @ 8DBBBA4
	.incbin "graphics/pokemon/forretress/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_forretress_footprint:: @ 8DBBFA4
	.incbin "graphics/pokemon/forretress/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_dunsparce_still_front_pic:: @ 8DBBFC4
	.incbin "graphics/pokemon/dunsparce/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dunsparce_palette:: @ 8DBC2D4
	.incbin "graphics/pokemon/dunsparce/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_dunsparce_back_pic:: @ 8DBC2FC
	.incbin "graphics/pokemon/dunsparce/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dunsparce_shiny_palette:: @ 8DBC5F8
	.incbin "graphics/pokemon/dunsparce/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_dunsparce_icon:: @ 8DBC620
	.incbin "graphics/pokemon/dunsparce/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_dunsparce_footprint:: @ 8DBCA20
	.incbin "graphics/pokemon/dunsparce/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_gligar_still_front_pic:: @ 8DBCA40
	.incbin "graphics/pokemon/gligar/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gligar_palette:: @ 8DBCE68
	.incbin "graphics/pokemon/gligar/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_gligar_back_pic:: @ 8DBCE90
	.incbin "graphics/pokemon/gligar/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gligar_shiny_palette:: @ 8DBD268
	.incbin "graphics/pokemon/gligar/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_gligar_icon:: @ 8DBD290
	.incbin "graphics/pokemon/gligar/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_gligar_footprint:: @ 8DBD690
	.incbin "graphics/pokemon/gligar/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_steelix_still_front_pic:: @ 8DBD6B0
	.incbin "graphics/pokemon/steelix/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_steelix_palette:: @ 8DBDB78
	.incbin "graphics/pokemon/steelix/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_steelix_back_pic:: @ 8DBDB9C
	.incbin "graphics/pokemon/steelix/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_steelix_shiny_palette:: @ 8DBDFA8
	.incbin "graphics/pokemon/steelix/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_steelix_icon:: @ 8DBDFCC
	.incbin "graphics/pokemon/steelix/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_steelix_footprint:: @ 8DBE3CC
	.incbin "graphics/pokemon/steelix/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_snubbull_still_front_pic:: @ 8DBE3EC
	.incbin "graphics/pokemon/snubbull/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_snubbull_palette:: @ 8DBE6C0
	.incbin "graphics/pokemon/snubbull/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_snubbull_back_pic:: @ 8DBE6E8
	.incbin "graphics/pokemon/snubbull/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_snubbull_shiny_palette:: @ 8DBEA10
	.incbin "graphics/pokemon/snubbull/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_snubbull_icon:: @ 8DBEA38
	.incbin "graphics/pokemon/snubbull/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_snubbull_footprint:: @ 8DBEE38
	.incbin "graphics/pokemon/snubbull/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_granbull_still_front_pic:: @ 8DBEE58
	.incbin "graphics/pokemon/granbull/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_granbull_palette:: @ 8DBF1E4
	.incbin "graphics/pokemon/granbull/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_granbull_back_pic:: @ 8DBF20C
	.incbin "graphics/pokemon/granbull/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_granbull_shiny_palette:: @ 8DBF530
	.incbin "graphics/pokemon/granbull/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_granbull_icon:: @ 8DBF558
	.incbin "graphics/pokemon/granbull/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_granbull_footprint:: @ 8DBF958
	.incbin "graphics/pokemon/granbull/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_qwilfish_still_front_pic:: @ 8DBF978
	.incbin "graphics/pokemon/qwilfish/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_qwilfish_palette:: @ 8DBFC38
	.incbin "graphics/pokemon/qwilfish/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_qwilfish_back_pic:: @ 8DBFC60
	.incbin "graphics/pokemon/qwilfish/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_qwilfish_shiny_palette:: @ 8DBFF40
	.incbin "graphics/pokemon/qwilfish/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_qwilfish_icon:: @ 8DBFF68
	.incbin "graphics/pokemon/qwilfish/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_qwilfish_footprint:: @ 8DC0368
	.incbin "graphics/pokemon/qwilfish/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_scizor_still_front_pic:: @ 8DC0388
	.incbin "graphics/pokemon/scizor/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_scizor_palette:: @ 8DC0870
	.incbin "graphics/pokemon/scizor/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_scizor_back_pic:: @ 8DC0898
	.incbin "graphics/pokemon/scizor/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_scizor_shiny_palette:: @ 8DC0C18
	.incbin "graphics/pokemon/scizor/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_scizor_icon:: @ 8DC0C40
	.incbin "graphics/pokemon/scizor/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_scizor_footprint:: @ 8DC1040
	.incbin "graphics/pokemon/scizor/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_shuckle_still_front_pic:: @ 8DC1060
	.incbin "graphics/pokemon/shuckle/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shuckle_palette:: @ 8DC1328
	.incbin "graphics/pokemon/shuckle/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_shuckle_back_pic:: @ 8DC1350
	.incbin "graphics/pokemon/shuckle/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shuckle_shiny_palette:: @ 8DC15A8
	.incbin "graphics/pokemon/shuckle/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_shuckle_icon:: @ 8DC15D0
	.incbin "graphics/pokemon/shuckle/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_shuckle_footprint:: @ 8DC19D0
	.incbin "graphics/pokemon/shuckle/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_heracross_still_front_pic:: @ 8DC19F0
	.incbin "graphics/pokemon/heracross/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_heracross_palette:: @ 8DC1DE0
	.incbin "graphics/pokemon/heracross/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_heracross_back_pic:: @ 8DC1E08
	.incbin "graphics/pokemon/heracross/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_heracross_shiny_palette:: @ 8DC2178
	.incbin "graphics/pokemon/heracross/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_heracross_icon:: @ 8DC21A0
	.incbin "graphics/pokemon/heracross/icon.4bpp"

gUnknown_heracross_icon:: @ 8DC25A0
	.incbin "baserom.gba", 0xDC25A0, 0x400

	.align 2
gFile_graphics_pokemon_footprints_heracross_footprint:: @ 8DC29A0
	.incbin "graphics/pokemon/heracross/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sneasel_still_front_pic:: @ 8DC29C0
	.incbin "graphics/pokemon/sneasel/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sneasel_palette:: @ 8DC2D04
	.incbin "graphics/pokemon/sneasel/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sneasel_back_pic:: @ 8DC2D2C
	.incbin "graphics/pokemon/sneasel/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sneasel_shiny_palette:: @ 8DC3050
	.incbin "graphics/pokemon/sneasel/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sneasel_icon:: @ 8DC3078
	.incbin "graphics/pokemon/sneasel/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sneasel_footprint:: @ 8DC3478
	.incbin "graphics/pokemon/sneasel/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_teddiursa_still_front_pic:: @ 8DC3498
	.incbin "graphics/pokemon/teddiursa/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_teddiursa_palette:: @ 8DC3740
	.incbin "graphics/pokemon/teddiursa/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_teddiursa_back_pic:: @ 8DC3768
	.incbin "graphics/pokemon/teddiursa/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_teddiursa_shiny_palette:: @ 8DC39E0
	.incbin "graphics/pokemon/teddiursa/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_teddiursa_icon:: @ 8DC3A08
	.incbin "graphics/pokemon/teddiursa/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_teddiursa_footprint:: @ 8DC3E08
	.incbin "graphics/pokemon/teddiursa/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ursaring_still_front_pic:: @ 8DC3E28
	.incbin "graphics/pokemon/ursaring/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ursaring_palette:: @ 8DC4260
	.incbin "graphics/pokemon/ursaring/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ursaring_back_pic:: @ 8DC4288
	.incbin "graphics/pokemon/ursaring/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ursaring_shiny_palette:: @ 8DC4610
	.incbin "graphics/pokemon/ursaring/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ursaring_icon:: @ 8DC4638
	.incbin "graphics/pokemon/ursaring/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ursaring_footprint:: @ 8DC4A38
	.incbin "graphics/pokemon/ursaring/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_slugma_still_front_pic:: @ 8DC4A58
	.incbin "graphics/pokemon/slugma/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slugma_palette:: @ 8DC4CCC
	.incbin "graphics/pokemon/slugma/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_slugma_back_pic:: @ 8DC4CF0
	.incbin "graphics/pokemon/slugma/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slugma_shiny_palette:: @ 8DC4FD8
	.incbin "graphics/pokemon/slugma/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_slugma_icon:: @ 8DC4FFC
	.incbin "graphics/pokemon/slugma/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_slugma_footprint:: @ 8DC53FC
	.incbin "graphics/pokemon/slugma/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_magcargo_still_front_pic:: @ 8DC541C
	.incbin "graphics/pokemon/magcargo/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magcargo_palette:: @ 8DC5764
	.incbin "graphics/pokemon/magcargo/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_magcargo_back_pic:: @ 8DC578C
	.incbin "graphics/pokemon/magcargo/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magcargo_shiny_palette:: @ 8DC5BA4
	.incbin "graphics/pokemon/magcargo/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_magcargo_icon:: @ 8DC5BCC
	.incbin "graphics/pokemon/magcargo/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_magcargo_footprint:: @ 8DC5FCC
	.incbin "graphics/pokemon/magcargo/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_swinub_still_front_pic:: @ 8DC5FEC
	.incbin "graphics/pokemon/swinub/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_swinub_palette:: @ 8DC61E8
	.incbin "graphics/pokemon/swinub/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_swinub_back_pic:: @ 8DC6210
	.incbin "graphics/pokemon/swinub/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_swinub_shiny_palette:: @ 8DC644C
	.incbin "graphics/pokemon/swinub/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_swinub_icon:: @ 8DC6474
	.incbin "graphics/pokemon/swinub/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_swinub_footprint:: @ 8DC6874
	.incbin "graphics/pokemon/swinub/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_piloswine_still_front_pic:: @ 8DC6894
	.incbin "graphics/pokemon/piloswine/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_piloswine_palette:: @ 8DC6BBC
	.incbin "graphics/pokemon/piloswine/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_piloswine_back_pic:: @ 8DC6BE4
	.incbin "graphics/pokemon/piloswine/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_piloswine_shiny_palette:: @ 8DC6E30
	.incbin "graphics/pokemon/piloswine/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_piloswine_icon:: @ 8DC6E58
	.incbin "graphics/pokemon/piloswine/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_piloswine_footprint:: @ 8DC7258
	.incbin "graphics/pokemon/piloswine/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_corsola_still_front_pic:: @ 8DC7278
	.incbin "graphics/pokemon/corsola/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_corsola_palette:: @ 8DC7560
	.incbin "graphics/pokemon/corsola/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_corsola_back_pic:: @ 8DC7588
	.incbin "graphics/pokemon/corsola/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_corsola_shiny_palette:: @ 8DC7848
	.incbin "graphics/pokemon/corsola/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_corsola_icon:: @ 8DC7870
	.incbin "graphics/pokemon/corsola/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_corsola_footprint:: @ 8DC7C70
	.incbin "graphics/pokemon/corsola/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_remoraid_still_front_pic:: @ 8DC7C90
	.incbin "graphics/pokemon/remoraid/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_remoraid_palette:: @ 8DC7EF8
	.incbin "graphics/pokemon/remoraid/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_remoraid_back_pic:: @ 8DC7F20
	.incbin "graphics/pokemon/remoraid/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_remoraid_shiny_palette:: @ 8DC8234
	.incbin "graphics/pokemon/remoraid/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_remoraid_icon:: @ 8DC825C
	.incbin "graphics/pokemon/remoraid/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_remoraid_footprint:: @ 8DC865C
	.incbin "graphics/pokemon/remoraid/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_octillery_still_front_pic:: @ 8DC867C
	.incbin "graphics/pokemon/octillery/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_octillery_palette:: @ 8DC89B0
	.incbin "graphics/pokemon/octillery/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_octillery_back_pic:: @ 8DC89D8
	.incbin "graphics/pokemon/octillery/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_octillery_shiny_palette:: @ 8DC8C90
	.incbin "graphics/pokemon/octillery/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_octillery_icon:: @ 8DC8CB8
	.incbin "graphics/pokemon/octillery/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_octillery_footprint:: @ 8DC90B8
	.incbin "graphics/pokemon/octillery/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_delibird_still_front_pic:: @ 8DC90D8
	.incbin "graphics/pokemon/delibird/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_delibird_palette:: @ 8DC9448
	.incbin "graphics/pokemon/delibird/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_delibird_back_pic:: @ 8DC9470
	.incbin "graphics/pokemon/delibird/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_delibird_shiny_palette:: @ 8DC9830
	.incbin "graphics/pokemon/delibird/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_delibird_icon:: @ 8DC9858
	.incbin "graphics/pokemon/delibird/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_delibird_footprint:: @ 8DC9C58
	.incbin "graphics/pokemon/delibird/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_mantine_still_front_pic:: @ 8DC9C78
	.incbin "graphics/pokemon/mantine/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mantine_palette:: @ 8DCA114
	.incbin "graphics/pokemon/mantine/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_mantine_back_pic:: @ 8DCA13C
	.incbin "graphics/pokemon/mantine/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mantine_shiny_palette:: @ 8DCA3DC
	.incbin "graphics/pokemon/mantine/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_mantine_icon:: @ 8DCA404
	.incbin "graphics/pokemon/mantine/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_mantine_footprint:: @ 8DCA804
	.incbin "graphics/pokemon/mantine/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_skarmory_still_front_pic:: @ 8DCA824
	.incbin "graphics/pokemon/skarmory/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_skarmory_palette:: @ 8DCAD04
	.incbin "graphics/pokemon/skarmory/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_skarmory_back_pic:: @ 8DCAD2C
	.incbin "graphics/pokemon/skarmory/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_skarmory_shiny_palette:: @ 8DCB030
	.incbin "graphics/pokemon/skarmory/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_skarmory_icon:: @ 8DCB058
	.incbin "graphics/pokemon/skarmory/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_skarmory_footprint:: @ 8DCB458
	.incbin "graphics/pokemon/skarmory/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_houndour_still_front_pic:: @ 8DCB478
	.incbin "graphics/pokemon/houndour/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_houndour_palette:: @ 8DCB730
	.incbin "graphics/pokemon/houndour/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_houndour_back_pic:: @ 8DCB758
	.incbin "graphics/pokemon/houndour/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_houndour_shiny_palette:: @ 8DCB9D8
	.incbin "graphics/pokemon/houndour/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_houndour_icon:: @ 8DCBA00
	.incbin "graphics/pokemon/houndour/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_houndour_footprint:: @ 8DCBE00
	.incbin "graphics/pokemon/houndour/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_houndoom_still_front_pic:: @ 8DCBE20
	.incbin "graphics/pokemon/houndoom/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_houndoom_palette:: @ 8DCC220
	.incbin "graphics/pokemon/houndoom/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_houndoom_back_pic:: @ 8DCC248
	.incbin "graphics/pokemon/houndoom/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_houndoom_shiny_palette:: @ 8DCC56C
	.incbin "graphics/pokemon/houndoom/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_houndoom_icon:: @ 8DCC594
	.incbin "graphics/pokemon/houndoom/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_houndoom_footprint:: @ 8DCC994
	.incbin "graphics/pokemon/houndoom/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_kingdra_still_front_pic:: @ 8DCC9B4
	.incbin "graphics/pokemon/kingdra/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kingdra_palette:: @ 8DCCDD4
	.incbin "graphics/pokemon/kingdra/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_kingdra_back_pic:: @ 8DCCDFC
	.incbin "graphics/pokemon/kingdra/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kingdra_shiny_palette:: @ 8DCD1B0
	.incbin "graphics/pokemon/kingdra/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_kingdra_icon:: @ 8DCD1D8
	.incbin "graphics/pokemon/kingdra/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_kingdra_footprint:: @ 8DCD5D8
	.incbin "graphics/pokemon/kingdra/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_phanpy_still_front_pic:: @ 8DCD5F8
	.incbin "graphics/pokemon/phanpy/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_phanpy_palette:: @ 8DCD854
	.incbin "graphics/pokemon/phanpy/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_phanpy_back_pic:: @ 8DCD87C
	.incbin "graphics/pokemon/phanpy/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_phanpy_shiny_palette:: @ 8DCDB40
	.incbin "graphics/pokemon/phanpy/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_phanpy_icon:: @ 8DCDB68
	.incbin "graphics/pokemon/phanpy/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_phanpy_footprint:: @ 8DCDF68
	.incbin "graphics/pokemon/phanpy/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_donphan_still_front_pic:: @ 8DCDF88
	.incbin "graphics/pokemon/donphan/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_donphan_palette:: @ 8DCE3FC
	.incbin "graphics/pokemon/donphan/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_donphan_back_pic:: @ 8DCE424
	.incbin "graphics/pokemon/donphan/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_donphan_shiny_palette:: @ 8DCE720
	.incbin "graphics/pokemon/donphan/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_donphan_icon:: @ 8DCE748
	.incbin "graphics/pokemon/donphan/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_donphan_footprint:: @ 8DCEB48
	.incbin "graphics/pokemon/donphan/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_porygon2_still_front_pic:: @ 8DCEB68
	.incbin "graphics/pokemon/porygon2/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_porygon2_palette:: @ 8DCEDF0
	.incbin "graphics/pokemon/porygon2/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_porygon2_back_pic:: @ 8DCEE18
	.incbin "graphics/pokemon/porygon2/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_porygon2_shiny_palette:: @ 8DCF134
	.incbin "graphics/pokemon/porygon2/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_porygon2_icon:: @ 8DCF15C
	.incbin "graphics/pokemon/porygon2/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_porygon2_footprint:: @ 8DCF55C
	.incbin "graphics/pokemon/porygon2/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_stantler_still_front_pic:: @ 8DCF57C
	.incbin "graphics/pokemon/stantler/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_stantler_palette:: @ 8DCF990
	.incbin "graphics/pokemon/stantler/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_stantler_back_pic:: @ 8DCF9B8
	.incbin "graphics/pokemon/stantler/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_stantler_shiny_palette:: @ 8DCFD04
	.incbin "graphics/pokemon/stantler/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_stantler_icon:: @ 8DCFD2C
	.incbin "graphics/pokemon/stantler/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_stantler_footprint:: @ 8DD012C
	.incbin "graphics/pokemon/stantler/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_smeargle_still_front_pic:: @ 8DD014C
	.incbin "graphics/pokemon/smeargle/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_smeargle_palette:: @ 8DD04E0
	.incbin "graphics/pokemon/smeargle/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_smeargle_back_pic:: @ 8DD0508
	.incbin "graphics/pokemon/smeargle/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_smeargle_shiny_palette:: @ 8DD082C
	.incbin "graphics/pokemon/smeargle/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_smeargle_icon:: @ 8DD0854
	.incbin "graphics/pokemon/smeargle/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_smeargle_footprint:: @ 8DD0C54
	.incbin "graphics/pokemon/smeargle/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_tyrogue_still_front_pic:: @ 8DD0C74
	.incbin "graphics/pokemon/tyrogue/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tyrogue_palette:: @ 8DD0F00
	.incbin "graphics/pokemon/tyrogue/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_tyrogue_back_pic:: @ 8DD0F28
	.incbin "graphics/pokemon/tyrogue/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tyrogue_shiny_palette:: @ 8DD1244
	.incbin "graphics/pokemon/tyrogue/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_tyrogue_icon:: @ 8DD126C
	.incbin "graphics/pokemon/tyrogue/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_tyrogue_footprint:: @ 8DD166C
	.incbin "graphics/pokemon/tyrogue/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_hitmontop_still_front_pic:: @ 8DD168C
	.incbin "graphics/pokemon/hitmontop/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hitmontop_palette:: @ 8DD1A18
	.incbin "graphics/pokemon/hitmontop/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_hitmontop_back_pic:: @ 8DD1A40
	.incbin "graphics/pokemon/hitmontop/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hitmontop_shiny_palette:: @ 8DD1E68
	.incbin "graphics/pokemon/hitmontop/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_hitmontop_icon:: @ 8DD1E90
	.incbin "graphics/pokemon/hitmontop/icon.4bpp"

gUnknown_hitmontop_unknown_data:: @ 8DD2290
	.incbin "baserom.gba", 0xDD2290, 0x200

	.align 2
gFile_graphics_pokemon_footprints_hitmontop_footprint:: @ 8DD2490
	.incbin "graphics/pokemon/hitmontop/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_smoochum_still_front_pic:: @ 8DD24B0
	.incbin "graphics/pokemon/smoochum/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_smoochum_palette:: @ 8DD2708
	.incbin "graphics/pokemon/smoochum/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_smoochum_back_pic:: @ 8DD2730
	.incbin "graphics/pokemon/smoochum/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_smoochum_shiny_palette:: @ 8DD29A8
	.incbin "graphics/pokemon/smoochum/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_smoochum_icon:: @ 8DD29D0
	.incbin "graphics/pokemon/smoochum/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_smoochum_footprint:: @ 8DD2DD0
	.incbin "graphics/pokemon/smoochum/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_elekid_still_front_pic:: @ 8DD2DF0
	.incbin "graphics/pokemon/elekid/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_elekid_palette:: @ 8DD30F8
	.incbin "graphics/pokemon/elekid/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_elekid_back_pic:: @ 8DD3120
	.incbin "graphics/pokemon/elekid/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_elekid_shiny_palette:: @ 8DD3478
	.incbin "graphics/pokemon/elekid/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_elekid_icon:: @ 8DD34A0
	.incbin "graphics/pokemon/elekid/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_elekid_footprint:: @ 8DD38A0
	.incbin "graphics/pokemon/elekid/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_magby_still_front_pic:: @ 8DD38C0
	.incbin "graphics/pokemon/magby/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magby_palette:: @ 8DD3B44
	.incbin "graphics/pokemon/magby/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_magby_back_pic:: @ 8DD3B6C
	.incbin "graphics/pokemon/magby/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_magby_shiny_palette:: @ 8DD3E18
	.incbin "graphics/pokemon/magby/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_magby_icon:: @ 8DD3E40
	.incbin "graphics/pokemon/magby/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_magby_footprint:: @ 8DD4240
	.incbin "graphics/pokemon/magby/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_miltank_still_front_pic:: @ 8DD4260
	.incbin "graphics/pokemon/miltank/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_miltank_palette:: @ 8DD4610
	.incbin "graphics/pokemon/miltank/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_miltank_back_pic:: @ 8DD4638
	.incbin "graphics/pokemon/miltank/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_miltank_shiny_palette:: @ 8DD49D4
	.incbin "graphics/pokemon/miltank/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_miltank_icon:: @ 8DD49FC
	.incbin "graphics/pokemon/miltank/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_miltank_footprint:: @ 8DD4DFC
	.incbin "graphics/pokemon/miltank/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_blissey_still_front_pic:: @ 8DD4E1C
	.incbin "graphics/pokemon/blissey/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_blissey_palette:: @ 8DD5204
	.incbin "graphics/pokemon/blissey/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_blissey_back_pic:: @ 8DD522C
	.incbin "graphics/pokemon/blissey/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_blissey_shiny_palette:: @ 8DD54F8
	.incbin "graphics/pokemon/blissey/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_blissey_icon:: @ 8DD5520
	.incbin "graphics/pokemon/blissey/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_blissey_footprint:: @ 8DD5920
	.incbin "graphics/pokemon/blissey/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_raikou_still_front_pic:: @ 8DD5940
	.incbin "graphics/pokemon/raikou/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_raikou_palette:: @ 8DD5EBC
	.incbin "graphics/pokemon/raikou/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_raikou_back_pic:: @ 8DD5EE4
	.incbin "graphics/pokemon/raikou/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_raikou_shiny_palette:: @ 8DD628C
	.incbin "graphics/pokemon/raikou/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_raikou_icon:: @ 8DD62B4
	.incbin "graphics/pokemon/raikou/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_raikou_footprint:: @ 8DD66B4
	.incbin "graphics/pokemon/raikou/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_entei_still_front_pic:: @ 8DD66D4
	.incbin "graphics/pokemon/entei/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_entei_palette:: @ 8DD6CD0
	.incbin "graphics/pokemon/entei/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_entei_back_pic:: @ 8DD6CF8
	.incbin "graphics/pokemon/entei/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_entei_shiny_palette:: @ 8DD711C
	.incbin "graphics/pokemon/entei/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_entei_icon:: @ 8DD7144
	.incbin "graphics/pokemon/entei/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_entei_footprint:: @ 8DD7544
	.incbin "graphics/pokemon/entei/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_suicune_still_front_pic:: @ 8DD7564
	.incbin "graphics/pokemon/suicune/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_suicune_palette:: @ 8DD7AE8
	.incbin "graphics/pokemon/suicune/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_suicune_back_pic:: @ 8DD7B10
	.incbin "graphics/pokemon/suicune/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_suicune_shiny_palette:: @ 8DD7FEC
	.incbin "graphics/pokemon/suicune/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_suicune_icon:: @ 8DD8014
	.incbin "graphics/pokemon/suicune/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_suicune_footprint:: @ 8DD8414
	.incbin "graphics/pokemon/suicune/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_larvitar_still_front_pic:: @ 8DD8434
	.incbin "graphics/pokemon/larvitar/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_larvitar_palette:: @ 8DD8690
	.incbin "graphics/pokemon/larvitar/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_larvitar_back_pic:: @ 8DD86B8
	.incbin "graphics/pokemon/larvitar/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_larvitar_shiny_palette:: @ 8DD8964
	.incbin "graphics/pokemon/larvitar/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_larvitar_icon:: @ 8DD898C
	.incbin "graphics/pokemon/larvitar/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_larvitar_footprint:: @ 8DD8D8C
	.incbin "graphics/pokemon/larvitar/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_pupitar_still_front_pic:: @ 8DD8DAC
	.incbin "graphics/pokemon/pupitar/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pupitar_palette:: @ 8DD909C
	.incbin "graphics/pokemon/pupitar/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_pupitar_back_pic:: @ 8DD90C4
	.incbin "graphics/pokemon/pupitar/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pupitar_shiny_palette:: @ 8DD93FC
	.incbin "graphics/pokemon/pupitar/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_pupitar_icon:: @ 8DD9424
	.incbin "graphics/pokemon/pupitar/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_pupitar_footprint:: @ 8DD9824
	.incbin "graphics/pokemon/pupitar/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_tyranitar_still_front_pic:: @ 8DD9844
	.incbin "graphics/pokemon/tyranitar/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tyranitar_palette:: @ 8DD9D80
	.incbin "graphics/pokemon/tyranitar/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_tyranitar_back_pic:: @ 8DD9DA8
	.incbin "graphics/pokemon/tyranitar/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tyranitar_shiny_palette:: @ 8DDA194
	.incbin "graphics/pokemon/tyranitar/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_tyranitar_icon:: @ 8DDA1BC
	.incbin "graphics/pokemon/tyranitar/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_tyranitar_footprint:: @ 8DDA5BC
	.incbin "graphics/pokemon/tyranitar/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_lugia_still_front_pic:: @ 8DDA5DC
	.incbin "graphics/pokemon/lugia/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lugia_palette:: @ 8DDAAA0
	.incbin "graphics/pokemon/lugia/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_lugia_back_pic:: @ 8DDAAC8
	.incbin "graphics/pokemon/lugia/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lugia_shiny_palette:: @ 8DDAE9C
	.incbin "graphics/pokemon/lugia/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_lugia_icon:: @ 8DDAEC4
	.incbin "graphics/pokemon/lugia/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_lugia_footprint:: @ 8DDB2C4
	.incbin "graphics/pokemon/lugia/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ho_oh_still_front_pic:: @ 8DDB2E4
	.incbin "graphics/pokemon/ho_oh/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ho_oh_palette:: @ 8DDB938
	.incbin "graphics/pokemon/ho_oh/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ho_oh_back_pic:: @ 8DDB960
	.incbin "graphics/pokemon/ho_oh/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ho_oh_shiny_palette:: @ 8DDBD70
	.incbin "graphics/pokemon/ho_oh/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ho_oh_icon:: @ 8DDBD98
	.incbin "graphics/pokemon/ho_oh/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ho_oh_footprint:: @ 8DDC198
	.incbin "graphics/pokemon/ho_oh/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_celebi_still_front_pic:: @ 8DDC1B8
	.incbin "graphics/pokemon/celebi/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_celebi_palette:: @ 8DDC430
	.incbin "graphics/pokemon/celebi/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_celebi_back_pic:: @ 8DDC458
	.incbin "graphics/pokemon/celebi/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_celebi_shiny_palette:: @ 8DDC804
	.incbin "graphics/pokemon/celebi/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_celebi_icon:: @ 8DDC82C
	.incbin "graphics/pokemon/celebi/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_celebi_footprint:: @ 8DDCC2C
	.incbin "graphics/pokemon/celebi/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_double_question_mark_still_front_pic:: @ 8DDCC4C
	.incbin "graphics/pokemon/question_mark/double/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_double_question_mark_palette:: @ 8DDCDD0
	.incbin "graphics/pokemon/question_mark/double/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_double_question_mark_back_pic:: @ 8DDCDE4
	.incbin "graphics/pokemon/question_mark/double/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_double_question_mark_shiny_palette:: @ 8DDCF68
	.incbin "graphics/pokemon/question_mark/double/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_front_pics_treecko_still_front_pic:: @ 8DDCF7C
	.incbin "graphics/pokemon/treecko/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_treecko_palette:: @ 8DDD284
	.incbin "graphics/pokemon/treecko/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_treecko_back_pic:: @ 8DDD2AC
	.incbin "graphics/pokemon/treecko/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_treecko_shiny_palette:: @ 8DDD5AC
	.incbin "graphics/pokemon/treecko/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_treecko_icon:: @ 8DDD5D4
	.incbin "graphics/pokemon/treecko/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_treecko_footprint:: @ 8DDD9D4
	.incbin "graphics/pokemon/treecko/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_grovyle_still_front_pic:: @ 8DDD9F4
	.incbin "graphics/pokemon/grovyle/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_grovyle_palette:: @ 8DDDE80
	.incbin "graphics/pokemon/grovyle/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_grovyle_back_pic:: @ 8DDDEA8
	.incbin "graphics/pokemon/grovyle/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_grovyle_shiny_palette:: @ 8DDE1E4
	.incbin "graphics/pokemon/grovyle/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_grovyle_icon:: @ 8DDE20C
	.incbin "graphics/pokemon/grovyle/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_grovyle_footprint:: @ 8DDE60C
	.incbin "graphics/pokemon/grovyle/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sceptile_still_front_pic:: @ 8DDE62C
	.incbin "graphics/pokemon/sceptile/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sceptile_palette:: @ 8DDEB30
	.incbin "graphics/pokemon/sceptile/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sceptile_back_pic:: @ 8DDEB58
	.incbin "graphics/pokemon/sceptile/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sceptile_shiny_palette:: @ 8DDEF54
	.incbin "graphics/pokemon/sceptile/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sceptile_icon:: @ 8DDEF7C
	.incbin "graphics/pokemon/sceptile/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sceptile_footprint:: @ 8DDF37C
	.incbin "graphics/pokemon/sceptile/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_torchic_still_front_pic:: @ 8DDF39C
	.incbin "graphics/pokemon/torchic/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_torchic_palette:: @ 8DDF638
	.incbin "graphics/pokemon/torchic/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_torchic_back_pic:: @ 8DDF660
	.incbin "graphics/pokemon/torchic/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_torchic_shiny_palette:: @ 8DDF938
	.incbin "graphics/pokemon/torchic/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_torchic_icon:: @ 8DDF960
	.incbin "graphics/pokemon/torchic/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_torchic_footprint:: @ 8DDFD60
	.incbin "graphics/pokemon/torchic/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_combusken_still_front_pic:: @ 8DDFD80
	.incbin "graphics/pokemon/combusken/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_combusken_palette:: @ 8DE016C
	.incbin "graphics/pokemon/combusken/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_combusken_back_pic:: @ 8DE0194
	.incbin "graphics/pokemon/combusken/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_combusken_shiny_palette:: @ 8DE0564
	.incbin "graphics/pokemon/combusken/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_combusken_icon:: @ 8DE058C
	.incbin "graphics/pokemon/combusken/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_combusken_footprint:: @ 8DE098C
	.incbin "graphics/pokemon/combusken/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_blaziken_still_front_pic:: @ 8DE09AC
	.incbin "graphics/pokemon/blaziken/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_blaziken_palette:: @ 8DE0E24
	.incbin "graphics/pokemon/blaziken/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_blaziken_back_pic:: @ 8DE0E4C
	.incbin "graphics/pokemon/blaziken/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_blaziken_shiny_palette:: @ 8DE1228
	.incbin "graphics/pokemon/blaziken/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_blaziken_icon:: @ 8DE1250
	.incbin "graphics/pokemon/blaziken/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_blaziken_footprint:: @ 8DE1650
	.incbin "graphics/pokemon/blaziken/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_mudkip_still_front_pic:: @ 8DE1670
	.incbin "graphics/pokemon/mudkip/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mudkip_palette:: @ 8DE1928
	.incbin "graphics/pokemon/mudkip/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_mudkip_back_pic:: @ 8DE1950
	.incbin "graphics/pokemon/mudkip/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mudkip_shiny_palette:: @ 8DE1C30
	.incbin "graphics/pokemon/mudkip/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_mudkip_icon:: @ 8DE1C58
	.incbin "graphics/pokemon/mudkip/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_mudkip_footprint:: @ 8DE2058
	.incbin "graphics/pokemon/mudkip/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_marshtomp_still_front_pic:: @ 8DE2078
	.incbin "graphics/pokemon/marshtomp/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_marshtomp_palette:: @ 8DE2400
	.incbin "graphics/pokemon/marshtomp/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_marshtomp_back_pic:: @ 8DE2428
	.incbin "graphics/pokemon/marshtomp/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_marshtomp_shiny_palette:: @ 8DE27D8
	.incbin "graphics/pokemon/marshtomp/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_marshtomp_icon:: @ 8DE2800
	.incbin "graphics/pokemon/marshtomp/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_marshtomp_footprint:: @ 8DE2C00
	.incbin "graphics/pokemon/marshtomp/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_swampert_still_front_pic:: @ 8DE2C20
	.incbin "graphics/pokemon/swampert/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_swampert_palette:: @ 8DE319C
	.incbin "graphics/pokemon/swampert/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_swampert_back_pic:: @ 8DE31C4
	.incbin "graphics/pokemon/swampert/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_swampert_shiny_palette:: @ 8DE3578
	.incbin "graphics/pokemon/swampert/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_swampert_icon:: @ 8DE35A0
	.incbin "graphics/pokemon/swampert/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_swampert_footprint:: @ 8DE39A0
	.incbin "graphics/pokemon/swampert/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_poochyena_still_front_pic:: @ 8DE39C0
	.incbin "graphics/pokemon/poochyena/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_poochyena_palette:: @ 8DE3C88
	.incbin "graphics/pokemon/poochyena/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_poochyena_back_pic:: @ 8DE3CB0
	.incbin "graphics/pokemon/poochyena/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_poochyena_shiny_palette:: @ 8DE3FDC
	.incbin "graphics/pokemon/poochyena/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_poochyena_icon:: @ 8DE4004
	.incbin "graphics/pokemon/poochyena/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_poochyena_footprint:: @ 8DE4404
	.incbin "graphics/pokemon/poochyena/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_mightyena_still_front_pic:: @ 8DE4424
	.incbin "graphics/pokemon/mightyena/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mightyena_palette:: @ 8DE485C
	.incbin "graphics/pokemon/mightyena/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_mightyena_back_pic:: @ 8DE4884
	.incbin "graphics/pokemon/mightyena/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mightyena_shiny_palette:: @ 8DE4BFC
	.incbin "graphics/pokemon/mightyena/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_mightyena_icon:: @ 8DE4C24
	.incbin "graphics/pokemon/mightyena/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_mightyena_footprint:: @ 8DE5024
	.incbin "graphics/pokemon/mightyena/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_zigzagoon_still_front_pic:: @ 8DE5044
	.incbin "graphics/pokemon/zigzagoon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_zigzagoon_palette:: @ 8DE5414
	.incbin "graphics/pokemon/zigzagoon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_zigzagoon_back_pic:: @ 8DE543C
	.incbin "graphics/pokemon/zigzagoon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_zigzagoon_shiny_palette:: @ 8DE577C
	.incbin "graphics/pokemon/zigzagoon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_zigzagoon_icon:: @ 8DE57A4
	.incbin "graphics/pokemon/zigzagoon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_zigzagoon_footprint:: @ 8DE5BA4
	.incbin "graphics/pokemon/zigzagoon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_linoone_still_front_pic:: @ 8DE5BC4
	.incbin "graphics/pokemon/linoone/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_linoone_palette:: @ 8DE5F34
	.incbin "graphics/pokemon/linoone/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_linoone_back_pic:: @ 8DE5F5C
	.incbin "graphics/pokemon/linoone/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_linoone_shiny_palette:: @ 8DE6230
	.incbin "graphics/pokemon/linoone/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_linoone_icon:: @ 8DE6258
	.incbin "graphics/pokemon/linoone/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_linoone_footprint:: @ 8DE6658
	.incbin "graphics/pokemon/linoone/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_wurmple_still_front_pic:: @ 8DE6678
	.incbin "graphics/pokemon/wurmple/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wurmple_palette:: @ 8DE6900
	.incbin "graphics/pokemon/wurmple/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_wurmple_back_pic:: @ 8DE6928
	.incbin "graphics/pokemon/wurmple/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wurmple_shiny_palette:: @ 8DE6B74
	.incbin "graphics/pokemon/wurmple/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_wurmple_icon:: @ 8DE6B9C
	.incbin "graphics/pokemon/wurmple/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_wurmple_footprint:: @ 8DE6F9C
	.incbin "graphics/pokemon/wurmple/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_silcoon_still_front_pic:: @ 8DE6FBC
	.incbin "graphics/pokemon/silcoon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_silcoon_palette:: @ 8DE723C
	.incbin "graphics/pokemon/silcoon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_silcoon_back_pic:: @ 8DE7264
	.incbin "graphics/pokemon/silcoon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_silcoon_shiny_palette:: @ 8DE7480
	.incbin "graphics/pokemon/silcoon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_silcoon_icon:: @ 8DE74A8
	.incbin "graphics/pokemon/silcoon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_silcoon_footprint:: @ 8DE78A8
	.incbin "graphics/pokemon/silcoon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_beautifly_still_front_pic:: @ 8DE78C8
	.incbin "graphics/pokemon/beautifly/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_beautifly_palette:: @ 8DE7C20
	.incbin "graphics/pokemon/beautifly/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_beautifly_back_pic:: @ 8DE7C48
	.incbin "graphics/pokemon/beautifly/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_beautifly_shiny_palette:: @ 8DE7FF8
	.incbin "graphics/pokemon/beautifly/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_beautifly_icon:: @ 8DE8020
	.incbin "graphics/pokemon/beautifly/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_beautifly_footprint:: @ 8DE8420
	.incbin "graphics/pokemon/beautifly/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_cascoon_still_front_pic:: @ 8DE8440
	.incbin "graphics/pokemon/cascoon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cascoon_palette:: @ 8DE86AC
	.incbin "graphics/pokemon/cascoon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_cascoon_back_pic:: @ 8DE86D4
	.incbin "graphics/pokemon/cascoon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cascoon_shiny_palette:: @ 8DE88E4
	.incbin "graphics/pokemon/cascoon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_cascoon_icon:: @ 8DE890C
	.incbin "graphics/pokemon/cascoon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_cascoon_footprint:: @ 8DE8D0C
	.incbin "graphics/pokemon/cascoon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_dustox_still_front_pic:: @ 8DE8D2C
	.incbin "graphics/pokemon/dustox/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dustox_palette:: @ 8DE9094
	.incbin "graphics/pokemon/dustox/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_dustox_back_pic:: @ 8DE90BC
	.incbin "graphics/pokemon/dustox/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dustox_shiny_palette:: @ 8DE9314
	.incbin "graphics/pokemon/dustox/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_dustox_icon:: @ 8DE933C
	.incbin "graphics/pokemon/dustox/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_dustox_footprint:: @ 8DE973C
	.incbin "graphics/pokemon/dustox/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_lotad_still_front_pic:: @ 8DE975C
	.incbin "graphics/pokemon/lotad/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lotad_palette:: @ 8DE99BC
	.incbin "graphics/pokemon/lotad/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_lotad_back_pic:: @ 8DE99E4
	.incbin "graphics/pokemon/lotad/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lotad_shiny_palette:: @ 8DE9CCC
	.incbin "graphics/pokemon/lotad/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_lotad_icon:: @ 8DE9CF4
	.incbin "graphics/pokemon/lotad/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_lotad_footprint:: @ 8DEA0F4
	.incbin "graphics/pokemon/lotad/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_lombre_still_front_pic:: @ 8DEA114
	.incbin "graphics/pokemon/lombre/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lombre_palette:: @ 8DEA42C
	.incbin "graphics/pokemon/lombre/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_lombre_back_pic:: @ 8DEA454
	.incbin "graphics/pokemon/lombre/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lombre_shiny_palette:: @ 8DEA750
	.incbin "graphics/pokemon/lombre/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_lombre_icon:: @ 8DEA778
	.incbin "graphics/pokemon/lombre/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_lombre_footprint:: @ 8DEAB78
	.incbin "graphics/pokemon/lombre/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ludicolo_still_front_pic:: @ 8DEAB98
	.incbin "graphics/pokemon/ludicolo/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ludicolo_palette:: @ 8DEB07C
	.incbin "graphics/pokemon/ludicolo/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ludicolo_back_pic:: @ 8DEB0A4
	.incbin "graphics/pokemon/ludicolo/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ludicolo_shiny_palette:: @ 8DEB3A0
	.incbin "graphics/pokemon/ludicolo/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ludicolo_icon:: @ 8DEB3C8
	.incbin "graphics/pokemon/ludicolo/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ludicolo_footprint:: @ 8DEB7C8
	.incbin "graphics/pokemon/ludicolo/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_seedot_still_front_pic:: @ 8DEB7E8
	.incbin "graphics/pokemon/seedot/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_seedot_palette:: @ 8DEBA7C
	.incbin "graphics/pokemon/seedot/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_seedot_back_pic:: @ 8DEBAA4
	.incbin "graphics/pokemon/seedot/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_seedot_shiny_palette:: @ 8DEBD84
	.incbin "graphics/pokemon/seedot/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_seedot_icon:: @ 8DEBDAC
	.incbin "graphics/pokemon/seedot/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_seedot_footprint:: @ 8DEC1AC
	.incbin "graphics/pokemon/seedot/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_nuzleaf_still_front_pic:: @ 8DEC1CC
	.incbin "graphics/pokemon/nuzleaf/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nuzleaf_palette:: @ 8DEC4B8
	.incbin "graphics/pokemon/nuzleaf/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_nuzleaf_back_pic:: @ 8DEC4E0
	.incbin "graphics/pokemon/nuzleaf/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nuzleaf_shiny_palette:: @ 8DEC7A8
	.incbin "graphics/pokemon/nuzleaf/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_nuzleaf_icon:: @ 8DEC7D0
	.incbin "graphics/pokemon/nuzleaf/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_nuzleaf_footprint:: @ 8DECBD0
	.incbin "graphics/pokemon/nuzleaf/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_shiftry_still_front_pic:: @ 8DECBF0
	.incbin "graphics/pokemon/shiftry/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shiftry_palette:: @ 8DED0AC
	.incbin "graphics/pokemon/shiftry/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_shiftry_back_pic:: @ 8DED0D4
	.incbin "graphics/pokemon/shiftry/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shiftry_shiny_palette:: @ 8DED398
	.incbin "graphics/pokemon/shiftry/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_shiftry_icon:: @ 8DED3C0
	.incbin "graphics/pokemon/shiftry/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_shiftry_footprint:: @ 8DED7C0
	.incbin "graphics/pokemon/shiftry/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_nincada_still_front_pic:: @ 8DED7E0
	.incbin "graphics/pokemon/nincada/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nincada_palette:: @ 8DEDA80
	.incbin "graphics/pokemon/nincada/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_nincada_back_pic:: @ 8DEDAA8
	.incbin "graphics/pokemon/nincada/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nincada_shiny_palette:: @ 8DEDD60
	.incbin "graphics/pokemon/nincada/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_nincada_icon:: @ 8DEDD88
	.incbin "graphics/pokemon/nincada/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_nincada_footprint:: @ 8DEE188
	.incbin "graphics/pokemon/nincada/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ninjask_still_front_pic:: @ 8DEE1A8
	.incbin "graphics/pokemon/ninjask/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ninjask_palette:: @ 8DEE518
	.incbin "graphics/pokemon/ninjask/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ninjask_back_pic:: @ 8DEE540
	.incbin "graphics/pokemon/ninjask/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ninjask_shiny_palette:: @ 8DEE90C
	.incbin "graphics/pokemon/ninjask/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ninjask_icon:: @ 8DEE934
	.incbin "graphics/pokemon/ninjask/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ninjask_footprint:: @ 8DEED34
	.incbin "graphics/pokemon/ninjask/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_shedinja_still_front_pic:: @ 8DEED54
	.incbin "graphics/pokemon/shedinja/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shedinja_palette:: @ 8DEF074
	.incbin "graphics/pokemon/shedinja/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_shedinja_back_pic:: @ 8DEF09C
	.incbin "graphics/pokemon/shedinja/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shedinja_shiny_palette:: @ 8DEF43C
	.incbin "graphics/pokemon/shedinja/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_shedinja_icon:: @ 8DEF464
	.incbin "graphics/pokemon/shedinja/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_shedinja_footprint:: @ 8DEF864
	.incbin "graphics/pokemon/shedinja/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_taillow_still_front_pic:: @ 8DEF884
	.incbin "graphics/pokemon/taillow/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_taillow_palette:: @ 8DEFADC
	.incbin "graphics/pokemon/taillow/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_taillow_back_pic:: @ 8DEFB04
	.incbin "graphics/pokemon/taillow/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_taillow_shiny_palette:: @ 8DEFD24
	.incbin "graphics/pokemon/taillow/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_taillow_icon:: @ 8DEFD4C
	.incbin "graphics/pokemon/taillow/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_taillow_footprint:: @ 8DF014C
	.incbin "graphics/pokemon/taillow/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_swellow_still_front_pic:: @ 8DF016C
	.incbin "graphics/pokemon/swellow/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_swellow_palette:: @ 8DF0530
	.incbin "graphics/pokemon/swellow/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_swellow_back_pic:: @ 8DF0558
	.incbin "graphics/pokemon/swellow/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_swellow_shiny_palette:: @ 8DF0890
	.incbin "graphics/pokemon/swellow/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_swellow_icon:: @ 8DF08B8
	.incbin "graphics/pokemon/swellow/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_swellow_footprint:: @ 8DF0CB8
	.incbin "graphics/pokemon/swellow/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_shroomish_still_front_pic:: @ 8DF0CD8
	.incbin "graphics/pokemon/shroomish/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shroomish_palette:: @ 8DF0F40
	.incbin "graphics/pokemon/shroomish/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_shroomish_back_pic:: @ 8DF0F68
	.incbin "graphics/pokemon/shroomish/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shroomish_shiny_palette:: @ 8DF1248
	.incbin "graphics/pokemon/shroomish/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_shroomish_icon:: @ 8DF1270
	.incbin "graphics/pokemon/shroomish/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_shroomish_footprint:: @ 8DF1670
	.incbin "graphics/pokemon/shroomish/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_breloom_still_front_pic:: @ 8DF1690
	.incbin "graphics/pokemon/breloom/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_breloom_palette:: @ 8DF1A78
	.incbin "graphics/pokemon/breloom/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_breloom_back_pic:: @ 8DF1AA0
	.incbin "graphics/pokemon/breloom/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_breloom_shiny_palette:: @ 8DF1E80
	.incbin "graphics/pokemon/breloom/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_breloom_icon:: @ 8DF1EA8
	.incbin "graphics/pokemon/breloom/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_breloom_footprint:: @ 8DF22A8
	.incbin "graphics/pokemon/breloom/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_spinda_still_front_pic:: @ 8DF22C8
	.incbin "graphics/pokemon/spinda/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_spinda_palette:: @ 8DF25C8
	.incbin "graphics/pokemon/spinda/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_spinda_back_pic:: @ 8DF25F0
	.incbin "graphics/pokemon/spinda/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_spinda_shiny_palette:: @ 8DF292C
	.incbin "graphics/pokemon/spinda/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_spinda_icon:: @ 8DF2954
	.incbin "graphics/pokemon/spinda/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_spinda_footprint:: @ 8DF2D54
	.incbin "graphics/pokemon/spinda/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_wingull_still_front_pic:: @ 8DF2D74
	.incbin "graphics/pokemon/wingull/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wingull_palette:: @ 8DF2FB0
	.incbin "graphics/pokemon/wingull/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_wingull_back_pic:: @ 8DF2FD8
	.incbin "graphics/pokemon/wingull/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wingull_shiny_palette:: @ 8DF3328
	.incbin "graphics/pokemon/wingull/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_wingull_icon:: @ 8DF3350
	.incbin "graphics/pokemon/wingull/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_wingull_footprint:: @ 8DF3750
	.incbin "graphics/pokemon/wingull/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_pelipper_still_front_pic:: @ 8DF3770
	.incbin "graphics/pokemon/pelipper/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pelipper_palette:: @ 8DF3B08
	.incbin "graphics/pokemon/pelipper/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_pelipper_back_pic:: @ 8DF3B30
	.incbin "graphics/pokemon/pelipper/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_pelipper_shiny_palette:: @ 8DF3EB0
	.incbin "graphics/pokemon/pelipper/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_pelipper_icon:: @ 8DF3ED8
	.incbin "graphics/pokemon/pelipper/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_pelipper_footprint:: @ 8DF42D8
	.incbin "graphics/pokemon/pelipper/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_surskit_still_front_pic:: @ 8DF42F8
	.incbin "graphics/pokemon/surskit/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_surskit_palette:: @ 8DF4504
	.incbin "graphics/pokemon/surskit/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_surskit_back_pic:: @ 8DF452C
	.incbin "graphics/pokemon/surskit/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_surskit_shiny_palette:: @ 8DF4764
	.incbin "graphics/pokemon/surskit/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_surskit_icon:: @ 8DF478C
	.incbin "graphics/pokemon/surskit/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_surskit_footprint:: @ 8DF4B8C
	.incbin "graphics/pokemon/surskit/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_masquerain_still_front_pic:: @ 8DF4BAC
	.incbin "graphics/pokemon/masquerain/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_masquerain_palette:: @ 8DF4F48
	.incbin "graphics/pokemon/masquerain/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_masquerain_back_pic:: @ 8DF4F70
	.incbin "graphics/pokemon/masquerain/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_masquerain_shiny_palette:: @ 8DF52C8
	.incbin "graphics/pokemon/masquerain/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_masquerain_icon:: @ 8DF52F0
	.incbin "graphics/pokemon/masquerain/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_masquerain_footprint:: @ 8DF56F0
	.incbin "graphics/pokemon/masquerain/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_wailmer_still_front_pic:: @ 8DF5710
	.incbin "graphics/pokemon/wailmer/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wailmer_palette:: @ 8DF59F0
	.incbin "graphics/pokemon/wailmer/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_wailmer_back_pic:: @ 8DF5A18
	.incbin "graphics/pokemon/wailmer/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wailmer_shiny_palette:: @ 8DF5BFC
	.incbin "graphics/pokemon/wailmer/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_wailmer_icon:: @ 8DF5C24
	.incbin "graphics/pokemon/wailmer/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_wailmer_footprint:: @ 8DF6024
	.incbin "graphics/pokemon/wailmer/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_wailord_still_front_pic:: @ 8DF6044
	.incbin "graphics/pokemon/wailord/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wailord_palette:: @ 8DF6408
	.incbin "graphics/pokemon/wailord/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_wailord_back_pic:: @ 8DF6430
	.incbin "graphics/pokemon/wailord/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wailord_shiny_palette:: @ 8DF6648
	.incbin "graphics/pokemon/wailord/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_wailord_icon:: @ 8DF6670
	.incbin "graphics/pokemon/wailord/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_wailord_footprint:: @ 8DF6A70
	.incbin "graphics/pokemon/wailord/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_skitty_still_front_pic:: @ 8DF6A90
	.incbin "graphics/pokemon/skitty/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_skitty_palette:: @ 8DF6D90
	.incbin "graphics/pokemon/skitty/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_skitty_back_pic:: @ 8DF6DB8
	.incbin "graphics/pokemon/skitty/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_skitty_shiny_palette:: @ 8DF7100
	.incbin "graphics/pokemon/skitty/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_skitty_icon:: @ 8DF7128
	.incbin "graphics/pokemon/skitty/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_skitty_footprint:: @ 8DF7528
	.incbin "graphics/pokemon/skitty/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_delcatty_still_front_pic:: @ 8DF7548
	.incbin "graphics/pokemon/delcatty/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_delcatty_palette:: @ 8DF78D4
	.incbin "graphics/pokemon/delcatty/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_delcatty_back_pic:: @ 8DF78FC
	.incbin "graphics/pokemon/delcatty/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_delcatty_shiny_palette:: @ 8DF7C98
	.incbin "graphics/pokemon/delcatty/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_delcatty_icon:: @ 8DF7CC0
	.incbin "graphics/pokemon/delcatty/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_delcatty_footprint:: @ 8DF80C0
	.incbin "graphics/pokemon/delcatty/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_kecleon_still_front_pic:: @ 8DF80E0
	.incbin "graphics/pokemon/kecleon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kecleon_palette:: @ 8DF8460
	.incbin "graphics/pokemon/kecleon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_kecleon_back_pic:: @ 8DF8488
	.incbin "graphics/pokemon/kecleon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kecleon_shiny_palette:: @ 8DF8860
	.incbin "graphics/pokemon/kecleon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_kecleon_icon:: @ 8DF8888
	.incbin "graphics/pokemon/kecleon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_kecleon_footprint:: @ 8DF8C88
	.incbin "graphics/pokemon/kecleon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_baltoy_still_front_pic:: @ 8DF8CA8
	.incbin "graphics/pokemon/baltoy/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_baltoy_palette:: @ 8DF8ECC
	.incbin "graphics/pokemon/baltoy/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_baltoy_back_pic:: @ 8DF8EEC
	.incbin "graphics/pokemon/baltoy/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_baltoy_shiny_palette:: @ 8DF9194
	.incbin "graphics/pokemon/baltoy/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_baltoy_icon:: @ 8DF91B4
	.incbin "graphics/pokemon/baltoy/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_baltoy_footprint:: @ 8DF95B4
	.incbin "graphics/pokemon/baltoy/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_claydol_still_front_pic:: @ 8DF95D4
	.incbin "graphics/pokemon/claydol/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_claydol_palette:: @ 8DF998C
	.incbin "graphics/pokemon/claydol/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_claydol_back_pic:: @ 8DF99B4
	.incbin "graphics/pokemon/claydol/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_claydol_shiny_palette:: @ 8DF9D88
	.incbin "graphics/pokemon/claydol/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_claydol_icon:: @ 8DF9DB0
	.incbin "graphics/pokemon/claydol/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_claydol_footprint:: @ 8DFA1B0
	.incbin "graphics/pokemon/claydol/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_nosepass_still_front_pic:: @ 8DFA1D0
	.incbin "graphics/pokemon/nosepass/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nosepass_palette:: @ 8DFA49C
	.incbin "graphics/pokemon/nosepass/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_nosepass_back_pic:: @ 8DFA4C4
	.incbin "graphics/pokemon/nosepass/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_nosepass_shiny_palette:: @ 8DFA764
	.incbin "graphics/pokemon/nosepass/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_nosepass_icon:: @ 8DFA78C
	.incbin "graphics/pokemon/nosepass/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_nosepass_footprint:: @ 8DFAB8C
	.incbin "graphics/pokemon/nosepass/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_torkoal_still_front_pic:: @ 8DFABAC
	.incbin "graphics/pokemon/torkoal/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_torkoal_palette:: @ 8DFB058
	.incbin "graphics/pokemon/torkoal/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_torkoal_back_pic:: @ 8DFB080
	.incbin "graphics/pokemon/torkoal/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_torkoal_shiny_palette:: @ 8DFB348
	.incbin "graphics/pokemon/torkoal/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_torkoal_icon:: @ 8DFB370
	.incbin "graphics/pokemon/torkoal/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_torkoal_footprint:: @ 8DFB770
	.incbin "graphics/pokemon/torkoal/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sableye_still_front_pic:: @ 8DFB790
	.incbin "graphics/pokemon/sableye/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sableye_palette:: @ 8DFBA64
	.incbin "graphics/pokemon/sableye/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sableye_back_pic:: @ 8DFBA8C
	.incbin "graphics/pokemon/sableye/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sableye_shiny_palette:: @ 8DFBDB4
	.incbin "graphics/pokemon/sableye/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sableye_icon:: @ 8DFBDDC
	.incbin "graphics/pokemon/sableye/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sableye_footprint:: @ 8DFC1DC
	.incbin "graphics/pokemon/sableye/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_barboach_still_front_pic:: @ 8DFC1FC
	.incbin "graphics/pokemon/barboach/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_barboach_palette:: @ 8DFC48C
	.incbin "graphics/pokemon/barboach/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_barboach_back_pic:: @ 8DFC4B4
	.incbin "graphics/pokemon/barboach/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_barboach_shiny_palette:: @ 8DFC744
	.incbin "graphics/pokemon/barboach/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_barboach_icon:: @ 8DFC76C
	.incbin "graphics/pokemon/barboach/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_barboach_footprint:: @ 8DFCB6C
	.incbin "graphics/pokemon/barboach/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_whiscash_still_front_pic:: @ 8DFCB8C
	.incbin "graphics/pokemon/whiscash/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_whiscash_palette:: @ 8DFCF04
	.incbin "graphics/pokemon/whiscash/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_whiscash_back_pic:: @ 8DFCF2C
	.incbin "graphics/pokemon/whiscash/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_whiscash_shiny_palette:: @ 8DFD278
	.incbin "graphics/pokemon/whiscash/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_whiscash_icon:: @ 8DFD2A0
	.incbin "graphics/pokemon/whiscash/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_whiscash_footprint:: @ 8DFD6A0
	.incbin "graphics/pokemon/whiscash/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_luvdisc_still_front_pic:: @ 8DFD6C0
	.incbin "graphics/pokemon/luvdisc/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_luvdisc_palette:: @ 8DFD880
	.incbin "graphics/pokemon/luvdisc/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_luvdisc_back_pic:: @ 8DFD8A4
	.incbin "graphics/pokemon/luvdisc/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_luvdisc_shiny_palette:: @ 8DFDA78
	.incbin "graphics/pokemon/luvdisc/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_luvdisc_icon:: @ 8DFDA9C
	.incbin "graphics/pokemon/luvdisc/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_luvdisc_footprint:: @ 8DFDE9C
	.incbin "graphics/pokemon/luvdisc/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_corphish_still_front_pic:: @ 8DFDEBC
	.incbin "graphics/pokemon/corphish/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_corphish_palette:: @ 8DFE218
	.incbin "graphics/pokemon/corphish/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_corphish_back_pic:: @ 8DFE240
	.incbin "graphics/pokemon/corphish/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_corphish_shiny_palette:: @ 8DFE55C
	.incbin "graphics/pokemon/corphish/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_corphish_icon:: @ 8DFE584
	.incbin "graphics/pokemon/corphish/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_corphish_footprint:: @ 8DFE984
	.incbin "graphics/pokemon/corphish/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_crawdaunt_still_front_pic:: @ 8DFE9A4
	.incbin "graphics/pokemon/crawdaunt/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_crawdaunt_palette:: @ 8DFEE34
	.incbin "graphics/pokemon/crawdaunt/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_crawdaunt_back_pic:: @ 8DFEE5C
	.incbin "graphics/pokemon/crawdaunt/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_crawdaunt_shiny_palette:: @ 8DFF240
	.incbin "graphics/pokemon/crawdaunt/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_crawdaunt_icon:: @ 8DFF268
	.incbin "graphics/pokemon/crawdaunt/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_crawdaunt_footprint:: @ 8DFF668
	.incbin "graphics/pokemon/crawdaunt/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_feebas_still_front_pic:: @ 8DFF688
	.incbin "graphics/pokemon/feebas/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_feebas_palette:: @ 8DFF914
	.incbin "graphics/pokemon/feebas/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_feebas_back_pic:: @ 8DFF93C
	.incbin "graphics/pokemon/feebas/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_feebas_shiny_palette:: @ 8DFFC74
	.incbin "graphics/pokemon/feebas/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_feebas_icon:: @ 8DFFC9C
	.incbin "graphics/pokemon/feebas/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_feebas_footprint:: @ 8E0009C
	.incbin "graphics/pokemon/feebas/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_milotic_still_front_pic:: @ 8E000BC
	.incbin "graphics/pokemon/milotic/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_milotic_palette:: @ 8E0054C
	.incbin "graphics/pokemon/milotic/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_milotic_back_pic:: @ 8E00574
	.incbin "graphics/pokemon/milotic/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_milotic_shiny_palette:: @ 8E00868
	.incbin "graphics/pokemon/milotic/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_milotic_icon:: @ 8E00890
	.incbin "graphics/pokemon/milotic/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_milotic_footprint:: @ 8E00C90
	.incbin "graphics/pokemon/milotic/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_carvanha_still_front_pic:: @ 8E00CB0
	.incbin "graphics/pokemon/carvanha/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_carvanha_palette:: @ 8E00FDC
	.incbin "graphics/pokemon/carvanha/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_carvanha_back_pic:: @ 8E01004
	.incbin "graphics/pokemon/carvanha/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_carvanha_shiny_palette:: @ 8E01314
	.incbin "graphics/pokemon/carvanha/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_carvanha_icon:: @ 8E0133C
	.incbin "graphics/pokemon/carvanha/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_carvanha_footprint:: @ 8E0173C
	.incbin "graphics/pokemon/carvanha/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sharpedo_still_front_pic:: @ 8E0175C
	.incbin "graphics/pokemon/sharpedo/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sharpedo_palette:: @ 8E01AEC
	.incbin "graphics/pokemon/sharpedo/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sharpedo_back_pic:: @ 8E01B14
	.incbin "graphics/pokemon/sharpedo/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sharpedo_shiny_palette:: @ 8E01E6C
	.incbin "graphics/pokemon/sharpedo/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sharpedo_icon:: @ 8E01E94
	.incbin "graphics/pokemon/sharpedo/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sharpedo_footprint:: @ 8E02294
	.incbin "graphics/pokemon/sharpedo/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_trapinch_still_front_pic:: @ 8E022B4
	.incbin "graphics/pokemon/trapinch/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_trapinch_palette:: @ 8E024D0
	.incbin "graphics/pokemon/trapinch/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_trapinch_back_pic:: @ 8E024F8
	.incbin "graphics/pokemon/trapinch/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_trapinch_shiny_palette:: @ 8E02718
	.incbin "graphics/pokemon/trapinch/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_trapinch_icon:: @ 8E02740
	.incbin "graphics/pokemon/trapinch/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_trapinch_footprint:: @ 8E02B40
	.incbin "graphics/pokemon/trapinch/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_vibrava_still_front_pic:: @ 8E02B60
	.incbin "graphics/pokemon/vibrava/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_vibrava_palette:: @ 8E02ED0
	.incbin "graphics/pokemon/vibrava/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_vibrava_back_pic:: @ 8E02EF8
	.incbin "graphics/pokemon/vibrava/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_vibrava_shiny_palette:: @ 8E03170
	.incbin "graphics/pokemon/vibrava/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_vibrava_icon:: @ 8E03198
	.incbin "graphics/pokemon/vibrava/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_vibrava_footprint:: @ 8E03598
	.incbin "graphics/pokemon/vibrava/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_flygon_still_front_pic:: @ 8E035B8
	.incbin "graphics/pokemon/flygon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_flygon_palette:: @ 8E03AA8
	.incbin "graphics/pokemon/flygon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_flygon_back_pic:: @ 8E03AD0
	.incbin "graphics/pokemon/flygon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_flygon_shiny_palette:: @ 8E03F0C
	.incbin "graphics/pokemon/flygon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_flygon_icon:: @ 8E03F34
	.incbin "graphics/pokemon/flygon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_flygon_footprint:: @ 8E04334
	.incbin "graphics/pokemon/flygon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_makuhita_still_front_pic:: @ 8E04354
	.incbin "graphics/pokemon/makuhita/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_makuhita_palette:: @ 8E0466C
	.incbin "graphics/pokemon/makuhita/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_makuhita_back_pic:: @ 8E04694
	.incbin "graphics/pokemon/makuhita/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_makuhita_shiny_palette:: @ 8E04984
	.incbin "graphics/pokemon/makuhita/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_makuhita_icon:: @ 8E049A8
	.incbin "graphics/pokemon/makuhita/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_makuhita_footprint:: @ 8E04DA8
	.incbin "graphics/pokemon/makuhita/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_hariyama_still_front_pic:: @ 8E04DC8
	.incbin "graphics/pokemon/hariyama/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hariyama_palette:: @ 8E05278
	.incbin "graphics/pokemon/hariyama/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_hariyama_back_pic:: @ 8E052A0
	.incbin "graphics/pokemon/hariyama/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_hariyama_shiny_palette:: @ 8E05680
	.incbin "graphics/pokemon/hariyama/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_hariyama_icon:: @ 8E056A8
	.incbin "graphics/pokemon/hariyama/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_hariyama_footprint:: @ 8E05AA8
	.incbin "graphics/pokemon/hariyama/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_electrike_still_front_pic:: @ 8E05AC8
	.incbin "graphics/pokemon/electrike/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_electrike_palette:: @ 8E05D58
	.incbin "graphics/pokemon/electrike/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_electrike_back_pic:: @ 8E05D80
	.incbin "graphics/pokemon/electrike/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_electrike_shiny_palette:: @ 8E0600C
	.incbin "graphics/pokemon/electrike/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_electrike_icon:: @ 8E06034
	.incbin "graphics/pokemon/electrike/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_electrike_footprint:: @ 8E06434
	.incbin "graphics/pokemon/electrike/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_manectric_still_front_pic:: @ 8E06454
	.incbin "graphics/pokemon/manectric/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_manectric_palette:: @ 8E06784
	.incbin "graphics/pokemon/manectric/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_manectric_back_pic:: @ 8E067AC
	.incbin "graphics/pokemon/manectric/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_manectric_shiny_palette:: @ 8E069D8
	.incbin "graphics/pokemon/manectric/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_manectric_icon:: @ 8E06A00
	.incbin "graphics/pokemon/manectric/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_manectric_footprint:: @ 8E06E00
	.incbin "graphics/pokemon/manectric/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_numel_still_front_pic:: @ 8E06E20
	.incbin "graphics/pokemon/numel/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_numel_palette:: @ 8E070F0
	.incbin "graphics/pokemon/numel/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_numel_back_pic:: @ 8E07118
	.incbin "graphics/pokemon/numel/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_numel_shiny_palette:: @ 8E073D4
	.incbin "graphics/pokemon/numel/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_numel_icon:: @ 8E073FC
	.incbin "graphics/pokemon/numel/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_numel_footprint:: @ 8E077FC
	.incbin "graphics/pokemon/numel/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_camerupt_still_front_pic:: @ 8E0781C
	.incbin "graphics/pokemon/camerupt/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_camerupt_palette:: @ 8E07C34
	.incbin "graphics/pokemon/camerupt/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_camerupt_back_pic:: @ 8E07C5C
	.incbin "graphics/pokemon/camerupt/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_camerupt_shiny_palette:: @ 8E07F20
	.incbin "graphics/pokemon/camerupt/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_camerupt_icon:: @ 8E07F48
	.incbin "graphics/pokemon/camerupt/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_camerupt_footprint:: @ 8E08348
	.incbin "graphics/pokemon/camerupt/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_spheal_still_front_pic:: @ 8E08368
	.incbin "graphics/pokemon/spheal/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_spheal_palette:: @ 8E085DC
	.incbin "graphics/pokemon/spheal/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_spheal_back_pic:: @ 8E08604
	.incbin "graphics/pokemon/spheal/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_spheal_shiny_palette:: @ 8E08800
	.incbin "graphics/pokemon/spheal/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_spheal_icon:: @ 8E08828
	.incbin "graphics/pokemon/spheal/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_spheal_footprint:: @ 8E08C28
	.incbin "graphics/pokemon/spheal/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_sealeo_still_front_pic:: @ 8E08C48
	.incbin "graphics/pokemon/sealeo/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sealeo_palette:: @ 8E08FC8
	.incbin "graphics/pokemon/sealeo/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_sealeo_back_pic:: @ 8E08FF0
	.incbin "graphics/pokemon/sealeo/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_sealeo_shiny_palette:: @ 8E0926C
	.incbin "graphics/pokemon/sealeo/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_sealeo_icon:: @ 8E09294
	.incbin "graphics/pokemon/sealeo/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_sealeo_footprint:: @ 8E09694
	.incbin "graphics/pokemon/sealeo/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_walrein_still_front_pic:: @ 8E096B4
	.incbin "graphics/pokemon/walrein/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_walrein_palette:: @ 8E09B54
	.incbin "graphics/pokemon/walrein/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_walrein_back_pic:: @ 8E09B7C
	.incbin "graphics/pokemon/walrein/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_walrein_shiny_palette:: @ 8E09F04
	.incbin "graphics/pokemon/walrein/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_walrein_icon:: @ 8E09F2C
	.incbin "graphics/pokemon/walrein/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_walrein_footprint:: @ 8E0A32C
	.incbin "graphics/pokemon/walrein/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_cacnea_still_front_pic:: @ 8E0A34C
	.incbin "graphics/pokemon/cacnea/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cacnea_palette:: @ 8E0A65C
	.incbin "graphics/pokemon/cacnea/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_cacnea_back_pic:: @ 8E0A684
	.incbin "graphics/pokemon/cacnea/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cacnea_shiny_palette:: @ 8E0A9E4
	.incbin "graphics/pokemon/cacnea/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_cacnea_icon:: @ 8E0AA0C
	.incbin "graphics/pokemon/cacnea/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_cacnea_footprint:: @ 8E0AE0C
	.incbin "graphics/pokemon/cacnea/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_cacturne_still_front_pic:: @ 8E0AE2C
	.incbin "graphics/pokemon/cacturne/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cacturne_palette:: @ 8E0B264
	.incbin "graphics/pokemon/cacturne/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_cacturne_back_pic:: @ 8E0B28C
	.incbin "graphics/pokemon/cacturne/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cacturne_shiny_palette:: @ 8E0B58C
	.incbin "graphics/pokemon/cacturne/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_cacturne_icon:: @ 8E0B5B4
	.incbin "graphics/pokemon/cacturne/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_cacturne_footprint:: @ 8E0B9B4
	.incbin "graphics/pokemon/cacturne/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_snorunt_still_front_pic:: @ 8E0B9D4
	.incbin "graphics/pokemon/snorunt/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_snorunt_palette:: @ 8E0BC98
	.incbin "graphics/pokemon/snorunt/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_snorunt_back_pic:: @ 8E0BCC0
	.incbin "graphics/pokemon/snorunt/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_snorunt_shiny_palette:: @ 8E0BFA4
	.incbin "graphics/pokemon/snorunt/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_snorunt_icon:: @ 8E0BFCC
	.incbin "graphics/pokemon/snorunt/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_snorunt_footprint:: @ 8E0C3CC
	.incbin "graphics/pokemon/snorunt/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_glalie_still_front_pic:: @ 8E0C3EC
	.incbin "graphics/pokemon/glalie/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_glalie_palette:: @ 8E0C7B4
	.incbin "graphics/pokemon/glalie/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_glalie_back_pic:: @ 8E0C7DC
	.incbin "graphics/pokemon/glalie/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_glalie_shiny_palette:: @ 8E0CB8C
	.incbin "graphics/pokemon/glalie/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_glalie_icon:: @ 8E0CBB4
	.incbin "graphics/pokemon/glalie/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_glalie_footprint:: @ 8E0CFB4
	.incbin "graphics/pokemon/glalie/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_lunatone_still_front_pic:: @ 8E0CFD4
	.incbin "graphics/pokemon/lunatone/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lunatone_palette:: @ 8E0D2FC
	.incbin "graphics/pokemon/lunatone/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_lunatone_back_pic:: @ 8E0D324
	.incbin "graphics/pokemon/lunatone/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lunatone_shiny_palette:: @ 8E0D67C
	.incbin "graphics/pokemon/lunatone/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_lunatone_icon:: @ 8E0D6A4
	.incbin "graphics/pokemon/lunatone/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_lunatone_footprint:: @ 8E0DAA4
	.incbin "graphics/pokemon/lunatone/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_solrock_still_front_pic:: @ 8E0DAC4
	.incbin "graphics/pokemon/solrock/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_solrock_palette:: @ 8E0DF10
	.incbin "graphics/pokemon/solrock/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_solrock_back_pic:: @ 8E0DF38
	.incbin "graphics/pokemon/solrock/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_solrock_shiny_palette:: @ 8E0E324
	.incbin "graphics/pokemon/solrock/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_solrock_icon:: @ 8E0E34C
	.incbin "graphics/pokemon/solrock/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_solrock_footprint:: @ 8E0E74C
	.incbin "graphics/pokemon/solrock/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_azurill_still_front_pic:: @ 8E0E76C
	.incbin "graphics/pokemon/azurill/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_azurill_palette:: @ 8E0EA34
	.incbin "graphics/pokemon/azurill/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_azurill_back_pic:: @ 8E0EA5C
	.incbin "graphics/pokemon/azurill/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_azurill_shiny_palette:: @ 8E0ED74
	.incbin "graphics/pokemon/azurill/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_azurill_icon:: @ 8E0ED9C
	.incbin "graphics/pokemon/azurill/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_azurill_footprint:: @ 8E0F19C
	.incbin "graphics/pokemon/azurill/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_spoink_still_front_pic:: @ 8E0F1BC
	.incbin "graphics/pokemon/spoink/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_spoink_palette:: @ 8E0F428
	.incbin "graphics/pokemon/spoink/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_spoink_back_pic:: @ 8E0F450
	.incbin "graphics/pokemon/spoink/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_spoink_shiny_palette:: @ 8E0F690
	.incbin "graphics/pokemon/spoink/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_spoink_icon:: @ 8E0F6B8
	.incbin "graphics/pokemon/spoink/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_spoink_footprint:: @ 8E0FAB8
	.incbin "graphics/pokemon/spoink/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_grumpig_still_front_pic:: @ 8E0FAD8
	.incbin "graphics/pokemon/grumpig/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_grumpig_palette:: @ 8E0FE94
	.incbin "graphics/pokemon/grumpig/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_grumpig_back_pic:: @ 8E0FEBC
	.incbin "graphics/pokemon/grumpig/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_grumpig_shiny_palette:: @ 8E1021C
	.incbin "graphics/pokemon/grumpig/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_grumpig_icon:: @ 8E10244
	.incbin "graphics/pokemon/grumpig/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_grumpig_footprint:: @ 8E10644
	.incbin "graphics/pokemon/grumpig/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_plusle_still_front_pic:: @ 8E10664
	.incbin "graphics/pokemon/plusle/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_plusle_palette:: @ 8E108F0
	.incbin "graphics/pokemon/plusle/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_plusle_back_pic:: @ 8E10918
	.incbin "graphics/pokemon/plusle/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_plusle_shiny_palette:: @ 8E10BD0
	.incbin "graphics/pokemon/plusle/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_plusle_icon:: @ 8E10BF8
	.incbin "graphics/pokemon/plusle/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_plusle_footprint:: @ 8E10FF8
	.incbin "graphics/pokemon/plusle/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_minun_still_front_pic:: @ 8E11018
	.incbin "graphics/pokemon/minun/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_minun_palette:: @ 8E11280
	.incbin "graphics/pokemon/minun/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_minun_back_pic:: @ 8E112A8
	.incbin "graphics/pokemon/minun/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_minun_shiny_palette:: @ 8E11570
	.incbin "graphics/pokemon/minun/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_minun_icon:: @ 8E11598
	.incbin "graphics/pokemon/minun/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_minun_footprint:: @ 8E11998
	.incbin "graphics/pokemon/minun/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_mawile_still_front_pic:: @ 8E119B8
	.incbin "graphics/pokemon/mawile/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mawile_palette:: @ 8E11D74
	.incbin "graphics/pokemon/mawile/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_mawile_back_pic:: @ 8E11D9C
	.incbin "graphics/pokemon/mawile/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_mawile_shiny_palette:: @ 8E1219C
	.incbin "graphics/pokemon/mawile/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_mawile_icon:: @ 8E121C4
	.incbin "graphics/pokemon/mawile/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_mawile_footprint:: @ 8E125C4
	.incbin "graphics/pokemon/mawile/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_meditite_still_front_pic:: @ 8E125E4
	.incbin "graphics/pokemon/meditite/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_meditite_palette:: @ 8E1289C
	.incbin "graphics/pokemon/meditite/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_meditite_back_pic:: @ 8E128C4
	.incbin "graphics/pokemon/meditite/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_meditite_shiny_palette:: @ 8E12B8C
	.incbin "graphics/pokemon/meditite/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_meditite_icon:: @ 8E12BB0
	.incbin "graphics/pokemon/meditite/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_meditite_footprint:: @ 8E12FB0
	.incbin "graphics/pokemon/meditite/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_medicham_still_front_pic:: @ 8E12FD0
	.incbin "graphics/pokemon/medicham/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_medicham_palette:: @ 8E13300
	.incbin "graphics/pokemon/medicham/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_medicham_back_pic:: @ 8E13328
	.incbin "graphics/pokemon/medicham/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_medicham_shiny_palette:: @ 8E13660
	.incbin "graphics/pokemon/medicham/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_medicham_icon:: @ 8E13688
	.incbin "graphics/pokemon/medicham/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_medicham_footprint:: @ 8E13A88
	.incbin "graphics/pokemon/medicham/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_swablu_still_front_pic:: @ 8E13AA8
	.incbin "graphics/pokemon/swablu/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_swablu_palette:: @ 8E13D80
	.incbin "graphics/pokemon/swablu/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_swablu_back_pic:: @ 8E13DA8
	.incbin "graphics/pokemon/swablu/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_swablu_shiny_palette:: @ 8E14160
	.incbin "graphics/pokemon/swablu/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_swablu_icon:: @ 8E14188
	.incbin "graphics/pokemon/swablu/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_swablu_footprint:: @ 8E14588
	.incbin "graphics/pokemon/swablu/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_altaria_still_front_pic:: @ 8E145A8
	.incbin "graphics/pokemon/altaria/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_altaria_palette:: @ 8E14984
	.incbin "graphics/pokemon/altaria/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_altaria_back_pic:: @ 8E149AC
	.incbin "graphics/pokemon/altaria/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_altaria_shiny_palette:: @ 8E14D24
	.incbin "graphics/pokemon/altaria/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_altaria_icon:: @ 8E14D4C
	.incbin "graphics/pokemon/altaria/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_altaria_footprint:: @ 8E1514C
	.incbin "graphics/pokemon/altaria/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_wynaut_still_front_pic:: @ 8E1516C
	.incbin "graphics/pokemon/wynaut/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wynaut_palette:: @ 8E15404
	.incbin "graphics/pokemon/wynaut/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_wynaut_back_pic:: @ 8E1542C
	.incbin "graphics/pokemon/wynaut/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_wynaut_shiny_palette:: @ 8E156BC
	.incbin "graphics/pokemon/wynaut/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_wynaut_icon:: @ 8E156E4
	.incbin "graphics/pokemon/wynaut/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_wynaut_footprint:: @ 8E15AE4
	.incbin "graphics/pokemon/wynaut/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_duskull_still_front_pic:: @ 8E15B04
	.incbin "graphics/pokemon/duskull/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_duskull_palette:: @ 8E15DF4
	.incbin "graphics/pokemon/duskull/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_duskull_back_pic:: @ 8E15E1C
	.incbin "graphics/pokemon/duskull/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_duskull_shiny_palette:: @ 8E160CC
	.incbin "graphics/pokemon/duskull/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_duskull_icon:: @ 8E160F4
	.incbin "graphics/pokemon/duskull/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_duskull_footprint:: @ 8E164F4
	.incbin "graphics/pokemon/duskull/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_dusclops_still_front_pic:: @ 8E16514
	.incbin "graphics/pokemon/dusclops/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dusclops_palette:: @ 8E168B4
	.incbin "graphics/pokemon/dusclops/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_dusclops_back_pic:: @ 8E168DC
	.incbin "graphics/pokemon/dusclops/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_dusclops_shiny_palette:: @ 8E16BC8
	.incbin "graphics/pokemon/dusclops/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_dusclops_icon:: @ 8E16BF0
	.incbin "graphics/pokemon/dusclops/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_dusclops_footprint:: @ 8E16FF0
	.incbin "graphics/pokemon/dusclops/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_roselia_still_front_pic:: @ 8E17010
	.incbin "graphics/pokemon/roselia/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_roselia_palette:: @ 8E1737C
	.incbin "graphics/pokemon/roselia/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_roselia_back_pic:: @ 8E173A4
	.incbin "graphics/pokemon/roselia/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_roselia_shiny_palette:: @ 8E1776C
	.incbin "graphics/pokemon/roselia/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_roselia_icon:: @ 8E17794
	.incbin "graphics/pokemon/roselia/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_roselia_footprint:: @ 8E17B94
	.incbin "graphics/pokemon/roselia/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_slakoth_still_front_pic:: @ 8E17BB4
	.incbin "graphics/pokemon/slakoth/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slakoth_palette:: @ 8E17E9C
	.incbin "graphics/pokemon/slakoth/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_slakoth_back_pic:: @ 8E17EC4
	.incbin "graphics/pokemon/slakoth/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slakoth_shiny_palette:: @ 8E181AC
	.incbin "graphics/pokemon/slakoth/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_slakoth_icon:: @ 8E181D4
	.incbin "graphics/pokemon/slakoth/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_slakoth_footprint:: @ 8E185D4
	.incbin "graphics/pokemon/slakoth/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_vigoroth_still_front_pic:: @ 8E185F4
	.incbin "graphics/pokemon/vigoroth/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_vigoroth_palette:: @ 8E189F0
	.incbin "graphics/pokemon/vigoroth/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_vigoroth_back_pic:: @ 8E18A18
	.incbin "graphics/pokemon/vigoroth/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_vigoroth_shiny_palette:: @ 8E18CE0
	.incbin "graphics/pokemon/vigoroth/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_vigoroth_icon:: @ 8E18D08
	.incbin "graphics/pokemon/vigoroth/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_vigoroth_footprint:: @ 8E19108
	.incbin "graphics/pokemon/vigoroth/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_slaking_still_front_pic:: @ 8E19128
	.incbin "graphics/pokemon/slaking/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slaking_palette:: @ 8E195FC
	.incbin "graphics/pokemon/slaking/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_slaking_back_pic:: @ 8E19624
	.incbin "graphics/pokemon/slaking/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_slaking_shiny_palette:: @ 8E199E8
	.incbin "graphics/pokemon/slaking/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_slaking_icon:: @ 8E19A10
	.incbin "graphics/pokemon/slaking/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_slaking_footprint:: @ 8E19E10
	.incbin "graphics/pokemon/slaking/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_gulpin_still_front_pic:: @ 8E19E30
	.incbin "graphics/pokemon/gulpin/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gulpin_palette:: @ 8E1A048
	.incbin "graphics/pokemon/gulpin/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_gulpin_back_pic:: @ 8E1A070
	.incbin "graphics/pokemon/gulpin/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gulpin_shiny_palette:: @ 8E1A2F4
	.incbin "graphics/pokemon/gulpin/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_gulpin_icon:: @ 8E1A31C
	.incbin "graphics/pokemon/gulpin/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_gulpin_footprint:: @ 8E1A71C
	.incbin "graphics/pokemon/gulpin/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_swalot_still_front_pic:: @ 8E1A73C
	.incbin "graphics/pokemon/swalot/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_swalot_palette:: @ 8E1AA80
	.incbin "graphics/pokemon/swalot/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_swalot_back_pic:: @ 8E1AAA8
	.incbin "graphics/pokemon/swalot/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_swalot_shiny_palette:: @ 8E1ADF0
	.incbin "graphics/pokemon/swalot/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_swalot_icon:: @ 8E1AE18
	.incbin "graphics/pokemon/swalot/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_swalot_footprint:: @ 8E1B218
	.incbin "graphics/pokemon/swalot/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_tropius_still_front_pic:: @ 8E1B238
	.incbin "graphics/pokemon/tropius/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tropius_palette:: @ 8E1B7B0
	.incbin "graphics/pokemon/tropius/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_tropius_back_pic:: @ 8E1B7D8
	.incbin "graphics/pokemon/tropius/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_tropius_shiny_palette:: @ 8E1BAFC
	.incbin "graphics/pokemon/tropius/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_tropius_icon:: @ 8E1BB24
	.incbin "graphics/pokemon/tropius/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_tropius_footprint:: @ 8E1BF24
	.incbin "graphics/pokemon/tropius/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_whismur_still_front_pic:: @ 8E1BF44
	.incbin "graphics/pokemon/whismur/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_whismur_palette:: @ 8E1C1D8
	.incbin "graphics/pokemon/whismur/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_whismur_back_pic:: @ 8E1C200
	.incbin "graphics/pokemon/whismur/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_whismur_shiny_palette:: @ 8E1C470
	.incbin "graphics/pokemon/whismur/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_whismur_icon:: @ 8E1C498
	.incbin "graphics/pokemon/whismur/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_whismur_footprint:: @ 8E1C898
	.incbin "graphics/pokemon/whismur/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_loudred_still_front_pic:: @ 8E1C8B8
	.incbin "graphics/pokemon/loudred/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_loudred_palette:: @ 8E1CD30
	.incbin "graphics/pokemon/loudred/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_loudred_back_pic:: @ 8E1CD58
	.incbin "graphics/pokemon/loudred/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_loudred_shiny_palette:: @ 8E1D0C8
	.incbin "graphics/pokemon/loudred/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_loudred_icon:: @ 8E1D0F0
	.incbin "graphics/pokemon/loudred/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_loudred_footprint:: @ 8E1D4F0
	.incbin "graphics/pokemon/loudred/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_exploud_still_front_pic:: @ 8E1D510
	.incbin "graphics/pokemon/exploud/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_exploud_palette:: @ 8E1DA78
	.incbin "graphics/pokemon/exploud/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_exploud_back_pic:: @ 8E1DAA0
	.incbin "graphics/pokemon/exploud/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_exploud_shiny_palette:: @ 8E1DEAC
	.incbin "graphics/pokemon/exploud/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_exploud_icon:: @ 8E1DED4
	.incbin "graphics/pokemon/exploud/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_exploud_footprint:: @ 8E1E2D4
	.incbin "graphics/pokemon/exploud/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_clamperl_still_front_pic:: @ 8E1E2F4
	.incbin "graphics/pokemon/clamperl/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_clamperl_palette:: @ 8E1E5CC
	.incbin "graphics/pokemon/clamperl/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_clamperl_back_pic:: @ 8E1E5F4
	.incbin "graphics/pokemon/clamperl/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_clamperl_shiny_palette:: @ 8E1E888
	.incbin "graphics/pokemon/clamperl/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_clamperl_icon:: @ 8E1E8B0
	.incbin "graphics/pokemon/clamperl/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_clamperl_footprint:: @ 8E1ECB0
	.incbin "graphics/pokemon/clamperl/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_huntail_still_front_pic:: @ 8E1ECD0
	.incbin "graphics/pokemon/huntail/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_huntail_palette:: @ 8E1F09C
	.incbin "graphics/pokemon/huntail/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_huntail_back_pic:: @ 8E1F0C4
	.incbin "graphics/pokemon/huntail/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_huntail_shiny_palette:: @ 8E1F418
	.incbin "graphics/pokemon/huntail/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_huntail_icon:: @ 8E1F440
	.incbin "graphics/pokemon/huntail/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_huntail_footprint:: @ 8E1F840
	.incbin "graphics/pokemon/huntail/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_gorebyss_still_front_pic:: @ 8E1F860
	.incbin "graphics/pokemon/gorebyss/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gorebyss_palette:: @ 8E1FB70
	.incbin "graphics/pokemon/gorebyss/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_gorebyss_back_pic:: @ 8E1FB98
	.incbin "graphics/pokemon/gorebyss/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gorebyss_shiny_palette:: @ 8E1FE80
	.incbin "graphics/pokemon/gorebyss/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_gorebyss_icon:: @ 8E1FEA8
	.incbin "graphics/pokemon/gorebyss/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_gorebyss_footprint:: @ 8E202A8
	.incbin "graphics/pokemon/gorebyss/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_absol_still_front_pic:: @ 8E202C8
	.incbin "graphics/pokemon/absol/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_absol_palette:: @ 8E206F8
	.incbin "graphics/pokemon/absol/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_absol_back_pic:: @ 8E20720
	.incbin "graphics/pokemon/absol/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_absol_shiny_palette:: @ 8E20A80
	.incbin "graphics/pokemon/absol/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_absol_icon:: @ 8E20AA8
	.incbin "graphics/pokemon/absol/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_absol_footprint:: @ 8E20EA8
	.incbin "graphics/pokemon/absol/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_shuppet_still_front_pic:: @ 8E20EC8
	.incbin "graphics/pokemon/shuppet/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shuppet_palette:: @ 8E21100
	.incbin "graphics/pokemon/shuppet/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_shuppet_back_pic:: @ 8E21128
	.incbin "graphics/pokemon/shuppet/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shuppet_shiny_palette:: @ 8E213C0
	.incbin "graphics/pokemon/shuppet/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_shuppet_icon:: @ 8E213E8
	.incbin "graphics/pokemon/shuppet/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_shuppet_footprint:: @ 8E217E8
	.incbin "graphics/pokemon/shuppet/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_banette_still_front_pic:: @ 8E21808
	.incbin "graphics/pokemon/banette/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_banette_palette:: @ 8E21ABC
	.incbin "graphics/pokemon/banette/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_banette_back_pic:: @ 8E21AE4
	.incbin "graphics/pokemon/banette/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_banette_shiny_palette:: @ 8E21D60
	.incbin "graphics/pokemon/banette/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_banette_icon:: @ 8E21D88
	.incbin "graphics/pokemon/banette/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_banette_footprint:: @ 8E22188
	.incbin "graphics/pokemon/banette/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_seviper_still_front_pic:: @ 8E221A8
	.incbin "graphics/pokemon/seviper/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_seviper_palette:: @ 8E225C8
	.incbin "graphics/pokemon/seviper/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_seviper_back_pic:: @ 8E225F0
	.incbin "graphics/pokemon/seviper/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_seviper_shiny_palette:: @ 8E22A7C
	.incbin "graphics/pokemon/seviper/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_seviper_icon:: @ 8E22AA4
	.incbin "graphics/pokemon/seviper/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_seviper_footprint:: @ 8E22EA4
	.incbin "graphics/pokemon/seviper/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_zangoose_still_front_pic:: @ 8E22EC4
	.incbin "graphics/pokemon/zangoose/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_zangoose_palette:: @ 8E23290
	.incbin "graphics/pokemon/zangoose/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_zangoose_back_pic:: @ 8E232B8
	.incbin "graphics/pokemon/zangoose/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_zangoose_shiny_palette:: @ 8E2362C
	.incbin "graphics/pokemon/zangoose/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_zangoose_icon:: @ 8E23654
	.incbin "graphics/pokemon/zangoose/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_zangoose_footprint:: @ 8E23A54
	.incbin "graphics/pokemon/zangoose/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_relicanth_still_front_pic:: @ 8E23A74
	.incbin "graphics/pokemon/relicanth/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_relicanth_palette:: @ 8E23E08
	.incbin "graphics/pokemon/relicanth/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_relicanth_back_pic:: @ 8E23E30
	.incbin "graphics/pokemon/relicanth/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_relicanth_shiny_palette:: @ 8E24188
	.incbin "graphics/pokemon/relicanth/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_relicanth_icon:: @ 8E241B0
	.incbin "graphics/pokemon/relicanth/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_relicanth_footprint:: @ 8E245B0
	.incbin "graphics/pokemon/relicanth/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_aron_still_front_pic:: @ 8E245D0
	.incbin "graphics/pokemon/aron/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_aron_palette:: @ 8E247B8
	.incbin "graphics/pokemon/aron/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_aron_back_pic:: @ 8E247E0
	.incbin "graphics/pokemon/aron/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_aron_shiny_palette:: @ 8E24A08
	.incbin "graphics/pokemon/aron/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_aron_icon:: @ 8E24A30
	.incbin "graphics/pokemon/aron/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_aron_footprint:: @ 8E24E30
	.incbin "graphics/pokemon/aron/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_lairon_still_front_pic:: @ 8E24E50
	.incbin "graphics/pokemon/lairon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lairon_palette:: @ 8E2521C
	.incbin "graphics/pokemon/lairon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_lairon_back_pic:: @ 8E25244
	.incbin "graphics/pokemon/lairon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lairon_shiny_palette:: @ 8E25530
	.incbin "graphics/pokemon/lairon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_lairon_icon:: @ 8E25558
	.incbin "graphics/pokemon/lairon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_lairon_footprint:: @ 8E25958
	.incbin "graphics/pokemon/lairon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_aggron_still_front_pic:: @ 8E25978
	.incbin "graphics/pokemon/aggron/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_aggron_palette:: @ 8E25EF4
	.incbin "graphics/pokemon/aggron/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_aggron_back_pic:: @ 8E25F1C
	.incbin "graphics/pokemon/aggron/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_aggron_shiny_palette:: @ 8E26344
	.incbin "graphics/pokemon/aggron/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_aggron_icon:: @ 8E2636C
	.incbin "graphics/pokemon/aggron/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_aggron_footprint:: @ 8E2676C
	.incbin "graphics/pokemon/aggron/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_castform_still_front_pic:: @ 8E2678C
	.incbin "graphics/pokemon/castform/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_castform_palette:: @ 8E27214
	.incbin "graphics/pokemon/castform/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_castform_back_pic:: @ 8E27294
	.incbin "graphics/pokemon/castform/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_castform_shiny_palette:: @ 8E27C50
	.incbin "graphics/pokemon/castform/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_castform_icon:: @ 8E27CCC
	.incbin "graphics/pokemon/castform/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_castform_footprint:: @ 8E280CC
	.incbin "graphics/pokemon/castform/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_volbeat_still_front_pic:: @ 8E280EC
	.incbin "graphics/pokemon/volbeat/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_volbeat_palette:: @ 8E2847C
	.incbin "graphics/pokemon/volbeat/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_volbeat_back_pic:: @ 8E284A4
	.incbin "graphics/pokemon/volbeat/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_volbeat_shiny_palette:: @ 8E28804
	.incbin "graphics/pokemon/volbeat/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_volbeat_icon:: @ 8E2882C
	.incbin "graphics/pokemon/volbeat/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_volbeat_footprint:: @ 8E28C2C
	.incbin "graphics/pokemon/volbeat/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_illumise_still_front_pic:: @ 8E28C4C
	.incbin "graphics/pokemon/illumise/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_illumise_palette:: @ 8E28FC0
	.incbin "graphics/pokemon/illumise/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_illumise_back_pic:: @ 8E28FE8
	.incbin "graphics/pokemon/illumise/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_illumise_shiny_palette:: @ 8E29304
	.incbin "graphics/pokemon/illumise/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_illumise_icon:: @ 8E2932C
	.incbin "graphics/pokemon/illumise/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_illumise_footprint:: @ 8E2972C
	.incbin "graphics/pokemon/illumise/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_lileep_still_front_pic:: @ 8E2974C
	.incbin "graphics/pokemon/lileep/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lileep_palette:: @ 8E29A90
	.incbin "graphics/pokemon/lileep/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_lileep_back_pic:: @ 8E29AB8
	.incbin "graphics/pokemon/lileep/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_lileep_shiny_palette:: @ 8E29DFC
	.incbin "graphics/pokemon/lileep/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_lileep_icon:: @ 8E29E24
	.incbin "graphics/pokemon/lileep/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_lileep_footprint:: @ 8E2A224
	.incbin "graphics/pokemon/lileep/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_cradily_still_front_pic:: @ 8E2A244
	.incbin "graphics/pokemon/cradily/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cradily_palette:: @ 8E2A660
	.incbin "graphics/pokemon/cradily/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_cradily_back_pic:: @ 8E2A688
	.incbin "graphics/pokemon/cradily/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_cradily_shiny_palette:: @ 8E2AA84
	.incbin "graphics/pokemon/cradily/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_cradily_icon:: @ 8E2AAAC
	.incbin "graphics/pokemon/cradily/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_cradily_footprint:: @ 8E2AEAC
	.incbin "graphics/pokemon/cradily/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_anorith_still_front_pic:: @ 8E2AECC
	.incbin "graphics/pokemon/anorith/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_anorith_palette:: @ 8E2B1F0
	.incbin "graphics/pokemon/anorith/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_anorith_back_pic:: @ 8E2B218
	.incbin "graphics/pokemon/anorith/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_anorith_shiny_palette:: @ 8E2B460
	.incbin "graphics/pokemon/anorith/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_anorith_icon:: @ 8E2B488
	.incbin "graphics/pokemon/anorith/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_anorith_footprint:: @ 8E2B888
	.incbin "graphics/pokemon/anorith/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_armaldo_still_front_pic:: @ 8E2B8A8
	.incbin "graphics/pokemon/armaldo/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_armaldo_palette:: @ 8E2BE28
	.incbin "graphics/pokemon/armaldo/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_armaldo_back_pic:: @ 8E2BE50
	.incbin "graphics/pokemon/armaldo/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_armaldo_shiny_palette:: @ 8E2C288
	.incbin "graphics/pokemon/armaldo/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_armaldo_icon:: @ 8E2C2B0
	.incbin "graphics/pokemon/armaldo/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_armaldo_footprint:: @ 8E2C6B0
	.incbin "graphics/pokemon/armaldo/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_ralts_still_front_pic:: @ 8E2C6D0
	.incbin "graphics/pokemon/ralts/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ralts_palette:: @ 8E2C900
	.incbin "graphics/pokemon/ralts/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_ralts_back_pic:: @ 8E2C928
	.incbin "graphics/pokemon/ralts/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_ralts_shiny_palette:: @ 8E2CB64
	.incbin "graphics/pokemon/ralts/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_ralts_icon:: @ 8E2CB8C
	.incbin "graphics/pokemon/ralts/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_ralts_footprint:: @ 8E2CF8C
	.incbin "graphics/pokemon/ralts/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_kirlia_still_front_pic:: @ 8E2CFAC
	.incbin "graphics/pokemon/kirlia/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kirlia_palette:: @ 8E2D2A8
	.incbin "graphics/pokemon/kirlia/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_kirlia_back_pic:: @ 8E2D2D0
	.incbin "graphics/pokemon/kirlia/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kirlia_shiny_palette:: @ 8E2D644
	.incbin "graphics/pokemon/kirlia/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_kirlia_icon:: @ 8E2D66C
	.incbin "graphics/pokemon/kirlia/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_kirlia_footprint:: @ 8E2DA6C
	.incbin "graphics/pokemon/kirlia/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_gardevoir_still_front_pic:: @ 8E2DA8C
	.incbin "graphics/pokemon/gardevoir/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gardevoir_palette:: @ 8E2DE08
	.incbin "graphics/pokemon/gardevoir/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_gardevoir_back_pic:: @ 8E2DE30
	.incbin "graphics/pokemon/gardevoir/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_gardevoir_shiny_palette:: @ 8E2E164
	.incbin "graphics/pokemon/gardevoir/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_gardevoir_icon:: @ 8E2E18C
	.incbin "graphics/pokemon/gardevoir/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_gardevoir_footprint:: @ 8E2E58C
	.incbin "graphics/pokemon/gardevoir/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_bagon_still_front_pic:: @ 8E2E5AC
	.incbin "graphics/pokemon/bagon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_bagon_palette:: @ 8E2E824
	.incbin "graphics/pokemon/bagon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_bagon_back_pic:: @ 8E2E84C
	.incbin "graphics/pokemon/bagon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_bagon_shiny_palette:: @ 8E2EB34
	.incbin "graphics/pokemon/bagon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_bagon_icon:: @ 8E2EB5C
	.incbin "graphics/pokemon/bagon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_bagon_footprint:: @ 8E2EF5C
	.incbin "graphics/pokemon/bagon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_shelgon_still_front_pic:: @ 8E2EF7C
	.incbin "graphics/pokemon/shelgon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shelgon_palette:: @ 8E2F280
	.incbin "graphics/pokemon/shelgon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_shelgon_back_pic:: @ 8E2F2A8
	.incbin "graphics/pokemon/shelgon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_shelgon_shiny_palette:: @ 8E2F590
	.incbin "graphics/pokemon/shelgon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_shelgon_icon:: @ 8E2F5B8
	.incbin "graphics/pokemon/shelgon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_shelgon_footprint:: @ 8E2F9B8
	.incbin "graphics/pokemon/shelgon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_salamence_still_front_pic:: @ 8E2F9D8
	.incbin "graphics/pokemon/salamence/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_salamence_palette:: @ 8E2FE3C
	.incbin "graphics/pokemon/salamence/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_salamence_back_pic:: @ 8E2FE64
	.incbin "graphics/pokemon/salamence/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_salamence_shiny_palette:: @ 8E30148
	.incbin "graphics/pokemon/salamence/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_salamence_icon:: @ 8E30170
	.incbin "graphics/pokemon/salamence/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_salamence_footprint:: @ 8E30570
	.incbin "graphics/pokemon/salamence/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_beldum_still_front_pic:: @ 8E30590
	.incbin "graphics/pokemon/beldum/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_beldum_palette:: @ 8E30800
	.incbin "graphics/pokemon/beldum/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_beldum_back_pic:: @ 8E30828
	.incbin "graphics/pokemon/beldum/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_beldum_shiny_palette:: @ 8E30B18
	.incbin "graphics/pokemon/beldum/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_beldum_icon:: @ 8E30B40
	.incbin "graphics/pokemon/beldum/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_beldum_footprint:: @ 8E30F40
	.incbin "graphics/pokemon/beldum/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_metang_still_front_pic:: @ 8E30F60
	.incbin "graphics/pokemon/metang/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_metang_palette:: @ 8E313BC
	.incbin "graphics/pokemon/metang/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_metang_back_pic:: @ 8E313E4
	.incbin "graphics/pokemon/metang/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_metang_shiny_palette:: @ 8E31708
	.incbin "graphics/pokemon/metang/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_metang_icon:: @ 8E31730
	.incbin "graphics/pokemon/metang/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_metang_footprint:: @ 8E31B30
	.incbin "graphics/pokemon/metang/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_metagross_still_front_pic:: @ 8E31B50
	.incbin "graphics/pokemon/metagross/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_metagross_palette:: @ 8E31FB4
	.incbin "graphics/pokemon/metagross/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_metagross_back_pic:: @ 8E31FDC
	.incbin "graphics/pokemon/metagross/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_metagross_shiny_palette:: @ 8E322A8
	.incbin "graphics/pokemon/metagross/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_metagross_icon:: @ 8E322D0
	.incbin "graphics/pokemon/metagross/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_metagross_footprint:: @ 8E326D0
	.incbin "graphics/pokemon/metagross/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_regirock_still_front_pic:: @ 8E326F0
	.incbin "graphics/pokemon/regirock/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_regirock_palette:: @ 8E32BAC
	.incbin "graphics/pokemon/regirock/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_regirock_back_pic:: @ 8E32BD4
	.incbin "graphics/pokemon/regirock/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_regirock_shiny_palette:: @ 8E33020
	.incbin "graphics/pokemon/regirock/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_regirock_icon:: @ 8E33048
	.incbin "graphics/pokemon/regirock/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_regirock_footprint:: @ 8E33448
	.incbin "graphics/pokemon/regirock/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_regice_still_front_pic:: @ 8E33468
	.incbin "graphics/pokemon/regice/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_regice_palette:: @ 8E338B0
	.incbin "graphics/pokemon/regice/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_regice_back_pic:: @ 8E338D8
	.incbin "graphics/pokemon/regice/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_regice_shiny_palette:: @ 8E33BC8
	.incbin "graphics/pokemon/regice/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_regice_icon:: @ 8E33BF0
	.incbin "graphics/pokemon/regice/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_regice_footprint:: @ 8E33FF0
	.incbin "graphics/pokemon/regice/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_registeel_still_front_pic:: @ 8E34010
	.incbin "graphics/pokemon/registeel/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_registeel_palette:: @ 8E34498
	.incbin "graphics/pokemon/registeel/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_registeel_back_pic:: @ 8E344C0
	.incbin "graphics/pokemon/registeel/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_registeel_shiny_palette:: @ 8E347F8
	.incbin "graphics/pokemon/registeel/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_registeel_icon:: @ 8E34820
	.incbin "graphics/pokemon/registeel/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_registeel_footprint:: @ 8E34C20
	.incbin "graphics/pokemon/registeel/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_kyogre_still_front_pic:: @ 8E34C40
	.incbin "graphics/pokemon/kyogre/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kyogre_palette:: @ 8E350B0
	.incbin "graphics/pokemon/kyogre/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_kyogre_back_pic:: @ 8E350D8
	.incbin "graphics/pokemon/kyogre/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_kyogre_shiny_palette:: @ 8E35350
	.incbin "graphics/pokemon/kyogre/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_kyogre_icon:: @ 8E35378
	.incbin "graphics/pokemon/kyogre/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_kyogre_footprint:: @ 8E35778
	.incbin "graphics/pokemon/kyogre/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_groudon_still_front_pic:: @ 8E35798
	.incbin "graphics/pokemon/groudon/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_groudon_palette:: @ 8E35D2C
	.incbin "graphics/pokemon/groudon/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_groudon_back_pic:: @ 8E35D54
	.incbin "graphics/pokemon/groudon/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_groudon_shiny_palette:: @ 8E361BC
	.incbin "graphics/pokemon/groudon/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_groudon_icon:: @ 8E361E4
	.incbin "graphics/pokemon/groudon/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_groudon_footprint:: @ 8E365E4
	.incbin "graphics/pokemon/groudon/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_rayquaza_still_front_pic:: @ 8E36604
	.incbin "graphics/pokemon/rayquaza/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_rayquaza_palette:: @ 8E36B14
	.incbin "graphics/pokemon/rayquaza/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_rayquaza_back_pic:: @ 8E36B3C
	.incbin "graphics/pokemon/rayquaza/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_rayquaza_shiny_palette:: @ 8E36E74
	.incbin "graphics/pokemon/rayquaza/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_rayquaza_icon:: @ 8E36E9C
	.incbin "graphics/pokemon/rayquaza/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_rayquaza_footprint:: @ 8E3729C
	.incbin "graphics/pokemon/rayquaza/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_latias_still_front_pic:: @ 8E372BC
	.incbin "graphics/pokemon/latias/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_latias_palette:: @ 8E376E0
	.incbin "graphics/pokemon/latias/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_latias_back_pic:: @ 8E37708
	.incbin "graphics/pokemon/latias/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_latias_shiny_palette:: @ 8E37A04
	.incbin "graphics/pokemon/latias/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_latias_icon:: @ 8E37A2C
	.incbin "graphics/pokemon/latias/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_latias_footprint:: @ 8E37E2C
	.incbin "graphics/pokemon/latias/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_latios_still_front_pic:: @ 8E37E4C
	.incbin "graphics/pokemon/latios/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_latios_palette:: @ 8E382A0
	.incbin "graphics/pokemon/latios/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_latios_back_pic:: @ 8E382C8
	.incbin "graphics/pokemon/latios/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_latios_shiny_palette:: @ 8E38628
	.incbin "graphics/pokemon/latios/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_latios_icon:: @ 8E38650
	.incbin "graphics/pokemon/latios/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_latios_footprint:: @ 8E38A50
	.incbin "graphics/pokemon/latios/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_jirachi_still_front_pic:: @ 8E38A70
	.incbin "graphics/pokemon/jirachi/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_jirachi_palette:: @ 8E38D7C
	.incbin "graphics/pokemon/jirachi/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_jirachi_back_pic:: @ 8E38DA4
	.incbin "graphics/pokemon/jirachi/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_jirachi_shiny_palette:: @ 8E39144
	.incbin "graphics/pokemon/jirachi/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_jirachi_icon:: @ 8E3916C
	.incbin "graphics/pokemon/jirachi/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_jirachi_footprint:: @ 8E3956C
	.incbin "graphics/pokemon/jirachi/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_deoxys_still_front_pic:: @ 8E3958C
	.incbin "graphics/pokemon/deoxys/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_deoxys_palette:: @ 8E39D48
	.incbin "graphics/pokemon/deoxys/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_deoxys_back_pic:: @ 8E39D70
	.incbin "graphics/pokemon/deoxys/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_deoxys_shiny_palette:: @ 8E3A360
	.incbin "graphics/pokemon/deoxys/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_deoxys_icon:: @ 8E3A388
	.incbin "graphics/pokemon/deoxys/icon.4bpp"

	.align 2
gFile_graphics_pokemon_icons_deoxys_speed_icon:: @ 8E3A788
	.incbin "graphics/pokemon/deoxys/speed_icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_deoxys_footprint:: @ 8E3AB88
	.incbin "graphics/pokemon/deoxys/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_chimecho_still_front_pic:: @ 8E3ABA8
	.incbin "graphics/pokemon/chimecho/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_chimecho_palette:: @ 8E3ADF4
	.incbin "graphics/pokemon/chimecho/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_back_pics_chimecho_back_pic:: @ 8E3AE1C
	.incbin "graphics/pokemon/chimecho/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_chimecho_shiny_palette:: @ 8E3B090
	.incbin "graphics/pokemon/chimecho/shiny.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_chimecho_icon:: @ 8E3B0B8
	.incbin "graphics/pokemon/chimecho/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_chimecho_footprint:: @ 8E3B4B8
	.incbin "graphics/pokemon/chimecho/footprint.1bpp"

	.align 2
gFile_graphics_pokemon_front_pics_egg_still_front_pic:: @ 8E3B4D8
	.incbin "graphics/pokemon/egg/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_palettes_egg_palette:: @ 8E3B68C
	.incbin "graphics/pokemon/egg/normal.gbapal.lz"

	.align 2
gFile_graphics_pokemon_front_pics_unown_b_still_front_pic:: @ 8E3B6AC
	.incbin "graphics/pokemon/unown/b/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_b_back_pic:: @ 8E3B884
	.incbin "graphics/pokemon/unown/b/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_B_icon:: @ 8E3BA88
	.incbin "graphics/pokemon/unown/b/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_c_still_front_pic:: @ 8E3BE88
	.incbin "graphics/pokemon/unown/c/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_c_back_pic:: @ 8E3C09C
	.incbin "graphics/pokemon/unown/c/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_C_icon:: @ 8E3C348
	.incbin "graphics/pokemon/unown/c/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_d_still_front_pic:: @ 8E3C748
	.incbin "graphics/pokemon/unown/d/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_d_back_pic:: @ 8E3C940
	.incbin "graphics/pokemon/unown/d/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_D_icon:: @ 8E3CB98
	.incbin "graphics/pokemon/unown/d/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_e_still_front_pic:: @ 8E3CF98
	.incbin "graphics/pokemon/unown/e/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_e_back_pic:: @ 8E3D150
	.incbin "graphics/pokemon/unown/e/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_E_icon:: @ 8E3D350
	.incbin "graphics/pokemon/unown/e/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_f_still_front_pic:: @ 8E3D750
	.incbin "graphics/pokemon/unown/f/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_f_back_pic:: @ 8E3D944
	.incbin "graphics/pokemon/unown/f/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_F_icon:: @ 8E3DB60
	.incbin "graphics/pokemon/unown/f/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_g_still_front_pic:: @ 8E3DF60
	.incbin "graphics/pokemon/unown/g/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_g_back_pic:: @ 8E3E13C
	.incbin "graphics/pokemon/unown/g/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_G_icon:: @ 8E3E388
	.incbin "graphics/pokemon/unown/g/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_h_still_front_pic:: @ 8E3E788
	.incbin "graphics/pokemon/unown/h/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_h_back_pic:: @ 8E3E9CC
	.incbin "graphics/pokemon/unown/h/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_H_icon:: @ 8E3EC90
	.incbin "graphics/pokemon/unown/h/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_i_still_front_pic:: @ 8E3F090
	.incbin "graphics/pokemon/unown/i/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_i_back_pic:: @ 8E3F228
	.incbin "graphics/pokemon/unown/i/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_I_icon:: @ 8E3F3D0
	.incbin "graphics/pokemon/unown/i/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_j_still_front_pic:: @ 8E3F7D0
	.incbin "graphics/pokemon/unown/j/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_j_back_pic:: @ 8E3F994
	.incbin "graphics/pokemon/unown/j/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_J_icon:: @ 8E3FB7C
	.incbin "graphics/pokemon/unown/j/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_k_still_front_pic:: @ 8E3FF7C
	.incbin "graphics/pokemon/unown/k/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_k_back_pic:: @ 8E4014C
	.incbin "graphics/pokemon/unown/k/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_K_icon:: @ 8E40344
	.incbin "graphics/pokemon/unown/k/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_l_still_front_pic:: @ 8E40744
	.incbin "graphics/pokemon/unown/l/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_l_back_pic:: @ 8E408F4
	.incbin "graphics/pokemon/unown/l/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_L_icon:: @ 8E40AC8
	.incbin "graphics/pokemon/unown/l/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_m_still_front_pic:: @ 8E40EC8
	.incbin "graphics/pokemon/unown/m/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_m_back_pic:: @ 8E410EC
	.incbin "graphics/pokemon/unown/m/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_M_icon:: @ 8E41394
	.incbin "graphics/pokemon/unown/m/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_n_still_front_pic:: @ 8E41794
	.incbin "graphics/pokemon/unown/n/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_n_back_pic:: @ 8E4198C
	.incbin "graphics/pokemon/unown/n/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_N_icon:: @ 8E41BF8
	.incbin "graphics/pokemon/unown/n/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_o_still_front_pic:: @ 8E41FF8
	.incbin "graphics/pokemon/unown/o/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_o_back_pic:: @ 8E42230
	.incbin "graphics/pokemon/unown/o/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_O_icon:: @ 8E424F0
	.incbin "graphics/pokemon/unown/o/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_p_still_front_pic:: @ 8E428F0
	.incbin "graphics/pokemon/unown/p/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_p_back_pic:: @ 8E42A90
	.incbin "graphics/pokemon/unown/p/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_P_icon:: @ 8E42C54
	.incbin "graphics/pokemon/unown/p/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_q_still_front_pic:: @ 8E43054
	.incbin "graphics/pokemon/unown/q/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_q_back_pic:: @ 8E43208
	.incbin "graphics/pokemon/unown/q/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_Q_icon:: @ 8E433D4
	.incbin "graphics/pokemon/unown/q/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_r_still_front_pic:: @ 8E437D4
	.incbin "graphics/pokemon/unown/r/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_r_back_pic:: @ 8E43978
	.incbin "graphics/pokemon/unown/r/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_R_icon:: @ 8E43B40
	.incbin "graphics/pokemon/unown/r/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_s_still_front_pic:: @ 8E43F40
	.incbin "graphics/pokemon/unown/s/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_s_back_pic:: @ 8E44128
	.incbin "graphics/pokemon/unown/s/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_S_icon:: @ 8E4437C
	.incbin "graphics/pokemon/unown/s/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_t_still_front_pic:: @ 8E4477C
	.incbin "graphics/pokemon/unown/t/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_t_back_pic:: @ 8E4492C
	.incbin "graphics/pokemon/unown/t/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_T_icon:: @ 8E44AE0
	.incbin "graphics/pokemon/unown/t/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_u_still_front_pic:: @ 8E44EE0
	.incbin "graphics/pokemon/unown/u/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_u_back_pic:: @ 8E450F8
	.incbin "graphics/pokemon/unown/u/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_U_icon:: @ 8E4534C
	.incbin "graphics/pokemon/unown/u/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_v_still_front_pic:: @ 8E4574C
	.incbin "graphics/pokemon/unown/v/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_v_back_pic:: @ 8E45930
	.incbin "graphics/pokemon/unown/v/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_V_icon:: @ 8E45B60
	.incbin "graphics/pokemon/unown/v/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_w_still_front_pic:: @ 8E45F60
	.incbin "graphics/pokemon/unown/w/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_w_back_pic:: @ 8E46134
	.incbin "graphics/pokemon/unown/w/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_W_icon:: @ 8E46338
	.incbin "graphics/pokemon/unown/w/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_x_still_front_pic:: @ 8E46738
	.incbin "graphics/pokemon/unown/x/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_x_back_pic:: @ 8E468FC
	.incbin "graphics/pokemon/unown/x/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_X_icon:: @ 8E46AEC
	.incbin "graphics/pokemon/unown/x/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_y_still_front_pic:: @ 8E46EEC
	.incbin "graphics/pokemon/unown/y/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_y_back_pic:: @ 8E470C4
	.incbin "graphics/pokemon/unown/y/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_Y_icon:: @ 8E472B8
	.incbin "graphics/pokemon/unown/y/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_z_still_front_pic:: @ 8E476B8
	.incbin "graphics/pokemon/unown/z/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_z_back_pic:: @ 8E47868
	.incbin "graphics/pokemon/unown/z/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_Z_icon:: @ 8E47A44
	.incbin "graphics/pokemon/unown/z/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_exclamation_mark_still_front_pic:: @ 8E47E44
	.incbin "graphics/pokemon/unown/exclamation_mark/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_exclamation_mark_back_pic:: @ 8E47FD4
	.incbin "graphics/pokemon/unown/exclamation_mark/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_exclamation_mark_icon:: @ 8E4819C
	.incbin "graphics/pokemon/unown/exclamation_mark/icon.4bpp"

	.align 2
gFile_graphics_pokemon_front_pics_unown_question_mark_still_front_pic:: @ 8E4859C
	.incbin "graphics/pokemon/unown/question_mark/front.4bpp.lz"

	.align 2
gFile_graphics_pokemon_back_pics_unown_question_mark_back_pic:: @ 8E48758
	.incbin "graphics/pokemon/unown/question_mark/back.4bpp.lz"

	.align 2
gFile_graphics_pokemon_icons_unown_question_mark_icon:: @ 8E48958
	.incbin "graphics/pokemon/unown/question_mark/icon.4bpp"

	.align 2
gFile_graphics_trainers_front_pics_aqua_leader_archie_front_pic:: @ 8E48D58
	.incbin "graphics/trainers/front_pics/aqua_leader_archie_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_aqua_leader_archie:: @ 8E49094
	.incbin "graphics/trainers/palettes/aqua_leader_archie.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_aqua_grunt_m_front_pic:: @ 8E490BC
	.incbin "graphics/trainers/front_pics/aqua_grunt_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_aqua_grunt_m:: @ 8E4941C
	.incbin "graphics/trainers/palettes/aqua_grunt_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_aqua_grunt_f_front_pic:: @ 8E49444
	.incbin "graphics/trainers/front_pics/aqua_grunt_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_aqua_grunt_f:: @ 8E49780
	.incbin "graphics/trainers/palettes/aqua_grunt_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_aroma_lady_front_pic:: @ 8E497A8
	.incbin "graphics/trainers/front_pics/emerald_aroma_lady_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_aroma_lady:: @ 8E49A6C
	.incbin "graphics/trainers/palettes/emerald_aroma_lady.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_ruin_maniac_front_pic:: @ 8E49A94
	.incbin "graphics/trainers/front_pics/emerald_ruin_maniac_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_ruin_maniac:: @ 8E49E30
	.incbin "graphics/trainers/palettes/emerald_ruin_maniac.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_interviewer_front_pic:: @ 8E49E58
	.incbin "graphics/trainers/front_pics/interviewer_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_interviewer:: @ 8E4A2FC
	.incbin "graphics/trainers/palettes/interviewer.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_tuber_f_front_pic:: @ 8E4A324
	.incbin "graphics/trainers/front_pics/emerald_tuber_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_tuber_f:: @ 8E4A5C8
	.incbin "graphics/trainers/palettes/emerald_tuber_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_tuber_m_front_pic:: @ 8E4A5F0
	.incbin "graphics/trainers/front_pics/emerald_tuber_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_tuber_m:: @ 8E4A87C
	.incbin "graphics/trainers/palettes/emerald_tuber_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_cool_trainer_m_front_pic:: @ 8E4A8A4
	.incbin "graphics/trainers/front_pics/emerald_cool_trainer_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_cool_trainer_m:: @ 8E4AB8C
	.incbin "graphics/trainers/palettes/emerald_cool_trainer_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_cool_trainer_f_front_pic:: @ 8E4ABB4
	.incbin "graphics/trainers/front_pics/emerald_cool_trainer_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_cool_trainer_f:: @ 8E4AEC8
	.incbin "graphics/trainers/palettes/emerald_cool_trainer_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_hex_maniac_front_pic:: @ 8E4AEF0
	.incbin "graphics/trainers/front_pics/hex_maniac_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_hex_maniac:: @ 8E4B25C
	.incbin "graphics/trainers/palettes/hex_maniac.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_lady_front_pic:: @ 8E4B284
	.incbin "graphics/trainers/front_pics/emerald_lady_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_lady:: @ 8E4B638
	.incbin "graphics/trainers/palettes/emerald_lady.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_beauty_front_pic:: @ 8E4B660
	.incbin "graphics/trainers/front_pics/emerald_beauty_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_beauty:: @ 8E4B948
	.incbin "graphics/trainers/palettes/emerald_beauty.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_rich_boy_front_pic:: @ 8E4B970
	.incbin "graphics/trainers/front_pics/rich_boy_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_rich_boy:: @ 8E4BC24
	.incbin "graphics/trainers/palettes/rich_boy.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_pokemaniac_front_pic:: @ 8E4BC4C
	.incbin "graphics/trainers/front_pics/emerald_pokemaniac_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_pokemaniac:: @ 8E4BFBC
	.incbin "graphics/trainers/palettes/emerald_pokemaniac.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_swimmer_m_front_pic:: @ 8E4BFE4
	.incbin "graphics/trainers/front_pics/emerald_swimmer_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_swimmer_m:: @ 8E4C2A4
	.incbin "graphics/trainers/palettes/emerald_swimmer_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_black_belt_front_pic:: @ 8E4C2CC
	.incbin "graphics/trainers/front_pics/emerald_black_belt_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_black_belt:: @ 8E4C630
	.incbin "graphics/trainers/palettes/emerald_black_belt.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_guitarist_front_pic:: @ 8E4C658
	.incbin "graphics/trainers/front_pics/guitarist_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_guitarist:: @ 8E4C9DC
	.incbin "graphics/trainers/palettes/guitarist.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_kindler_front_pic:: @ 8E4CA04
	.incbin "graphics/trainers/front_pics/kindler_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_kindler:: @ 8E4CD70
	.incbin "graphics/trainers/palettes/kindler.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_camper_front_pic:: @ 8E4CD98
	.incbin "graphics/trainers/front_pics/emerald_camper_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_camper:: @ 8E4D080
	.incbin "graphics/trainers/palettes/emerald_camper.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_bug_maniac_front_pic:: @ 8E4D0A8
	.incbin "graphics/trainers/front_pics/bug_maniac_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_bug_maniac:: @ 8E4D4F8
	.incbin "graphics/trainers/palettes/bug_maniac.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_psychic_m_front_pic:: @ 8E4D520
	.incbin "graphics/trainers/front_pics/emerald_psychic_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_psychic_m:: @ 8E4D84C
	.incbin "graphics/trainers/palettes/emerald_psychic_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_psychic_f_front_pic:: @ 8E4D874
	.incbin "graphics/trainers/front_pics/emerald_psychic_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_psychic_f:: @ 8E4DB9C
	.incbin "graphics/trainers/palettes/emerald_psychic_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_gentleman_front_pic:: @ 8E4DBC4
	.incbin "graphics/trainers/front_pics/emerald_gentleman_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_gentleman:: @ 8E4DEC4
	.incbin "graphics/trainers/palettes/emerald_gentleman.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_elite_four_sidney_front_pic:: @ 8E4DEEC
	.incbin "graphics/trainers/front_pics/elite_four_sidney_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_elite_four_sidney:: @ 8E4E220
	.incbin "graphics/trainers/palettes/elite_four_sidney.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_elite_four_phoebe_front_pic:: @ 8E4E248
	.incbin "graphics/trainers/front_pics/elite_four_phoebe_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_elite_four_phoebe:: @ 8E4E548
	.incbin "graphics/trainers/palettes/elite_four_phoebe.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_roxanne_front_pic:: @ 8E4E570
	.incbin "graphics/trainers/front_pics/leader_roxanne_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_roxanne:: @ 8E4E85C
	.incbin "graphics/trainers/palettes/leader_roxanne.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_brawly_front_pic:: @ 8E4E884
	.incbin "graphics/trainers/front_pics/leader_brawly_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_brawly:: @ 8E4EC18
	.incbin "graphics/trainers/palettes/leader_brawly.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_tate_and_liza_front_pic:: @ 8E4EC40
	.incbin "graphics/trainers/front_pics/leader_tate_and_liza_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_tate_and_liza:: @ 8E4F084
	.incbin "graphics/trainers/palettes/leader_tate_and_liza.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_school_kid_m_front_pic:: @ 8E4F0AC
	.incbin "graphics/trainers/front_pics/school_kid_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_school_kid_m:: @ 8E4F36C
	.incbin "graphics/trainers/palettes/school_kid_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_school_kid_f_front_pic:: @ 8E4F394
	.incbin "graphics/trainers/front_pics/school_kid_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_school_kid_f:: @ 8E4F630
	.incbin "graphics/trainers/palettes/school_kid_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_sr_and_jr_front_pic:: @ 8E4F658
	.incbin "graphics/trainers/front_pics/sr_and_jr_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_sr_and_jr:: @ 8E4FAC8
	.incbin "graphics/trainers/palettes/sr_and_jr.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_winstrate_m_front_pic:: @ 8E4FAF0
	.incbin "graphics/trainers/front_pics/winstrate_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_winstrate_m:: @ 8E4FEAC
	.incbin "graphics/trainers/palettes/winstrate_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_winstrate_f_front_pic:: @ 8E4FED4
	.incbin "graphics/trainers/front_pics/winstrate_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_winstrate_f:: @ 8E502A0
	.incbin "graphics/trainers/palettes/winstrate_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_expert_m_front_pic:: @ 8E502C8
	.incbin "graphics/trainers/front_pics/expert_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_expert_m:: @ 8E50608
	.incbin "graphics/trainers/palettes/expert_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_expert_f_front_pic:: @ 8E50630
	.incbin "graphics/trainers/front_pics/expert_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_expert_f:: @ 8E5094C
	.incbin "graphics/trainers/palettes/expert_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_youngster_front_pic:: @ 8E50974
	.incbin "graphics/trainers/front_pics/emerald_youngster_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_youngster:: @ 8E50C1C
	.incbin "graphics/trainers/palettes/emerald_youngster.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_steven_front_pic:: @ 8E50C44
	.incbin "graphics/trainers/front_pics/steven_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_steven:: @ 8E50F7C
	.incbin "graphics/trainers/palettes/steven.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_fisherman_front_pic:: @ 8E50FA4
	.incbin "graphics/trainers/front_pics/emerald_fisherman_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_fisherman:: @ 8E51388
	.incbin "graphics/trainers/palettes/emerald_fisherman.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_cycling_triathlete_m_front_pic:: @ 8E513B0
	.incbin "graphics/trainers/front_pics/cycling_triathlete_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_cycling_triathlete_m:: @ 8E517C0
	.incbin "graphics/trainers/palettes/cycling_triathlete_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_cycling_triathlete_f_front_pic:: @ 8E517E8
	.incbin "graphics/trainers/front_pics/cycling_triathlete_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_cycling_triathlete_f:: @ 8E51BF4
	.incbin "graphics/trainers/palettes/cycling_triathlete_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_running_triathlete_m_front_pic:: @ 8E51C1C
	.incbin "graphics/trainers/front_pics/running_triathlete_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_running_triathlete_m:: @ 8E51ED4
	.incbin "graphics/trainers/palettes/running_triathlete_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_running_triathlete_f_front_pic:: @ 8E51EFC
	.incbin "graphics/trainers/front_pics/running_triathlete_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_running_triathlete_f:: @ 8E521A0
	.incbin "graphics/trainers/palettes/running_triathlete_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_swimming_triathlete_m_front_pic:: @ 8E521C8
	.incbin "graphics/trainers/front_pics/swimming_triathlete_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_swimming_triathlete_m:: @ 8E524F4
	.incbin "graphics/trainers/palettes/swimming_triathlete_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_swimming_triathlete_f_front_pic:: @ 8E5251C
	.incbin "graphics/trainers/front_pics/swimming_triathlete_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_swimming_triathlete_f:: @ 8E527F8
	.incbin "graphics/trainers/palettes/swimming_triathlete_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_dragon_tamer_front_pic:: @ 8E52820
	.incbin "graphics/trainers/front_pics/dragon_tamer_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_dragon_tamer:: @ 8E52B74
	.incbin "graphics/trainers/palettes/dragon_tamer.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_bird_keeper_front_pic:: @ 8E52B9C
	.incbin "graphics/trainers/front_pics/emerald_bird_keeper_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_bird_keeper:: @ 8E52ED4
	.incbin "graphics/trainers/palettes/emerald_bird_keeper.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_ninja_boy_front_pic:: @ 8E52EFC
	.incbin "graphics/trainers/front_pics/ninja_boy_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_ninja_boy:: @ 8E531D8
	.incbin "graphics/trainers/palettes/ninja_boy.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_battle_girl_front_pic:: @ 8E53200
	.incbin "graphics/trainers/front_pics/battle_girl_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_battle_girl:: @ 8E53520
	.incbin "graphics/trainers/palettes/battle_girl.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_parasol_lady_front_pic:: @ 8E53548
	.incbin "graphics/trainers/front_pics/parasol_lady_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_parasol_lady:: @ 8E53880
	.incbin "graphics/trainers/palettes/parasol_lady.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_swimmer_f_front_pic:: @ 8E538A8
	.incbin "graphics/trainers/front_pics/emerald_swimmer_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_swimmer_f:: @ 8E53B78
	.incbin "graphics/trainers/palettes/emerald_swimmer_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_picnicker_front_pic:: @ 8E53BA0
	.incbin "graphics/trainers/front_pics/emerald_picnicker_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_picnicker:: @ 8E53E80
	.incbin "graphics/trainers/palettes/emerald_picnicker.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_twins_front_pic:: @ 8E53EA8
	.incbin "graphics/trainers/front_pics/emerald_twins_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_twins:: @ 8E5426C
	.incbin "graphics/trainers/palettes/emerald_twins.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_sailor_front_pic:: @ 8E54294
	.incbin "graphics/trainers/front_pics/emerald_sailor_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_sailor:: @ 8E54644
	.incbin "graphics/trainers/palettes/emerald_sailor.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_collector_front_pic:: @ 8E5466C
	.incbin "graphics/trainers/front_pics/collector_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_collector:: @ 8E54A70
	.incbin "graphics/trainers/palettes/collector.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_wally_front_pic:: @ 8E54A98
	.incbin "graphics/trainers/front_pics/wally_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_wally:: @ 8E54D68
	.incbin "graphics/trainers/palettes/wally.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_ruby_sapphire_brendan_front_pic:: @ 8E54D90
	.incbin "graphics/trainers/front_pics/ruby_sapphire_brendan_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_ruby_sapphire_brendan:: @ 8E550A4
	.incbin "graphics/trainers/palettes/ruby_sapphire_brendan.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_ruby_sapphire_may_front_pic:: @ 8E550CC
	.incbin "graphics/trainers/front_pics/ruby_sapphire_may_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_ruby_sapphire_may:: @ 8E553CC
	.incbin "graphics/trainers/palettes/ruby_sapphire_may.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_pokemon_breeder_m_front_pic:: @ 8E553F4
	.incbin "graphics/trainers/front_pics/emerald_pokemon_breeder_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_pokemon_breeder_m:: @ 8E55724
	.incbin "graphics/trainers/palettes/emerald_pokemon_breeder_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_pokemon_breeder_f_front_pic:: @ 8E5574C
	.incbin "graphics/trainers/front_pics/emerald_pokemon_breeder_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_pokemon_breeder_f:: @ 8E55A80
	.incbin "graphics/trainers/palettes/emerald_pokemon_breeder_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_pokemon_ranger_m_front_pic:: @ 8E55AA8
	.incbin "graphics/trainers/front_pics/emerald_pokemon_ranger_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_pokemon_ranger_m:: @ 8E55DF0
	.incbin "graphics/trainers/palettes/emerald_pokemon_ranger_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_pokemon_ranger_f_front_pic:: @ 8E55E18
	.incbin "graphics/trainers/front_pics/emerald_pokemon_ranger_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_pokemon_ranger_f:: @ 8E5614C
	.incbin "graphics/trainers/palettes/emerald_pokemon_ranger_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_magma_leader_maxie_front_pic:: @ 8E56174
	.incbin "graphics/trainers/front_pics/magma_leader_maxie_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_magma_leader_maxie:: @ 8E56468
	.incbin "graphics/trainers/palettes/magma_leader_maxie.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_magma_grunt_m_front_pic:: @ 8E56490
	.incbin "graphics/trainers/front_pics/magma_grunt_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_magma_grunt_m:: @ 8E56810
	.incbin "graphics/trainers/palettes/magma_grunt_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_magma_grunt_f_front_pic:: @ 8E56838
	.incbin "graphics/trainers/front_pics/magma_grunt_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_magma_grunt_f:: @ 8E56BC4
	.incbin "graphics/trainers/palettes/magma_grunt_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_lass_front_pic:: @ 8E56BEC
	.incbin "graphics/trainers/front_pics/emerald_lass_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_lass:: @ 8E56EC4
	.incbin "graphics/trainers/palettes/emerald_lass.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_bug_catcher_front_pic:: @ 8E56EEC
	.incbin "graphics/trainers/front_pics/emerald_bug_catcher_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_bug_catcher:: @ 8E57218
	.incbin "graphics/trainers/palettes/emerald_bug_catcher.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_hiker_front_pic:: @ 8E57240
	.incbin "graphics/trainers/front_pics/emerald_hiker_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_hiker:: @ 8E576C0
	.incbin "graphics/trainers/palettes/emerald_hiker.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_young_couple_front_pic:: @ 8E576E8
	.incbin "graphics/trainers/front_pics/emerald_young_couple_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_young_couple:: @ 8E57AA8
	.incbin "graphics/trainers/palettes/emerald_young_couple.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_old_couple_front_pic:: @ 8E57AD0
	.incbin "graphics/trainers/front_pics/old_couple_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_old_couple:: @ 8E57FE0
	.incbin "graphics/trainers/palettes/old_couple.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_emerald_sis_and_bro_front_pic:: @ 8E58008
	.incbin "graphics/trainers/front_pics/emerald_sis_and_bro_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_emerald_sis_and_bro:: @ 8E58454
	.incbin "graphics/trainers/palettes/emerald_sis_and_bro.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_aqua_admin_m_front_pic:: @ 8E5847C
	.incbin "graphics/trainers/front_pics/aqua_admin_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_aqua_admin_m:: @ 8E58830
	.incbin "graphics/trainers/palettes/aqua_admin_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_aqua_admin_f_front_pic:: @ 8E58858
	.incbin "graphics/trainers/front_pics/aqua_admin_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_aqua_admin_f:: @ 8E58C1C
	.incbin "graphics/trainers/palettes/aqua_admin_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_magma_admin_front_pic:: @ 8E58C44
	.incbin "graphics/trainers/front_pics/magma_admin_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_magma_admin:: @ 8E5901C
	.incbin "graphics/trainers/palettes/magma_admin.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_ruby_magma_admin_f_front_pic:: @ 8E59044
	.incbin "graphics/trainers/front_pics/ruby_magma_admin_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_ruby_magma_admin_f:: @ 8E593F4
	.incbin "graphics/trainers/palettes/ruby_magma_admin_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_wattson_front_pic:: @ 8E5941C
	.incbin "graphics/trainers/front_pics/leader_wattson_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_wattson:: @ 8E59764
	.incbin "graphics/trainers/palettes/leader_wattson.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_flannery_front_pic:: @ 8E5978C
	.incbin "graphics/trainers/front_pics/leader_flannery_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_flannery:: @ 8E59B0C
	.incbin "graphics/trainers/palettes/leader_flannery.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_norman_front_pic:: @ 8E59B34
	.incbin "graphics/trainers/front_pics/leader_norman_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_norman:: @ 8E59E70
	.incbin "graphics/trainers/palettes/leader_norman.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_winona_front_pic:: @ 8E59E98
	.incbin "graphics/trainers/front_pics/leader_winona_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_winona:: @ 8E5A218
	.incbin "graphics/trainers/palettes/leader_winona.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_ruby_sapphire_champion_wallace_front_pic:: @ 8E5A240
	.incbin "graphics/trainers/front_pics/ruby_sapphire_champion_wallace_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_champion_wallace:: @ 8E5A5B8
	.incbin "graphics/trainers/palettes/champion_wallace.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_elite_four_glacia_front_pic:: @ 8E5A5E0
	.incbin "graphics/trainers/front_pics/elite_four_glacia_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_elite_four_glacia:: @ 8E5A964
	.incbin "graphics/trainers/palettes/elite_four_glacia.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_elite_four_drake_front_pic:: @ 8E5A98C
	.incbin "graphics/trainers/front_pics/elite_four_drake_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_elite_four_drake:: @ 8E5AD34
	.incbin "graphics/trainers/palettes/elite_four_drake.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_youngster_front_pic:: @ 8E5AD5C
	.incbin "graphics/trainers/front_pics/youngster_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_youngster:: @ 8E5AFFC
	.incbin "graphics/trainers/palettes/youngster.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_bug_catcher_front_pic:: @ 8E5B024
	.incbin "graphics/trainers/front_pics/bug_catcher_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_bug_catcher:: @ 8E5B36C
	.incbin "graphics/trainers/palettes/bug_catcher.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_lass_front_pic:: @ 8E5B394
	.incbin "graphics/trainers/front_pics/lass_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_lass:: @ 8E5B680
	.incbin "graphics/trainers/palettes/lass.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_sailor_front_pic:: @ 8E5B6A8
	.incbin "graphics/trainers/front_pics/sailor_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_sailor:: @ 8E5B9C8
	.incbin "graphics/trainers/palettes/sailor.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_camper_front_pic:: @ 8E5B9F0
	.incbin "graphics/trainers/front_pics/camper_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_camper:: @ 8E5BCD0
	.incbin "graphics/trainers/palettes/camper.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_picnicker_front_pic:: @ 8E5BCF8
	.incbin "graphics/trainers/front_pics/picnicker_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_picnicker:: @ 8E5BFE0
	.incbin "graphics/trainers/palettes/picnicker.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_pokemaniac_front_pic:: @ 8E5C008
	.incbin "graphics/trainers/front_pics/pokemaniac_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_pokemaniac:: @ 8E5C3C4
	.incbin "graphics/trainers/palettes/pokemaniac.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_super_nerd_front_pic:: @ 8E5C3EC
	.incbin "graphics/trainers/front_pics/super_nerd_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_super_nerd:: @ 8E5C704
	.incbin "graphics/trainers/palettes/super_nerd.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_hiker_front_pic:: @ 8E5C72C
	.incbin "graphics/trainers/front_pics/hiker_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_hiker:: @ 8E5CB9C
	.incbin "graphics/trainers/palettes/hiker.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_biker_front_pic:: @ 8E5CBC4
	.incbin "graphics/trainers/front_pics/biker_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_biker:: @ 8E5D12C
	.incbin "graphics/trainers/palettes/biker.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_burglar_front_pic:: @ 8E5D154
	.incbin "graphics/trainers/front_pics/burglar_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_burglar:: @ 8E5D4A0
	.incbin "graphics/trainers/palettes/burglar.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_engineer_front_pic:: @ 8E5D4C8
	.incbin "graphics/trainers/front_pics/engineer_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_engineer:: @ 8E5D8D4
	.incbin "graphics/trainers/palettes/engineer.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_fisherman_front_pic:: @ 8E5D8FC
	.incbin "graphics/trainers/front_pics/fisherman_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_fisherman:: @ 8E5DCA8
	.incbin "graphics/trainers/palettes/fisherman.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_swimmer_m_front_pic:: @ 8E5DCD0
	.incbin "graphics/trainers/front_pics/swimmer_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_swimmer_m:: @ 8E5DFA8
	.incbin "graphics/trainers/palettes/swimmer_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_roughneck_front_pic:: @ 8E5DFD0
	.incbin "graphics/trainers/front_pics/roughneck_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_roughneck:: @ 8E5E598
	.incbin "graphics/trainers/palettes/roughneck.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_gamer_front_pic:: @ 8E5E5C0
	.incbin "graphics/trainers/front_pics/gamer_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_gamer:: @ 8E5E954
	.incbin "graphics/trainers/palettes/gamer.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_beauty_front_pic:: @ 8E5E97C
	.incbin "graphics/trainers/front_pics/beauty_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_beauty:: @ 8E5ECD8
	.incbin "graphics/trainers/palettes/beauty.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_swimmer_f_front_pic:: @ 8E5ED00
	.incbin "graphics/trainers/front_pics/swimmer_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_swimmer_f:: @ 8E5EFEC
	.incbin "graphics/trainers/palettes/swimmer_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_psychic_m_front_pic:: @ 8E5F014
	.incbin "graphics/trainers/front_pics/psychic_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_psychic_m:: @ 8E5F374
	.incbin "graphics/trainers/palettes/psychic_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_rocker_front_pic:: @ 8E5F39C
	.incbin "graphics/trainers/front_pics/rocker_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_rocker:: @ 8E5F7F8
	.incbin "graphics/trainers/palettes/rocker.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_juggler_front_pic:: @ 8E5F820
	.incbin "graphics/trainers/front_pics/juggler_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_juggler:: @ 8E5FC5C
	.incbin "graphics/trainers/palettes/juggler.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_tamer_front_pic:: @ 8E5FC84
	.incbin "graphics/trainers/front_pics/tamer_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_tamer:: @ 8E60038
	.incbin "graphics/trainers/palettes/tamer.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_bird_keeper_front_pic:: @ 8E60060
	.incbin "graphics/trainers/front_pics/bird_keeper_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_bird_keeper:: @ 8E60424
	.incbin "graphics/trainers/palettes/bird_keeper.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_black_belt_front_pic:: @ 8E6044C
	.incbin "graphics/trainers/front_pics/black_belt_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_black_belt:: @ 8E6086C
	.incbin "graphics/trainers/palettes/black_belt.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_blue_1_front_pic:: @ 8E60894
	.incbin "graphics/trainers/front_pics/blue_1_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_blue_1:: @ 8E60B4C
	.incbin "graphics/trainers/palettes/blue_1.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_scientist_front_pic:: @ 8E60B74
	.incbin "graphics/trainers/front_pics/scientist_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_scientist:: @ 8E60F50
	.incbin "graphics/trainers/palettes/scientist.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_giovanni_front_pic:: @ 8E60F78
	.incbin "graphics/trainers/front_pics/giovanni_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_giovanni:: @ 8E61288
	.incbin "graphics/trainers/palettes/giovanni.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_rocket_grunt_m_front_pic:: @ 8E612B0
	.incbin "graphics/trainers/front_pics/rocket_grunt_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_rocket_grunt_m:: @ 8E615E4
	.incbin "graphics/trainers/palettes/rocket_grunt_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_cool_trainer_m_front_pic:: @ 8E6160C
	.incbin "graphics/trainers/front_pics/cool_trainer_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_cool_trainer_m:: @ 8E618DC
	.incbin "graphics/trainers/palettes/cool_trainer_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_cool_trainer_f_front_pic:: @ 8E61904
	.incbin "graphics/trainers/front_pics/cool_trainer_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_cool_trainer_f:: @ 8E61C1C
	.incbin "graphics/trainers/palettes/cool_trainer_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_elite_four_lorelei_front_pic:: @ 8E61C44
	.incbin "graphics/trainers/front_pics/elite_four_lorelei_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_elite_four_lorelei:: @ 8E61F70
	.incbin "graphics/trainers/palettes/elite_four_lorelei.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_elite_four_bruno_front_pic:: @ 8E61F98
	.incbin "graphics/trainers/front_pics/elite_four_bruno_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_elite_four_bruno:: @ 8E623E4
	.incbin "graphics/trainers/palettes/elite_four_bruno.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_elite_four_agatha_front_pic:: @ 8E6240C
	.incbin "graphics/trainers/front_pics/elite_four_agatha_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_elite_four_agatha:: @ 8E62728
	.incbin "graphics/trainers/palettes/elite_four_agatha.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_elite_four_lance_front_pic:: @ 8E62750
	.incbin "graphics/trainers/front_pics/elite_four_lance_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_elite_four_lance:: @ 8E62B18
	.incbin "graphics/trainers/palettes/elite_four_lance.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_brock_front_pic:: @ 8E62B40
	.incbin "graphics/trainers/front_pics/leader_brock_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_brock:: @ 8E62E8C
	.incbin "graphics/trainers/palettes/leader_brock.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_misty_front_pic:: @ 8E62EB4
	.incbin "graphics/trainers/front_pics/leader_misty_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_misty:: @ 8E631B4
	.incbin "graphics/trainers/palettes/leader_misty.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_lt_surge_front_pic:: @ 8E631DC
	.incbin "graphics/trainers/front_pics/leader_lt_surge_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_lt_surge:: @ 8E6356C
	.incbin "graphics/trainers/palettes/leader_lt_surge.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_erika_front_pic:: @ 8E63594
	.incbin "graphics/trainers/front_pics/leader_erika_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_erika:: @ 8E63888
	.incbin "graphics/trainers/palettes/leader_erika.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_koga_front_pic:: @ 8E638B0
	.incbin "graphics/trainers/front_pics/leader_koga_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_koga:: @ 8E63C18
	.incbin "graphics/trainers/palettes/leader_koga.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_blaine_front_pic:: @ 8E63C40
	.incbin "graphics/trainers/front_pics/leader_blaine_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_blaine:: @ 8E6404C
	.incbin "graphics/trainers/palettes/leader_blaine.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leader_sabrina_front_pic:: @ 8E64074
	.incbin "graphics/trainers/front_pics/leader_sabrina_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leader_sabrina:: @ 8E6437C
	.incbin "graphics/trainers/palettes/leader_sabrina.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_gentleman_front_pic:: @ 8E643A4
	.incbin "graphics/trainers/front_pics/gentleman_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_gentleman:: @ 8E646DC
	.incbin "graphics/trainers/palettes/gentleman.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_blue_2_front_pic:: @ 8E64704
	.incbin "graphics/trainers/front_pics/blue_2_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_blue_2:: @ 8E649F8
	.incbin "graphics/trainers/palettes/blue_2.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_champion_blue_front_pic:: @ 8E64A20
	.incbin "graphics/trainers/front_pics/champion_blue_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_champion_blue:: @ 8E64D1C
	.incbin "graphics/trainers/palettes/champion_blue.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_channeler_front_pic:: @ 8E64D44
	.incbin "graphics/trainers/front_pics/channeler_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_channeler:: @ 8E6511C
	.incbin "graphics/trainers/palettes/channeler.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_twins_front_pic:: @ 8E65144
	.incbin "graphics/trainers/front_pics/twins_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_twins:: @ 8E65494
	.incbin "graphics/trainers/palettes/twins.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_cool_couple_front_pic:: @ 8E654BC
	.incbin "graphics/trainers/front_pics/cool_couple_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_cool_couple:: @ 8E6599C
	.incbin "graphics/trainers/palettes/cool_couple.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_young_couple_front_pic:: @ 8E659C4
	.incbin "graphics/trainers/front_pics/young_couple_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_young_couple:: @ 8E65E10
	.incbin "graphics/trainers/palettes/young_couple.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_crush_kin_front_pic:: @ 8E65E38
	.incbin "graphics/trainers/front_pics/crush_kin_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_crush_kin:: @ 8E663D8
	.incbin "graphics/trainers/palettes/crush_kin.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_sis_and_bro_front_pic:: @ 8E66400
	.incbin "graphics/trainers/front_pics/sis_and_bro_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_sis_and_bro:: @ 8E66860
	.incbin "graphics/trainers/palettes/sis_and_bro.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_oak_front_pic:: @ 8E66888
	.incbin "graphics/trainers/front_pics/oak_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_oak:: @ 8E66BF4
	.incbin "graphics/trainers/palettes/oak.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_ruby_sapphire_brendan_front_pic2:: @ 8E66C1C
	.incbin "graphics/trainers/front_pics/ruby_sapphire_brendan_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_ruby_sapphire_brendan2:: @ 8E66F30
	.incbin "graphics/trainers/palettes/ruby_sapphire_brendan.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_ruby_sapphire_may_front_pic2:: @ 8E66F58
	.incbin "graphics/trainers/front_pics/ruby_sapphire_may_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_ruby_sapphire_may2:: @ 8E67258
	.incbin "graphics/trainers/palettes/ruby_sapphire_may.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_red_front_pic:: @ 8E67280
	.incbin "graphics/trainers/front_pics/red_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_red:: @ 8E6758C
	.incbin "graphics/trainers/palettes/red.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_leaf_front_pic:: @ 8E675B4
	.incbin "graphics/trainers/front_pics/leaf_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_leaf:: @ 8E678F0
	.incbin "graphics/trainers/palettes/leaf.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_rocket_grunt_f_front_pic:: @ 8E67918
	.incbin "graphics/trainers/front_pics/rocket_grunt_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_rocket_grunt_f:: @ 8E67C30
	.incbin "graphics/trainers/palettes/rocket_grunt_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_psychic_f_front_pic:: @ 8E67C58
	.incbin "graphics/trainers/front_pics/psychic_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_psychic_f:: @ 8E67FF8
	.incbin "graphics/trainers/palettes/psychic_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_crush_girl_front_pic:: @ 8E68020
	.incbin "graphics/trainers/front_pics/crush_girl_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_crush_girl:: @ 8E6832C
	.incbin "graphics/trainers/palettes/crush_girl.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_tuber_front_pic:: @ 8E68354
	.incbin "graphics/trainers/front_pics/tuber_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_tuber:: @ 8E68658
	.incbin "graphics/trainers/palettes/tuber.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_pokemon_breeder_front_pic:: @ 8E68680
	.incbin "graphics/trainers/front_pics/pokemon_breeder_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_pokemon_breeder:: @ 8E689C0
	.incbin "graphics/trainers/palettes/pokemon_breeder.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_pokemon_ranger_m_front_pic:: @ 8E689E8
	.incbin "graphics/trainers/front_pics/pokemon_ranger_m_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_pokemon_ranger_m:: @ 8E68D48
	.incbin "graphics/trainers/palettes/pokemon_ranger_m.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_pokemon_ranger_f_front_pic:: @ 8E68D70
	.incbin "graphics/trainers/front_pics/pokemon_ranger_f_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_pokemon_ranger_f:: @ 8E690A4
	.incbin "graphics/trainers/palettes/pokemon_ranger_f.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_aroma_lady_front_pic:: @ 8E690CC
	.incbin "graphics/trainers/front_pics/aroma_lady_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_aroma_lady:: @ 8E6941C
	.incbin "graphics/trainers/palettes/aroma_lady.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_ruin_maniac_front_pic:: @ 8E69444
	.incbin "graphics/trainers/front_pics/ruin_maniac_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_ruin_maniac:: @ 8E69850
	.incbin "graphics/trainers/palettes/ruin_maniac.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_lady_front_pic:: @ 8E69878
	.incbin "graphics/trainers/front_pics/lady_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_lady:: @ 8E69BA0
	.incbin "graphics/trainers/palettes/lady.gbapal.lz"

	.align 2
gFile_graphics_trainers_front_pics_painter_front_pic:: @ 8E69BC8
	.incbin "graphics/trainers/front_pics/painter_front_pic.4bpp.lz"

	.align 2
gFile_graphics_trainers_palettes_painter:: @ 8E69E94
	.incbin "graphics/trainers/palettes/painter.gbapal.lz"

	.align 2
gFile_graphics_trainers_back_pics_red_back_pic:: @ 8E69EBC
	.incbin "graphics/trainers/back_pics/red_back_pic.4bpp"

	.align 2
gFile_graphics_trainers_back_pics_leaf_back_pic:: @ 8E6C6BC
	.incbin "graphics/trainers/back_pics/leaf_back_pic.4bpp"

	.align 2
gFile_graphics_trainers_back_pics_pokedude_back_pic:: @ 8E6EEBC
	.incbin "graphics/trainers/back_pics/pokedude_back_pic.4bpp"

	.align 2
gFile_graphics_trainers_back_pics_old_man_back_pic:: @ 8E70EBC
	.incbin "graphics/trainers/back_pics/old_man_back_pic.4bpp"

	.align 2
gFile_graphics_trainers_back_pics_ruby_sapphire_brendan_back_pic:: @ 8E72EBC
	.incbin "graphics/trainers/back_pics/ruby_sapphire_brendan_back_pic.4bpp"

	.align 2
gFile_graphics_trainers_back_pics_ruby_sapphire_may_back_pic:: @ 8E74EBC
	.incbin "graphics/trainers/back_pics/ruby_sapphire_may_back_pic.4bpp"

	.align 2
gFile_graphics_trainers_palettes_leaf_back_pic:: @ 8E76EBC
	.incbin "graphics/trainers/palettes/leaf_back_pic.gbapal.lz"

	.align 2
gFile_graphics_trainers_palettes_red_back_pic:: @ 8E76EE4
	.incbin "graphics/trainers/palettes/red_back_pic.gbapal.lz"

	.align 2
gFile_graphics_trainers_palettes_pokedude_back_pic:: @ 8E76F0C
	.incbin "graphics/trainers/palettes/pokedude_back_pic.gbapal.lz"

	.align 2
gFile_graphics_trainers_palettes_old_man_back_pic:: @ 8E76F34
	.incbin "graphics/trainers/palettes/old_man_back_pic.gbapal.lz"

	.align 2
gFile_graphics_pokemon_icons_question_mark_icon:: @ 8E76F5C
	.incbin "graphics/pokemon/question_mark/icon.4bpp"

	.align 2
gFile_graphics_pokemon_footprints_question_mark_footprint:: @ 8E7735C
	.incbin "graphics/pokemon/question_mark/footprint.1bpp"

	.align 2
gFile_graphics_battle_transitions_vs_frame_sheet:: @ 8E7737C
	.incbin "graphics/battle_transitions/vs_frame.4bpp.lz"

	.align 2
gFile_graphics_battle_transitions_vs_frame_tilemap:: @ 8E77464
	.incbin "graphics/battle_transitions/vs_frame.bin.lz"

	.align 2
gFile_graphics_battle_transitions_vs_frame_palette:: @ 8E77570
	.incbin "graphics/battle_transitions/vs_frame.gbapal.lz"

	.align 2
gFile_graphics_battle_transitions_vs_sheet:: @ 8E77598
	.incbin "graphics/battle_transitions/vs.4bpp.lz" @from ruby

	.align 2
gFile_graphics_battle_terrain_plain_palette_palette:: @ 8E777A8
	.incbin "graphics/battle_terrain/plain/palette.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_building_tiles_sheet:: @ 8E777E4
	.incbin "graphics/battle_terrain/building/tiles.4bpp.lz"

	.align 2
gFile_graphics_battle_terrain_stadium_battle_frontier_palette:: @ 8E77D90
	.incbin "graphics/battle_terrain/stadium/battle_frontier.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_building_map_tilemap:: @ 8E77DCC
	.incbin "graphics/battle_terrain/building/map.bin.lz"

	.align 2
gFile_graphics_battle_terrain_stadium_tiles_sheet:: @ 8E7807C
	.incbin "graphics/battle_terrain/stadium/tiles.4bpp.lz"

	.align 2
gFile_graphics_battle_terrain_stadium_map_tilemap:: @ 8E78684
	.incbin "graphics/battle_terrain/stadium/map.bin.lz"

	.align 2
gFile_graphics_battle_terrain_building_palette_palette:: @ 8E78934
	.incbin "graphics/battle_terrain/building/palette.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_water_kyogre_palette:: @ 8E78974
	.incbin "graphics/battle_terrain/water/kyogre.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_cave_groudon_palette:: @ 8E789B0
	.incbin "graphics/battle_terrain/cave/groudon.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_building_palette2_palette:: @ 8E78A08
	.incbin "graphics/battle_terrain/building/palette2.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_building_palette3_palette:: @ 8E78A44
	.incbin "graphics/battle_terrain/building/palette3.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_stadium_palette1_palette:: @ 8E78A80
	.incbin "graphics/battle_terrain/stadium/palette1.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_stadium_palette2_palette:: @ 8E78AE0
	.incbin "graphics/battle_terrain/stadium/palette2.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_stadium_palette3_palette:: @ 8E78B4C
	.incbin "graphics/battle_terrain/stadium/palette3.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_stadium_palette4_palette:: @ 8E78B9C
	.incbin "graphics/battle_terrain/stadium/palette4.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_stadium_palette5_palette:: @ 8E78BE4
	.incbin "graphics/battle_terrain/stadium/palette5.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_stadium_palette6_palette:: @ 8E78C28
	.incbin "graphics/battle_terrain/stadium/palette6.gbapal.lz"

	.align 2
gFile_graphics_battle_terrain_stadium_palette7_palette:: @ 8E78C78
	.incbin "graphics/battle_terrain/stadium/palette7.gbapal.lz" @from ruby

	.align 2
gFile_graphics_battle_terrain_building_anim_tiles_sheet:: @ 8E78CB4
	.incbin "graphics/battle_terrain/building/anim_tiles.4bpp.lz"

	.align 2
gFile_graphics_battle_terrain_building_anim_map_tilemap:: @ 8E790C4
	.incbin "graphics/battle_terrain/building/anim_map.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_261_sheet:: @ 8E791E8
	.incbin "graphics/battle_anims/sprites/261.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_sandstorm_brew_tilemap:: @ 8E79354
	.incbin "graphics/battle_anims/backgrounds/sandstorm_brew.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_sandstorm_brew_sheet:: @ 8E794D0
	.incbin "graphics/battle_anims/backgrounds/sandstorm_brew.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_261_palette:: @ 8E799FC
	.incbin "graphics/battle_anims/sprites/261.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_260_sheet:: @ 8E79A24
	.incbin "graphics/battle_anims/sprites/260.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_260_palette:: @ 8E79BE0
	.incbin "graphics/battle_anims/sprites/260.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_15_sheet:: @ 8E79BF8
	.incbin "graphics/battle_anims/backgrounds/15.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_15_palette:: @ 8E7A568
	.incbin "graphics/battle_anims/backgrounds/15.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_15_tilemap:: @ 8E7A58C
	.incbin "graphics/battle_anims/backgrounds/15.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_262_sheet:: @ 8E7A784
	.incbin "graphics/battle_anims/sprites/262.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_262_palette:: @ 8E7A858
	.incbin "graphics/battle_anims/sprites/262.gbapal.lz"

	.align 2
gUnknown_8E7A880:: @ 8E7A880
	.incbin "baserom.gba", 0xE7A880, 0x5C

	.align 2
gFile_graphics_contest_nextturn_numbers:: @ 8E7A8DC
	.incbin "graphics/contest/nextturn_numbers.4bpp"

	.align 2
gFile_graphics_contest_nextturn_random:: @ 8E7A95C
	.incbin "graphics/contest/nextturn_random.4bpp"

	.align 2
gFile_graphics_battle_anims_sprites_264_sheet:: @ 8E7A97C
	.incbin "graphics/battle_anims/sprites/264.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_264_palette:: @ 8E7A99C
	.incbin "graphics/battle_anims/sprites/264.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_265_palette:: @ 8E7A9B4
	.incbin "graphics/battle_anims/sprites/265.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_067_palette:: @ 8E7A9CC
	.incbin "graphics/battle_anims/sprites/067.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_068_palette:: @ 8E7A9EC
	.incbin "graphics/battle_anims/sprites/068.gbapal.lz"

	.align 2
gUnknown_8E7AA0C:: @ 8E7AA0C
	.incbin "baserom.gba", 0xE7AA0C, 0x12C
	
	.align 2
gFile_graphics_contest_applause_meter:: @ 8E7AB38
	.incbin "graphics/contest/applause_meter.4bpp"

	.align 2
gFile_graphics_contest_nextturn:: @ 8E7ABB8
	.incbin "graphics/contest/nextturn.gbapal"

	.align 2
gFile_graphics_battle_anims_sprites_272_sheet:: @ 8E7ABD8
	.incbin "graphics/battle_anims/sprites/272.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_272_palette:: @ 8E7ADF4
	.incbin "graphics/battle_anims/sprites/272.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_273_sheet:: @ 8E7AE18
	.incbin "graphics/battle_anims/sprites/273.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_269_sheet:: @ 8E7AE40
	.incbin "graphics/battle_anims/sprites/269.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_269_palette:: @ 8E7AE94
	.incbin "graphics/battle_anims/sprites/269.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_274_sheet:: @ 8E7AEAC
	.incbin "graphics/battle_anims/sprites/274.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_275_sheet:: @ 8E7B02C
	.incbin "graphics/battle_anims/sprites/275.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_276_sheet:: @ 8E7B198
	.incbin "graphics/battle_anims/sprites/276.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_274_palette:: @ 8E7B300
	.incbin "graphics/battle_anims/sprites/274.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_17_sheet:: @ 8E7B328
	.incbin "graphics/battle_anims/backgrounds/17.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_17_palette:: @ 8E7B484
	.incbin "graphics/battle_anims/backgrounds/17.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_17_tilemap:: @ 8E7B4AC
	.incbin "graphics/battle_anims/backgrounds/17.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_280_sheet:: @ 8E7B694
	.incbin "graphics/battle_anims/sprites/280.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_280_palette:: @ 8E7BA90
	.incbin "graphics/battle_anims/sprites/280.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_water_muddy_palette:: @ 8E7BAB0
	.incbin "graphics/battle_anims/backgrounds/water_muddy.gbapal.lz"

	.align 2
gFile_graphics_battle_interface_enemy_mon_shadow_sheet:: @ 8E7BAD4
	.incbin "graphics/battle_interface/enemy_mon_shadow.4bpp.lz"

	.align 2
gFile_graphics_battle_interface_ball_status_bar_sheet:: @ 8E7BB04
	.incbin "graphics/battle_interface/ball_status_bar.4bpp.lz"
	
	.align 2
gUnknown_8E7BBB8:: @ 8E7BB88
	.incbin "baserom.gba", 0xE7BB88, 0x400 @UNKNOWN

	.align 2
gFile_graphics_battle_anims_backgrounds_02_sheet:: @ 8E7BF88
	.incbin "graphics/battle_anims/backgrounds/02.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_02_palette:: @ 8E7CC50
	.incbin "graphics/battle_anims/backgrounds/02.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_02_tilemap:: @ 8E7CC6C
	.incbin "graphics/battle_anims/backgrounds/02.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_287_palette:: @ 8E7CF60
	.incbin "graphics/battle_anims/sprites/287.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_24_palette:: @ 8E7CF88
	.incbin "graphics/battle_anims/backgrounds/24.gbapal.lz"

	.align 2
gFile_graphics_unknown_unknown_E7CFB0_tilemap:: @ 8E7CFB0
	.incbin "graphics/unknown/unknown_E7CFB0.bin.lz"

	.align 2
gFile_graphics_berry_blender_center_sheet:: @ 8E7D4AC
	.incbin "graphics/berry_blender/center.8bpp.lz"

	.align 2
gFile_graphics_berry_blender_outer_sheet:: @ 8E7DCCC
	.incbin "graphics/berry_blender/outer.4bpp.lz"

	.align 2
gFile_graphics_berry_blender_outer_map_tilemap:: @ 8E7E700
	.incbin "graphics/berry_blender/outer_map.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_16_palette:: @ 8E7EA14
	.incbin "graphics/battle_anims/backgrounds/16.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_16_sheet:: @ 8E7EA3C
	.incbin "graphics/battle_anims/backgrounds/16.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_16_tilemap:: @ 8E7EC9C
	.incbin "graphics/battle_anims/backgrounds/16.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_277_palette:: @ 8E7EDD8
	.incbin "graphics/battle_anims/sprites/277.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_277_sheet:: @ 8E7EE00
	.incbin "graphics/battle_anims/sprites/277.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_fog_tilemap:: @ 8E7F1F4
	.incbin "graphics/battle_anims/backgrounds/fog.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_283_palette:: @ 8E7F36C
	.incbin "graphics/battle_anims/sprites/283.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_283_sheet:: @ 8E7F388
	.incbin "graphics/battle_anims/sprites/283.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_scary_face_player_tilemap:: @ 8E7F4AC
	.incbin "graphics/battle_anims/backgrounds/scary_face_player.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_scary_face_opponent_tilemap:: @ 8E7F690
	.incbin "graphics/battle_anims/backgrounds/scary_face_opponent.bin.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_scary_face_contest_tilemap:: @ 8E7F874
	.incbin "graphics/battle_anims/backgrounds/scary_face_contest.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_263_sheet:: @ 8E7FA58
	.incbin "graphics/battle_anims/sprites/263.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_263_palette:: @ 8E7FA98
	.incbin "graphics/battle_anims/sprites/263.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_266_sheet:: @ 8E7FAB0
	.incbin "graphics/battle_anims/sprites/266.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_266_palette:: @ 8E7FAF0
	.incbin "graphics/battle_anims/sprites/266.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_267_palette:: @ 8E7FB08
	.incbin "graphics/battle_anims/sprites/267.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_268_palette:: @ 8E7FB20
	.incbin "graphics/battle_anims/sprites/268.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_278_sheet:: @ 8E7FB38
	.incbin "graphics/battle_anims/sprites/278.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_278_palette:: @ 8E7FD44
	.incbin "graphics/battle_anims/sprites/278.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_279_sheet:: @ 8E7FD60
	.incbin "graphics/battle_anims/sprites/279.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_279_palette:: @ 8E7FDAC
	.incbin "graphics/battle_anims/sprites/279.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_281_sheet:: @ 8E7FDC8
	.incbin "graphics/battle_anims/sprites/281.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_281_palette:: @ 8E7FF50
	.incbin "graphics/battle_anims/sprites/281.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_21_sheet:: @ 8E7FF70
	.incbin "graphics/battle_anims/backgrounds/21.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_21_palette:: @ 8E80264
	.incbin "graphics/battle_anims/backgrounds/21.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_21_tilemap:: @ 8E80280
	.incbin "graphics/battle_anims/backgrounds/21.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_284_sheet:: @ 8E8056C
	.incbin "graphics/battle_anims/sprites/284.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_284_palette:: @ 8E808E8
	.incbin "graphics/battle_anims/sprites/284.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_285_sheet:: @ 8E80904
	.incbin "graphics/battle_anims/sprites/285.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_285_palette:: @ 8E809A4
	.incbin "graphics/battle_anims/sprites/285.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_water_sheet:: @ 8E809CC
	.incbin "graphics/battle_anims/backgrounds/water.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_backgrounds_water_palette:: @ 8E81CEC
	.incbin "graphics/battle_anims/backgrounds/water.gbapal.lz"

	.align 2
gFile_graphics_unknown_unknown_E81D14_tilemap:: @ 8E81D14
	.incbin "graphics/unknown/unknown_E81D14.bin.lz"

	.align 2
gFile_graphics_unknown_unknown_E81FE4_tilemap:: @ 8E81FE4
	.incbin "graphics/unknown/unknown_E81FE4.bin.lz"

	.align 2
gFile_graphics_unknown_unknown_E822B8_tilemap:: @ 8E822B8
	.incbin "graphics/unknown/unknown_E822B8.bin.lz"

	.align 2
gFile_graphics_battle_anims_sprites_286_palette:: @ 8E825AC
	.incbin "graphics/battle_anims/sprites/286.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_188_sheet:: @ 8E825D4
	.incbin "graphics/battle_anims/sprites/188.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_188_palette:: @ 8E826E8
	.incbin "graphics/battle_anims/sprites/188.gbapal.lz"

	.align 2
gFile_graphics_interface_party_menu_misc_sheet:: @ 8E82700
	.incbin "graphics/interface/party_menu_misc.4bpp.lz"

	.align 2
gUnknown_8E829C8:: @ 8E829C8
	.incbin "baserom.gba", 0xE829C8, 0xE8

	.align 2
gFile_graphics_interface_party_menu_misc_tilemap:: @ 8E82AB0
	.incbin "graphics/interface/party_menu_misc.bin.lz"

	.align 2
gFile_graphics_interface_party_menu_pokeball_sheet:: @ 8E82BE8
	.incbin "graphics/interface/party_menu_pokeball.4bpp.lz"

	.align 2
gFile_graphics_interface_party_menu_pokeball_small_sheet:: @ 8E82D68
	.incbin "graphics/interface/party_menu_pokeball_small.4bpp.lz"

	.align 2
gFile_graphics_interface_party_menu_pokeball_palette:: @ 8E82E7C
	.incbin "graphics/interface/party_menu_pokeball.gbapal.lz"

	.align 2
gUnknown_8E82EA0:: @ 8E82EA0
	.incbin "baserom.gba", 0xE82EA0, 0x204

	.align 2
gFile_graphics_interface_status_icons_palette:: @ 8E830A4
	.incbin "graphics/interface/status_icons.gbapal.lz"

	.align 2
gUnknown_8E830CC:: @ 8E830CC
	.incbin "baserom.gba", 0xE830CC, 0x1F4

gUnknown_8E832C0:: @ 8E832C0
	.incbin "baserom.gba", 0xE832C0, 0x184

gUnknown_8E83444:: @ 8E83444
	.incbin "baserom.gba", 0xE83444, 0x170

gUnknown_8E835B4:: @ 8E835B4
	.incbin "baserom.gba", 0xE835B4, 0x50

gUnknown_8E83604:: @ 8E83604
	.incbin "baserom.gba", 0xE83604, 0x28

gUnknown_8E8362C:: @ 8E8362C
	.incbin "baserom.gba", 0xE8362C, 0x790

gUnknown_8E83DBC:: @ 8E83DBC
	.incbin "baserom.gba", 0xE83DBC, 0x7A4

gUnknown_8E84560:: @ 8E84560
	.incbin "baserom.gba", 0xE84560, 0x28
	
	.align 2
gFile_graphics_interface_bag_swap_sheet:: @ 8E84588
	.incbin "graphics/interface/bag_swap.4bpp.lz"

	.align 2
gFile_graphics_interface_bag_swap_palette:: @ 8E845C8
	.incbin "graphics/interface/bag_swap.gbapal.lz"

	.align 2
gUnknown_8E845D8:: @ 8E845D8
	.incbin "graphics/tm_case/unk_8E845D8.4bpp.lz"

gUnknown_8E84A24:: @ 8E84A24
	.incbin "graphics/tm_case/unk_8E84A24.bin.lz"

gUnknown_8E84B70:: @ 8E84B70
	.incbin "graphics/tm_case/unk_8E84B70.bin.lz"

gUnknown_8E84CB0:: @ 8E84CB0
	.incbin "graphics/tm_case/unk_8E84CB0.gbapal.lz"

gUnknown_8E84D20:: @ 8E84D20
	.incbin "graphics/tm_case/unk_8E84D20.gbapal.lz"
	
gTMCase_TMSpriteGfx:: @ 8E84D90
	.incbin "graphics/tm_case/unk_8E84D90.4bpp.lz"

gUnknown_8E84F20:: @ 8E84F20
	.incbin "graphics/tm_case/unk_8E84F20.gbapal.lz"

gUnknown_8E85068:: @ 8E85068
	.incbin "graphics/tm_case/unk_8E85068.gbapal.lz"

gItemPcTiles:: @ 8E85090
	.incbin "graphics/item_pc/unk_8E85090.4bpp.lz"

gItemPcBgPals:: @ 8E85408
	.incbin "graphics/item_pc/unk_8E85408.gbapal.lz"

gItemPcTilemap:: @ 8E85458
	.incbin "graphics/item_pc/unk_8E85458.bin.lz"

gUnknown_8E8560C:: @ 8E8560C
	.incbin "baserom.gba", 0xE8560C, 0x3C4

gUnknown_8E859D0:: @ 8E859D0
	.incbin "baserom.gba", 0xE859D0, 0x1D4

gUnknown_8E85BA4:: @ 8E85BA4
	.incbin "baserom.gba", 0xE85BA4, 0x50

gUnknown_8E85BF4:: @ 8E85BF4
	.incbin "baserom.gba", 0xE85BF4, 0x28

gUnknown_8E85C1C:: @ 8E85C1C
	.incbin "baserom.gba", 0xE85C1C, 0x28

gUnknown_8E85C44:: @ 8E85C44
	.incbin "baserom.gba", 0xE85C44, 0x184

gUnknown_8E85DC8:: @ 8E85DC8
	.incbin "baserom.gba", 0xE85DC8, 0x134

gUnknown_8E85EFC:: @ 8E85EFC
	.incbin "baserom.gba", 0xE85EFC, 0x13C

gUnknown_8E86038:: @ 8E86038
	.incbin "baserom.gba", 0xE86038, 0x138

gUnknown_8E86170:: @ 8E86170
	.incbin "baserom.gba", 0xE86170, 0x38

gUnknown_8E861A8:: @ 8E861A8
	.incbin "baserom.gba", 0xE861A8, 0x98

gUnknown_8E86240:: @ 8E86240
	.incbin "graphics/teachy_tv/tiles.4bpp.lz"

gUnknown_8E86BE8:: @ 8E86BE8
	.incbin "graphics/teachy_tv/bg1_tilemap.bin.lz"

gUnknown_8E86D6C:: @ 8E86D6C
	.incbin "graphics/teachy_tv/bg2_tilemap.bin.lz"

gUnknown_8E86F98:: @ 8E86F98
	.incbin "graphics/teachy_tv/palettes.gbapal.lz"

gUnknown_8E87010:: @ 8E87010
	.incbin "baserom.gba", 0xE87010, 0x18
	
	@ THIS IS ITEM ICONS
	.align 2
gFile_graphics_items_icons_question_mark_sheet:: @ 8E87028
	.incbin "graphics/items/icons/question_mark.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_question_mark_palette:: @ 8E870A0
	.incbin "graphics/items/icon_palettes/question_mark.gbapal.lz"

	.align 2
gFile_graphics_items_icons_return_to_field_arrow_sheet:: @ 8E870B4
	.incbin "graphics/items/icons/return_to_field_arrow.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_return_to_field_arrow_palette:: @ 8E8713C
	.incbin "graphics/items/icon_palettes/return_to_field_arrow.gbapal.lz"

	.align 2
gFile_graphics_items_icons_master_ball_sheet:: @ 8E87154
	.incbin "graphics/items/icons/master_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_master_ball_palette:: @ 8E87224
	.incbin "graphics/items/icon_palettes/master_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_ultra_ball_sheet:: @ 8E8724C
	.incbin "graphics/items/icons/ultra_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_ultra_ball_palette:: @ 8E8730C
	.incbin "graphics/items/icon_palettes/ultra_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_great_ball_sheet:: @ 8E87334
	.incbin "graphics/items/icons/great_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_great_ball_palette:: @ 8E87404
	.incbin "graphics/items/icon_palettes/great_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_poke_ball_sheet:: @ 8E8742C
	.incbin "graphics/items/icons/poke_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_poke_ball_palette:: @ 8E874DC
	.incbin "graphics/items/icon_palettes/poke_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_safari_ball_sheet:: @ 8E87500
	.incbin "graphics/items/icons/safari_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_safari_ball_palette:: @ 8E875D0
	.incbin "graphics/items/icon_palettes/safari_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_net_ball_sheet:: @ 8E875F8
	.incbin "graphics/items/icons/net_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_net_ball_palette:: @ 8E876CC
	.incbin "graphics/items/icon_palettes/net_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_dive_ball_sheet:: @ 8E876F0
	.incbin "graphics/items/icons/dive_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_dive_ball_palette:: @ 8E877B8
	.incbin "graphics/items/icon_palettes/dive_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_nest_ball_sheet:: @ 8E877DC
	.incbin "graphics/items/icons/nest_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_nest_ball_palette:: @ 8E878A0
	.incbin "graphics/items/icon_palettes/nest_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_repeat_ball_sheet:: @ 8E878C8
	.incbin "graphics/items/icons/repeat_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_repeat_ball_palette:: @ 8E8798C
	.incbin "graphics/items/icon_palettes/repeat_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_timer_ball_sheet:: @ 8E879B4
	.incbin "graphics/items/icons/timer_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icons_luxury_ball_sheet:: @ 8E87A7C
	.incbin "graphics/items/icons/luxury_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_luxury_ball_palette:: @ 8E87B38
	.incbin "graphics/items/icon_palettes/luxury_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_premier_ball_sheet:: @ 8E87B60
	.incbin "graphics/items/icons/premier_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icons_potion_sheet:: @ 8E87C04
	.incbin "graphics/items/icons/potion.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_potion_palette:: @ 8E87CCC
	.incbin "graphics/items/icon_palettes/potion.gbapal.lz"

	.align 2
gFile_graphics_items_icons_antidote_sheet:: @ 8E87CF0
	.incbin "graphics/items/icons/antidote.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_antidote_palette:: @ 8E87DA0
	.incbin "graphics/items/icon_palettes/antidote.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_burn_heal_palette:: @ 8E87DC4
	.incbin "graphics/items/icon_palettes/burn_heal.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_ice_heal_palette:: @ 8E87DE8
	.incbin "graphics/items/icon_palettes/ice_heal.gbapal.lz"

	.align 2
gFile_graphics_items_icons_status_heal_sheet:: @ 8E87E0C
	.incbin "graphics/items/icons/status_heal.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_awakening_palette:: @ 8E87EBC
	.incbin "graphics/items/icon_palettes/awakening.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_paralyze_heal_palette:: @ 8E87EE0
	.incbin "graphics/items/icon_palettes/paralyze_heal.gbapal.lz"

	.align 2
gFile_graphics_items_icons_large_potion_sheet:: @ 8E87F04
	.incbin "graphics/items/icons/large_potion.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_full_restore_palette:: @ 8E87FE8
	.incbin "graphics/items/icon_palettes/full_restore.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_max_potion_palette:: @ 8E8800C
	.incbin "graphics/items/icon_palettes/max_potion.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_hyper_potion_palette:: @ 8E88030
	.incbin "graphics/items/icon_palettes/hyper_potion.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_super_potion_palette:: @ 8E88054
	.incbin "graphics/items/icon_palettes/super_potion.gbapal.lz"

	.align 2
gFile_graphics_items_icons_full_heal_sheet:: @ 8E88078
	.incbin "graphics/items/icons/full_heal.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_full_heal_palette:: @ 8E88120
	.incbin "graphics/items/icon_palettes/full_heal.gbapal.lz"

	.align 2
gFile_graphics_items_icons_revive_sheet:: @ 8E88148
	.incbin "graphics/items/icons/revive.4bpp.lz"

	.align 2
gFile_graphics_items_icons_max_revive_sheet:: @ 8E881A4
	.incbin "graphics/items/icons/max_revive.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_revive_palette:: @ 8E88270
	.incbin "graphics/items/icon_palettes/revive.gbapal.lz"

	.align 2
gFile_graphics_items_icons_fresh_water_sheet:: @ 8E8828C
	.incbin "graphics/items/icons/fresh_water.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_fresh_water_palette:: @ 8E8833C
	.incbin "graphics/items/icon_palettes/fresh_water.gbapal.lz"

	.align 2
gFile_graphics_items_icons_soda_pop_sheet:: @ 8E88360
	.incbin "graphics/items/icons/soda_pop.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_soda_pop_palette:: @ 8E883F4
	.incbin "graphics/items/icon_palettes/soda_pop.gbapal.lz"

	.align 2
gFile_graphics_items_icons_lemonade_sheet:: @ 8E8841C
	.incbin "graphics/items/icons/lemonade.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_lemonade_palette:: @ 8E884DC
	.incbin "graphics/items/icon_palettes/lemonade.gbapal.lz"

	.align 2
gFile_graphics_items_icons_moomoo_milk_sheet:: @ 8E88504
	.incbin "graphics/items/icons/moomoo_milk.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_moomoo_milk_palette:: @ 8E885B4
	.incbin "graphics/items/icon_palettes/moomoo_milk.gbapal.lz"

	.align 2
gFile_graphics_items_icons_powder_sheet:: @ 8E885DC
	.incbin "graphics/items/icons/powder.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_energy_powder_palette:: @ 8E88668
	.incbin "graphics/items/icon_palettes/energy_powder.gbapal.lz"

	.align 2
gFile_graphics_items_icons_energy_root_sheet:: @ 8E88688
	.incbin "graphics/items/icons/energy_root.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_energy_root_palette:: @ 8E88754
	.incbin "graphics/items/icon_palettes/energy_root.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_heal_powder_palette:: @ 8E88770
	.incbin "graphics/items/icon_palettes/heal_powder.gbapal.lz"

	.align 2
gFile_graphics_items_icons_revival_herb_sheet:: @ 8E88790
	.incbin "graphics/items/icons/revival_herb.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_revival_herb_palette:: @ 8E88860
	.incbin "graphics/items/icon_palettes/revival_herb.gbapal.lz"

	.align 2
gFile_graphics_items_icons_ether_sheet:: @ 8E88880
	.incbin "graphics/items/icons/ether.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_ether_palette:: @ 8E88940
	.incbin "graphics/items/icon_palettes/ether.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_max_ether_palette:: @ 8E88964
	.incbin "graphics/items/icon_palettes/max_ether.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_elixir_palette:: @ 8E88988
	.incbin "graphics/items/icon_palettes/elixir.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_max_elixir_palette:: @ 8E889AC
	.incbin "graphics/items/icon_palettes/max_elixir.gbapal.lz"

	.align 2
gFile_graphics_items_icons_lava_cookie_sheet:: @ 8E889D0
	.incbin "graphics/items/icons/lava_cookie.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_lava_cookie_and_letter_palette:: @ 8E88A9C
	.incbin "graphics/items/icon_palettes/lava_cookie_and_letter.gbapal.lz"

	.align 2
gFile_graphics_items_icons_flute_sheet:: @ 8E88AC0
	.incbin "graphics/items/icons/flute.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_blue_flute_palette:: @ 8E88B74
	.incbin "graphics/items/icon_palettes/blue_flute.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_yellow_flute_palette:: @ 8E88B98
	.incbin "graphics/items/icon_palettes/yellow_flute.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_red_flute_palette:: @ 8E88BBC
	.incbin "graphics/items/icon_palettes/red_flute.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_black_flute_palette:: @ 8E88BE0
	.incbin "graphics/items/icon_palettes/black_flute.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_white_flute_palette:: @ 8E88C04
	.incbin "graphics/items/icon_palettes/white_flute.gbapal.lz"

	.align 2
gFile_graphics_items_icons_berry_juice_sheet:: @ 8E88C28
	.incbin "graphics/items/icons/berry_juice.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_berry_juice_palette:: @ 8E88D08
	.incbin "graphics/items/icon_palettes/berry_juice.gbapal.lz"

	.align 2
gFile_graphics_items_icons_sacred_ash_sheet:: @ 8E88D30
	.incbin "graphics/items/icons/sacred_ash.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_sacred_ash_palette:: @ 8E88DF0
	.incbin "graphics/items/icon_palettes/sacred_ash.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_shoal_salt_palette:: @ 8E88E14
	.incbin "graphics/items/icon_palettes/shoal_salt.gbapal.lz"

	.align 2
gFile_graphics_items_icons_shoal_shell_sheet:: @ 8E88E34
	.incbin "graphics/items/icons/shoal_shell.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_shell_palette:: @ 8E88F28
	.incbin "graphics/items/icon_palettes/shell.gbapal.lz"

	.align 2
gFile_graphics_items_icons_shard_sheet:: @ 8E88F50
	.incbin "graphics/items/icons/shard.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_red_shard_palette:: @ 8E88FAC
	.incbin "graphics/items/icon_palettes/red_shard.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_blue_shard_palette:: @ 8E88FC4
	.incbin "graphics/items/icon_palettes/blue_shard.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_yellow_shard_palette:: @ 8E88FDC
	.incbin "graphics/items/icon_palettes/yellow_shard.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_green_shard_palette:: @ 8E88FF4
	.incbin "graphics/items/icon_palettes/green_shard.gbapal.lz"

	.align 2
gFile_graphics_items_icons_hp_up_sheet:: @ 8E8900C
	.incbin "graphics/items/icons/hp_up.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_hp_up_palette:: @ 8E890C4
	.incbin "graphics/items/icon_palettes/hp_up.gbapal.lz"

	.align 2
gFile_graphics_items_icons_vitamin_sheet:: @ 8E890EC
	.incbin "graphics/items/icons/vitamin.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_protein_palette:: @ 8E8919C
	.incbin "graphics/items/icon_palettes/protein.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_iron_palette:: @ 8E891C4
	.incbin "graphics/items/icon_palettes/iron.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_carbos_palette:: @ 8E891EC
	.incbin "graphics/items/icon_palettes/carbos.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_calcium_palette:: @ 8E89214
	.incbin "graphics/items/icon_palettes/calcium.gbapal.lz"

	.align 2
gFile_graphics_items_icons_rare_candy_sheet:: @ 8E8923C
	.incbin "graphics/items/icons/rare_candy.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_rare_candy_palette:: @ 8E89300
	.incbin "graphics/items/icon_palettes/rare_candy.gbapal.lz"

	.align 2
gFile_graphics_items_icons_pp_up_sheet:: @ 8E8931C
	.incbin "graphics/items/icons/pp_up.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_pp_up_palette:: @ 8E893CC
	.incbin "graphics/items/icon_palettes/pp_up.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_zinc_palette:: @ 8E893F4
	.incbin "graphics/items/icon_palettes/zinc.gbapal.lz"

	.align 2
gFile_graphics_items_icons_pp_max_sheet:: @ 8E8941C
	.incbin "graphics/items/icons/pp_max.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_pp_max_palette:: @ 8E894C4
	.incbin "graphics/items/icon_palettes/pp_max.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_guard_spec_palette:: @ 8E894EC
	.incbin "graphics/items/icon_palettes/guard_spec.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_dire_hit_palette:: @ 8E89510
	.incbin "graphics/items/icon_palettes/dire_hit.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_x_attack_palette:: @ 8E89534
	.incbin "graphics/items/icon_palettes/x_attack.gbapal.lz"

	.align 2
gFile_graphics_items_icons_battle_stat_item_sheet:: @ 8E89558
	.incbin "graphics/items/icons/battle_stat_item.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_x_defend_palette:: @ 8E8963C
	.incbin "graphics/items/icon_palettes/x_defend.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_x_speed_palette:: @ 8E89660
	.incbin "graphics/items/icon_palettes/x_speed.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_x_accuracy_palette:: @ 8E89684
	.incbin "graphics/items/icon_palettes/x_accuracy.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_x_special_palette:: @ 8E896A8
	.incbin "graphics/items/icon_palettes/x_special.gbapal.lz"

	.align 2
gFile_graphics_items_icons_poke_doll_sheet:: @ 8E896CC
	.incbin "graphics/items/icons/poke_doll.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_poke_doll_palette:: @ 8E897BC
	.incbin "graphics/items/icon_palettes/poke_doll.gbapal.lz"

	.align 2
gFile_graphics_items_icons_fluffy_tail_sheet:: @ 8E897D8
	.incbin "graphics/items/icons/fluffy_tail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_fluffy_tail_palette:: @ 8E898C8
	.incbin "graphics/items/icon_palettes/fluffy_tail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_repel_sheet:: @ 8E898EC
	.incbin "graphics/items/icons/repel.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_super_repel_palette:: @ 8E8998C
	.incbin "graphics/items/icon_palettes/super_repel.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_max_repel_palette:: @ 8E899B4
	.incbin "graphics/items/icon_palettes/max_repel.gbapal.lz"

	.align 2
gFile_graphics_items_icons_escape_rope_sheet:: @ 8E899DC
	.incbin "graphics/items/icons/escape_rope.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_escape_rope_palette:: @ 8E89A90
	.incbin "graphics/items/icon_palettes/escape_rope.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_repel_palette:: @ 8E89AB4
	.incbin "graphics/items/icon_palettes/repel.gbapal.lz"

	.align 2
gFile_graphics_items_icons_sun_stone_sheet:: @ 8E89ADC
	.incbin "graphics/items/icons/sun_stone.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_sun_stone_palette:: @ 8E89BD4
	.incbin "graphics/items/icon_palettes/sun_stone.gbapal.lz"

	.align 2
gFile_graphics_items_icons_moon_stone_sheet:: @ 8E89BF0
	.incbin "graphics/items/icons/moon_stone.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_moon_stone_palette:: @ 8E89CC4
	.incbin "graphics/items/icon_palettes/moon_stone.gbapal.lz"

	.align 2
gFile_graphics_items_icons_fire_stone_sheet:: @ 8E89CE4
	.incbin "graphics/items/icons/fire_stone.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_fire_stone_palette:: @ 8E89DD8
	.incbin "graphics/items/icon_palettes/fire_stone.gbapal.lz"

	.align 2
gFile_graphics_items_icons_thunder_stone_sheet:: @ 8E89E00
	.incbin "graphics/items/icons/thunder_stone.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_thunder_stone_palette:: @ 8E89EE8
	.incbin "graphics/items/icon_palettes/thunder_stone.gbapal.lz"

	.align 2
gFile_graphics_items_icons_water_stone_sheet:: @ 8E89F08
	.incbin "graphics/items/icons/water_stone.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_water_stone_palette:: @ 8E89FE8
	.incbin "graphics/items/icon_palettes/water_stone.gbapal.lz"

	.align 2
gFile_graphics_items_icons_leaf_stone_sheet:: @ 8E8A00C
	.incbin "graphics/items/icons/leaf_stone.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_leaf_stone_palette:: @ 8E8A100
	.incbin "graphics/items/icon_palettes/leaf_stone.gbapal.lz"

	.align 2
gFile_graphics_items_icons_tiny_mushroom_sheet:: @ 8E8A128
	.incbin "graphics/items/icons/tiny_mushroom.4bpp.lz"

	.align 2
gFile_graphics_items_icons_big_mushroom_sheet:: @ 8E8A1A8
	.incbin "graphics/items/icons/big_mushroom.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_mushroom_palette:: @ 8E8A260
	.incbin "graphics/items/icon_palettes/mushroom.gbapal.lz"

	.align 2
gFile_graphics_items_icons_pearl_sheet:: @ 8E8A284
	.incbin "graphics/items/icons/pearl.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_pearl_palette:: @ 8E8A300
	.incbin "graphics/items/icon_palettes/pearl.gbapal.lz"

	.align 2
gFile_graphics_items_icons_big_pearl_sheet:: @ 8E8A328
	.incbin "graphics/items/icons/big_pearl.4bpp.lz"

	.align 2
gFile_graphics_items_icons_stardust_sheet:: @ 8E8A3E0
	.incbin "graphics/items/icons/stardust.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_star_palette:: @ 8E8A4A0
	.incbin "graphics/items/icon_palettes/star.gbapal.lz"

	.align 2
gFile_graphics_items_icons_star_piece_sheet:: @ 8E8A4C4
	.incbin "graphics/items/icons/star_piece.4bpp.lz"

	.align 2
gFile_graphics_items_icons_nugget_sheet:: @ 8E8A548
	.incbin "graphics/items/icons/nugget.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_nugget_palette:: @ 8E8A5D4
	.incbin "graphics/items/icon_palettes/nugget.gbapal.lz"

	.align 2
gFile_graphics_items_icons_heart_scale_sheet:: @ 8E8A5F4
	.incbin "graphics/items/icons/heart_scale.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_heart_scale_palette:: @ 8E8A694
	.incbin "graphics/items/icon_palettes/heart_scale.gbapal.lz"

	.align 2
gFile_graphics_items_icons_orange_mail_sheet:: @ 8E8A6B0
	.incbin "graphics/items/icons/orange_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_orange_mail_palette:: @ 8E8A784
	.incbin "graphics/items/icon_palettes/orange_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_harbor_mail_sheet:: @ 8E8A7A4
	.incbin "graphics/items/icons/harbor_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_harbor_mail_palette:: @ 8E8A86C
	.incbin "graphics/items/icon_palettes/harbor_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_glitter_mail_sheet:: @ 8E8A88C
	.incbin "graphics/items/icons/glitter_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_glitter_mail_palette:: @ 8E8A968
	.incbin "graphics/items/icon_palettes/glitter_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_mech_mail_sheet:: @ 8E8A990
	.incbin "graphics/items/icons/mech_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_mech_mail_palette:: @ 8E8AA6C
	.incbin "graphics/items/icon_palettes/mech_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_wood_mail_sheet:: @ 8E8AA8C
	.incbin "graphics/items/icons/wood_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_wood_mail_palette:: @ 8E8AB6C
	.incbin "graphics/items/icon_palettes/wood_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_wave_mail_sheet:: @ 8E8AB8C
	.incbin "graphics/items/icons/wave_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_wave_mail_palette:: @ 8E8AC64
	.incbin "graphics/items/icon_palettes/wave_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_bead_mail_sheet:: @ 8E8AC84
	.incbin "graphics/items/icons/bead_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_bead_mail_palette:: @ 8E8AD44
	.incbin "graphics/items/icon_palettes/bead_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_shadow_mail_sheet:: @ 8E8AD64
	.incbin "graphics/items/icons/shadow_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_shadow_mail_palette:: @ 8E8AE38
	.incbin "graphics/items/icon_palettes/shadow_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_tropic_mail_sheet:: @ 8E8AE5C
	.incbin "graphics/items/icons/tropic_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_tropic_mail_palette:: @ 8E8AF40
	.incbin "graphics/items/icon_palettes/tropic_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_dream_mail_sheet:: @ 8E8AF64
	.incbin "graphics/items/icons/dream_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_dream_mail_palette:: @ 8E8B044
	.incbin "graphics/items/icon_palettes/dream_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_fab_mail_sheet:: @ 8E8B064
	.incbin "graphics/items/icons/fab_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_fab_mail_palette:: @ 8E8B12C
	.incbin "graphics/items/icon_palettes/fab_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_retro_mail_sheet:: @ 8E8B148
	.incbin "graphics/items/icons/retro_mail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_retro_mail_palette:: @ 8E8B1E0
	.incbin "graphics/items/icon_palettes/retro_mail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_cheri_berry_sheet:: @ 8E8B200
	.incbin "graphics/items/icons/cheri_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_cheri_berry_palette:: @ 8E8B2E8
	.incbin "graphics/items/icon_palettes/cheri_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_chesto_berry_sheet:: @ 8E8B310
	.incbin "graphics/items/icons/chesto_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_chesto_berry_palette:: @ 8E8B3D0
	.incbin "graphics/items/icon_palettes/chesto_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_pecha_berry_sheet:: @ 8E8B3F4
	.incbin "graphics/items/icons/pecha_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_pecha_berry_palette:: @ 8E8B4B4
	.incbin "graphics/items/icon_palettes/pecha_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_rawst_berry_sheet:: @ 8E8B4D8
	.incbin "graphics/items/icons/rawst_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_rawst_berry_palette:: @ 8E8B5BC
	.incbin "graphics/items/icon_palettes/rawst_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_aspear_berry_sheet:: @ 8E8B5E0
	.incbin "graphics/items/icons/aspear_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_aspear_berry_palette:: @ 8E8B6C8
	.incbin "graphics/items/icon_palettes/aspear_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_leppa_berry_sheet:: @ 8E8B6EC
	.incbin "graphics/items/icons/leppa_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_leppa_berry_palette:: @ 8E8B7A4
	.incbin "graphics/items/icon_palettes/leppa_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_oran_berry_sheet:: @ 8E8B7C8
	.incbin "graphics/items/icons/oran_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_oran_berry_palette:: @ 8E8B88C
	.incbin "graphics/items/icon_palettes/oran_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_persim_berry_sheet:: @ 8E8B8B0
	.incbin "graphics/items/icons/persim_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_persim_berry_palette:: @ 8E8B984
	.incbin "graphics/items/icon_palettes/persim_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_lum_berry_sheet:: @ 8E8B9A8
	.incbin "graphics/items/icons/lum_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_lum_berry_palette:: @ 8E8BA60
	.incbin "graphics/items/icon_palettes/lum_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_sitrus_berry_sheet:: @ 8E8BA7C
	.incbin "graphics/items/icons/sitrus_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_sitrus_berry_palette:: @ 8E8BB48
	.incbin "graphics/items/icon_palettes/sitrus_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_figy_berry_sheet:: @ 8E8BB6C
	.incbin "graphics/items/icons/figy_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_figy_berry_palette:: @ 8E8BC34
	.incbin "graphics/items/icon_palettes/figy_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_wiki_berry_sheet:: @ 8E8BC58
	.incbin "graphics/items/icons/wiki_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_wiki_berry_palette:: @ 8E8BD3C
	.incbin "graphics/items/icon_palettes/wiki_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_mago_berry_sheet:: @ 8E8BD60
	.incbin "graphics/items/icons/mago_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_mago_berry_palette:: @ 8E8BE1C
	.incbin "graphics/items/icon_palettes/mago_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_aguav_berry_sheet:: @ 8E8BE40
	.incbin "graphics/items/icons/aguav_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_aguav_berry_palette:: @ 8E8BF2C
	.incbin "graphics/items/icon_palettes/aguav_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_iapapa_berry_sheet:: @ 8E8BF4C
	.incbin "graphics/items/icons/iapapa_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_iapapa_berry_palette:: @ 8E8C034
	.incbin "graphics/items/icon_palettes/iapapa_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_razz_berry_sheet:: @ 8E8C058
	.incbin "graphics/items/icons/razz_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_razz_berry_palette:: @ 8E8C138
	.incbin "graphics/items/icon_palettes/razz_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_bluk_berry_sheet:: @ 8E8C15C
	.incbin "graphics/items/icons/bluk_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_bluk_berry_palette:: @ 8E8C24C
	.incbin "graphics/items/icon_palettes/bluk_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_nanab_berry_sheet:: @ 8E8C270
	.incbin "graphics/items/icons/nanab_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_nanab_berry_palette:: @ 8E8C354
	.incbin "graphics/items/icon_palettes/nanab_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_wepear_berry_sheet:: @ 8E8C378
	.incbin "graphics/items/icons/wepear_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_wepear_berry_palette:: @ 8E8C440
	.incbin "graphics/items/icon_palettes/wepear_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_pinap_berry_sheet:: @ 8E8C45C
	.incbin "graphics/items/icons/pinap_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_pinap_berry_palette:: @ 8E8C550
	.incbin "graphics/items/icon_palettes/pinap_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_pomeg_berry_sheet:: @ 8E8C574
	.incbin "graphics/items/icons/pomeg_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_pomeg_berry_palette:: @ 8E8C628
	.incbin "graphics/items/icon_palettes/pomeg_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_kelpsy_berry_sheet:: @ 8E8C64C
	.incbin "graphics/items/icons/kelpsy_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_kelpsy_berry_palette:: @ 8E8C71C
	.incbin "graphics/items/icon_palettes/kelpsy_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_qualot_berry_sheet:: @ 8E8C73C
	.incbin "graphics/items/icons/qualot_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_qualot_berry_palette:: @ 8E8C808
	.incbin "graphics/items/icon_palettes/qualot_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_hondew_berry_sheet:: @ 8E8C82C
	.incbin "graphics/items/icons/hondew_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_hondew_berry_palette:: @ 8E8C90C
	.incbin "graphics/items/icon_palettes/hondew_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_grepa_berry_sheet:: @ 8E8C930
	.incbin "graphics/items/icons/grepa_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_grepa_berry_palette:: @ 8E8C9E4
	.incbin "graphics/items/icon_palettes/grepa_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_tamato_berry_sheet:: @ 8E8CA08
	.incbin "graphics/items/icons/tamato_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_tamato_berry_palette:: @ 8E8CAE4
	.incbin "graphics/items/icon_palettes/tamato_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_cornn_berry_sheet:: @ 8E8CB08
	.incbin "graphics/items/icons/cornn_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_cornn_berry_palette:: @ 8E8CBF4
	.incbin "graphics/items/icon_palettes/cornn_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_magost_berry_sheet:: @ 8E8CC1C
	.incbin "graphics/items/icons/magost_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_magost_berry_palette:: @ 8E8CCC4
	.incbin "graphics/items/icon_palettes/magost_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_rabuta_berry_sheet:: @ 8E8CCE8
	.incbin "graphics/items/icons/rabuta_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_rabuta_berry_palette:: @ 8E8CDE4
	.incbin "graphics/items/icon_palettes/rabuta_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_nomel_berry_sheet:: @ 8E8CE08
	.incbin "graphics/items/icons/nomel_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_nomel_berry_palette:: @ 8E8CEAC
	.incbin "graphics/items/icon_palettes/nomel_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_spelon_berry_sheet:: @ 8E8CEC8
	.incbin "graphics/items/icons/spelon_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_spelon_berry_palette:: @ 8E8CF8C
	.incbin "graphics/items/icon_palettes/spelon_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_pamtre_berry_sheet:: @ 8E8CFAC
	.incbin "graphics/items/icons/pamtre_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_pamtre_berry_palette:: @ 8E8D08C
	.incbin "graphics/items/icon_palettes/pamtre_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_watmel_berry_sheet:: @ 8E8D0B4
	.incbin "graphics/items/icons/watmel_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_watmel_berry_palette:: @ 8E8D1C4
	.incbin "graphics/items/icon_palettes/watmel_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_durin_berry_sheet:: @ 8E8D1E8
	.incbin "graphics/items/icons/durin_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_durin_berry_palette:: @ 8E8D2EC
	.incbin "graphics/items/icon_palettes/durin_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_belue_berry_sheet:: @ 8E8D310
	.incbin "graphics/items/icons/belue_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_belue_berry_palette:: @ 8E8D3F4
	.incbin "graphics/items/icon_palettes/belue_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_liechi_berry_sheet:: @ 8E8D418
	.incbin "graphics/items/icons/liechi_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_liechi_berry_palette:: @ 8E8D4F8
	.incbin "graphics/items/icon_palettes/liechi_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_ganlon_berry_sheet:: @ 8E8D518
	.incbin "graphics/items/icons/ganlon_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_ganlon_berry_palette:: @ 8E8D5F8
	.incbin "graphics/items/icon_palettes/ganlon_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_salac_berry_sheet:: @ 8E8D618
	.incbin "graphics/items/icons/salac_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_salac_berry_palette:: @ 8E8D700
	.incbin "graphics/items/icon_palettes/salac_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_petaya_berry_sheet:: @ 8E8D720
	.incbin "graphics/items/icons/petaya_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_petaya_berry_palette:: @ 8E8D818
	.incbin "graphics/items/icon_palettes/petaya_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_apicot_berry_sheet:: @ 8E8D83C
	.incbin "graphics/items/icons/apicot_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_apicot_berry_palette:: @ 8E8D8F4
	.incbin "graphics/items/icon_palettes/apicot_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_lansat_berry_sheet:: @ 8E8D91C
	.incbin "graphics/items/icons/lansat_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_lansat_berry_palette:: @ 8E8D9FC
	.incbin "graphics/items/icon_palettes/lansat_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_starf_berry_sheet:: @ 8E8DA20
	.incbin "graphics/items/icons/starf_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_starf_berry_palette:: @ 8E8DAF0
	.incbin "graphics/items/icon_palettes/starf_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_enigma_berry_sheet:: @ 8E8DB14
	.incbin "graphics/items/icons/enigma_berry.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_enigma_berry_palette:: @ 8E8DBE0
	.incbin "graphics/items/icon_palettes/enigma_berry.gbapal.lz"

	.align 2
gFile_graphics_items_icons_bright_powder_sheet:: @ 8E8DC00
	.incbin "graphics/items/icons/bright_powder.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_bright_powder_palette:: @ 8E8DCBC
	.incbin "graphics/items/icon_palettes/bright_powder.gbapal.lz"

	.align 2
gFile_graphics_items_icons_in_battle_herb_sheet:: @ 8E8DCDC
	.incbin "graphics/items/icons/in_battle_herb.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_white_herb_palette:: @ 8E8DD88
	.incbin "graphics/items/icon_palettes/white_herb.gbapal.lz"

	.align 2
gFile_graphics_items_icons_macho_brace_sheet:: @ 8E8DDA8
	.incbin "graphics/items/icons/macho_brace.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_macho_brace_palette:: @ 8E8DE94
	.incbin "graphics/items/icon_palettes/macho_brace.gbapal.lz"

	.align 2
gFile_graphics_items_icons_exp_share_sheet:: @ 8E8DEBC
	.incbin "graphics/items/icons/exp_share.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_exp_share_palette:: @ 8E8DFA8
	.incbin "graphics/items/icon_palettes/exp_share.gbapal.lz"

	.align 2
gFile_graphics_items_icons_quick_claw_sheet:: @ 8E8DFD0
	.incbin "graphics/items/icons/quick_claw.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_quick_claw_palette:: @ 8E8E068
	.incbin "graphics/items/icon_palettes/quick_claw.gbapal.lz"

	.align 2
gFile_graphics_items_icons_soothe_bell_sheet:: @ 8E8E088
	.incbin "graphics/items/icons/soothe_bell.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_soothe_bell_palette:: @ 8E8E14C
	.incbin "graphics/items/icon_palettes/soothe_bell.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_mental_herb_palette:: @ 8E8E170
	.incbin "graphics/items/icon_palettes/mental_herb.gbapal.lz"

	.align 2
gFile_graphics_items_icons_choice_band_sheet:: @ 8E8E190
	.incbin "graphics/items/icons/choice_band.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_choice_band_palette:: @ 8E8E27C
	.incbin "graphics/items/icon_palettes/choice_band.gbapal.lz"

	.align 2
gFile_graphics_items_icons_kings_rock_sheet:: @ 8E8E2A4
	.incbin "graphics/items/icons/kings_rock.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_kings_rock_palette:: @ 8E8E394
	.incbin "graphics/items/icon_palettes/kings_rock.gbapal.lz"

	.align 2
gFile_graphics_items_icons_silver_powder_sheet:: @ 8E8E3B0
	.incbin "graphics/items/icons/silver_powder.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_silver_powder_palette:: @ 8E8E43C
	.incbin "graphics/items/icon_palettes/silver_powder.gbapal.lz"

	.align 2
gFile_graphics_items_icons_amulet_coin_sheet:: @ 8E8E460
	.incbin "graphics/items/icons/amulet_coin.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_amulet_coin_palette:: @ 8E8E4F8
	.incbin "graphics/items/icon_palettes/amulet_coin.gbapal.lz"

	.align 2
gFile_graphics_items_icons_cleanse_tag_sheet:: @ 8E8E51C
	.incbin "graphics/items/icons/cleanse_tag.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_cleanse_tag_palette:: @ 8E8E5C0
	.incbin "graphics/items/icon_palettes/cleanse_tag.gbapal.lz"

	.align 2
gFile_graphics_items_icons_soul_dew_sheet:: @ 8E8E5E0
	.incbin "graphics/items/icons/soul_dew.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_soul_dew_palette:: @ 8E8E674
	.incbin "graphics/items/icon_palettes/soul_dew.gbapal.lz"

	.align 2
gFile_graphics_items_icons_deep_sea_tooth_sheet:: @ 8E8E694
	.incbin "graphics/items/icons/deep_sea_tooth.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_deep_sea_tooth_palette:: @ 8E8E748
	.incbin "graphics/items/icon_palettes/deep_sea_tooth.gbapal.lz"

	.align 2
gFile_graphics_items_icons_deep_sea_scale_sheet:: @ 8E8E76C
	.incbin "graphics/items/icons/deep_sea_scale.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_deep_sea_scale_palette:: @ 8E8E814
	.incbin "graphics/items/icon_palettes/deep_sea_scale.gbapal.lz"

	.align 2
gFile_graphics_items_icons_smoke_ball_sheet:: @ 8E8E834
	.incbin "graphics/items/icons/smoke_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_smoke_ball_palette:: @ 8E8E8EC
	.incbin "graphics/items/icon_palettes/smoke_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_everstone_sheet:: @ 8E8E910
	.incbin "graphics/items/icons/everstone.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_everstone_palette:: @ 8E8E9C4
	.incbin "graphics/items/icon_palettes/everstone.gbapal.lz"

	.align 2
gFile_graphics_items_icons_focus_band_sheet:: @ 8E8E9E0
	.incbin "graphics/items/icons/focus_band.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_focus_band_palette:: @ 8E8EAD0
	.incbin "graphics/items/icon_palettes/focus_band.gbapal.lz"

	.align 2
gFile_graphics_items_icons_lucky_egg_sheet:: @ 8E8EAF8
	.incbin "graphics/items/icons/lucky_egg.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_lucky_egg_palette:: @ 8E8EB80
	.incbin "graphics/items/icon_palettes/lucky_egg.gbapal.lz"

	.align 2
gFile_graphics_items_icons_scope_lens_sheet:: @ 8E8EB98
	.incbin "graphics/items/icons/scope_lens.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_scope_lens_palette:: @ 8E8EC98
	.incbin "graphics/items/icon_palettes/scope_lens.gbapal.lz"

	.align 2
gFile_graphics_items_icons_metal_coat_sheet:: @ 8E8ECC0
	.incbin "graphics/items/icons/metal_coat.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_metal_coat_palette:: @ 8E8ED7C
	.incbin "graphics/items/icon_palettes/metal_coat.gbapal.lz"

	.align 2
gFile_graphics_items_icons_leftovers_sheet:: @ 8E8ED9C
	.incbin "graphics/items/icons/leftovers.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_leftovers_palette:: @ 8E8EE40
	.incbin "graphics/items/icon_palettes/leftovers.gbapal.lz"

	.align 2
gFile_graphics_items_icons_dragon_scale_sheet:: @ 8E8EE64
	.incbin "graphics/items/icons/dragon_scale.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_dragon_scale_palette:: @ 8E8EF18
	.incbin "graphics/items/icon_palettes/dragon_scale.gbapal.lz"

	.align 2
gFile_graphics_items_icons_light_ball_sheet:: @ 8E8EF38
	.incbin "graphics/items/icons/light_ball.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_light_ball_palette:: @ 8E8EFCC
	.incbin "graphics/items/icon_palettes/light_ball.gbapal.lz"

	.align 2
gFile_graphics_items_icons_soft_sand_sheet:: @ 8E8EFF0
	.incbin "graphics/items/icons/soft_sand.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_soft_sand_palette:: @ 8E8F0AC
	.incbin "graphics/items/icon_palettes/soft_sand.gbapal.lz"

	.align 2
gFile_graphics_items_icons_hard_stone_sheet:: @ 8E8F0CC
	.incbin "graphics/items/icons/hard_stone.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_hard_stone_palette:: @ 8E8F180
	.incbin "graphics/items/icon_palettes/hard_stone.gbapal.lz"

	.align 2
gFile_graphics_items_icons_miracle_seed_sheet:: @ 8E8F1A4
	.incbin "graphics/items/icons/miracle_seed.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_miracle_seed_palette:: @ 8E8F254
	.incbin "graphics/items/icon_palettes/miracle_seed.gbapal.lz"

	.align 2
gFile_graphics_items_icons_black_glasses_sheet:: @ 8E8F270
	.incbin "graphics/items/icons/black_glasses.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_black_type_enhancing_item_palette:: @ 8E8F2F8
	.incbin "graphics/items/icon_palettes/black_type_enhancing_item.gbapal.lz"

	.align 2
gFile_graphics_items_icons_black_belt_sheet:: @ 8E8F310
	.incbin "graphics/items/icons/black_belt.4bpp.lz"

	.align 2
gFile_graphics_items_icons_magnet_sheet:: @ 8E8F3D8
	.incbin "graphics/items/icons/magnet.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_magnet_palette:: @ 8E8F488
	.incbin "graphics/items/icon_palettes/magnet.gbapal.lz"

	.align 2
gFile_graphics_items_icons_mystic_water_sheet:: @ 8E8F4B0
	.incbin "graphics/items/icons/mystic_water.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_mystic_water_palette:: @ 8E8F548
	.incbin "graphics/items/icon_palettes/mystic_water.gbapal.lz"

	.align 2
gFile_graphics_items_icons_sharp_beak_sheet:: @ 8E8F568
	.incbin "graphics/items/icons/sharp_beak.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_sharp_beak_palette:: @ 8E8F624
	.incbin "graphics/items/icon_palettes/sharp_beak.gbapal.lz"

	.align 2
gFile_graphics_items_icons_poison_barb_sheet:: @ 8E8F644
	.incbin "graphics/items/icons/poison_barb.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_poison_barb_palette:: @ 8E8F6CC
	.incbin "graphics/items/icon_palettes/poison_barb.gbapal.lz"

	.align 2
gFile_graphics_items_icons_never_melt_ice_sheet:: @ 8E8F6EC
	.incbin "graphics/items/icons/never_melt_ice.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_never_melt_ice_palette:: @ 8E8F7B8
	.incbin "graphics/items/icon_palettes/never_melt_ice.gbapal.lz"

	.align 2
gFile_graphics_items_icons_spell_tag_sheet:: @ 8E8F7D4
	.incbin "graphics/items/icons/spell_tag.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_spell_tag_palette:: @ 8E8F874
	.incbin "graphics/items/icon_palettes/spell_tag.gbapal.lz"

	.align 2
gFile_graphics_items_icons_twisted_spoon_sheet:: @ 8E8F894
	.incbin "graphics/items/icons/twisted_spoon.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_twisted_spoon_palette:: @ 8E8F934
	.incbin "graphics/items/icon_palettes/twisted_spoon.gbapal.lz"

	.align 2
gFile_graphics_items_icons_charcoal_sheet:: @ 8E8F94C
	.incbin "graphics/items/icons/charcoal.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_charcoal_palette:: @ 8E8FA1C
	.incbin "graphics/items/icon_palettes/charcoal.gbapal.lz"

	.align 2
gFile_graphics_items_icons_dragon_fang_sheet:: @ 8E8FA38
	.incbin "graphics/items/icons/dragon_fang.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_dragon_fang_palette:: @ 8E8FAEC
	.incbin "graphics/items/icon_palettes/dragon_fang.gbapal.lz"

	.align 2
gFile_graphics_items_icons_silk_scarf_sheet:: @ 8E8FB0C
	.incbin "graphics/items/icons/silk_scarf.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_silk_scarf_palette:: @ 8E8FC14
	.incbin "graphics/items/icon_palettes/silk_scarf.gbapal.lz"

	.align 2
gFile_graphics_items_icons_up_grade_sheet:: @ 8E8FC34
	.incbin "graphics/items/icons/up_grade.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_up_grade_palette:: @ 8E8FCF0
	.incbin "graphics/items/icon_palettes/up_grade.gbapal.lz"

	.align 2
gFile_graphics_items_icons_shell_bell_sheet:: @ 8E8FD18
	.incbin "graphics/items/icons/shell_bell.4bpp.lz"

	.align 2
gFile_graphics_items_icons_sea_incense_sheet:: @ 8E8FDF8
	.incbin "graphics/items/icons/sea_incense.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_sea_incense_palette:: @ 8E8FEE0
	.incbin "graphics/items/icon_palettes/sea_incense.gbapal.lz"

	.align 2
gFile_graphics_items_icons_lax_incense_sheet:: @ 8E8FF08
	.incbin "graphics/items/icons/lax_incense.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_lax_incense_palette:: @ 8E8FFF0
	.incbin "graphics/items/icon_palettes/lax_incense.gbapal.lz"

	.align 2
gFile_graphics_items_icons_lucky_punch_sheet:: @ 8E90018
	.incbin "graphics/items/icons/lucky_punch.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_lucky_punch_palette:: @ 8E900DC
	.incbin "graphics/items/icon_palettes/lucky_punch.gbapal.lz"

	.align 2
gFile_graphics_items_icons_metal_powder_sheet:: @ 8E900FC
	.incbin "graphics/items/icons/metal_powder.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_metal_powder_palette:: @ 8E901BC
	.incbin "graphics/items/icon_palettes/metal_powder.gbapal.lz"

	.align 2
gFile_graphics_items_icons_thick_club_sheet:: @ 8E901E0
	.incbin "graphics/items/icons/thick_club.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_thick_club_palette:: @ 8E90274
	.incbin "graphics/items/icon_palettes/thick_club.gbapal.lz"

	.align 2
gFile_graphics_items_icons_stick_sheet:: @ 8E90290
	.incbin "graphics/items/icons/stick.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_stick_palette:: @ 8E90330
	.incbin "graphics/items/icon_palettes/stick.gbapal.lz"

	.align 2
gFile_graphics_items_icons_scarf_sheet:: @ 8E90354
	.incbin "graphics/items/icons/scarf.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_red_scarf_palette:: @ 8E90420
	.incbin "graphics/items/icon_palettes/red_scarf.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_blue_scarf_palette:: @ 8E9043C
	.incbin "graphics/items/icon_palettes/blue_scarf.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_pink_scarf_palette:: @ 8E90458
	.incbin "graphics/items/icon_palettes/pink_scarf.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_green_scarf_palette:: @ 8E90474
	.incbin "graphics/items/icon_palettes/green_scarf.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_yellow_scarf_palette:: @ 8E90490
	.incbin "graphics/items/icon_palettes/yellow_scarf.gbapal.lz"

	.align 2
gFile_graphics_items_icons_mach_bike_sheet:: @ 8E904AC
	.incbin "graphics/items/icons/mach_bike.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_mach_bike_palette:: @ 8E905B4
	.incbin "graphics/items/icon_palettes/mach_bike.gbapal.lz"

	.align 2
gFile_graphics_items_icons_coin_case_sheet:: @ 8E905D8
	.incbin "graphics/items/icons/coin_case.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_coin_case_palette:: @ 8E90698
	.incbin "graphics/items/icon_palettes/coin_case.gbapal.lz"

	.align 2
gFile_graphics_items_icons_itemfinder_sheet:: @ 8E906B8
	.incbin "graphics/items/icons/itemfinder.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_itemfinder_palette:: @ 8E90774
	.incbin "graphics/items/icon_palettes/itemfinder.gbapal.lz"

	.align 2
gFile_graphics_items_icons_old_rod_sheet:: @ 8E9079C
	.incbin "graphics/items/icons/old_rod.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_old_rod_palette:: @ 8E90848
	.incbin "graphics/items/icon_palettes/old_rod.gbapal.lz"

	.align 2
gFile_graphics_items_icons_good_rod_sheet:: @ 8E9086C
	.incbin "graphics/items/icons/good_rod.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_good_rod_palette:: @ 8E90908
	.incbin "graphics/items/icon_palettes/good_rod.gbapal.lz"

	.align 2
gFile_graphics_items_icons_super_rod_sheet:: @ 8E90930
	.incbin "graphics/items/icons/super_rod.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_super_rod_palette:: @ 8E909E0
	.incbin "graphics/items/icon_palettes/super_rod.gbapal.lz"

	.align 2
gFile_graphics_items_icons_ss_ticket_sheet:: @ 8E90A08
	.incbin "graphics/items/icons/ss_ticket.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_ss_ticket_palette:: @ 8E90A9C
	.incbin "graphics/items/icon_palettes/ss_ticket.gbapal.lz"

	.align 2
gFile_graphics_items_icons_contest_pass_sheet:: @ 8E90AB4
	.incbin "graphics/items/icons/contest_pass.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_contest_pass_palette:: @ 8E90B60
	.incbin "graphics/items/icon_palettes/contest_pass.gbapal.lz"

	.align 2
gFile_graphics_items_icons_wailmer_pail_sheet:: @ 8E90B88
	.incbin "graphics/items/icons/wailmer_pail.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_wailmer_pail_palette:: @ 8E90C54
	.incbin "graphics/items/icon_palettes/wailmer_pail.gbapal.lz"

	.align 2
gFile_graphics_items_icons_devon_goods_sheet:: @ 8E90C78
	.incbin "graphics/items/icons/devon_goods.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_devon_goods_palette:: @ 8E90D20
	.incbin "graphics/items/icon_palettes/devon_goods.gbapal.lz"

	.align 2
gFile_graphics_items_icons_soot_sack_sheet:: @ 8E90D3C
	.incbin "graphics/items/icons/soot_sack.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_soot_sack_palette:: @ 8E90E14
	.incbin "graphics/items/icon_palettes/soot_sack.gbapal.lz"

	.align 2
gFile_graphics_items_icons_basement_key_sheet:: @ 8E90E3C
	.incbin "graphics/items/icons/basement_key.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_old_key_palette:: @ 8E90EE4
	.incbin "graphics/items/icon_palettes/old_key.gbapal.lz"

	.align 2
gFile_graphics_items_icons_acro_bike_sheet:: @ 8E90F0C
	.incbin "graphics/items/icons/acro_bike.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_acro_bike_palette:: @ 8E91008
	.incbin "graphics/items/icon_palettes/acro_bike.gbapal.lz"

	.align 2
gFile_graphics_items_icons_pokeblock_case_sheet:: @ 8E91028
	.incbin "graphics/items/icons/pokeblock_case.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_pokeblock_case_palette:: @ 8E91110
	.incbin "graphics/items/icon_palettes/pokeblock_case.gbapal.lz"

	.align 2
gFile_graphics_items_icons_letter_sheet:: @ 8E91138
	.incbin "graphics/items/icons/letter.4bpp.lz"

	.align 2
gFile_graphics_items_icons_eon_ticket_sheet:: @ 8E911B8
	.incbin "graphics/items/icons/eon_ticket.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_eon_ticket_palette:: @ 8E91254
	.incbin "graphics/items/icon_palettes/eon_ticket.gbapal.lz"

	.align 2
gFile_graphics_items_icons_orb_sheet:: @ 8E91278
	.incbin "graphics/items/icons/orb.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_red_orb_palette:: @ 8E91330
	.incbin "graphics/items/icon_palettes/red_orb.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_blue_orb_palette:: @ 8E9134C
	.incbin "graphics/items/icon_palettes/blue_orb.gbapal.lz"

	.align 2
gFile_graphics_items_icons_scanner_sheet:: @ 8E91368
	.incbin "graphics/items/icons/scanner.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_scanner_palette:: @ 8E91430
	.incbin "graphics/items/icon_palettes/scanner.gbapal.lz"

	.align 2
gFile_graphics_items_icons_go_goggles_sheet:: @ 8E91454
	.incbin "graphics/items/icons/go_goggles.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_go_goggles_palette:: @ 8E91508
	.incbin "graphics/items/icon_palettes/go_goggles.gbapal.lz"

	.align 2
gFile_graphics_items_icons_meteorite_sheet:: @ 8E91528
	.incbin "graphics/items/icons/meteorite.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_meteorite_palette:: @ 8E91608
	.incbin "graphics/items/icon_palettes/meteorite.gbapal.lz"

	.align 2
gFile_graphics_items_icons_room1_key_sheet:: @ 8E91628
	.incbin "graphics/items/icons/room1_key.4bpp.lz"

	.align 2
gFile_graphics_items_icons_room2_key_sheet:: @ 8E916E0
	.incbin "graphics/items/icons/room2_key.4bpp.lz"

	.align 2
gFile_graphics_items_icons_room4_key_sheet:: @ 8E9179C
	.incbin "graphics/items/icons/room4_key.4bpp.lz"

	.align 2
gFile_graphics_items_icons_room6_key_sheet:: @ 8E9185C
	.incbin "graphics/items/icons/room6_key.4bpp.lz"

	.align 2
gFile_graphics_items_icons_storage_key_sheet:: @ 8E91918
	.incbin "graphics/items/icons/storage_key.4bpp.lz"

	.align 2
gFile_graphics_items_icons_root_fossil_sheet:: @ 8E919C0
	.incbin "graphics/items/icons/root_fossil.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_hoenn_fossil_palette:: @ 8E91ACC
	.incbin "graphics/items/icon_palettes/hoenn_fossil.gbapal.lz"

	.align 2
gFile_graphics_items_icons_claw_fossil_sheet:: @ 8E91AF4
	.incbin "graphics/items/icons/claw_fossil.4bpp.lz"

	.align 2
gFile_graphics_items_icons_devon_scope_sheet:: @ 8E91BE4
	.incbin "graphics/items/icons/devon_scope.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_devon_scope_palette:: @ 8E91CA0
	.incbin "graphics/items/icon_palettes/devon_scope.gbapal.lz"

	.align 2
gFile_graphics_items_icons_tm_sheet:: @ 8E91CC8
	.incbin "graphics/items/icons/tm.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_fighting_tm_hm_palette:: @ 8E91DC4
	.incbin "graphics/items/icon_palettes/fighting_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_dragon_tm_hm_palette:: @ 8E91DEC
	.incbin "graphics/items/icon_palettes/dragon_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_water_tm_hm_palette:: @ 8E91E14
	.incbin "graphics/items/icon_palettes/water_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_psychic_tm_hm_palette:: @ 8E91E3C
	.incbin "graphics/items/icon_palettes/psychic_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_normal_tm_hm_palette:: @ 8E91E64
	.incbin "graphics/items/icon_palettes/normal_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_poison_tm_hm_palette:: @ 8E91E8C
	.incbin "graphics/items/icon_palettes/poison_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_ice_tm_hm_palette:: @ 8E91EB4
	.incbin "graphics/items/icon_palettes/ice_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_grass_tm_hm_palette:: @ 8E91EDC
	.incbin "graphics/items/icon_palettes/grass_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_fire_tm_hm_palette:: @ 8E91F04
	.incbin "graphics/items/icon_palettes/fire_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_dark_tm_hm_palette:: @ 8E91F2C
	.incbin "graphics/items/icon_palettes/dark_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_steel_tm_hm_palette:: @ 8E91F54
	.incbin "graphics/items/icon_palettes/steel_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_electric_tm_hm_palette:: @ 8E91F7C
	.incbin "graphics/items/icon_palettes/electric_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_ground_tm_hm_palette:: @ 8E91FA4
	.incbin "graphics/items/icon_palettes/ground_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_ghost_tm_hm_palette:: @ 8E91FCC
	.incbin "graphics/items/icon_palettes/ghost_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_rock_tm_hm_palette:: @ 8E91FF4
	.incbin "graphics/items/icon_palettes/rock_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_flying_tm_hm_palette:: @ 8E9201C
	.incbin "graphics/items/icon_palettes/flying_tm_hm.gbapal.lz"

	.align 2
gFile_graphics_items_icons_oaks_parcel_sheet:: @ 8E92044
	.incbin "graphics/items/icons/oaks_parcel.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_oaks_parcel_palette:: @ 8E920FC
	.incbin "graphics/items/icon_palettes/oaks_parcel.gbapal.lz"

	.align 2
gFile_graphics_items_icons_poke_flute_sheet:: @ 8E9211C
	.incbin "graphics/items/icons/poke_flute.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_poke_flute_palette:: @ 8E921E0
	.incbin "graphics/items/icon_palettes/poke_flute.gbapal.lz"

	.align 2
gFile_graphics_items_icons_secret_key_sheet:: @ 8E92208
	.incbin "graphics/items/icons/secret_key.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_secret_key_palette:: @ 8E922D4
	.incbin "graphics/items/icon_palettes/secret_key.gbapal.lz"

	.align 2
gFile_graphics_items_icons_bike_voucher_sheet:: @ 8E922FC
	.incbin "graphics/items/icons/bike_voucher.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_bike_voucher_palette:: @ 8E9239C
	.incbin "graphics/items/icon_palettes/bike_voucher.gbapal.lz"

	.align 2
gFile_graphics_items_icons_gold_teeth_sheet:: @ 8E923BC
	.incbin "graphics/items/icons/gold_teeth.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_gold_teeth_palette:: @ 8E924A8
	.incbin "graphics/items/icon_palettes/gold_teeth.gbapal.lz"

	.align 2
gFile_graphics_items_icons_old_amber_sheet:: @ 8E924CC
	.incbin "graphics/items/icons/old_amber.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_old_amber_palette:: @ 8E925AC
	.incbin "graphics/items/icon_palettes/old_amber.gbapal.lz"

	.align 2
gFile_graphics_items_icons_card_key_sheet:: @ 8E925D0
	.incbin "graphics/items/icons/card_key.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_card_key_palette:: @ 8E92678
	.incbin "graphics/items/icon_palettes/card_key.gbapal.lz"

	.align 2
gFile_graphics_items_icons_lift_key_sheet:: @ 8E92698
	.incbin "graphics/items/icons/lift_key.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_key_palette:: @ 8E92754
	.incbin "graphics/items/icon_palettes/key.gbapal.lz"

	.align 2
gFile_graphics_items_icons_helix_fossil_sheet:: @ 8E92774
	.incbin "graphics/items/icons/helix_fossil.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_kanto_fossil_palette:: @ 8E92868
	.incbin "graphics/items/icon_palettes/kanto_fossil.gbapal.lz"

	.align 2
gFile_graphics_items_icons_dome_fossil_sheet:: @ 8E92888
	.incbin "graphics/items/icons/dome_fossil.4bpp.lz"

	.align 2
gFile_graphics_items_icons_silph_scope_sheet:: @ 8E92978
	.incbin "graphics/items/icons/silph_scope.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_silph_scope_palette:: @ 8E92A4C
	.incbin "graphics/items/icon_palettes/silph_scope.gbapal.lz"

	.align 2
gFile_graphics_items_icons_bicycle_sheet:: @ 8E92A70
	.incbin "graphics/items/icons/bicycle.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_bicycle_palette:: @ 8E92B74
	.incbin "graphics/items/icon_palettes/bicycle.gbapal.lz"

	.align 2
gFile_graphics_items_icons_town_map_sheet:: @ 8E92B94
	.incbin "graphics/items/icons/town_map.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_town_map_palette:: @ 8E92C50
	.incbin "graphics/items/icon_palettes/town_map.gbapal.lz"

	.align 2
gFile_graphics_items_icons_vs_seeker_sheet:: @ 8E92C78
	.incbin "graphics/items/icons/vs_seeker.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_vs_seeker_palette:: @ 8E92D40
	.incbin "graphics/items/icon_palettes/vs_seeker.gbapal.lz"

	.align 2
gFile_graphics_items_icons_fame_checker_sheet:: @ 8E92D60
	.incbin "graphics/items/icons/fame_checker.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_fame_checker_palette:: @ 8E92E18
	.incbin "graphics/items/icon_palettes/fame_checker.gbapal.lz"

	.align 2
gFile_graphics_items_icons_tm_case_sheet:: @ 8E92E3C
	.incbin "graphics/items/icons/tm_case.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_tm_case_palette:: @ 8E92F00
	.incbin "graphics/items/icon_palettes/tm_case.gbapal.lz"

	.align 2
gFile_graphics_items_icons_berry_pouch_sheet:: @ 8E92F28
	.incbin "graphics/items/icons/berry_pouch.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_berry_pouch_palette:: @ 8E93028
	.incbin "graphics/items/icon_palettes/berry_pouch.gbapal.lz"

	.align 2
gFile_graphics_items_icons_teachy_tv_sheet:: @ 8E93050
	.incbin "graphics/items/icons/teachy_tv.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_teachy_tv_palette:: @ 8E93148
	.incbin "graphics/items/icon_palettes/teachy_tv.gbapal.lz"

	.align 2
gFile_graphics_items_icons_tri_pass_sheet:: @ 8E93170
	.incbin "graphics/items/icons/tri_pass.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_tri_pass_palette:: @ 8E93214
	.incbin "graphics/items/icon_palettes/tri_pass.gbapal.lz"

	.align 2
gFile_graphics_items_icons_rainbow_pass_sheet:: @ 8E93234
	.incbin "graphics/items/icons/rainbow_pass.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_rainbow_pass_palette:: @ 8E932DC
	.incbin "graphics/items/icon_palettes/rainbow_pass.gbapal.lz"

	.align 2
gFile_graphics_items_icons_tea_sheet:: @ 8E93304
	.incbin "graphics/items/icons/tea.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_tea_palette:: @ 8E933CC
	.incbin "graphics/items/icon_palettes/tea.gbapal.lz"

	.align 2
gFile_graphics_items_icons_mystic_ticket_sheet:: @ 8E933F0
	.incbin "graphics/items/icons/mystic_ticket.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_mystic_ticket_palette:: @ 8E93488
	.incbin "graphics/items/icon_palettes/mystic_ticket.gbapal.lz"

	.align 2
gFile_graphics_items_icons_aurora_ticket_sheet:: @ 8E934A8
	.incbin "graphics/items/icons/aurora_ticket.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_aurora_ticket_palette:: @ 8E93544
	.incbin "graphics/items/icon_palettes/aurora_ticket.gbapal.lz"

	.align 2
gFile_graphics_items_icons_powder_jar_sheet:: @ 8E93568
	.incbin "graphics/items/icons/powder_jar.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_powder_jar_palette:: @ 8E93608
	.incbin "graphics/items/icon_palettes/powder_jar.gbapal.lz"

	.align 2
gFile_graphics_items_icon_palettes_ruby_palette:: @ 8E93630
	.incbin "graphics/items/icon_palettes/ruby.gbapal.lz"

	.align 2
gFile_graphics_items_icons_gem_sheet:: @ 8E93658
	.incbin "graphics/items/icons/gem.4bpp.lz"

	.align 2
gFile_graphics_items_icon_palettes_sapphire_palette:: @ 8E93720
	.incbin "graphics/items/icon_palettes/sapphire.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_282_palette:: @ 8E93748
	.incbin "graphics/battle_anims/sprites/282.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_282_sheet:: @ 8E93770
	.incbin "graphics/battle_anims/sprites/282.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_270_palette:: @ 8E93958
	.incbin "graphics/battle_anims/sprites/270.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_270_sheet:: @ 8E93974
	.incbin "graphics/battle_anims/sprites/270.4bpp.lz"

	.align 2
gFile_graphics_battle_anims_sprites_271_palette:: @ 8E93A9C
	.incbin "graphics/battle_anims/sprites/271.gbapal.lz"

	.align 2
gFile_graphics_battle_anims_sprites_271_sheet:: @ 8E93AB4
	.incbin "graphics/battle_anims/sprites/271.4bpp.lz"

	.align 2
gUnknown_8E93B14:: @ 8E93B14
	.incbin "baserom.gba", 0xE93B14, 0x24

gUnknown_8E93B38:: @ 8E93B38
	.incbin "baserom.gba", 0xE93B38, 0x368

gUnknown_8E93EA0:: @ 8E93EA0
	.incbin "baserom.gba", 0xE93EA0, 0x180 @UNKNOWN
	
	.align 2
gFile_graphics_mail_orange_tiles_sheet:: @ 8E94020
	.incbin "graphics/mail/orange/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_harbor_tiles_sheet:: @ 8E941C0
	.incbin "graphics/mail/harbor/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_glitter_tiles_sheet:: @ 8E942FC
	.incbin "graphics/mail/glitter/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_mech_tiles_sheet:: @ 8E9450C
	.incbin "graphics/mail/mech/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_wood_tiles_sheet:: @ 8E945E4
	.incbin "graphics/mail/wood/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_wave_tiles_sheet:: @ 8E947DC
	.incbin "graphics/mail/wave/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_bead_tiles_sheet:: @ 8E9495C
	.incbin "graphics/mail/bead/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_shadow_tiles_sheet:: @ 8E94A04
	.incbin "graphics/mail/shadow/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_tropic_tiles_sheet:: @ 8E94B94
	.incbin "graphics/mail/tropic/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_dream_tiles_sheet:: @ 8E94CD4
	.incbin "graphics/mail/dream/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_fab_tiles_sheet:: @ 8E94E3C
	.incbin "graphics/mail/fab/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_retro_tiles_sheet:: @ 8E94F8C
	.incbin "graphics/mail/retro/tiles.4bpp.lz"

	.align 2
gFile_graphics_mail_orange_map_tilemap:: @ 8E9522C
	.incbin "graphics/mail/orange/map.bin.lz"

	.align 2
gFile_graphics_mail_harbor_map_tilemap:: @ 8E95304
	.incbin "graphics/mail/harbor/map.bin.lz"

	.align 2
gFile_graphics_mail_glitter_map_tilemap:: @ 8E953E4
	.incbin "graphics/mail/glitter/map.bin.lz"

	.align 2
gFile_graphics_mail_mech_map_tilemap:: @ 8E954F0
	.incbin "graphics/mail/mech/map.bin.lz"

	.align 2
gFile_graphics_mail_wood_map_tilemap:: @ 8E955CC
	.incbin "graphics/mail/wood/map.bin.lz"

	.align 2
gFile_graphics_mail_wave_map_tilemap:: @ 8E956BC
	.incbin "graphics/mail/wave/map.bin.lz"

	.align 2
gFile_graphics_mail_bead_map_tilemap:: @ 8E9579C
	.incbin "graphics/mail/bead/map.bin.lz"

	.align 2
gFile_graphics_mail_shadow_map_tilemap:: @ 8E9587C
	.incbin "graphics/mail/shadow/map.bin.lz"

	.align 2
gFile_graphics_mail_tropic_map_tilemap:: @ 8E95988
	.incbin "graphics/mail/tropic/map.bin.lz"

	.align 2
gFile_graphics_mail_dream_map_tilemap:: @ 8E95A78
	.incbin "graphics/mail/dream/map.bin.lz"

	.align 2
gFile_graphics_mail_fab_map_tilemap:: @ 8E95B70
	.incbin "graphics/mail/fab/map.bin.lz"

	.align 2
gFile_graphics_mail_retro_map_tilemap:: @ 8E95C88
	.incbin "graphics/mail/retro/map.bin.lz"

	.align 2
gUnknown_8E95D9C:: @ 8E95D9C
	.incbin "baserom.gba", 0xE95D9C, 0x20 @UNKNOWN

gUnknown_8E95DBC:: @ 8E95DBC
	.incbin "baserom.gba", 0xE95DBC, 0x20 @UNKNOWN

gUnknown_8E95DDC:: @ 8E95DDC
	.incbin "baserom.gba", 0xE95DDC, 0x2000 @UNKNOWN

gUnknown_8E97DDC:: @ 8E97DDC
	.incbin "baserom.gba", 0xE97DDC, 0x20 @UNKNOWN

gUnknown_8E97DFC:: @ 8E97DFC
	.incbin "baserom.gba", 0xE97DFC, 0xC8

gUnknown_8E97EC4:: @ 8E97EC4
	.incbin "baserom.gba", 0xE97EC4, 0x120

gUnknown_8E97FE4:: @ 8E97FE4
	.incbin "baserom.gba", 0xE97FE4, 0x40 @UNKNOWN

gUnknown_8E98024:: @ 8E98024
	.incbin "baserom.gba", 0xE98024, 0xC0 @UNKNOWN

gUnknown_8E980E4:: @ 8E980E4
	.incbin "baserom.gba", 0xE980E4, 0x1D8

gUnknown_8E982BC:: @ 8E982BC
	.incbin "baserom.gba", 0xE982BC, 0xDC

gUnknown_8E98398:: @ 8E98398
	.incbin "baserom.gba", 0xE98398, 0xC0

gUnknown_8E98458:: @ 8E98458
	.incbin "baserom.gba", 0xE98458, 0xC0

gUnknown_8E98518:: @ 8E98518
	.incbin "baserom.gba", 0xE98518, 0xC0
	
gUnknown_8E985D8:: @ 8E985D8
	.incbin "baserom.gba", 0xE985D8, 0xB40 @UNKNOWN, FALSEPOSITIVE?

gUnknown_8E99118:: @ 8E99118
	.incbin "graphics/tm_case/unk_8E99118.4bpp"

gUnknown_8E99198::
	.incbin "baserom.gba", 0xE99198, 0x60 @UNKNOWN

gUnknown_8E991F8:: @ 8E991F8
	.incbin "baserom.gba", 0xE991F8, 0x674

gUnknown_8E9986C:: @ 8E9986C
	.incbin "baserom.gba", 0xE9986C, 0x60 @UNKNOWN

gUnknown_8E998CC:: @ 8E998CC
	.incbin "baserom.gba", 0xE998CC, 0x4C0

gUnknown_8E99D8C:: @ 8E99D8C
	.incbin "baserom.gba", 0xE99D8C, 0x20 @UNKNOWN

gUnknown_8E99DAC:: @ 8E99DAC
	.incbin "baserom.gba", 0xE99DAC, 0xC8 @UNKNOWN

gUnknown_8E99E74:: @ 8E99E74
	.incbin "baserom.gba", 0xE99E74, 0xB0

gUnknown_8E99F24:: @ 8E99F24
	.incbin "baserom.gba", 0xE99F24, 0x20 @UNKNOWN

gUnknown_8E99F44:: @ 8E99F44
	.incbin "baserom.gba", 0xE99F44, 0x224

gUnknown_8E9A168:: @ 8E9A168
	.incbin "baserom.gba", 0xE9A168, 0x2F8

gUnknown_8E9A460:: @ 8E9A460
	.incbin "baserom.gba", 0xE9A460, 0xEB0

gUnknown_8E9B310:: @ 8E9B310
	.incbin "baserom.gba", 0xE9B310, 0xC0 @UNKNOWN

gUnknown_8E9B3D0:: @ 8E9B3D0
	.incbin "baserom.gba", 0xE9B3D0, 0x20 @UNKNOWN

gUnknown_8E9B3F0:: @ 8E9B3F0
	.incbin "baserom.gba", 0xE9B3F0, 0xC8

gUnknown_8E9B4B8:: @ 8E9B4B8
	.incbin "baserom.gba", 0xE9B4B8, 0xC0

gUnknown_8E9B578:: @ 8E9B578
	.incbin "baserom.gba", 0xE9B578, 0x20 @UNKNOWN

gUnknown_8E9B598:: @ 8E9B598
	.incbin "baserom.gba", 0xE9B598, 0x1B8

gUnknown_8E9B750:: @ 8E9B750
	.incbin "baserom.gba", 0xE9B750, 0x200

gUnknown_8E9B950:: @ 8E9B950
	.incbin "baserom.gba", 0xE9B950, 0x14C

gUnknown_8E9BA9C:: @ 8E9BA9C
	.incbin "baserom.gba", 0xE9BA9C, 0x130

gUnknown_8E9BBCC:: @ 8E9BBCC
	.incbin "baserom.gba", 0xE9BBCC, 0x13C

gUnknown_8E9BD08:: @ 8E9BD08
	.incbin "baserom.gba", 0xE9BD08, 0x20 @UNKNOWN

gUnknown_8E9BD28:: @ 8E9BD28
	.incbin "baserom.gba", 0xE9BD28, 0x200

gUnknown_8E9BF28:: @ 8E9BF28
	.incbin "baserom.gba", 0xE9BF28, 0x20 @UNKNOWN

gUnknown_8E9BF48:: @ 8E9BF48
	.incbin "baserom.gba", 0xE9BF48, 0x204

gUnknown_8E9C14C:: @ 8E9C14C
	.incbin "baserom.gba", 0xE9C14C, 0x20 @UNKNOWN

gUnknown_8E9C16C:: @ 8E9C16C
	.incbin "baserom.gba", 0xE9C16C, 0x26C

gUnknown_8E9C3D8:: @ 8E9C3D8
	.incbin "baserom.gba", 0xE9C3D8, 0x20 @UNKNOWN

gUnknown_8E9C3F8:: @ 8E9C3F8
	.incbin "baserom.gba", 0xE9C3F8, 0x20 @UNKNOWN

gUnknown_8E9C418:: @ 8E9C418
	.incbin "baserom.gba", 0xE9C418, 0x20 @UNKNOWN

gUnknown_8E9C438:: @ 8E9C438
	.incbin "baserom.gba", 0xE9C438, 0x6B4

gUnknown_8E9CAEC:: @ 8E9CAEC
	.incbin "baserom.gba", 0xE9CAEC, 0xB0

gUnknown_8E9CB9C:: @ 8E9CB9C
	.incbin "baserom.gba", 0xE9CB9C, 0x20 @UNKNOWN

gUnknown_8E9CBBC:: @ 8E9CBBC
	.incbin "baserom.gba", 0xE9CBBC, 0x320 @UNKNOWN

gUnknown_8E9CEDC:: @ 8E9CEDC
	.incbin "baserom.gba", 0xE9CEDC, 0x80 @UNKNOWN

gUnknown_8E9CF5C:: @ 8E9CF5C
	.incbin "baserom.gba", 0xE9CF5C, 0x1AA0 @UNKNOWN

gUnknown_8E9E9FC:: @ 8E9E9FC
	.incbin "baserom.gba", 0xE9E9FC, 0x800 @UNKNOWN

gUnknown_8E9F1FC:: @ 8E9F1FC
	.incbin "baserom.gba", 0xE9F1FC, 0x24 @UNKNOWN

gFameCheckerBgPals:: @ 8E9F220
	.incbin "data/graphics/fame_checker_bg.gbapal"

gFameCheckerBgTiles:: @ 8E9F260
	.incbin "data/graphics/fame_checker_bg.4bpp"

gFameCheckerBg3Tilemap:: @ 8EA0700
	.incbin "data/graphics/fame_checker_tilemap3.bin"

gFameCheckerBg2Tilemap:: @ 8EA0F00
	.incbin "data/graphics/fame_checker_tilemap2.bin"

gUnknown_8EA1700:: @ 8EA1700
	.incbin "baserom.gba", 0xEA1700, 0x20 @UNKNOWN

gUnknown_8EA1720:: @ 8EA1720
	.incbin "baserom.gba", 0xEA1720, 0x238

gUnknown_8EA1958:: @ 8EA1958
	.incbin "baserom.gba", 0xEA1958, 0xF8

gUnknown_8EA1A50:: @ 8EA1A50
	.incbin "baserom.gba", 0xEA1A50, 0x118

	.align 2
gTilesetPalettes_8EA1B68:: @ 8EA1B68
	.incbin "data/tilesets/primary/82D4A94/palettes/0.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/1.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/2.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/3.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/4.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/5.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/6.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/7.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/8.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/9.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/10.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/11.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/12.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/13.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/14.gbapal"
	.incbin "data/tilesets/primary/82D4A94/palettes/15.gbapal"

gTilesetTiles_8EA1D68:: @ 8EA1D68
	.incbin "data/tilesets/primary/82D4A94/tiles.4bpp.lz"

gBerryFixGameboy_Pal:: @ 8EA463C
	.incbin "graphics/berry_fix/gba_small.gbapal"

gBerryFixGameboy_Gfx:: @ 8EA467C
	.incbin "graphics/berry_fix/gba_small.4bpp.lz"

gBerryFixGameboy_Tilemap:: @ 8EA52B8
	.incbin "graphics/berry_fix/gba_small.bin.lz"

gBerryFixGameboyLogo_Pal:: @ 8EA5604
	.incbin "graphics/berry_fix/logo.gbapal"

gBerryFixGameboyLogo_Gfx:: @ 8EA5664
	.incbin "graphics/berry_fix/logo.4bpp.lz"

gBerryFixGameboyLogo_Tilemap:: @ 8EA60C8
	.incbin "graphics/berry_fix/logo.bin.lz"

gBerryFixGbaTransfer_Pal:: @ 8EA63C8
	.incbin "graphics/berry_fix/gba_transfer.gbapal"

gBerryFixGbaTransfer_Gfx:: @ 8EA6408
	.incbin "graphics/berry_fix/gba_transfer.4bpp.lz"

gBerryFixGbaTransfer_Tilemap:: @ 8EA7028
	.incbin "graphics/berry_fix/gba_transfer.bin.lz"

gBerryFixGbaTransferHighlight_Pal:: @ 8EA72E0
	.incbin "graphics/berry_fix/gba_transfer_highlight.gbapal"

gBerryFixGbaTransferHighlight_Gfx:: @ 8EA7320
	.incbin "graphics/berry_fix/gba_transfer_highlight.4bpp.lz"

gBerryFixGbaTransferHighlight_Tilemap:: @ 8EA8118
	.incbin "graphics/berry_fix/gba_transfer_highlight.bin.lz"

gBerryFixGbaTransferError_Pal:: @ 8EA83C8
	.incbin "graphics/berry_fix/gba_transfer_error.gbapal"

gBerryFixGbaTransferError_Gfx:: @ 8EA8408
	.incbin "graphics/berry_fix/gba_transfer_error.4bpp.lz"

gBerryFixGbaTransferError_Tilemap:: @ 8EA8CC8
	.incbin "graphics/berry_fix/gba_transfer_error.bin.lz"

gBerryFixWindow_Pal:: @ 8EA8F00
	.incbin "graphics/berry_fix/window.gbapal"

gBerryFixWindow_Gfx:: @ 8EA8F40
	.incbin "graphics/berry_fix/window.4bpp.lz"

gBerryFixWindow_Tilemap:: @ 8EA9588
	.incbin "graphics/berry_fix/window.bin.lz"

	.align 2
gTilesetPalettes_8EA97F4:: @ 8EA97F4
	.incbin "data/tilesets/secondary/82D4C74/palettes/0.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/1.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/2.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/3.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/4.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/5.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/6.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/7.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/8.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/9.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/10.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/11.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/12.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/13.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/14.gbapal"
	.incbin "data/tilesets/secondary/82D4C74/palettes/15.gbapal"

	.align 2
gTilesetTiles_8EA99F4:: @ 8EA99F4
	.incbin "data/tilesets/secondary/82D4C74/tiles.4bpp.lz"

	.align 2
gTilesetPalettes_8EA9D88:: @ 8EA9D88
	.incbin "data/tilesets/secondary/82D4E6C/palettes/0.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/1.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/2.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/3.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/4.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/5.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/6.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/7.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/8.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/9.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/10.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/11.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/12.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/13.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/14.gbapal"
	.incbin "data/tilesets/secondary/82D4E6C/palettes/15.gbapal"


gTilesetTiles_8EA9F88:: @ 8EA9F88
	.incbin "data/tilesets/secondary/82D4E6C/tiles.4bpp.lz"

gUnknown_8EAA9F0:: @ 8EAA9F0
	.incbin "baserom.gba", 0xEAA9F0, 0x20 @UNKNOWN

gUnknown_8EAAA10:: @ 8EAAA10
	.incbin "baserom.gba", 0xEAAA10, 0x5C

gUnknown_8EAAA6C:: @ 8EAAA6C
	.incbin "baserom.gba", 0xEAAA6C, 0xAC

gUnknown_8EAAB18:: @ 8EAAB18
	.incbin "baserom.gba", 0xEAAB18, 0x80 @UNKNOWN

gUnknown_8EAAB98:: @ 8EAAB98
	.incbin "baserom.gba", 0xEAAB98, 0x774

gUnknown_8EAB30C:: @ 8EAB30C
	.incbin "baserom.gba", 0xEAB30C, 0x3B8

gUnknown_8EAB6C4:: @ 8EAB6C4
	.incbin "baserom.gba", 0xEAB6C4, 0x200 @UNKNOWN

gUnknown_8EAB8C4:: @ 8EAB8C4
	.incbin "baserom.gba", 0xEAB8C4, 0x1ACC

gUnknown_8EAD390:: @ 8EAD390
	.incbin "baserom.gba", 0xEAD390, 0x258

gUnknown_8EAD5E8:: @ 8EAD5E8
	.incbin "baserom.gba", 0xEAD5E8, 0x20 @UNKNOWN

gUnknown_8EAD608:: @ 8EAD608
	.incbin "baserom.gba", 0xEAD608, 0x8DC

gUnknown_8EADEE4:: @ 8EADEE4
	.incbin "baserom.gba", 0xEADEE4, 0x1B0

gUnknown_8EAE094:: @ 8EAE094
	.incbin "baserom.gba", 0xEAE094, 0x20 @UNKNOWN

gUnknown_8EAE0B4:: @ 8EAE0B4
	.incbin "baserom.gba", 0xEAE0B4, 0x2C0

gUnknown_8EAE374:: @ 8EAE374
	.incbin "baserom.gba", 0xEAE374, 0x114

gUnknown_8EAE488:: @ 8EAE488
	.incbin "baserom.gba", 0xEAE488, 0x20 @UNKNOWN

gUnknown_8EAE4A8:: @ 8EAE4A8
	.incbin "baserom.gba", 0xEAE4A8, 0x80

gUnknown_8EAE528:: @ 8EAE528
	.incbin "baserom.gba", 0xEAE528, 0x20 @UNKNOWN

gUnknown_8EAE548:: @ 8EAE548
	.incbin "baserom.gba", 0xEAE548, 0x3B8

gUnknown_8EAE900:: @ 8EAE900
	.incbin "baserom.gba", 0xEAE900, 0x100

gUnknown_8EAEA00:: @ 8EAEA00
	.incbin "baserom.gba", 0xEAEA00, 0x20 @UNKNOWN

gTradeGba2_Pal:: @ 8EAEA20
	.incbin "baserom.gba", 0xEAEA20, 0x60 @UNKNOWN

gTradeGba_Gfx:: @ 8EAEA80
	.incbin "baserom.gba", 0xEAEA80, 0x1420 @UNKNOWN

gUnknown_8EAFEA0:: @ 8EAFEA0
	.incbin "baserom.gba", 0xEAFEA0, 0x120 @UNKNOWN

gUnknown_8EAFFC0:: @ 8EAFFC0
	.incbin "baserom.gba", 0xEAFFC0, 0xB1C

gUnknown_8EB0ADC:: @ 8EB0ADC
	.incbin "baserom.gba", 0xEB0ADC, 0x44

	@ EOF
