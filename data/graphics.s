	.section gfx_data, "aw", %progbits

gUnknown_8D00000:: @ 8D00000
	.incbin "baserom.gba", 0xD00000, 0x4D8

gUnknown_8D004D8:: @ 8D004D8
	.incbin "baserom.gba", 0xD004D8, 0x44

	.align 2
gMenuMapBin:: @ 8D0051C
	.incbin "graphics/interface/menu_map.bin.lz"
	
	.align 2
gUnknown_8D00748:: @ 8D00748
	.incbin "baserom.gba", 0xD00748, 0x488

	.align 2
gUnknown_8D00BD0:: @ 8D00BD0
	.incbin "graphics/pokemon/palettes/circled_question_mark_palette.gbapal.lz"

	.align 2
gUnknown_8D00BE8:: @ 8D00BE8
	.incbin "graphics/pokemon/palettes/circled_question_mark_shiny_palette.gbapal.lz"

	.align 2
gOldCharmap4bpp:: @ 8D00C00
	.incbin "graphics/unused/old_charmap.4bpp.lz" @from ruby
	
	.align 2
gOldCharmapBin:: @ 8D013D8
	.incbin "graphics/unused/old_charmap.bin.lz" @from ruby
	
	.align 2
gOldCharmapGbapal:: @ 8D01604
	.incbin "graphics/unused/old_charmap.gbapal.lz" @from ruby
	
	.align 2
gSmokescreenImpact4bpp:: @ 8D0162C
	.incbin "graphics/battle_anims/sprites/smokescreen_impact.4bpp.lz"
	
	.align 2
gSmokescreenImpactGbapal:: @ 8D0170C
	.incbin "graphics/battle_anims/sprites/smokescreen_impact.gbapal.lz"
	
	.align 2
gBallPoke4bpp:: @ 8D01724
	.incbin "graphics/interface/ball/poke.4bpp.lz"
	
	.align 2
gBallPokeGbaPal:: @ 8D017E0
	.incbin "graphics/interface/ball/poke.gbapal.lz"
	
	.align 2
gBallGreat4bpp:: @ 8D01800
	.incbin "graphics/interface/ball/great.4bpp.lz"
	
	.align 2
gBallGreatGbapal:: @ 8D018BC
	.incbin "graphics/interface/ball/great.gbapal.lz"
	
	.align 2
gBallSafari4bpp:: @ 8D018E0
	.incbin "graphics/interface/ball/safari.4bpp.lz"
	
	.align 2
gBallSafariGbapal:: @ 8D019A4
	.incbin "graphics/interface/ball/safari.gbapal.lz"
	
	.align 2
gBallUltra4bpp:: @ 8D019C8
	.incbin "graphics/interface/ball/ultra.4bpp.lz"
	
	.align 2
gBallUltraGbapal:: @ 8D01A7C
	.incbin "graphics/interface/ball/ultra.gbapal.lz"
	
	.align 2
gBallMaster4bpp:: @ 8D01A9C
	.incbin "graphics/interface/ball/master.4bpp.lz"
	
	.align 2
gBallMasterGbapal:: @ 8D01B5C
	.incbin "graphics/interface/ball/master.gbapal.lz"
	
	.align 2
gBallNet4bpp:: @ 8D01B80
	.incbin "graphics/interface/ball/net.4bpp.lz"
	
	.align 2
gBallNetGbapal:: @ 8D01C40
	.incbin "graphics/interface/ball/net.gbapal.lz"
	
	.align 2
gBallDive4bpp:: @ 8D01C60
	.incbin "graphics/interface/ball/dive.4bpp.lz"
	
	.align 2
gBallDiveGbapal:: @ 8D01D74
	.incbin "graphics/interface/ball/dive.gbapal.lz"
	
	.align 2
gBallNest4bpp:: @ 8D01D9C
	.incbin "graphics/interface/ball/nest.4bpp.lz"
	
	.align 2
gBallNestGbapal:: @ 8D01E60
	.incbin "graphics/interface/ball/nest.gbapal.lz"
	
	.align 2
gBallRepeat4bpp:: @ 8D01E84
	.incbin "graphics/interface/ball/repeat.4bpp.lz"
	
	.align 2
gBallRepeatGbapal:: @ 8D01F44
	.incbin "graphics/interface/ball/repeat.gbapal.lz"
	
	.align 2
gBallTimer4bpp:: @ 8D01F68
	.incbin "graphics/interface/ball/timer.4bpp.lz"
	
	.align 2
gBallTimerGbapal:: @ 8D02060
	.incbin "graphics/interface/ball/timer.gbapal.lz"
	
	.align 2
gBallLuxury4bpp:: @ 8D02084
	.incbin "graphics/interface/ball/luxury.4bpp.lz"
	
	.align 2
gBallLuxuryGbapal:: @ 8D021B0
	.incbin "graphics/interface/ball/luxury.gbapal.lz"
	
	.align 2
gBallPremier4bpp:: @ 8D021D8
	.incbin "graphics/interface/ball/premier.4bpp.lz"
	
	.align 2
gBallPremierGbapal:: @ 8D022C8
	.incbin "graphics/interface/ball/premier.gbapal.lz"
	
	.align 2
gBallOpen4bpp:: @ 8D022E8
	.incbin "graphics/interface/ball_open.4bpp.lz"
	
	.align 2
gBlank4bpp:: @ 8D02364
	.incbin "graphics/interface/blank.4bpp.lz"
	
	.align 2
gSprite1464bpp:: @ 8D02460
	.incbin "graphics/battle_anims/sprites/146.4bpp.lz"
	
	.align 2
gSprite0004bpp:: @ 8D02520
	.incbin "graphics/battle_anims/sprites/000.4bpp.lz"
	
	.align 2
gSprite0034bpp:: @ 8D025D0
	.incbin "graphics/battle_anims/sprites/003.4bpp.lz"
	
	.align 2
gSprite0044bpp:: @ 8D02644
	.incbin "graphics/battle_anims/sprites/004.4bpp.lz"
	
	.align 2
gSprite0054bpp:: @ 8D026F4
	.incbin "graphics/battle_anims/sprites/005.4bpp.lz"
	
	.align 2
gSprite0064bpp:: @ 8D027C8
	.incbin "graphics/battle_anims/sprites/006.4bpp.lz"
	
	.align 2
gSprite115Gbapal:: @ 8D02894
	.incbin "graphics/battle_anims/sprites/115.gbapal.lz"
	
	.align 2
gSprite000Gbapal:: @ 8D028B4
	.incbin "graphics/battle_anims/sprites/000.gbapal.lz"
	
	.align 2
gSprite003Gbapal:: @ 8D028D8
	.incbin "graphics/battle_anims/sprites/003.gbapal.lz"
	
	.align 2
gSprite004Gbapal:: @ 8D02900
	.incbin "graphics/battle_anims/sprites/004.gbapal.lz"
	
	.align 2
gSprite005Gbapal:: @ 8D02914
	.incbin "graphics/battle_anims/sprites/005.gbapal.lz"
	
	.align 2
gSprite006Gbapal:: @ 8D0293C
	.incbin "graphics/battle_anims/sprites/006.gbapal.lz"
	
	.align 2
gSprite1614bpp:: @ 8D02964
	.incbin "graphics/battle_anims/sprites/161.4bpp.lz"
	
	.align 2
gSprite161Gbapal:: @ 8D0298C
	.incbin "graphics/battle_anims/sprites/161.gbapal.lz"
	
	.align 2
gSprite0074bpp:: @ 8D029B4
	.incbin "graphics/battle_anims/sprites/007.4bpp.lz"
	
	.align 2
gSprite0074Gbapal:: @ 8D02B30
	.incbin "graphics/battle_anims/sprites/007.gbapal.lz"
	
	.align 2
gSprite0084bpp:: @ 8D02B50
	.incbin "graphics/battle_anims/sprites/008.4bpp.lz"
	
	.align 2
gSprite008Gbapal:: @ 8D02B70
	.incbin "graphics/battle_anims/sprites/008.gbapal.lz"
	
	.align 2
gSprite010Gbapal:: @ 8D02B8C
	.incbin "graphics/battle_anims/sprites/010.gbapal.lz"
	
	.align 2
gSprite0104bpp:: @ 8D02BAC
	.incbin "graphics/battle_anims/sprites/010.4bpp.lz"
	
	.align 2
gSprite0094bpp:: @ 8D02F8C
	.incbin "graphics/battle_anims/sprites/009.4bpp.lz"
	
	.align 2
gSprite009Gbapal:: @ 8D03274
	.incbin "graphics/battle_anims/sprites/009.gbapal.lz"

	.align 2
gSprite0114bpp:: @ 8D03294
	.incbin "graphics/battle_anims/sprites/011.4bpp.lz"
	
	.align 2
gSprite011Gbapal:: @ 8D0330C
	.incbin "graphics/battle_anims/sprites/011.gbapal.lz"
	
	.align 2
gSprite0124bpp:: @ 8D03334
	.incbin "graphics/battle_anims/sprites/012.4bpp.lz"
	
	.align 2
gSprite012Gbapal:: @ 8D0339C
	.incbin "graphics/battle_anims/sprites/012.gbapal.lz"
	
	.align 2
gSprite1524bpp:: @ 8D033B4
	.incbin "graphics/battle_anims/sprites/152.4bpp.lz"
	
	.align 2
gSprite152Gbapal:: @ 8D033FC
	.incbin "graphics/battle_anims/sprites/152.gbapal.lz"
	
	.align 2
gSprite0134bpp:: @ 8D03420
	.incbin "graphics/battle_anims/sprites/013.4bpp.lz"
	
	.align 2
gSprite013Gbapal:: @ 8D03454
	.incbin "graphics/battle_anims/sprites/013.gbapal.lz"
	
	.align 2
gSprite0154bpp:: @ 8D0346C
	.incbin "graphics/battle_anims/sprites/015.4bpp.lz"
	
	.align 2
gSprite015Gbapal:: @ 8D034D8
	.incbin "graphics/battle_anims/sprites/015.gbapal.lz"
	
	.align 2
gSprite0164bpp:: @ 8D03500
	.incbin "graphics/battle_anims/sprites/016.4bpp.lz"
	
	.align 2
gSprite016Gbapal:: @ 8D03570
	.incbin "graphics/battle_anims/sprites/016.gbapal.lz"
	
	.align 2
gSprite0174bpp:: @ 8D03580
	.incbin "graphics/battle_anims/sprites/017.4bpp.lz"
	
	.align 2
gUnknown_8D035A0:: @ 8D035A0
	.incbin "graphics/unknown/unknown_D035A0.4bpp.lz"
	
	.align 2
gSprite019Gbapal:: @ 8D035C4
	.incbin "graphics/battle_anims/sprites/019.gbapal.lz"
	
	.align 2
gSprite0194bpp:: @ 8D035E0
	.incbin "graphics/battle_anims/sprites/019.4bpp.lz"
	
	.align 2
gSprite0204bpp:: @ 8D036A0
	.incbin "graphics/battle_anims/sprites/020.4bpp.lz"
	
	.align 2
gSprite020Gbapal:: @ 8D0376C
	.incbin "graphics/battle_anims/sprites/020.gbapal.lz"
	
	.align 2
gSprite023Gbapal:: @ 8D03794
	.incbin "graphics/battle_anims/sprites/023.gbapal.lz"
	
	.align 2
gSprite0234bpp:: @ 8D037BC
	.incbin "graphics/battle_anims/sprites/023.4bpp.lz"
	
	.align 2
gSprite023UnusedGbapal:: @ 8D038C4
	.incbin "graphics/unused/battle_anim_023.gbapal.lz"
	
	.align 2
gSpriteMusicNotes4bpp:: @ 8D038EC
	.incbin "graphics/unused/music_notes.4bpp.lz"
	
	.align 2
gSprite021Gbapal:: @ 8D039E8
	.incbin "graphics/battle_anims/sprites/021.gbapal.lz"
	
	.align 2
gSprite0214bpp:: @ 8D03A10
	.incbin "graphics/battle_anims/sprites/021.4bpp.lz"
	
	.align 2
gSprite022Gbapal:: @ 8D03D48
	.incbin "graphics/battle_anims/sprites/022.gbapal.lz"
	
	.align 2
gSprite025Gbapal:: @ 8D03D70
	.incbin "graphics/battle_anims/sprites/025.gbapal.lz"
	
	.align 2
gSprite0254bpp:: @ 8D03D98
	.incbin "graphics/battle_anims/sprites/025.4bpp.lz"
	
	.align 2
gSprite0244bpp:: @ 8D03E88
	.incbin "graphics/battle_anims/sprites/024.4bpp.lz"
	
	.align 2
gSprite024Gbapal:: @ 8D03F54
	.incbin "graphics/battle_anims/sprites/024.gbapal.lz"
	
	.align 2
gSprite0314bpp:: @ 8D03F68
	.incbin "graphics/battle_anims/sprites/031.4bpp.lz"
	
	.align 2
gSprite031Gbapal:: @ 8D04348
	.incbin "graphics/battle_anims/sprites/031.gbapal.lz"
	
	.align 2
gSprite032Gbapal:: @ 8D04368
	.incbin "graphics/battle_anims/sprites/032.gbapal.lz"
	
	.align 2
gSprite0324bpp:: @ 8D04390
	.incbin "graphics/battle_anims/sprites/032.4bpp.lz"
	
	.align 2
gSprite0264bpp:: @ 8D0447C
	.incbin "graphics/battle_anims/sprites/026.4bpp.lz"
	
	.align 2
gSprite026Gbapal:: @ 8D047B4
	.incbin "graphics/battle_anims/sprites/026.gbapal.lz"
	
	.align 2
gSprite027Gbapal:: @ 8D047DC
	.incbin "graphics/battle_anims/sprites/027.gbapal.lz"
	
	.align 2
gSprite0274bpp:: @ 8D04804
	.incbin "graphics/battle_anims/sprites/027.4bpp.lz"

	.align 2
gSprite028Gbapal:: @ 8D04B00
	.incbin "graphics/battle_anims/sprites/028.gbapal.lz"

	.align 2
gSprite0284bpp:: @ 8D04B28
	.incbin "graphics/battle_anims/sprites/028.4bpp.lz"

	.align 2
gSprite0294bpp:: @ 8D04E78
	.incbin "graphics/battle_anims/sprites/029.4bpp.lz"

	.align 2
gSprite029Gbapal:: @ 8D05130
	.incbin "graphics/battle_anims/sprites/029.gbapal.lz"

	.align 2
gSprite0304bpp:: @ 8D05158
	.incbin "graphics/battle_anims/sprites/030.4bpp.lz"

	.align 2
gSprite030Gbapal:: @ 8D05518
	.incbin "graphics/battle_anims/sprites/030.gbapal.lz"

	.align 2
gSprite033Gbapal:: @ 8D0553C
	.incbin "graphics/battle_anims/sprites/033.gbapal.lz"

	.align 2
gSprite0334bpp:: @ 8D05564
	.incbin "graphics/battle_anims/sprites/033.4bpp.lz"

	.align 2
gSprite0344bpp:: @ 8D05ED4
	.incbin "graphics/battle_anims/sprites/034.4bpp.lz"

	.align 2
gSprite0354bpp:: @ 8D062A0
	.incbin "graphics/battle_anims/sprites/035.4bpp.lz"

	.align 2
gSprite036Gbapal:: @ 8D06638
	.incbin "graphics/battle_anims/sprites/036.gbapal.lz"

	.align 2
gSprite0364bpp:: @ 8D06660
	.incbin "graphics/battle_anims/sprites/036.4bpp.lz"

	.align 2
gSprite0374bpp:: @ 8D06A34
	.incbin "graphics/battle_anims/sprites/037.4bpp.lz"

	.align 2
gUnknown_D06D804bpp:: @ 8D06D80
	.incbin "graphics/unknown/unknown_D06D80.4bpp.lz"

	.align 2
gUnknown_D06D80Gbapal:: @ 8D06DC4
	.incbin "graphics/unknown/unknown_D06D80.gbapal.lz"

	.align 2
gUnknown_D06D80Gbapal2:: @ 8D06DD8
	.incbin "graphics/unknown/unknown_D06D80_2.gbapal.lz"

	.align 2
gUnusedObi14bpp:: @ 8D06E0C
	.incbin "graphics/unused/obi1.4bpp.lz"

	.align 2
gUnusedObiPalpak1Gbapal:: @ 8D07170
	.incbin "graphics/unused/obi_palpak1.gbapal.lz"

	.align 2
gUnusedOldPal4Gbapal:: @ 8D071B4
	.incbin "graphics/unused/old_pal4.gbapal.lz"

	.align 2
gUnusedObiPalpak3Gbapal:: @ 8D071CC
	.incbin "graphics/unused/obi_palpak3.gbapal.lz"

	.align 2
gUnusedObi24bpp:: @ 8D07224
	.incbin "graphics/unused/obi2.4bpp.lz"

	.align 2
gUnusedOldBattleInterfaceTilemapBin:: @ 8D077EC
	.incbin "graphics/unused/old_battle_interface_tilemap.bin.lz"

	.align 2
gSprite038Gbapal:: @ 8D078FC
	.incbin "graphics/battle_anims/sprites/038.gbapal.lz"

	.align 2
gSprite039Gbapal:: @ 8D07924
	.incbin "graphics/battle_anims/sprites/039.gbapal.lz"

	.align 2
gSprite0384bpp:: @ 8D0794C
	.incbin "graphics/battle_anims/sprites/038.4bpp.lz"

	.align 2
gSprite0394bpp:: @ 8D07B70
	.incbin "graphics/battle_anims/sprites/039.4bpp.lz"

	.align 2
gSprite0404bpp:: @ 8D07E6C
	.incbin "graphics/battle_anims/sprites/040.4bpp.lz"

	.align 2
gSprite0414bpp:: @ 8D08078
	.incbin "graphics/battle_anims/sprites/041.4bpp.lz"

	.align 2
gIntefacePartyMenuHpBar4bpp:: @ 8D08218
	.incbin "graphics/interface/party_menu_hpbar.4bpp.lz"

	.align 2
gSprite0424bpp:: @ 8D082AC
	.incbin "graphics/battle_anims/sprites/042.4bpp.lz"

	.align 2
gSprite042Gbapal:: @ 8D0857C
	.incbin "graphics/battle_anims/sprites/042.gbapal.lz"

	.align 2
gSprite0434bpp:: @ 8D085A4
	.incbin "graphics/battle_anims/sprites/043.4bpp.lz"

	.align 2
gSprite043Gbapal:: @ 8D089A4
	.incbin "graphics/battle_anims/sprites/043.gbapal.lz"

	.align 2
gSprite044Gbapal:: @ 8D089CC
	.incbin "graphics/battle_anims/sprites/044.gbapal.lz"

	.align 2
gSprite0444bpp:: @ 8D089F4
	.incbin "graphics/battle_anims/sprites/044.4bpp.lz"

	.align 2
gSprite045Gbapal:: @ 8D08C60
	.incbin "graphics/battle_anims/sprites/045.gbapal.lz"

	.align 2
gSprite0454bpp:: @ 8D08C88
	.incbin "graphics/battle_anims/sprites/045.4bpp.lz"

	.align 2
gBattleInterfaceUnusedWindow4bpp:: @ 8D08EF4
	.incbin "graphics/battle_interface/unused_window.4bpp.lz"

	.align 2
gBattleInterfaceUnusedWindowGbapal:: @ 8D093B0
	.incbin "graphics/battle_interface/unused_window.gbapal.lz"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

gUnknown_8D093D8:: @ 8D093D8
	.incbin "baserom.gba", 0xD093D8, 0x87EC

gUnknown_8D11BC4:: @ 8D11BC4
	.incbin "baserom.gba", 0xD11BC4, 0xB660

gUnknown_8D1D224:: @ 8D1D224
	.incbin "baserom.gba", 0xD1D224, 0x13C

gUnknown_8D1D360:: @ 8D1D360
	.incbin "baserom.gba", 0xD1D360, 0x28

gUnknown_8D1D388:: @ 8D1D388
	.incbin "baserom.gba", 0xD1D388, 0x34B4

gUnknown_8D2083C:: @ 8D2083C
	.incbin "baserom.gba", 0xD2083C, 0x1C

gUnknown_8D20858:: @ 8D20858
	.incbin "baserom.gba", 0xD20858, 0x1F8C

gUnknown_8D227E4:: @ 8D227E4
	.incbin "baserom.gba", 0xD227E4, 0xCD0

gUnknown_8D234B4:: @ 8D234B4
	.incbin "baserom.gba", 0xD234B4, 0xA70

gUnknown_8D23F24:: @ 8D23F24
	.incbin "baserom.gba", 0xD23F24, 0x28

gUnknown_8D23F4C:: @ 8D23F4C
	.incbin "baserom.gba", 0xD23F4C, 0xC58

gUnknown_8D24BA4:: @ 8D24BA4
	.incbin "baserom.gba", 0xD24BA4, 0x28

gUnknown_8D24BCC:: @ 8D24BCC
	.incbin "baserom.gba", 0xD24BCC, 0x5C3C

gUnknown_8D2A808:: @ 8D2A808
	.incbin "baserom.gba", 0xD2A808, 0xA0

gUnknown_8D2A8A8:: @ 8D2A8A8
	.incbin "baserom.gba", 0xD2A8A8, 0x18

gUnknown_8D2A8C0:: @ 8D2A8C0
	.incbin "baserom.gba", 0xD2A8C0, 0x27D0

gUnknown_8D2D090:: @ 8D2D090
	.incbin "baserom.gba", 0xD2D090, 0x24

gUnknown_8D2D0B4:: @ 8D2D0B4
	.incbin "baserom.gba", 0xD2D0B4, 0x240

gUnknown_8D2D2F4:: @ 8D2D2F4
	.incbin "baserom.gba", 0xD2D2F4, 0x600

gUnknown_8D2D8F4:: @ 8D2D8F4
	.incbin "baserom.gba", 0xD2D8F4, 0x210

gUnknown_8D2DB04:: @ 8D2DB04
	.incbin "baserom.gba", 0xD2DB04, 0x11C

gUnknown_8D2DC20:: @ 8D2DC20
	.incbin "baserom.gba", 0xD2DC20, 0x11C

gUnknown_8D2DD3C:: @ 8D2DD3C
	.incbin "baserom.gba", 0xD2DD3C, 0x20

gUnknown_8D2DD5C:: @ 8D2DD5C
	.incbin "baserom.gba", 0xD2DD5C, 0x20

gUnknown_8D2DD7C:: @ 8D2DD7C
	.incbin "baserom.gba", 0xD2DD7C, 0x20

gUnknown_8D2DD9C:: @ 8D2DD9C
	.incbin "baserom.gba", 0xD2DD9C, 0x20

gUnknown_8D2DDBC:: @ 8D2DDBC
	.incbin "baserom.gba", 0xD2DDBC, 0x20

gUnknown_8D2DDDC:: @ 8D2DDDC
	.incbin "baserom.gba", 0xD2DDDC, 0x20

gUnknown_8D2DDFC:: @ 8D2DDFC
	.incbin "baserom.gba", 0xD2DDFC, 0x20

gUnknown_8D2DE1C:: @ 8D2DE1C
	.incbin "baserom.gba", 0xD2DE1C, 0x20

gUnknown_8D2DE3C:: @ 8D2DE3C
	.incbin "baserom.gba", 0xD2DE3C, 0x13C

gUnknown_8D2DF78:: @ 8D2DF78
	.incbin "baserom.gba", 0xD2DF78, 0x20

gUnknown_8D2DF98:: @ 8D2DF98
	.incbin "baserom.gba", 0xD2DF98, 0xC8C

gUnknown_8D2EC24:: @ 8D2EC24
	.incbin "baserom.gba", 0xD2EC24, 0x4C

gUnknown_8D2EC70:: @ 8D2EC70
	.incbin "baserom.gba", 0xD2EC70, 0xF44

gUnknown_8D2FBB4:: @ 8D2FBB4
	.incbin "baserom.gba", 0xD2FBB4, 0x20
	

	.align 2
gFile_graphics_pokemon_front_pics_bulbasaur_still_front_pic:: @ 8D2FBD4
	.incbin "graphics/pokemon/front_pics/bulbasaur_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD2FBD4, 0x02A4

	.align 2
gFile_graphics_pokemon_palettes_bulbasaur_palette:: @ 8D2FE78
	.incbin "graphics/pokemon/palettes/bulbasaur_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD2FE78, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_bulbasaur_back_pic:: @ 8D2FEA0
	.incbin "graphics/pokemon/back_pics/bulbasaur_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD2FEA0, 0x02C4

	.align 2
gFile_graphics_pokemon_palettes_bulbasaur_shiny_palette:: @ 8D30164
	.incbin "graphics/pokemon/palettes/bulbasaur_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD30164, 0x0028

	.align 2
gFile_graphics_pokemon_icons_bulbasaur_icon:: @ 8D3018C
	.incbin "graphics/pokemon/icons/bulbasaur_icon.4bpp"
	@ .incbin "baserom.gba", 0xD3018C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_bulbasaur_footprint:: @ 8D3058C
	.incbin "graphics/pokemon/footprints/bulbasaur_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD3058C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ivysaur_still_front_pic:: @ 8D305AC
	.incbin "graphics/pokemon/front_pics/ivysaur_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD305AC, 0x033C

	.align 2
gFile_graphics_pokemon_palettes_ivysaur_palette:: @ 8D308E8
	.incbin "graphics/pokemon/palettes/ivysaur_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD308E8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ivysaur_back_pic:: @ 8D30910
	.incbin "graphics/pokemon/back_pics/ivysaur_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD30910, 0x0354

	.align 2
gFile_graphics_pokemon_palettes_ivysaur_shiny_palette:: @ 8D30C64
	.incbin "graphics/pokemon/palettes/ivysaur_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD30C64, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ivysaur_icon:: @ 8D30C8C
	.incbin "graphics/pokemon/icons/ivysaur_icon.4bpp"
	@ .incbin "baserom.gba", 0xD30C8C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ivysaur_footprint:: @ 8D3108C
	.incbin "graphics/pokemon/footprints/ivysaur_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD3108C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_venusaur_still_front_pic:: @ 8D310AC
	.incbin "graphics/pokemon/front_pics/venusaur_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD310AC, 0x0540

	.align 2
gFile_graphics_pokemon_palettes_venusaur_palette:: @ 8D315EC
	.incbin "graphics/pokemon/palettes/venusaur_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD315EC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_venusaur_back_pic:: @ 8D31614
	.incbin "graphics/pokemon/back_pics/venusaur_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD31614, 0x04C8

	.align 2
gFile_graphics_pokemon_palettes_venusaur_shiny_palette:: @ 8D31ADC
	.incbin "graphics/pokemon/palettes/venusaur_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD31ADC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_venusaur_icon:: @ 8D31B04
	.incbin "graphics/pokemon/icons/venusaur_icon.4bpp"
	@ .incbin "baserom.gba", 0xD31B04, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_venusaur_footprint:: @ 8D31F04
	.incbin "graphics/pokemon/footprints/venusaur_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD31F04, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_charmander_still_front_pic:: @ 8D31F24
	.incbin "graphics/pokemon/front_pics/charmander_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD31F24, 0x02A0

	.align 2
gFile_graphics_pokemon_palettes_charmander_palette:: @ 8D321C4
	.incbin "graphics/pokemon/palettes/charmander_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD321C4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_charmander_back_pic:: @ 8D321EC
	.incbin "graphics/pokemon/back_pics/charmander_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD321EC, 0x0284

	.align 2
gFile_graphics_pokemon_palettes_charmander_shiny_palette:: @ 8D32470
	.incbin "graphics/pokemon/palettes/charmander_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD32470, 0x0028

	.align 2
gFile_graphics_pokemon_icons_charmander_icon:: @ 8D32498
	.incbin "graphics/pokemon/icons/charmander_icon.4bpp"
	@ .incbin "baserom.gba", 0xD32498, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_charmander_footprint:: @ 8D32898
	.incbin "graphics/pokemon/footprints/charmander_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD32898, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_charmeleon_still_front_pic:: @ 8D328B8
	.incbin "graphics/pokemon/front_pics/charmeleon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD328B8, 0x03AC

	.align 2
gFile_graphics_pokemon_palettes_charmeleon_palette:: @ 8D32C64
	.incbin "graphics/pokemon/palettes/charmeleon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD32C64, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_charmeleon_back_pic:: @ 8D32C8C
	.incbin "graphics/pokemon/back_pics/charmeleon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD32C8C, 0x02F4

	.align 2
gFile_graphics_pokemon_palettes_charmeleon_shiny_palette:: @ 8D32F80
	.incbin "graphics/pokemon/palettes/charmeleon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD32F80, 0x0028

	.align 2
gFile_graphics_pokemon_icons_charmeleon_icon:: @ 8D32FA8
	.incbin "graphics/pokemon/icons/charmeleon_icon.4bpp"
	@ .incbin "baserom.gba", 0xD32FA8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_charmeleon_footprint:: @ 8D333A8
	.incbin "graphics/pokemon/footprints/charmeleon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD333A8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_charizard_still_front_pic:: @ 8D333C8
	.incbin "graphics/pokemon/front_pics/charizard_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD333C8, 0x04FC

	.align 2
gFile_graphics_pokemon_palettes_charizard_palette:: @ 8D338C4
	.incbin "graphics/pokemon/palettes/charizard_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD338C4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_charizard_back_pic:: @ 8D338EC
	.incbin "graphics/pokemon/back_pics/charizard_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD338EC, 0x040C

	.align 2
gFile_graphics_pokemon_palettes_charizard_shiny_palette:: @ 8D33CF8
	.incbin "graphics/pokemon/palettes/charizard_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD33CF8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_charizard_icon:: @ 8D33D20
	.incbin "graphics/pokemon/icons/charizard_icon.4bpp"
	@ .incbin "baserom.gba", 0xD33D20, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_charizard_footprint:: @ 8D34120
	.incbin "graphics/pokemon/footprints/charizard_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD34120, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_squirtle_still_front_pic:: @ 8D34140
	.incbin "graphics/pokemon/front_pics/squirtle_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD34140, 0x029C

	.align 2
gFile_graphics_pokemon_palettes_squirtle_palette:: @ 8D343DC
	.incbin "graphics/pokemon/palettes/squirtle_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD343DC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_squirtle_back_pic:: @ 8D34404
	.incbin "graphics/pokemon/back_pics/squirtle_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD34404, 0x0288

	.align 2
gFile_graphics_pokemon_palettes_squirtle_shiny_palette:: @ 8D3468C
	.incbin "graphics/pokemon/palettes/squirtle_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3468C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_squirtle_icon:: @ 8D346B4
	.incbin "graphics/pokemon/icons/squirtle_icon.4bpp"
	@ .incbin "baserom.gba", 0xD346B4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_squirtle_footprint:: @ 8D34AB4
	.incbin "graphics/pokemon/footprints/squirtle_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD34AB4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_wartortle_still_front_pic:: @ 8D34AD4
	.incbin "graphics/pokemon/front_pics/wartortle_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD34AD4, 0x03AC

	.align 2
gFile_graphics_pokemon_palettes_wartortle_palette:: @ 8D34E80
	.incbin "graphics/pokemon/palettes/wartortle_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD34E80, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_wartortle_back_pic:: @ 8D34EA8
	.incbin "graphics/pokemon/back_pics/wartortle_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD34EA8, 0x0348

	.align 2
gFile_graphics_pokemon_palettes_wartortle_shiny_palette:: @ 8D351F0
	.incbin "graphics/pokemon/palettes/wartortle_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD351F0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_wartortle_icon:: @ 8D35218
	.incbin "graphics/pokemon/icons/wartortle_icon.4bpp"
	@ .incbin "baserom.gba", 0xD35218, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_wartortle_footprint:: @ 8D35618
	.incbin "graphics/pokemon/footprints/wartortle_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD35618, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_blastoise_still_front_pic:: @ 8D35638
	.incbin "graphics/pokemon/front_pics/blastoise_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD35638, 0x0504

	.align 2
gFile_graphics_pokemon_palettes_blastoise_palette:: @ 8D35B3C
	.incbin "graphics/pokemon/palettes/blastoise_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD35B3C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_blastoise_back_pic:: @ 8D35B64
	.incbin "graphics/pokemon/back_pics/blastoise_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD35B64, 0x0414

	.align 2
gFile_graphics_pokemon_palettes_blastoise_shiny_palette:: @ 8D35F78
	.incbin "graphics/pokemon/palettes/blastoise_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD35F78, 0x0028

	.align 2
gFile_graphics_pokemon_icons_blastoise_icon:: @ 8D35FA0
	.incbin "graphics/pokemon/icons/blastoise_icon.4bpp"
	@ .incbin "baserom.gba", 0xD35FA0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_blastoise_footprint:: @ 8D363A0
	.incbin "graphics/pokemon/footprints/blastoise_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD363A0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_caterpie_still_front_pic:: @ 8D363C0
	.incbin "graphics/pokemon/front_pics/caterpie_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD363C0, 0x0258

	.align 2
gFile_graphics_pokemon_palettes_caterpie_palette:: @ 8D36618
	.incbin "graphics/pokemon/palettes/caterpie_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD36618, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_caterpie_back_pic:: @ 8D36640
	.incbin "graphics/pokemon/back_pics/caterpie_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD36640, 0x0288

	.align 2
gFile_graphics_pokemon_palettes_caterpie_shiny_palette:: @ 8D368C8
	.incbin "graphics/pokemon/palettes/caterpie_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD368C8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_caterpie_icon:: @ 8D368F0
	.incbin "graphics/pokemon/icons/caterpie_icon.4bpp"
	@ .incbin "baserom.gba", 0xD368F0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_caterpie_footprint:: @ 8D36CF0
	.incbin "graphics/pokemon/footprints/caterpie_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD36CF0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_metapod_still_front_pic:: @ 8D36D10
	.incbin "graphics/pokemon/front_pics/metapod_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD36D10, 0x021C

	.align 2
gFile_graphics_pokemon_palettes_metapod_palette:: @ 8D36F2C
	.incbin "graphics/pokemon/palettes/metapod_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD36F2C, 0x0020

	.align 2
gFile_graphics_pokemon_back_pics_metapod_back_pic:: @ 8D36F4C
	.incbin "graphics/pokemon/back_pics/metapod_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD36F4C, 0x021C

	.align 2
gFile_graphics_pokemon_palettes_metapod_shiny_palette:: @ 8D37168
	.incbin "graphics/pokemon/palettes/metapod_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD37168, 0x0020

	.align 2
gFile_graphics_pokemon_icons_metapod_icon:: @ 8D37188
	.incbin "graphics/pokemon/icons/metapod_icon.4bpp"
	@ .incbin "baserom.gba", 0xD37188, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_metapod_footprint:: @ 8D37588
	.incbin "graphics/pokemon/footprints/metapod_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD37588, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_butterfree_still_front_pic:: @ 8D375A8
	.incbin "graphics/pokemon/front_pics/butterfree_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD375A8, 0x0378

	.align 2
gFile_graphics_pokemon_palettes_butterfree_palette:: @ 8D37920
	.incbin "graphics/pokemon/palettes/butterfree_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD37920, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_butterfree_back_pic:: @ 8D37948
	.incbin "graphics/pokemon/back_pics/butterfree_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD37948, 0x0404

	.align 2
gFile_graphics_pokemon_palettes_butterfree_shiny_palette:: @ 8D37D4C
	.incbin "graphics/pokemon/palettes/butterfree_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD37D4C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_butterfree_icon:: @ 8D37D74
	.incbin "graphics/pokemon/icons/butterfree_icon.4bpp"
	@ .incbin "baserom.gba", 0xD37D74, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_butterfree_footprint:: @ 8D38174
	.incbin "graphics/pokemon/footprints/butterfree_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD38174, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_weedle_still_front_pic:: @ 8D38194
	.incbin "graphics/pokemon/front_pics/weedle_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD38194, 0x023C

	.align 2
gFile_graphics_pokemon_palettes_weedle_palette:: @ 8D383D0
	.incbin "graphics/pokemon/palettes/weedle_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD383D0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_weedle_back_pic:: @ 8D383F8
	.incbin "graphics/pokemon/back_pics/weedle_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD383F8, 0x0268

	.align 2
gFile_graphics_pokemon_palettes_weedle_shiny_palette:: @ 8D38660
	.incbin "graphics/pokemon/palettes/weedle_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD38660, 0x0028

	.align 2
gFile_graphics_pokemon_icons_weedle_icon:: @ 8D38688
	.incbin "graphics/pokemon/icons/weedle_icon.4bpp"
	@ .incbin "baserom.gba", 0xD38688, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_weedle_footprint:: @ 8D38A88
	.incbin "graphics/pokemon/footprints/weedle_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD38A88, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_kakuna_still_front_pic:: @ 8D38AA8
	.incbin "graphics/pokemon/front_pics/kakuna_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD38AA8, 0x0240

	.align 2
gFile_graphics_pokemon_palettes_kakuna_palette:: @ 8D38CE8
	.incbin "graphics/pokemon/palettes/kakuna_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD38CE8, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_kakuna_back_pic:: @ 8D38D0C
	.incbin "graphics/pokemon/back_pics/kakuna_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD38D0C, 0x0284

	.align 2
gFile_graphics_pokemon_palettes_kakuna_shiny_palette:: @ 8D38F90
	.incbin "graphics/pokemon/palettes/kakuna_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD38F90, 0x0024

	.align 2
gFile_graphics_pokemon_icons_kakuna_icon:: @ 8D38FB4
	.incbin "graphics/pokemon/icons/kakuna_icon.4bpp"
	@ .incbin "baserom.gba", 0xD38FB4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_kakuna_footprint:: @ 8D393B4
	.incbin "graphics/pokemon/footprints/kakuna_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD393B4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_beedrill_still_front_pic:: @ 8D393D4
	.incbin "graphics/pokemon/front_pics/beedrill_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD393D4, 0x0420

	.align 2
gFile_graphics_pokemon_palettes_beedrill_palette:: @ 8D397F4
	.incbin "graphics/pokemon/palettes/beedrill_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD397F4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_beedrill_back_pic:: @ 8D3981C
	.incbin "graphics/pokemon/back_pics/beedrill_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3981C, 0x0374

	.align 2
gFile_graphics_pokemon_palettes_beedrill_shiny_palette:: @ 8D39B90
	.incbin "graphics/pokemon/palettes/beedrill_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD39B90, 0x0028

	.align 2
gFile_graphics_pokemon_icons_beedrill_icon:: @ 8D39BB8
	.incbin "graphics/pokemon/icons/beedrill_icon.4bpp"
	@ .incbin "baserom.gba", 0xD39BB8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_beedrill_footprint:: @ 8D39FB8
	.incbin "graphics/pokemon/footprints/beedrill_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD39FB8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_pidgey_still_front_pic:: @ 8D39FD8
	.incbin "graphics/pokemon/front_pics/pidgey_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD39FD8, 0x0278

	.align 2
gFile_graphics_pokemon_palettes_pidgey_palette:: @ 8D3A250
	.incbin "graphics/pokemon/palettes/pidgey_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3A250, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_pidgey_back_pic:: @ 8D3A278
	.incbin "graphics/pokemon/back_pics/pidgey_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3A278, 0x0354

	.align 2
gFile_graphics_pokemon_palettes_pidgey_shiny_palette:: @ 8D3A5CC
	.incbin "graphics/pokemon/palettes/pidgey_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3A5CC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_pidgey_icon:: @ 8D3A5F4
	.incbin "graphics/pokemon/icons/pidgey_icon.4bpp"
	@ .incbin "baserom.gba", 0xD3A5F4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_pidgey_footprint:: @ 8D3A9F4
	.incbin "graphics/pokemon/footprints/pidgey_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD3A9F4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_pidgeotto_still_front_pic:: @ 8D3AA14
	.incbin "graphics/pokemon/front_pics/pidgeotto_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3AA14, 0x0398

	.align 2
gFile_graphics_pokemon_palettes_pidgeotto_palette:: @ 8D3ADAC
	.incbin "graphics/pokemon/palettes/pidgeotto_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3ADAC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_pidgeotto_back_pic:: @ 8D3ADD4
	.incbin "graphics/pokemon/back_pics/pidgeotto_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3ADD4, 0x034C

	.align 2
gFile_graphics_pokemon_palettes_pidgeotto_shiny_palette:: @ 8D3B120
	.incbin "graphics/pokemon/palettes/pidgeotto_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3B120, 0x0028

	.align 2
gFile_graphics_pokemon_icons_pidgeotto_icon:: @ 8D3B148
	.incbin "graphics/pokemon/icons/pidgeotto_icon.4bpp"
	@ .incbin "baserom.gba", 0xD3B148, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_pidgeotto_footprint:: @ 8D3B548
	.incbin "graphics/pokemon/footprints/pidgeotto_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD3B548, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_pidgeot_still_front_pic:: @ 8D3B568
	.incbin "graphics/pokemon/front_pics/pidgeot_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3B568, 0x04EC

	.align 2
gFile_graphics_pokemon_palettes_pidgeot_palette:: @ 8D3BA54
	.incbin "graphics/pokemon/palettes/pidgeot_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3BA54, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_pidgeot_back_pic:: @ 8D3BA7C
	.incbin "graphics/pokemon/back_pics/pidgeot_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3BA7C, 0x03E8

	.align 2
gFile_graphics_pokemon_palettes_pidgeot_shiny_palette:: @ 8D3BE64
	.incbin "graphics/pokemon/palettes/pidgeot_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3BE64, 0x0028

	.align 2
gFile_graphics_pokemon_icons_pidgeot_icon:: @ 8D3BE8C
	.incbin "graphics/pokemon/icons/pidgeot_icon.4bpp"
	@ .incbin "baserom.gba", 0xD3BE8C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_pidgeot_footprint:: @ 8D3C28C
	.incbin "graphics/pokemon/footprints/pidgeot_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD3C28C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_rattata_still_front_pic:: @ 8D3C2AC
	.incbin "graphics/pokemon/front_pics/rattata_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3C2AC, 0x0258

	.align 2
gFile_graphics_pokemon_palettes_rattata_palette:: @ 8D3C504
	.incbin "graphics/pokemon/palettes/rattata_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3C504, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_rattata_back_pic:: @ 8D3C52C
	.incbin "graphics/pokemon/back_pics/rattata_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3C52C, 0x02B8

	.align 2
gFile_graphics_pokemon_palettes_rattata_shiny_palette:: @ 8D3C7E4
	.incbin "graphics/pokemon/palettes/rattata_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3C7E4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_rattata_icon:: @ 8D3C80C
	.incbin "graphics/pokemon/icons/rattata_icon.4bpp"
	@ .incbin "baserom.gba", 0xD3C80C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_rattata_footprint:: @ 8D3CC0C
	.incbin "graphics/pokemon/footprints/rattata_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD3CC0C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_raticate_still_front_pic:: @ 8D3CC2C
	.incbin "graphics/pokemon/front_pics/raticate_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3CC2C, 0x0390

	.align 2
gFile_graphics_pokemon_palettes_raticate_palette:: @ 8D3CFBC
	.incbin "graphics/pokemon/palettes/raticate_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3CFBC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_raticate_back_pic:: @ 8D3CFE4
	.incbin "graphics/pokemon/back_pics/raticate_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3CFE4, 0x0310

	.align 2
gFile_graphics_pokemon_palettes_raticate_shiny_palette:: @ 8D3D2F4
	.incbin "graphics/pokemon/palettes/raticate_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3D2F4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_raticate_icon:: @ 8D3D31C
	.incbin "graphics/pokemon/icons/raticate_icon.4bpp"
	@ .incbin "baserom.gba", 0xD3D31C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_raticate_footprint:: @ 8D3D71C
	.incbin "graphics/pokemon/footprints/raticate_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD3D71C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_spearow_still_front_pic:: @ 8D3D73C
	.incbin "graphics/pokemon/front_pics/spearow_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3D73C, 0x02C0

	.align 2
gFile_graphics_pokemon_palettes_spearow_palette:: @ 8D3D9FC
	.incbin "graphics/pokemon/palettes/spearow_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3D9FC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_spearow_back_pic:: @ 8D3DA24
	.incbin "graphics/pokemon/back_pics/spearow_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3DA24, 0x02DC

	.align 2
gFile_graphics_pokemon_palettes_spearow_shiny_palette:: @ 8D3DD00
	.incbin "graphics/pokemon/palettes/spearow_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3DD00, 0x0028

	.align 2
gFile_graphics_pokemon_icons_spearow_icon:: @ 8D3DD28
	.incbin "graphics/pokemon/icons/spearow_icon.4bpp"
	@ .incbin "baserom.gba", 0xD3DD28, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_spearow_footprint:: @ 8D3E128
	.incbin "graphics/pokemon/footprints/spearow_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD3E128, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_fearow_still_front_pic:: @ 8D3E148
	.incbin "graphics/pokemon/front_pics/fearow_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3E148, 0x04BC

	.align 2
gFile_graphics_pokemon_palettes_fearow_palette:: @ 8D3E604
	.incbin "graphics/pokemon/palettes/fearow_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3E604, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_fearow_back_pic:: @ 8D3E62C
	.incbin "graphics/pokemon/back_pics/fearow_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3E62C, 0x02F8

	.align 2
gFile_graphics_pokemon_palettes_fearow_shiny_palette:: @ 8D3E924
	.incbin "graphics/pokemon/palettes/fearow_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3E924, 0x0028

	.align 2
gFile_graphics_pokemon_icons_fearow_icon:: @ 8D3E94C
	.incbin "graphics/pokemon/icons/fearow_icon.4bpp"
	@ .incbin "baserom.gba", 0xD3E94C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_fearow_footprint:: @ 8D3ED4C
	.incbin "graphics/pokemon/footprints/fearow_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD3ED4C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ekans_still_front_pic:: @ 8D3ED6C
	.incbin "graphics/pokemon/front_pics/ekans_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3ED6C, 0x02C8

	.align 2
gFile_graphics_pokemon_palettes_ekans_palette:: @ 8D3F034
	.incbin "graphics/pokemon/palettes/ekans_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3F034, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ekans_back_pic:: @ 8D3F05C
	.incbin "graphics/pokemon/back_pics/ekans_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3F05C, 0x02F0

	.align 2
gFile_graphics_pokemon_palettes_ekans_shiny_palette:: @ 8D3F34C
	.incbin "graphics/pokemon/palettes/ekans_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3F34C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ekans_icon:: @ 8D3F374
	.incbin "graphics/pokemon/icons/ekans_icon.4bpp"
	@ .incbin "baserom.gba", 0xD3F374, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ekans_footprint:: @ 8D3F774
	.incbin "graphics/pokemon/footprints/ekans_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD3F774, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_arbok_still_front_pic:: @ 8D3F794
	.incbin "graphics/pokemon/front_pics/arbok_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3F794, 0x0474

	.align 2
gFile_graphics_pokemon_palettes_arbok_palette:: @ 8D3FC08
	.incbin "graphics/pokemon/palettes/arbok_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3FC08, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_arbok_back_pic:: @ 8D3FC30
	.incbin "graphics/pokemon/back_pics/arbok_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD3FC30, 0x0288

	.align 2
gFile_graphics_pokemon_palettes_arbok_shiny_palette:: @ 8D3FEB8
	.incbin "graphics/pokemon/palettes/arbok_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD3FEB8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_arbok_icon:: @ 8D3FEE0
	.incbin "graphics/pokemon/icons/arbok_icon.4bpp"
	@ .incbin "baserom.gba", 0xD3FEE0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_arbok_footprint:: @ 8D402E0
	.incbin "graphics/pokemon/footprints/arbok_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD402E0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_pikachu_still_front_pic:: @ 8D40300
	.incbin "graphics/pokemon/front_pics/pikachu_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD40300, 0x02D0

	.align 2
gFile_graphics_pokemon_palettes_pikachu_palette:: @ 8D405D0
	.incbin "graphics/pokemon/palettes/pikachu_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD405D0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_pikachu_back_pic:: @ 8D405F8
	.incbin "graphics/pokemon/back_pics/pikachu_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD405F8, 0x02D8

	.align 2
gFile_graphics_pokemon_palettes_pikachu_shiny_palette:: @ 8D408D0
	.incbin "graphics/pokemon/palettes/pikachu_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD408D0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_pikachu_icon:: @ 8D408F8
	.incbin "graphics/pokemon/icons/pikachu_icon.4bpp"
	@ .incbin "baserom.gba", 0xD408F8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_pikachu_footprint:: @ 8D40CF8
	.incbin "graphics/pokemon/footprints/pikachu_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD40CF8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_raichu_still_front_pic:: @ 8D40D18
	.incbin "graphics/pokemon/front_pics/raichu_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD40D18, 0x03F8

	.align 2
gFile_graphics_pokemon_palettes_raichu_palette:: @ 8D41110
	.incbin "graphics/pokemon/palettes/raichu_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD41110, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_raichu_back_pic:: @ 8D41138
	.incbin "graphics/pokemon/back_pics/raichu_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD41138, 0x0320

	.align 2
gFile_graphics_pokemon_palettes_raichu_shiny_palette:: @ 8D41458
	.incbin "graphics/pokemon/palettes/raichu_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD41458, 0x0028

	.align 2
gFile_graphics_pokemon_icons_raichu_icon:: @ 8D41480
	.incbin "graphics/pokemon/icons/raichu_icon.4bpp"
	@ .incbin "baserom.gba", 0xD41480, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_raichu_footprint:: @ 8D41880
	.incbin "graphics/pokemon/footprints/raichu_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD41880, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sandshrew_still_front_pic:: @ 8D418A0
	.incbin "graphics/pokemon/front_pics/sandshrew_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD418A0, 0x02DC

	.align 2
gFile_graphics_pokemon_palettes_sandshrew_palette:: @ 8D41B7C
	.incbin "graphics/pokemon/palettes/sandshrew_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD41B7C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sandshrew_back_pic:: @ 8D41BA4
	.incbin "graphics/pokemon/back_pics/sandshrew_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD41BA4, 0x0328

	.align 2
gFile_graphics_pokemon_palettes_sandshrew_shiny_palette:: @ 8D41ECC
	.incbin "graphics/pokemon/palettes/sandshrew_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD41ECC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sandshrew_icon:: @ 8D41EF4
	.incbin "graphics/pokemon/icons/sandshrew_icon.4bpp"
	@ .incbin "baserom.gba", 0xD41EF4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sandshrew_footprint:: @ 8D422F4
	.incbin "graphics/pokemon/footprints/sandshrew_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD422F4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sandslash_still_front_pic:: @ 8D42314
	.incbin "graphics/pokemon/front_pics/sandslash_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD42314, 0x0418

	.align 2
gFile_graphics_pokemon_palettes_sandslash_palette:: @ 8D4272C
	.incbin "graphics/pokemon/palettes/sandslash_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4272C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sandslash_back_pic:: @ 8D42754
	.incbin "graphics/pokemon/back_pics/sandslash_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD42754, 0x041C

	.align 2
gFile_graphics_pokemon_palettes_sandslash_shiny_palette:: @ 8D42B70
	.incbin "graphics/pokemon/palettes/sandslash_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD42B70, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sandslash_icon:: @ 8D42B98
	.incbin "graphics/pokemon/icons/sandslash_icon.4bpp"
	@ .incbin "baserom.gba", 0xD42B98, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sandslash_footprint:: @ 8D42F98
	.incbin "graphics/pokemon/footprints/sandslash_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD42F98, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_nidoran_f_still_front_pic:: @ 8D42FB8
	.incbin "graphics/pokemon/front_pics/nidoran_f_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD42FB8, 0x0264

	.align 2
gFile_graphics_pokemon_palettes_nidoran_f_palette:: @ 8D4321C
	.incbin "graphics/pokemon/palettes/nidoran_f_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4321C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_nidoran_f_back_pic:: @ 8D43244
	.incbin "graphics/pokemon/back_pics/nidoran_f_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD43244, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_nidoran_f_shiny_palette:: @ 8D43524
	.incbin "graphics/pokemon/palettes/nidoran_f_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD43524, 0x0028

	.align 2
gFile_graphics_pokemon_icons_nidoran_f_icon:: @ 8D4354C
	.incbin "graphics/pokemon/icons/nidoran_f_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4354C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_nidoran_f_footprint:: @ 8D4394C
	.incbin "graphics/pokemon/footprints/nidoran_f_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4394C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_nidorina_still_front_pic:: @ 8D4396C
	.incbin "graphics/pokemon/front_pics/nidorina_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4396C, 0x0320

	.align 2
gFile_graphics_pokemon_palettes_nidorina_palette:: @ 8D43C8C
	.incbin "graphics/pokemon/palettes/nidorina_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD43C8C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_nidorina_back_pic:: @ 8D43CB4
	.incbin "graphics/pokemon/back_pics/nidorina_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD43CB4, 0x0394

	.align 2
gFile_graphics_pokemon_palettes_nidorina_shiny_palette:: @ 8D44048
	.incbin "graphics/pokemon/palettes/nidorina_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD44048, 0x0028

	.align 2
gFile_graphics_pokemon_icons_nidorina_icon:: @ 8D44070
	.incbin "graphics/pokemon/icons/nidorina_icon.4bpp"
	@ .incbin "baserom.gba", 0xD44070, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_nidorina_footprint:: @ 8D44470
	.incbin "graphics/pokemon/footprints/nidorina_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD44470, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_nidoqueen_still_front_pic:: @ 8D44490
	.incbin "graphics/pokemon/front_pics/nidoqueen_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD44490, 0x042C

	.align 2
gFile_graphics_pokemon_palettes_nidoqueen_palette:: @ 8D448BC
	.incbin "graphics/pokemon/palettes/nidoqueen_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD448BC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_nidoqueen_back_pic:: @ 8D448E4
	.incbin "graphics/pokemon/back_pics/nidoqueen_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD448E4, 0x03C4

	.align 2
gFile_graphics_pokemon_palettes_nidoqueen_shiny_palette:: @ 8D44CA8
	.incbin "graphics/pokemon/palettes/nidoqueen_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD44CA8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_nidoqueen_icon:: @ 8D44CD0
	.incbin "graphics/pokemon/icons/nidoqueen_icon.4bpp"
	@ .incbin "baserom.gba", 0xD44CD0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_nidoqueen_footprint:: @ 8D450D0
	.incbin "graphics/pokemon/footprints/nidoqueen_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD450D0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_nidoran_m_still_front_pic:: @ 8D450F0
	.incbin "graphics/pokemon/front_pics/nidoran_m_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD450F0, 0x028C

	.align 2
gFile_graphics_pokemon_palettes_nidoran_m_palette:: @ 8D4537C
	.incbin "graphics/pokemon/palettes/nidoran_m_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4537C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_nidoran_m_back_pic:: @ 8D453A4
	.incbin "graphics/pokemon/back_pics/nidoran_m_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD453A4, 0x0334

	.align 2
gFile_graphics_pokemon_palettes_nidoran_m_shiny_palette:: @ 8D456D8
	.incbin "graphics/pokemon/palettes/nidoran_m_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD456D8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_nidoran_m_icon:: @ 8D45700
	.incbin "graphics/pokemon/icons/nidoran_m_icon.4bpp"
	@ .incbin "baserom.gba", 0xD45700, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_nidoran_m_footprint:: @ 8D45B00
	.incbin "graphics/pokemon/footprints/nidoran_m_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD45B00, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_nidorino_still_front_pic:: @ 8D45B20
	.incbin "graphics/pokemon/front_pics/nidorino_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD45B20, 0x0384

	.align 2
gFile_graphics_pokemon_palettes_nidorino_palette:: @ 8D45EA4
	.incbin "graphics/pokemon/palettes/nidorino_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD45EA4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_nidorino_back_pic:: @ 8D45ECC
	.incbin "graphics/pokemon/back_pics/nidorino_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD45ECC, 0x03BC

	.align 2
gFile_graphics_pokemon_palettes_nidorino_shiny_palette:: @ 8D46288
	.incbin "graphics/pokemon/palettes/nidorino_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD46288, 0x0028

	.align 2
gFile_graphics_pokemon_icons_nidorino_icon:: @ 8D462B0
	.incbin "graphics/pokemon/icons/nidorino_icon.4bpp"
	@ .incbin "baserom.gba", 0xD462B0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_nidorino_footprint:: @ 8D466B0
	.incbin "graphics/pokemon/footprints/nidorino_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD466B0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_nidoking_still_front_pic:: @ 8D466D0
	.incbin "graphics/pokemon/front_pics/nidoking_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD466D0, 0x053C

	.align 2
gFile_graphics_pokemon_palettes_nidoking_palette:: @ 8D46C0C
	.incbin "graphics/pokemon/palettes/nidoking_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD46C0C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_nidoking_back_pic:: @ 8D46C34
	.incbin "graphics/pokemon/back_pics/nidoking_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD46C34, 0x043C

	.align 2
gFile_graphics_pokemon_palettes_nidoking_shiny_palette:: @ 8D47070
	.incbin "graphics/pokemon/palettes/nidoking_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD47070, 0x0028

	.align 2
gFile_graphics_pokemon_icons_nidoking_icon:: @ 8D47098
	.incbin "graphics/pokemon/icons/nidoking_icon.4bpp"
	@ .incbin "baserom.gba", 0xD47098, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_nidoking_footprint:: @ 8D47498
	.incbin "graphics/pokemon/footprints/nidoking_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD47498, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_clefairy_still_front_pic:: @ 8D474B8
	.incbin "graphics/pokemon/front_pics/clefairy_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD474B8, 0x029C

	.align 2
gFile_graphics_pokemon_palettes_clefairy_palette:: @ 8D47754
	.incbin "graphics/pokemon/palettes/clefairy_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD47754, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_clefairy_back_pic:: @ 8D4777C
	.incbin "graphics/pokemon/back_pics/clefairy_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4777C, 0x02D0

	.align 2
gFile_graphics_pokemon_palettes_clefairy_shiny_palette:: @ 8D47A4C
	.incbin "graphics/pokemon/palettes/clefairy_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD47A4C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_clefairy_icon:: @ 8D47A74
	.incbin "graphics/pokemon/icons/clefairy_icon.4bpp"
	@ .incbin "baserom.gba", 0xD47A74, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_clefairy_footprint:: @ 8D47E74
	.incbin "graphics/pokemon/footprints/clefairy_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD47E74, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_clefable_still_front_pic:: @ 8D47E94
	.incbin "graphics/pokemon/front_pics/clefable_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD47E94, 0x0340

	.align 2
gFile_graphics_pokemon_palettes_clefable_palette:: @ 8D481D4
	.incbin "graphics/pokemon/palettes/clefable_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD481D4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_clefable_back_pic:: @ 8D481FC
	.incbin "graphics/pokemon/back_pics/clefable_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD481FC, 0x0338

	.align 2
gFile_graphics_pokemon_palettes_clefable_shiny_palette:: @ 8D48534
	.incbin "graphics/pokemon/palettes/clefable_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD48534, 0x0028

	.align 2
gFile_graphics_pokemon_icons_clefable_icon:: @ 8D4855C
	.incbin "graphics/pokemon/icons/clefable_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4855C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_clefable_footprint:: @ 8D4895C
	.incbin "graphics/pokemon/footprints/clefable_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4895C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_vulpix_still_front_pic:: @ 8D4897C
	.incbin "graphics/pokemon/front_pics/vulpix_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4897C, 0x032C

	.align 2
gFile_graphics_pokemon_palettes_vulpix_palette:: @ 8D48CA8
	.incbin "graphics/pokemon/palettes/vulpix_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD48CA8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_vulpix_back_pic:: @ 8D48CD0
	.incbin "graphics/pokemon/back_pics/vulpix_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD48CD0, 0x0304

	.align 2
gFile_graphics_pokemon_palettes_vulpix_shiny_palette:: @ 8D48FD4
	.incbin "graphics/pokemon/palettes/vulpix_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD48FD4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_vulpix_icon:: @ 8D48FFC
	.incbin "graphics/pokemon/icons/vulpix_icon.4bpp"
	@ .incbin "baserom.gba", 0xD48FFC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_vulpix_footprint:: @ 8D493FC
	.incbin "graphics/pokemon/footprints/vulpix_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD493FC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ninetales_still_front_pic:: @ 8D4941C
	.incbin "graphics/pokemon/front_pics/ninetales_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4941C, 0x0454

	.align 2
gFile_graphics_pokemon_palettes_ninetales_palette:: @ 8D49870
	.incbin "graphics/pokemon/palettes/ninetales_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD49870, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_ninetales_back_pic:: @ 8D49894
	.incbin "graphics/pokemon/back_pics/ninetales_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD49894, 0x03F0

	.align 2
gFile_graphics_pokemon_palettes_ninetales_shiny_palette:: @ 8D49C84
	.incbin "graphics/pokemon/palettes/ninetales_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD49C84, 0x0024

	.align 2
gFile_graphics_pokemon_icons_ninetales_icon:: @ 8D49CA8
	.incbin "graphics/pokemon/icons/ninetales_icon.4bpp"
	@ .incbin "baserom.gba", 0xD49CA8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ninetales_footprint:: @ 8D4A0A8
	.incbin "graphics/pokemon/footprints/ninetales_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4A0A8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_jigglypuff_still_front_pic:: @ 8D4A0C8
	.incbin "graphics/pokemon/front_pics/jigglypuff_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4A0C8, 0x0284

	.align 2
gFile_graphics_pokemon_palettes_jigglypuff_palette:: @ 8D4A34C
	.incbin "graphics/pokemon/palettes/jigglypuff_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4A34C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_jigglypuff_back_pic:: @ 8D4A374
	.incbin "graphics/pokemon/back_pics/jigglypuff_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4A374, 0x025C

	.align 2
gFile_graphics_pokemon_palettes_jigglypuff_shiny_palette:: @ 8D4A5D0
	.incbin "graphics/pokemon/palettes/jigglypuff_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4A5D0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_jigglypuff_icon:: @ 8D4A5F8
	.incbin "graphics/pokemon/icons/jigglypuff_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4A5F8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_jigglypuff_footprint:: @ 8D4A9F8
	.incbin "graphics/pokemon/footprints/jigglypuff_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4A9F8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_wigglytuff_still_front_pic:: @ 8D4AA18
	.incbin "graphics/pokemon/front_pics/wigglytuff_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4AA18, 0x0374

	.align 2
gFile_graphics_pokemon_palettes_wigglytuff_palette:: @ 8D4AD8C
	.incbin "graphics/pokemon/palettes/wigglytuff_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4AD8C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_wigglytuff_back_pic:: @ 8D4ADB4
	.incbin "graphics/pokemon/back_pics/wigglytuff_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4ADB4, 0x0298

	.align 2
gFile_graphics_pokemon_palettes_wigglytuff_shiny_palette:: @ 8D4B04C
	.incbin "graphics/pokemon/palettes/wigglytuff_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4B04C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_wigglytuff_icon:: @ 8D4B074
	.incbin "graphics/pokemon/icons/wigglytuff_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4B074, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_wigglytuff_footprint:: @ 8D4B474
	.incbin "graphics/pokemon/footprints/wigglytuff_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4B474, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_zubat_still_front_pic:: @ 8D4B494
	.incbin "graphics/pokemon/front_pics/zubat_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4B494, 0x02BC

	.align 2
gFile_graphics_pokemon_palettes_zubat_palette:: @ 8D4B750
	.incbin "graphics/pokemon/palettes/zubat_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4B750, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_zubat_back_pic:: @ 8D4B778
	.incbin "graphics/pokemon/back_pics/zubat_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4B778, 0x02BC

	.align 2
gFile_graphics_pokemon_palettes_zubat_shiny_palette:: @ 8D4BA34
	.incbin "graphics/pokemon/palettes/zubat_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4BA34, 0x0028

	.align 2
gFile_graphics_pokemon_icons_zubat_icon:: @ 8D4BA5C
	.incbin "graphics/pokemon/icons/zubat_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4BA5C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_zubat_footprint:: @ 8D4BE5C
	.incbin "graphics/pokemon/footprints/zubat_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4BE5C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_golbat_still_front_pic:: @ 8D4BE7C
	.incbin "graphics/pokemon/front_pics/golbat_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4BE7C, 0x03A0

	.align 2
gFile_graphics_pokemon_palettes_golbat_palette:: @ 8D4C21C
	.incbin "graphics/pokemon/palettes/golbat_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4C21C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_golbat_back_pic:: @ 8D4C244
	.incbin "graphics/pokemon/back_pics/golbat_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4C244, 0x02BC

	.align 2
gFile_graphics_pokemon_palettes_golbat_shiny_palette:: @ 8D4C500
	.incbin "graphics/pokemon/palettes/golbat_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4C500, 0x0028

	.align 2
gFile_graphics_pokemon_icons_golbat_icon:: @ 8D4C528
	.incbin "graphics/pokemon/icons/golbat_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4C528, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_golbat_footprint:: @ 8D4C928
	.incbin "graphics/pokemon/footprints/golbat_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4C928, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_oddish_still_front_pic:: @ 8D4C948
	.incbin "graphics/pokemon/front_pics/oddish_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4C948, 0x0240

	.align 2
gFile_graphics_pokemon_palettes_oddish_palette:: @ 8D4CB88
	.incbin "graphics/pokemon/palettes/oddish_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4CB88, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_oddish_back_pic:: @ 8D4CBB0
	.incbin "graphics/pokemon/back_pics/oddish_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4CBB0, 0x02C4

	.align 2
gFile_graphics_pokemon_palettes_oddish_shiny_palette:: @ 8D4CE74
	.incbin "graphics/pokemon/palettes/oddish_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4CE74, 0x0028

	.align 2
gFile_graphics_pokemon_icons_oddish_icon:: @ 8D4CE9C
	.incbin "graphics/pokemon/icons/oddish_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4CE9C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_oddish_footprint:: @ 8D4D29C
	.incbin "graphics/pokemon/footprints/oddish_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4D29C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_gloom_still_front_pic:: @ 8D4D2BC
	.incbin "graphics/pokemon/front_pics/gloom_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4D2BC, 0x0368

	.align 2
gFile_graphics_pokemon_palettes_gloom_palette:: @ 8D4D624
	.incbin "graphics/pokemon/palettes/gloom_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4D624, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_gloom_back_pic:: @ 8D4D64C
	.incbin "graphics/pokemon/back_pics/gloom_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4D64C, 0x0380

	.align 2
gFile_graphics_pokemon_palettes_gloom_shiny_palette:: @ 8D4D9CC
	.incbin "graphics/pokemon/palettes/gloom_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4D9CC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_gloom_icon:: @ 8D4D9F4
	.incbin "graphics/pokemon/icons/gloom_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4D9F4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_gloom_footprint:: @ 8D4DDF4
	.incbin "graphics/pokemon/footprints/gloom_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4DDF4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_vileplume_still_front_pic:: @ 8D4DE14
	.incbin "graphics/pokemon/front_pics/vileplume_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4DE14, 0x0354

	.align 2
gFile_graphics_pokemon_palettes_vileplume_palette:: @ 8D4E168
	.incbin "graphics/pokemon/palettes/vileplume_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4E168, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_vileplume_back_pic:: @ 8D4E190
	.incbin "graphics/pokemon/back_pics/vileplume_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4E190, 0x044C

	.align 2
gFile_graphics_pokemon_palettes_vileplume_shiny_palette:: @ 8D4E5DC
	.incbin "graphics/pokemon/palettes/vileplume_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4E5DC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_vileplume_icon:: @ 8D4E604
	.incbin "graphics/pokemon/icons/vileplume_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4E604, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_vileplume_footprint:: @ 8D4EA04
	.incbin "graphics/pokemon/footprints/vileplume_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4EA04, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_paras_still_front_pic:: @ 8D4EA24
	.incbin "graphics/pokemon/front_pics/paras_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4EA24, 0x026C

	.align 2
gFile_graphics_pokemon_palettes_paras_palette:: @ 8D4EC90
	.incbin "graphics/pokemon/palettes/paras_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4EC90, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_paras_back_pic:: @ 8D4ECB8
	.incbin "graphics/pokemon/back_pics/paras_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4ECB8, 0x02A0

	.align 2
gFile_graphics_pokemon_palettes_paras_shiny_palette:: @ 8D4EF58
	.incbin "graphics/pokemon/palettes/paras_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4EF58, 0x0028

	.align 2
gFile_graphics_pokemon_icons_paras_icon:: @ 8D4EF80
	.incbin "graphics/pokemon/icons/paras_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4EF80, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_paras_footprint:: @ 8D4F380
	.incbin "graphics/pokemon/footprints/paras_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4F380, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_parasect_still_front_pic:: @ 8D4F3A0
	.incbin "graphics/pokemon/front_pics/parasect_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4F3A0, 0x0390

	.align 2
gFile_graphics_pokemon_palettes_parasect_palette:: @ 8D4F730
	.incbin "graphics/pokemon/palettes/parasect_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4F730, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_parasect_back_pic:: @ 8D4F758
	.incbin "graphics/pokemon/back_pics/parasect_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4F758, 0x02FC

	.align 2
gFile_graphics_pokemon_palettes_parasect_shiny_palette:: @ 8D4FA54
	.incbin "graphics/pokemon/palettes/parasect_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD4FA54, 0x0028

	.align 2
gFile_graphics_pokemon_icons_parasect_icon:: @ 8D4FA7C
	.incbin "graphics/pokemon/icons/parasect_icon.4bpp"
	@ .incbin "baserom.gba", 0xD4FA7C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_parasect_footprint:: @ 8D4FE7C
	.incbin "graphics/pokemon/footprints/parasect_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD4FE7C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_venonat_still_front_pic:: @ 8D4FE9C
	.incbin "graphics/pokemon/front_pics/venonat_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD4FE9C, 0x0320

	.align 2
gFile_graphics_pokemon_palettes_venonat_palette:: @ 8D501BC
	.incbin "graphics/pokemon/palettes/venonat_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD501BC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_venonat_back_pic:: @ 8D501E4
	.incbin "graphics/pokemon/back_pics/venonat_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD501E4, 0x0330

	.align 2
gFile_graphics_pokemon_palettes_venonat_shiny_palette:: @ 8D50514
	.incbin "graphics/pokemon/palettes/venonat_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD50514, 0x0028

	.align 2
gFile_graphics_pokemon_icons_venonat_icon:: @ 8D5053C
	.incbin "graphics/pokemon/icons/venonat_icon.4bpp"
	@ .incbin "baserom.gba", 0xD5053C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_venonat_footprint:: @ 8D5093C
	.incbin "graphics/pokemon/footprints/venonat_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5093C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_venomoth_still_front_pic:: @ 8D5095C
	.incbin "graphics/pokemon/front_pics/venomoth_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5095C, 0x0404

	.align 2
gFile_graphics_pokemon_palettes_venomoth_palette:: @ 8D50D60
	.incbin "graphics/pokemon/palettes/venomoth_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD50D60, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_venomoth_back_pic:: @ 8D50D88
	.incbin "graphics/pokemon/back_pics/venomoth_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD50D88, 0x03A4

	.align 2
gFile_graphics_pokemon_palettes_venomoth_shiny_palette:: @ 8D5112C
	.incbin "graphics/pokemon/palettes/venomoth_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5112C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_venomoth_icon:: @ 8D51154
	.incbin "graphics/pokemon/icons/venomoth_icon.4bpp"
	@ .incbin "baserom.gba", 0xD51154, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_venomoth_footprint:: @ 8D51554
	.incbin "graphics/pokemon/footprints/venomoth_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD51554, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_diglett_still_front_pic:: @ 8D51574
	.incbin "graphics/pokemon/front_pics/diglett_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD51574, 0x0210

	.align 2
gFile_graphics_pokemon_palettes_diglett_palette:: @ 8D51784
	.incbin "graphics/pokemon/palettes/diglett_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD51784, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_diglett_back_pic:: @ 8D517AC
	.incbin "graphics/pokemon/back_pics/diglett_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD517AC, 0x020C

	.align 2
gFile_graphics_pokemon_palettes_diglett_shiny_palette:: @ 8D519B8
	.incbin "graphics/pokemon/palettes/diglett_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD519B8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_diglett_icon:: @ 8D519E0
	.incbin "graphics/pokemon/icons/diglett_icon.4bpp"
	@ .incbin "baserom.gba", 0xD519E0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_diglett_footprint:: @ 8D51DE0
	.incbin "graphics/pokemon/footprints/diglett_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD51DE0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_dugtrio_still_front_pic:: @ 8D51E00
	.incbin "graphics/pokemon/front_pics/dugtrio_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD51E00, 0x032C

	.align 2
gFile_graphics_pokemon_palettes_dugtrio_palette:: @ 8D5212C
	.incbin "graphics/pokemon/palettes/dugtrio_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5212C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_dugtrio_back_pic:: @ 8D52154
	.incbin "graphics/pokemon/back_pics/dugtrio_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD52154, 0x02AC

	.align 2
gFile_graphics_pokemon_palettes_dugtrio_shiny_palette:: @ 8D52400
	.incbin "graphics/pokemon/palettes/dugtrio_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD52400, 0x0028

	.align 2
gFile_graphics_pokemon_icons_dugtrio_icon:: @ 8D52428
	.incbin "graphics/pokemon/icons/dugtrio_icon.4bpp"
	@ .incbin "baserom.gba", 0xD52428, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_dugtrio_footprint:: @ 8D52828
	.incbin "graphics/pokemon/footprints/dugtrio_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD52828, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_meowth_still_front_pic:: @ 8D52848
	.incbin "graphics/pokemon/front_pics/meowth_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD52848, 0x02EC

	.align 2
gFile_graphics_pokemon_palettes_meowth_palette:: @ 8D52B34
	.incbin "graphics/pokemon/palettes/meowth_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD52B34, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_meowth_back_pic:: @ 8D52B5C
	.incbin "graphics/pokemon/back_pics/meowth_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD52B5C, 0x02E4

	.align 2
gFile_graphics_pokemon_palettes_meowth_shiny_palette:: @ 8D52E40
	.incbin "graphics/pokemon/palettes/meowth_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD52E40, 0x0028

	.align 2
gFile_graphics_pokemon_icons_meowth_icon:: @ 8D52E68
	.incbin "graphics/pokemon/icons/meowth_icon.4bpp"
	@ .incbin "baserom.gba", 0xD52E68, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_meowth_footprint:: @ 8D53268
	.incbin "graphics/pokemon/footprints/meowth_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD53268, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_persian_still_front_pic:: @ 8D53288
	.incbin "graphics/pokemon/front_pics/persian_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD53288, 0x0378

	.align 2
gFile_graphics_pokemon_palettes_persian_palette:: @ 8D53600
	.incbin "graphics/pokemon/palettes/persian_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD53600, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_persian_back_pic:: @ 8D53628
	.incbin "graphics/pokemon/back_pics/persian_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD53628, 0x0340

	.align 2
gFile_graphics_pokemon_palettes_persian_shiny_palette:: @ 8D53968
	.incbin "graphics/pokemon/palettes/persian_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD53968, 0x0028

	.align 2
gFile_graphics_pokemon_icons_persian_icon:: @ 8D53990
	.incbin "graphics/pokemon/icons/persian_icon.4bpp"
	@ .incbin "baserom.gba", 0xD53990, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_persian_footprint:: @ 8D53D90
	.incbin "graphics/pokemon/footprints/persian_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD53D90, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_psyduck_still_front_pic:: @ 8D53DB0
	.incbin "graphics/pokemon/front_pics/psyduck_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD53DB0, 0x02E4

	.align 2
gFile_graphics_pokemon_palettes_psyduck_palette:: @ 8D54094
	.incbin "graphics/pokemon/palettes/psyduck_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD54094, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_psyduck_back_pic:: @ 8D540BC
	.incbin "graphics/pokemon/back_pics/psyduck_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD540BC, 0x029C

	.align 2
gFile_graphics_pokemon_palettes_psyduck_shiny_palette:: @ 8D54358
	.incbin "graphics/pokemon/palettes/psyduck_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD54358, 0x0028

	.align 2
gFile_graphics_pokemon_icons_psyduck_icon:: @ 8D54380
	.incbin "graphics/pokemon/icons/psyduck_icon.4bpp"
	@ .incbin "baserom.gba", 0xD54380, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_psyduck_footprint:: @ 8D54780
	.incbin "graphics/pokemon/footprints/psyduck_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD54780, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_golduck_still_front_pic:: @ 8D547A0
	.incbin "graphics/pokemon/front_pics/golduck_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD547A0, 0x03B8

	.align 2
gFile_graphics_pokemon_palettes_golduck_palette:: @ 8D54B58
	.incbin "graphics/pokemon/palettes/golduck_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD54B58, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_golduck_back_pic:: @ 8D54B80
	.incbin "graphics/pokemon/back_pics/golduck_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD54B80, 0x032C

	.align 2
gFile_graphics_pokemon_palettes_golduck_shiny_palette:: @ 8D54EAC
	.incbin "graphics/pokemon/palettes/golduck_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD54EAC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_golduck_icon:: @ 8D54ED4
	.incbin "graphics/pokemon/icons/golduck_icon.4bpp"
	@ .incbin "baserom.gba", 0xD54ED4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_golduck_footprint:: @ 8D552D4
	.incbin "graphics/pokemon/footprints/golduck_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD552D4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_mankey_still_front_pic:: @ 8D552F4
	.incbin "graphics/pokemon/front_pics/mankey_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD552F4, 0x02F8

	.align 2
gFile_graphics_pokemon_palettes_mankey_palette:: @ 8D555EC
	.incbin "graphics/pokemon/palettes/mankey_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD555EC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_mankey_back_pic:: @ 8D55614
	.incbin "graphics/pokemon/back_pics/mankey_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD55614, 0x0368

	.align 2
gFile_graphics_pokemon_palettes_mankey_shiny_palette:: @ 8D5597C
	.incbin "graphics/pokemon/palettes/mankey_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5597C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_mankey_icon:: @ 8D559A4
	.incbin "graphics/pokemon/icons/mankey_icon.4bpp"
	@ .incbin "baserom.gba", 0xD559A4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_mankey_footprint:: @ 8D55DA4
	.incbin "graphics/pokemon/footprints/mankey_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD55DA4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_primeape_still_front_pic:: @ 8D55DC4
	.incbin "graphics/pokemon/front_pics/primeape_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD55DC4, 0x038C

	.align 2
gFile_graphics_pokemon_palettes_primeape_palette:: @ 8D56150
	.incbin "graphics/pokemon/palettes/primeape_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD56150, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_primeape_back_pic:: @ 8D56178
	.incbin "graphics/pokemon/back_pics/primeape_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD56178, 0x0370

	.align 2
gFile_graphics_pokemon_palettes_primeape_shiny_palette:: @ 8D564E8
	.incbin "graphics/pokemon/palettes/primeape_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD564E8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_primeape_icon:: @ 8D56510
	.incbin "graphics/pokemon/icons/primeape_icon.4bpp"
	@ .incbin "baserom.gba", 0xD56510, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_primeape_footprint:: @ 8D56910
	.incbin "graphics/pokemon/footprints/primeape_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD56910, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_growlithe_still_front_pic:: @ 8D56930
	.incbin "graphics/pokemon/front_pics/growlithe_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD56930, 0x0328

	.align 2
gFile_graphics_pokemon_palettes_growlithe_palette:: @ 8D56C58
	.incbin "graphics/pokemon/palettes/growlithe_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD56C58, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_growlithe_back_pic:: @ 8D56C80
	.incbin "graphics/pokemon/back_pics/growlithe_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD56C80, 0x033C

	.align 2
gFile_graphics_pokemon_palettes_growlithe_shiny_palette:: @ 8D56FBC
	.incbin "graphics/pokemon/palettes/growlithe_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD56FBC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_growlithe_icon:: @ 8D56FE4
	.incbin "graphics/pokemon/icons/growlithe_icon.4bpp"
	@ .incbin "baserom.gba", 0xD56FE4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_growlithe_footprint:: @ 8D573E4
	.incbin "graphics/pokemon/footprints/growlithe_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD573E4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_arcanine_still_front_pic:: @ 8D57404
	.incbin "graphics/pokemon/front_pics/arcanine_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD57404, 0x04FC

	.align 2
gFile_graphics_pokemon_palettes_arcanine_palette:: @ 8D57900
	.incbin "graphics/pokemon/palettes/arcanine_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD57900, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_arcanine_back_pic:: @ 8D57928
	.incbin "graphics/pokemon/back_pics/arcanine_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD57928, 0x03E0

	.align 2
gFile_graphics_pokemon_palettes_arcanine_shiny_palette:: @ 8D57D08
	.incbin "graphics/pokemon/palettes/arcanine_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD57D08, 0x0028

	.align 2
gFile_graphics_pokemon_icons_arcanine_icon:: @ 8D57D30
	.incbin "graphics/pokemon/icons/arcanine_icon.4bpp"
	@ .incbin "baserom.gba", 0xD57D30, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_arcanine_footprint:: @ 8D58130
	.incbin "graphics/pokemon/footprints/arcanine_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD58130, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_poliwag_still_front_pic:: @ 8D58150
	.incbin "graphics/pokemon/front_pics/poliwag_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD58150, 0x029C

	.align 2
gFile_graphics_pokemon_palettes_poliwag_palette:: @ 8D583EC
	.incbin "graphics/pokemon/palettes/poliwag_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD583EC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_poliwag_back_pic:: @ 8D58414
	.incbin "graphics/pokemon/back_pics/poliwag_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD58414, 0x0264

	.align 2
gFile_graphics_pokemon_palettes_poliwag_shiny_palette:: @ 8D58678
	.incbin "graphics/pokemon/palettes/poliwag_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD58678, 0x0028

	.align 2
gFile_graphics_pokemon_icons_poliwag_icon:: @ 8D586A0
	.incbin "graphics/pokemon/icons/poliwag_icon.4bpp"
	@ .incbin "baserom.gba", 0xD586A0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_poliwag_footprint:: @ 8D58AA0
	.incbin "graphics/pokemon/footprints/poliwag_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD58AA0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_poliwhirl_still_front_pic:: @ 8D58AC0
	.incbin "graphics/pokemon/front_pics/poliwhirl_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD58AC0, 0x0380

	.align 2
gFile_graphics_pokemon_palettes_poliwhirl_palette:: @ 8D58E40
	.incbin "graphics/pokemon/palettes/poliwhirl_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD58E40, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_poliwhirl_back_pic:: @ 8D58E68
	.incbin "graphics/pokemon/back_pics/poliwhirl_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD58E68, 0x027C

	.align 2
gFile_graphics_pokemon_palettes_poliwhirl_shiny_palette:: @ 8D590E4
	.incbin "graphics/pokemon/palettes/poliwhirl_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD590E4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_poliwhirl_icon:: @ 8D5910C
	.incbin "graphics/pokemon/icons/poliwhirl_icon.4bpp"
	@ .incbin "baserom.gba", 0xD5910C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_poliwhirl_footprint:: @ 8D5950C
	.incbin "graphics/pokemon/footprints/poliwhirl_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5950C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_poliwrath_still_front_pic:: @ 8D5952C
	.incbin "graphics/pokemon/front_pics/poliwrath_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5952C, 0x03C4

	.align 2
gFile_graphics_pokemon_palettes_poliwrath_palette:: @ 8D598F0
	.incbin "graphics/pokemon/palettes/poliwrath_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD598F0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_poliwrath_back_pic:: @ 8D59918
	.incbin "graphics/pokemon/back_pics/poliwrath_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD59918, 0x02F4

	.align 2
gFile_graphics_pokemon_palettes_poliwrath_shiny_palette:: @ 8D59C0C
	.incbin "graphics/pokemon/palettes/poliwrath_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD59C0C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_poliwrath_icon:: @ 8D59C34
	.incbin "graphics/pokemon/icons/poliwrath_icon.4bpp"
	@ .incbin "baserom.gba", 0xD59C34, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_poliwrath_footprint:: @ 8D5A034
	.incbin "graphics/pokemon/footprints/poliwrath_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5A034, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_abra_still_front_pic:: @ 8D5A054
	.incbin "graphics/pokemon/front_pics/abra_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5A054, 0x02D4

	.align 2
gFile_graphics_pokemon_palettes_abra_palette:: @ 8D5A328
	.incbin "graphics/pokemon/palettes/abra_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5A328, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_abra_back_pic:: @ 8D5A34C
	.incbin "graphics/pokemon/back_pics/abra_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5A34C, 0x02D4

	.align 2
gFile_graphics_pokemon_palettes_abra_shiny_palette:: @ 8D5A620
	.incbin "graphics/pokemon/palettes/abra_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5A620, 0x0024

	.align 2
gFile_graphics_pokemon_icons_abra_icon:: @ 8D5A644
	.incbin "graphics/pokemon/icons/abra_icon.4bpp"
	@ .incbin "baserom.gba", 0xD5A644, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_abra_footprint:: @ 8D5AA44
	.incbin "graphics/pokemon/footprints/abra_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5AA44, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_kadabra_still_front_pic:: @ 8D5AA64
	.incbin "graphics/pokemon/front_pics/kadabra_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5AA64, 0x04C8

	.align 2
gFile_graphics_pokemon_palettes_kadabra_palette:: @ 8D5AF2C
	.incbin "graphics/pokemon/palettes/kadabra_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5AF2C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_kadabra_back_pic:: @ 8D5AF54
	.incbin "graphics/pokemon/back_pics/kadabra_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5AF54, 0x03AC

	.align 2
gFile_graphics_pokemon_palettes_kadabra_shiny_palette:: @ 8D5B300
	.incbin "graphics/pokemon/palettes/kadabra_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5B300, 0x0028

	.align 2
gFile_graphics_pokemon_icons_kadabra_icon:: @ 8D5B328
	.incbin "graphics/pokemon/icons/kadabra_icon.4bpp"
	@ .incbin "baserom.gba", 0xD5B328, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_kadabra_footprint:: @ 8D5B728
	.incbin "graphics/pokemon/footprints/kadabra_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5B728, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_alakazam_still_front_pic:: @ 8D5B748
	.incbin "graphics/pokemon/front_pics/alakazam_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5B748, 0x0498

	.align 2
gFile_graphics_pokemon_palettes_alakazam_palette:: @ 8D5BBE0
	.incbin "graphics/pokemon/palettes/alakazam_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5BBE0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_alakazam_back_pic:: @ 8D5BC08
	.incbin "graphics/pokemon/back_pics/alakazam_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5BC08, 0x0380

	.align 2
gFile_graphics_pokemon_palettes_alakazam_shiny_palette:: @ 8D5BF88
	.incbin "graphics/pokemon/palettes/alakazam_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5BF88, 0x0028

	.align 2
gFile_graphics_pokemon_icons_alakazam_icon:: @ 8D5BFB0
	.incbin "graphics/pokemon/icons/alakazam_icon.4bpp"
	@ .incbin "baserom.gba", 0xD5BFB0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_alakazam_footprint:: @ 8D5C3B0
	.incbin "graphics/pokemon/footprints/alakazam_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5C3B0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_machop_still_front_pic:: @ 8D5C3D0
	.incbin "graphics/pokemon/front_pics/machop_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5C3D0, 0x028C

	.align 2
gFile_graphics_pokemon_palettes_machop_palette:: @ 8D5C65C
	.incbin "graphics/pokemon/palettes/machop_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5C65C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_machop_back_pic:: @ 8D5C684
	.incbin "graphics/pokemon/back_pics/machop_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5C684, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_machop_shiny_palette:: @ 8D5C964
	.incbin "graphics/pokemon/palettes/machop_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5C964, 0x0028

	.align 2
gFile_graphics_pokemon_icons_machop_icon:: @ 8D5C98C
	.incbin "graphics/pokemon/icons/machop_icon.4bpp"
	@ .incbin "baserom.gba", 0xD5C98C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_machop_footprint:: @ 8D5CD8C
	.incbin "graphics/pokemon/footprints/machop_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5CD8C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_machoke_still_front_pic:: @ 8D5CDAC
	.incbin "graphics/pokemon/front_pics/machoke_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5CDAC, 0x03CC

	.align 2
gFile_graphics_pokemon_palettes_machoke_palette:: @ 8D5D178
	.incbin "graphics/pokemon/palettes/machoke_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5D178, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_machoke_back_pic:: @ 8D5D1A0
	.incbin "graphics/pokemon/back_pics/machoke_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5D1A0, 0x0350

	.align 2
gFile_graphics_pokemon_palettes_machoke_shiny_palette:: @ 8D5D4F0
	.incbin "graphics/pokemon/palettes/machoke_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5D4F0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_machoke_icon:: @ 8D5D518
	.incbin "graphics/pokemon/icons/machoke_icon.4bpp"
	@ .incbin "baserom.gba", 0xD5D518, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_machoke_footprint:: @ 8D5D918
	.incbin "graphics/pokemon/footprints/machoke_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5D918, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_machamp_still_front_pic:: @ 8D5D938
	.incbin "graphics/pokemon/front_pics/machamp_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5D938, 0x04EC

	.align 2
gFile_graphics_pokemon_palettes_machamp_palette:: @ 8D5DE24
	.incbin "graphics/pokemon/palettes/machamp_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5DE24, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_machamp_back_pic:: @ 8D5DE4C
	.incbin "graphics/pokemon/back_pics/machamp_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5DE4C, 0x045C

	.align 2
gFile_graphics_pokemon_palettes_machamp_shiny_palette:: @ 8D5E2A8
	.incbin "graphics/pokemon/palettes/machamp_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5E2A8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_machamp_icon:: @ 8D5E2D0
	.incbin "graphics/pokemon/icons/machamp_icon.4bpp"
	@ .incbin "baserom.gba", 0xD5E2D0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_machamp_footprint:: @ 8D5E6D0
	.incbin "graphics/pokemon/footprints/machamp_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5E6D0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_bellsprout_still_front_pic:: @ 8D5E6F0
	.incbin "graphics/pokemon/front_pics/bellsprout_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5E6F0, 0x028C

	.align 2
gFile_graphics_pokemon_palettes_bellsprout_palette:: @ 8D5E97C
	.incbin "graphics/pokemon/palettes/bellsprout_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5E97C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_bellsprout_back_pic:: @ 8D5E9A4
	.incbin "graphics/pokemon/back_pics/bellsprout_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5E9A4, 0x029C

	.align 2
gFile_graphics_pokemon_palettes_bellsprout_shiny_palette:: @ 8D5EC40
	.incbin "graphics/pokemon/palettes/bellsprout_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5EC40, 0x0028

	.align 2
gFile_graphics_pokemon_icons_bellsprout_icon:: @ 8D5EC68
	.incbin "graphics/pokemon/icons/bellsprout_icon.4bpp"
	@ .incbin "baserom.gba", 0xD5EC68, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_bellsprout_footprint:: @ 8D5F068
	.incbin "graphics/pokemon/footprints/bellsprout_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5F068, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_weepinbell_still_front_pic:: @ 8D5F088
	.incbin "graphics/pokemon/front_pics/weepinbell_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5F088, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_weepinbell_palette:: @ 8D5F3AC
	.incbin "graphics/pokemon/palettes/weepinbell_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5F3AC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_weepinbell_back_pic:: @ 8D5F3D4
	.incbin "graphics/pokemon/back_pics/weepinbell_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5F3D4, 0x02FC

	.align 2
gFile_graphics_pokemon_palettes_weepinbell_shiny_palette:: @ 8D5F6D0
	.incbin "graphics/pokemon/palettes/weepinbell_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5F6D0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_weepinbell_icon:: @ 8D5F6F8
	.incbin "graphics/pokemon/icons/weepinbell_icon.4bpp"
	@ .incbin "baserom.gba", 0xD5F6F8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_weepinbell_footprint:: @ 8D5FAF8
	.incbin "graphics/pokemon/footprints/weepinbell_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD5FAF8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_victreebel_still_front_pic:: @ 8D5FB18
	.incbin "graphics/pokemon/front_pics/victreebel_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5FB18, 0x042C

	.align 2
gFile_graphics_pokemon_palettes_victreebel_palette:: @ 8D5FF44
	.incbin "graphics/pokemon/palettes/victreebel_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD5FF44, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_victreebel_back_pic:: @ 8D5FF6C
	.incbin "graphics/pokemon/back_pics/victreebel_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD5FF6C, 0x0398

	.align 2
gFile_graphics_pokemon_palettes_victreebel_shiny_palette:: @ 8D60304
	.incbin "graphics/pokemon/palettes/victreebel_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD60304, 0x0028

	.align 2
gFile_graphics_pokemon_icons_victreebel_icon:: @ 8D6032C
	.incbin "graphics/pokemon/icons/victreebel_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6032C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_victreebel_footprint:: @ 8D6072C
	.incbin "graphics/pokemon/footprints/victreebel_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6072C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_tentacool_still_front_pic:: @ 8D6074C
	.incbin "graphics/pokemon/front_pics/tentacool_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6074C, 0x02A8

	.align 2
gFile_graphics_pokemon_palettes_tentacool_palette:: @ 8D609F4
	.incbin "graphics/pokemon/palettes/tentacool_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD609F4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_tentacool_back_pic:: @ 8D60A1C
	.incbin "graphics/pokemon/back_pics/tentacool_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD60A1C, 0x02CC

	.align 2
gFile_graphics_pokemon_palettes_tentacool_shiny_palette:: @ 8D60CE8
	.incbin "graphics/pokemon/palettes/tentacool_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD60CE8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_tentacool_icon:: @ 8D60D10
	.incbin "graphics/pokemon/icons/tentacool_icon.4bpp"
	@ .incbin "baserom.gba", 0xD60D10, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_tentacool_footprint:: @ 8D61110
	.incbin "graphics/pokemon/footprints/tentacool_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD61110, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_tentacruel_still_front_pic:: @ 8D61130
	.incbin "graphics/pokemon/front_pics/tentacruel_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD61130, 0x04F4

	.align 2
gFile_graphics_pokemon_palettes_tentacruel_palette:: @ 8D61624
	.incbin "graphics/pokemon/palettes/tentacruel_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD61624, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_tentacruel_back_pic:: @ 8D6164C
	.incbin "graphics/pokemon/back_pics/tentacruel_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6164C, 0x039C

	.align 2
gFile_graphics_pokemon_palettes_tentacruel_shiny_palette:: @ 8D619E8
	.incbin "graphics/pokemon/palettes/tentacruel_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD619E8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_tentacruel_icon:: @ 8D61A10
	.incbin "graphics/pokemon/icons/tentacruel_icon.4bpp"
	@ .incbin "baserom.gba", 0xD61A10, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_tentacruel_footprint:: @ 8D61E10
	.incbin "graphics/pokemon/footprints/tentacruel_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD61E10, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_geodude_still_front_pic:: @ 8D61E30
	.incbin "graphics/pokemon/front_pics/geodude_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD61E30, 0x0294

	.align 2
gFile_graphics_pokemon_palettes_geodude_palette:: @ 8D620C4
	.incbin "graphics/pokemon/palettes/geodude_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD620C4, 0x001C

	.align 2
gFile_graphics_pokemon_back_pics_geodude_back_pic:: @ 8D620E0
	.incbin "graphics/pokemon/back_pics/geodude_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD620E0, 0x0294

	.align 2
gFile_graphics_pokemon_palettes_geodude_shiny_palette:: @ 8D62374
	.incbin "graphics/pokemon/palettes/geodude_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD62374, 0x001C

	.align 2
gFile_graphics_pokemon_icons_geodude_icon:: @ 8D62390
	.incbin "graphics/pokemon/icons/geodude_icon.4bpp"
	@ .incbin "baserom.gba", 0xD62390, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_geodude_footprint:: @ 8D62790
	.incbin "graphics/pokemon/footprints/geodude_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD62790, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_graveler_still_front_pic:: @ 8D627B0
	.incbin "graphics/pokemon/front_pics/graveler_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD627B0, 0x03FC

	.align 2
gFile_graphics_pokemon_palettes_graveler_palette:: @ 8D62BAC
	.incbin "graphics/pokemon/palettes/graveler_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD62BAC, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_graveler_back_pic:: @ 8D62BD0
	.incbin "graphics/pokemon/back_pics/graveler_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD62BD0, 0x027C

	.align 2
gFile_graphics_pokemon_palettes_graveler_shiny_palette:: @ 8D62E4C
	.incbin "graphics/pokemon/palettes/graveler_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD62E4C, 0x0024

	.align 2
gFile_graphics_pokemon_icons_graveler_icon:: @ 8D62E70
	.incbin "graphics/pokemon/icons/graveler_icon.4bpp"
	@ .incbin "baserom.gba", 0xD62E70, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_graveler_footprint:: @ 8D63270
	.incbin "graphics/pokemon/footprints/graveler_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD63270, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_golem_still_front_pic:: @ 8D63290
	.incbin "graphics/pokemon/front_pics/golem_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD63290, 0x0430

	.align 2
gFile_graphics_pokemon_palettes_golem_palette:: @ 8D636C0
	.incbin "graphics/pokemon/palettes/golem_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD636C0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_golem_back_pic:: @ 8D636E8
	.incbin "graphics/pokemon/back_pics/golem_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD636E8, 0x02C0

	.align 2
gFile_graphics_pokemon_palettes_golem_shiny_palette:: @ 8D639A8
	.incbin "graphics/pokemon/palettes/golem_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD639A8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_golem_icon:: @ 8D639D0
	.incbin "graphics/pokemon/icons/golem_icon.4bpp"
	@ .incbin "baserom.gba", 0xD639D0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_golem_footprint:: @ 8D63DD0
	.incbin "graphics/pokemon/footprints/golem_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD63DD0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ponyta_still_front_pic:: @ 8D63DF0
	.incbin "graphics/pokemon/front_pics/ponyta_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD63DF0, 0x0390

	.align 2
gFile_graphics_pokemon_palettes_ponyta_palette:: @ 8D64180
	.incbin "graphics/pokemon/palettes/ponyta_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD64180, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ponyta_back_pic:: @ 8D641A8
	.incbin "graphics/pokemon/back_pics/ponyta_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD641A8, 0x033C

	.align 2
gFile_graphics_pokemon_palettes_ponyta_shiny_palette:: @ 8D644E4
	.incbin "graphics/pokemon/palettes/ponyta_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD644E4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ponyta_icon:: @ 8D6450C
	.incbin "graphics/pokemon/icons/ponyta_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6450C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ponyta_footprint:: @ 8D6490C
	.incbin "graphics/pokemon/footprints/ponyta_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6490C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_rapidash_still_front_pic:: @ 8D6492C
	.incbin "graphics/pokemon/front_pics/rapidash_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6492C, 0x0488

	.align 2
gFile_graphics_pokemon_palettes_rapidash_palette:: @ 8D64DB4
	.incbin "graphics/pokemon/palettes/rapidash_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD64DB4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_rapidash_back_pic:: @ 8D64DDC
	.incbin "graphics/pokemon/back_pics/rapidash_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD64DDC, 0x0410

	.align 2
gFile_graphics_pokemon_palettes_rapidash_shiny_palette:: @ 8D651EC
	.incbin "graphics/pokemon/palettes/rapidash_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD651EC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_rapidash_icon:: @ 8D65214
	.incbin "graphics/pokemon/icons/rapidash_icon.4bpp"
	@ .incbin "baserom.gba", 0xD65214, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_rapidash_footprint:: @ 8D65614
	.incbin "graphics/pokemon/footprints/rapidash_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD65614, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_slowpoke_still_front_pic:: @ 8D65634
	.incbin "graphics/pokemon/front_pics/slowpoke_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD65634, 0x02D4

	.align 2
gFile_graphics_pokemon_palettes_slowpoke_palette:: @ 8D65908
	.incbin "graphics/pokemon/palettes/slowpoke_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD65908, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_slowpoke_back_pic:: @ 8D65930
	.incbin "graphics/pokemon/back_pics/slowpoke_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD65930, 0x0264

	.align 2
gFile_graphics_pokemon_palettes_slowpoke_shiny_palette:: @ 8D65B94
	.incbin "graphics/pokemon/palettes/slowpoke_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD65B94, 0x0028

	.align 2
gFile_graphics_pokemon_icons_slowpoke_icon:: @ 8D65BBC
	.incbin "graphics/pokemon/icons/slowpoke_icon.4bpp"
	@ .incbin "baserom.gba", 0xD65BBC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_slowpoke_footprint:: @ 8D65FBC
	.incbin "graphics/pokemon/footprints/slowpoke_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD65FBC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_slowbro_still_front_pic:: @ 8D65FDC
	.incbin "graphics/pokemon/front_pics/slowbro_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD65FDC, 0x04A0

	.align 2
gFile_graphics_pokemon_palettes_slowbro_palette:: @ 8D6647C
	.incbin "graphics/pokemon/palettes/slowbro_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6647C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_slowbro_back_pic:: @ 8D664A4
	.incbin "graphics/pokemon/back_pics/slowbro_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD664A4, 0x039C

	.align 2
gFile_graphics_pokemon_palettes_slowbro_shiny_palette:: @ 8D66840
	.incbin "graphics/pokemon/palettes/slowbro_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD66840, 0x0028

	.align 2
gFile_graphics_pokemon_icons_slowbro_icon:: @ 8D66868
	.incbin "graphics/pokemon/icons/slowbro_icon.4bpp"
	@ .incbin "baserom.gba", 0xD66868, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_slowbro_footprint:: @ 8D66C68
	.incbin "graphics/pokemon/footprints/slowbro_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD66C68, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_magnemite_still_front_pic:: @ 8D66C88
	.incbin "graphics/pokemon/front_pics/magnemite_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD66C88, 0x01D8

	.align 2
gFile_graphics_pokemon_palettes_magnemite_palette:: @ 8D66E60
	.incbin "graphics/pokemon/palettes/magnemite_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD66E60, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_magnemite_back_pic:: @ 8D66E88
	.incbin "graphics/pokemon/back_pics/magnemite_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD66E88, 0x01E8

	.align 2
gFile_graphics_pokemon_palettes_magnemite_shiny_palette:: @ 8D67070
	.incbin "graphics/pokemon/palettes/magnemite_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD67070, 0x0024

	.align 2
gFile_graphics_pokemon_icons_magnemite_icon:: @ 8D67094
	.incbin "graphics/pokemon/icons/magnemite_icon.4bpp"
	@ .incbin "baserom.gba", 0xD67094, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_magnemite_footprint:: @ 8D67494
	.incbin "graphics/pokemon/footprints/magnemite_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD67494, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_magneton_still_front_pic:: @ 8D674B4
	.incbin "graphics/pokemon/front_pics/magneton_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD674B4, 0x033C

	.align 2
gFile_graphics_pokemon_palettes_magneton_palette:: @ 8D677F0
	.incbin "graphics/pokemon/palettes/magneton_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD677F0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_magneton_back_pic:: @ 8D67818
	.incbin "graphics/pokemon/back_pics/magneton_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD67818, 0x0380

	.align 2
gFile_graphics_pokemon_palettes_magneton_shiny_palette:: @ 8D67B98
	.incbin "graphics/pokemon/palettes/magneton_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD67B98, 0x0028

	.align 2
gFile_graphics_pokemon_icons_magneton_icon:: @ 8D67BC0
	.incbin "graphics/pokemon/icons/magneton_icon.4bpp"
	@ .incbin "baserom.gba", 0xD67BC0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_magneton_footprint:: @ 8D67FC0
	.incbin "graphics/pokemon/footprints/magneton_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD67FC0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_farfetch_d_still_front_pic:: @ 8D67FE0
	.incbin "graphics/pokemon/front_pics/farfetch_d_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD67FE0, 0x0354

	.align 2
gFile_graphics_pokemon_palettes_farfetch_d_palette:: @ 8D68334
	.incbin "graphics/pokemon/palettes/farfetch_d_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD68334, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_farfetch_d_back_pic:: @ 8D6835C
	.incbin "graphics/pokemon/back_pics/farfetch_d_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6835C, 0x036C

	.align 2
gFile_graphics_pokemon_palettes_farfetch_d_shiny_palette:: @ 8D686C8
	.incbin "graphics/pokemon/palettes/farfetch_d_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD686C8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_farfetch_d_icon:: @ 8D686F0
	.incbin "graphics/pokemon/icons/farfetch_d_icon.4bpp"
	@ .incbin "baserom.gba", 0xD686F0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_farfetch_d_footprint:: @ 8D68AF0
	.incbin "graphics/pokemon/footprints/farfetch_d_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD68AF0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_doduo_still_front_pic:: @ 8D68B10
	.incbin "graphics/pokemon/front_pics/doduo_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD68B10, 0x02EC

	.align 2
gFile_graphics_pokemon_palettes_doduo_palette:: @ 8D68DFC
	.incbin "graphics/pokemon/palettes/doduo_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD68DFC, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_doduo_back_pic:: @ 8D68E20
	.incbin "graphics/pokemon/back_pics/doduo_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD68E20, 0x0318

	.align 2
gFile_graphics_pokemon_palettes_doduo_shiny_palette:: @ 8D69138
	.incbin "graphics/pokemon/palettes/doduo_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD69138, 0x0024

	.align 2
gFile_graphics_pokemon_icons_doduo_icon:: @ 8D6915C
	.incbin "graphics/pokemon/icons/doduo_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6915C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_doduo_footprint:: @ 8D6955C
	.incbin "graphics/pokemon/footprints/doduo_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6955C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_dodrio_still_front_pic:: @ 8D6957C
	.incbin "graphics/pokemon/front_pics/dodrio_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6957C, 0x0440

	.align 2
gFile_graphics_pokemon_palettes_dodrio_palette:: @ 8D699BC
	.incbin "graphics/pokemon/palettes/dodrio_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD699BC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_dodrio_back_pic:: @ 8D699E4
	.incbin "graphics/pokemon/back_pics/dodrio_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD699E4, 0x0464

	.align 2
gFile_graphics_pokemon_palettes_dodrio_shiny_palette:: @ 8D69E48
	.incbin "graphics/pokemon/palettes/dodrio_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD69E48, 0x0028

	.align 2
gFile_graphics_pokemon_icons_dodrio_icon:: @ 8D69E70
	.incbin "graphics/pokemon/icons/dodrio_icon.4bpp"
	@ .incbin "baserom.gba", 0xD69E70, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_dodrio_footprint:: @ 8D6A270
	.incbin "graphics/pokemon/footprints/dodrio_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6A270, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_seel_still_front_pic:: @ 8D6A290
	.incbin "graphics/pokemon/front_pics/seel_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6A290, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_seel_palette:: @ 8D6A5B4
	.incbin "graphics/pokemon/palettes/seel_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6A5B4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_seel_back_pic:: @ 8D6A5DC
	.incbin "graphics/pokemon/back_pics/seel_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6A5DC, 0x02EC

	.align 2
gFile_graphics_pokemon_palettes_seel_shiny_palette:: @ 8D6A8C8
	.incbin "graphics/pokemon/palettes/seel_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6A8C8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_seel_icon:: @ 8D6A8F0
	.incbin "graphics/pokemon/icons/seel_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6A8F0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_seel_footprint:: @ 8D6ACF0
	.incbin "graphics/pokemon/footprints/seel_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6ACF0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_dewgong_still_front_pic:: @ 8D6AD10
	.incbin "graphics/pokemon/front_pics/dewgong_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6AD10, 0x03D0

	.align 2
gFile_graphics_pokemon_palettes_dewgong_palette:: @ 8D6B0E0
	.incbin "graphics/pokemon/palettes/dewgong_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6B0E0, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_dewgong_back_pic:: @ 8D6B104
	.incbin "graphics/pokemon/back_pics/dewgong_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6B104, 0x0294

	.align 2
gFile_graphics_pokemon_palettes_dewgong_shiny_palette:: @ 8D6B398
	.incbin "graphics/pokemon/palettes/dewgong_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6B398, 0x0024

	.align 2
gFile_graphics_pokemon_icons_dewgong_icon:: @ 8D6B3BC
	.incbin "graphics/pokemon/icons/dewgong_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6B3BC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_dewgong_footprint:: @ 8D6B7BC
	.incbin "graphics/pokemon/footprints/dewgong_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6B7BC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_grimer_still_front_pic:: @ 8D6B7DC
	.incbin "graphics/pokemon/front_pics/grimer_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6B7DC, 0x0328

	.align 2
gFile_graphics_pokemon_palettes_grimer_palette:: @ 8D6BB04
	.incbin "graphics/pokemon/palettes/grimer_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6BB04, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_grimer_back_pic:: @ 8D6BB28
	.incbin "graphics/pokemon/back_pics/grimer_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6BB28, 0x02C4

	.align 2
gFile_graphics_pokemon_palettes_grimer_shiny_palette:: @ 8D6BDEC
	.incbin "graphics/pokemon/palettes/grimer_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6BDEC, 0x0024

	.align 2
gFile_graphics_pokemon_icons_grimer_icon:: @ 8D6BE10
	.incbin "graphics/pokemon/icons/grimer_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6BE10, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_grimer_footprint:: @ 8D6C210
	.incbin "graphics/pokemon/footprints/grimer_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6C210, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_muk_still_front_pic:: @ 8D6C230
	.incbin "graphics/pokemon/front_pics/muk_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6C230, 0x0390

	.align 2
gFile_graphics_pokemon_palettes_muk_palette:: @ 8D6C5C0
	.incbin "graphics/pokemon/palettes/muk_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6C5C0, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_muk_back_pic:: @ 8D6C5E4
	.incbin "graphics/pokemon/back_pics/muk_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6C5E4, 0x02F8

	.align 2
gFile_graphics_pokemon_palettes_muk_shiny_palette:: @ 8D6C8DC
	.incbin "graphics/pokemon/palettes/muk_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6C8DC, 0x0024

	.align 2
gFile_graphics_pokemon_icons_muk_icon:: @ 8D6C900
	.incbin "graphics/pokemon/icons/muk_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6C900, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_muk_footprint:: @ 8D6CD00
	.incbin "graphics/pokemon/footprints/muk_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6CD00, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_shellder_still_front_pic:: @ 8D6CD20
	.incbin "graphics/pokemon/front_pics/shellder_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6CD20, 0x0274

	.align 2
gFile_graphics_pokemon_palettes_shellder_palette:: @ 8D6CF94
	.incbin "graphics/pokemon/palettes/shellder_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6CF94, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_shellder_back_pic:: @ 8D6CFB8
	.incbin "graphics/pokemon/back_pics/shellder_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6CFB8, 0x0314

	.align 2
gFile_graphics_pokemon_palettes_shellder_shiny_palette:: @ 8D6D2CC
	.incbin "graphics/pokemon/palettes/shellder_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6D2CC, 0x0024

	.align 2
gFile_graphics_pokemon_icons_shellder_icon:: @ 8D6D2F0
	.incbin "graphics/pokemon/icons/shellder_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6D2F0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_shellder_footprint:: @ 8D6D6F0
	.incbin "graphics/pokemon/footprints/shellder_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6D6F0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_cloyster_still_front_pic:: @ 8D6D710
	.incbin "graphics/pokemon/front_pics/cloyster_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6D710, 0x043C

	.align 2
gFile_graphics_pokemon_palettes_cloyster_palette:: @ 8D6DB4C
	.incbin "graphics/pokemon/palettes/cloyster_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6DB4C, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_cloyster_back_pic:: @ 8D6DB70
	.incbin "graphics/pokemon/back_pics/cloyster_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6DB70, 0x040C

	.align 2
gFile_graphics_pokemon_palettes_cloyster_shiny_palette:: @ 8D6DF7C
	.incbin "graphics/pokemon/palettes/cloyster_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6DF7C, 0x0024

	.align 2
gFile_graphics_pokemon_icons_cloyster_icon:: @ 8D6DFA0
	.incbin "graphics/pokemon/icons/cloyster_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6DFA0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_cloyster_footprint:: @ 8D6E3A0
	.incbin "graphics/pokemon/footprints/cloyster_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6E3A0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_gastly_still_front_pic:: @ 8D6E3C0
	.incbin "graphics/pokemon/front_pics/gastly_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6E3C0, 0x03B8

	.align 2
gFile_graphics_pokemon_palettes_gastly_palette:: @ 8D6E778
	.incbin "graphics/pokemon/palettes/gastly_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6E778, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_gastly_back_pic:: @ 8D6E7A0
	.incbin "graphics/pokemon/back_pics/gastly_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6E7A0, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_gastly_shiny_palette:: @ 8D6EAC4
	.incbin "graphics/pokemon/palettes/gastly_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6EAC4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_gastly_icon:: @ 8D6EAEC
	.incbin "graphics/pokemon/icons/gastly_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6EAEC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_gastly_footprint:: @ 8D6EEEC
	.incbin "graphics/pokemon/footprints/gastly_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6EEEC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_haunter_still_front_pic:: @ 8D6EF0C
	.incbin "graphics/pokemon/front_pics/haunter_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6EF0C, 0x03E8

	.align 2
gFile_graphics_pokemon_palettes_haunter_palette:: @ 8D6F2F4
	.incbin "graphics/pokemon/palettes/haunter_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6F2F4, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_haunter_back_pic:: @ 8D6F318
	.incbin "graphics/pokemon/back_pics/haunter_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6F318, 0x02E4

	.align 2
gFile_graphics_pokemon_palettes_haunter_shiny_palette:: @ 8D6F5FC
	.incbin "graphics/pokemon/palettes/haunter_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6F5FC, 0x0024

	.align 2
gFile_graphics_pokemon_icons_haunter_icon:: @ 8D6F620
	.incbin "graphics/pokemon/icons/haunter_icon.4bpp"
	@ .incbin "baserom.gba", 0xD6F620, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_haunter_footprint:: @ 8D6FA20
	.incbin "graphics/pokemon/footprints/haunter_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD6FA20, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_gengar_still_front_pic:: @ 8D6FA40
	.incbin "graphics/pokemon/front_pics/gengar_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6FA40, 0x035C

	.align 2
gFile_graphics_pokemon_palettes_gengar_palette:: @ 8D6FD9C
	.incbin "graphics/pokemon/palettes/gengar_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD6FD9C, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_gengar_back_pic:: @ 8D6FDC0
	.incbin "graphics/pokemon/back_pics/gengar_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD6FDC0, 0x0344

	.align 2
gFile_graphics_pokemon_palettes_gengar_shiny_palette:: @ 8D70104
	.incbin "graphics/pokemon/palettes/gengar_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD70104, 0x0024

	.align 2
gFile_graphics_pokemon_icons_gengar_icon:: @ 8D70128
	.incbin "graphics/pokemon/icons/gengar_icon.4bpp"
	@ .incbin "baserom.gba", 0xD70128, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_gengar_footprint:: @ 8D70528
	.incbin "graphics/pokemon/footprints/gengar_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD70528, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_onix_still_front_pic:: @ 8D70548
	.incbin "graphics/pokemon/front_pics/onix_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD70548, 0x04D0

	.align 2
gFile_graphics_pokemon_palettes_onix_palette:: @ 8D70A18
	.incbin "graphics/pokemon/palettes/onix_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD70A18, 0x001C

	.align 2
gFile_graphics_pokemon_back_pics_onix_back_pic:: @ 8D70A34
	.incbin "graphics/pokemon/back_pics/onix_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD70A34, 0x037C

	.align 2
gFile_graphics_pokemon_palettes_onix_shiny_palette:: @ 8D70DB0
	.incbin "graphics/pokemon/palettes/onix_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD70DB0, 0x001C

	.align 2
gFile_graphics_pokemon_icons_onix_icon:: @ 8D70DCC
	.incbin "graphics/pokemon/icons/onix_icon.4bpp"
	@ .incbin "baserom.gba", 0xD70DCC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_onix_footprint:: @ 8D711CC
	.incbin "graphics/pokemon/footprints/onix_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD711CC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_drowzee_still_front_pic:: @ 8D711EC
	.incbin "graphics/pokemon/front_pics/drowzee_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD711EC, 0x0340

	.align 2
gFile_graphics_pokemon_palettes_drowzee_palette:: @ 8D7152C
	.incbin "graphics/pokemon/palettes/drowzee_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7152C, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_drowzee_back_pic:: @ 8D71550
	.incbin "graphics/pokemon/back_pics/drowzee_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD71550, 0x023C

	.align 2
gFile_graphics_pokemon_palettes_drowzee_shiny_palette:: @ 8D7178C
	.incbin "graphics/pokemon/palettes/drowzee_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7178C, 0x0024

	.align 2
gFile_graphics_pokemon_icons_drowzee_icon:: @ 8D717B0
	.incbin "graphics/pokemon/icons/drowzee_icon.4bpp"
	@ .incbin "baserom.gba", 0xD717B0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_drowzee_footprint:: @ 8D71BB0
	.incbin "graphics/pokemon/footprints/drowzee_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD71BB0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_hypno_still_front_pic:: @ 8D71BD0
	.incbin "graphics/pokemon/front_pics/hypno_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD71BD0, 0x0438

	.align 2
gFile_graphics_pokemon_palettes_hypno_palette:: @ 8D72008
	.incbin "graphics/pokemon/palettes/hypno_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD72008, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_hypno_back_pic:: @ 8D7202C
	.incbin "graphics/pokemon/back_pics/hypno_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7202C, 0x0330

	.align 2
gFile_graphics_pokemon_palettes_hypno_shiny_palette:: @ 8D7235C
	.incbin "graphics/pokemon/palettes/hypno_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7235C, 0x0024

	.align 2
gFile_graphics_pokemon_icons_hypno_icon:: @ 8D72380
	.incbin "graphics/pokemon/icons/hypno_icon.4bpp"
	@ .incbin "baserom.gba", 0xD72380, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_hypno_footprint:: @ 8D72780
	.incbin "graphics/pokemon/footprints/hypno_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD72780, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_krabby_still_front_pic:: @ 8D727A0
	.incbin "graphics/pokemon/front_pics/krabby_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD727A0, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_krabby_palette:: @ 8D72AC4
	.incbin "graphics/pokemon/palettes/krabby_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD72AC4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_krabby_back_pic:: @ 8D72AEC
	.incbin "graphics/pokemon/back_pics/krabby_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD72AEC, 0x038C

	.align 2
gFile_graphics_pokemon_palettes_krabby_shiny_palette:: @ 8D72E78
	.incbin "graphics/pokemon/palettes/krabby_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD72E78, 0x0028

	.align 2
gFile_graphics_pokemon_icons_krabby_icon:: @ 8D72EA0
	.incbin "graphics/pokemon/icons/krabby_icon.4bpp"
	@ .incbin "baserom.gba", 0xD72EA0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_krabby_footprint:: @ 8D732A0
	.incbin "graphics/pokemon/footprints/krabby_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD732A0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_kingler_still_front_pic:: @ 8D732C0
	.incbin "graphics/pokemon/front_pics/kingler_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD732C0, 0x0480

	.align 2
gFile_graphics_pokemon_palettes_kingler_palette:: @ 8D73740
	.incbin "graphics/pokemon/palettes/kingler_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD73740, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_kingler_back_pic:: @ 8D73768
	.incbin "graphics/pokemon/back_pics/kingler_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD73768, 0x0384

	.align 2
gFile_graphics_pokemon_palettes_kingler_shiny_palette:: @ 8D73AEC
	.incbin "graphics/pokemon/palettes/kingler_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD73AEC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_kingler_icon:: @ 8D73B14
	.incbin "graphics/pokemon/icons/kingler_icon.4bpp"
	@ .incbin "baserom.gba", 0xD73B14, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_kingler_footprint:: @ 8D73F14
	.incbin "graphics/pokemon/footprints/kingler_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD73F14, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_voltorb_still_front_pic:: @ 8D73F34
	.incbin "graphics/pokemon/front_pics/voltorb_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD73F34, 0x0208

	.align 2
gFile_graphics_pokemon_palettes_voltorb_palette:: @ 8D7413C
	.incbin "graphics/pokemon/palettes/voltorb_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7413C, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_voltorb_back_pic:: @ 8D74160
	.incbin "graphics/pokemon/back_pics/voltorb_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD74160, 0x0274

	.align 2
gFile_graphics_pokemon_palettes_voltorb_shiny_palette:: @ 8D743D4
	.incbin "graphics/pokemon/palettes/voltorb_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD743D4, 0x0024

	.align 2
gFile_graphics_pokemon_icons_voltorb_icon:: @ 8D743F8
	.incbin "graphics/pokemon/icons/voltorb_icon.4bpp"
	@ .incbin "baserom.gba", 0xD743F8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_voltorb_footprint:: @ 8D747F8
	.incbin "graphics/pokemon/footprints/voltorb_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD747F8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_electrode_still_front_pic:: @ 8D74818
	.incbin "graphics/pokemon/front_pics/electrode_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD74818, 0x026C

	.align 2
gFile_graphics_pokemon_palettes_electrode_palette:: @ 8D74A84
	.incbin "graphics/pokemon/palettes/electrode_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD74A84, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_electrode_back_pic:: @ 8D74AA8
	.incbin "graphics/pokemon/back_pics/electrode_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD74AA8, 0x0270

	.align 2
gFile_graphics_pokemon_palettes_electrode_shiny_palette:: @ 8D74D18
	.incbin "graphics/pokemon/palettes/electrode_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD74D18, 0x0024

	.align 2
gFile_graphics_pokemon_icons_electrode_icon:: @ 8D74D3C
	.incbin "graphics/pokemon/icons/electrode_icon.4bpp"
	@ .incbin "baserom.gba", 0xD74D3C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_electrode_footprint:: @ 8D7513C
	.incbin "graphics/pokemon/footprints/electrode_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD7513C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_exeggcute_still_front_pic:: @ 8D7515C
	.incbin "graphics/pokemon/front_pics/exeggcute_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7515C, 0x0390

	.align 2
gFile_graphics_pokemon_palettes_exeggcute_palette:: @ 8D754EC
	.incbin "graphics/pokemon/palettes/exeggcute_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD754EC, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_exeggcute_back_pic:: @ 8D75510
	.incbin "graphics/pokemon/back_pics/exeggcute_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD75510, 0x0308

	.align 2
gFile_graphics_pokemon_palettes_exeggcute_shiny_palette:: @ 8D75818
	.incbin "graphics/pokemon/palettes/exeggcute_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD75818, 0x0024

	.align 2
gFile_graphics_pokemon_icons_exeggcute_icon:: @ 8D7583C
	.incbin "graphics/pokemon/icons/exeggcute_icon.4bpp"
	@ .incbin "baserom.gba", 0xD7583C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_exeggcute_footprint:: @ 8D75C3C
	.incbin "graphics/pokemon/footprints/exeggcute_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD75C3C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_exeggutor_still_front_pic:: @ 8D75C5C
	.incbin "graphics/pokemon/front_pics/exeggutor_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD75C5C, 0x0450

	.align 2
gFile_graphics_pokemon_palettes_exeggutor_palette:: @ 8D760AC
	.incbin "graphics/pokemon/palettes/exeggutor_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD760AC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_exeggutor_back_pic:: @ 8D760D4
	.incbin "graphics/pokemon/back_pics/exeggutor_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD760D4, 0x03CC

	.align 2
gFile_graphics_pokemon_palettes_exeggutor_shiny_palette:: @ 8D764A0
	.incbin "graphics/pokemon/palettes/exeggutor_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD764A0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_exeggutor_icon:: @ 8D764C8
	.incbin "graphics/pokemon/icons/exeggutor_icon.4bpp"
	@ .incbin "baserom.gba", 0xD764C8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_exeggutor_footprint:: @ 8D768C8
	.incbin "graphics/pokemon/footprints/exeggutor_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD768C8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_cubone_still_front_pic:: @ 8D768E8
	.incbin "graphics/pokemon/front_pics/cubone_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD768E8, 0x02BC

	.align 2
gFile_graphics_pokemon_palettes_cubone_palette:: @ 8D76BA4
	.incbin "graphics/pokemon/palettes/cubone_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD76BA4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_cubone_back_pic:: @ 8D76BCC
	.incbin "graphics/pokemon/back_pics/cubone_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD76BCC, 0x0340

	.align 2
gFile_graphics_pokemon_palettes_cubone_shiny_palette:: @ 8D76F0C
	.incbin "graphics/pokemon/palettes/cubone_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD76F0C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_cubone_icon:: @ 8D76F34
	.incbin "graphics/pokemon/icons/cubone_icon.4bpp"
	@ .incbin "baserom.gba", 0xD76F34, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_cubone_footprint:: @ 8D77334
	.incbin "graphics/pokemon/footprints/cubone_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD77334, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_marowak_still_front_pic:: @ 8D77354
	.incbin "graphics/pokemon/front_pics/marowak_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD77354, 0x0380

	.align 2
gFile_graphics_pokemon_palettes_marowak_palette:: @ 8D776D4
	.incbin "graphics/pokemon/palettes/marowak_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD776D4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_marowak_back_pic:: @ 8D776FC
	.incbin "graphics/pokemon/back_pics/marowak_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD776FC, 0x0314

	.align 2
gFile_graphics_pokemon_palettes_marowak_shiny_palette:: @ 8D77A10
	.incbin "graphics/pokemon/palettes/marowak_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD77A10, 0x0028

	.align 2
gFile_graphics_pokemon_icons_marowak_icon:: @ 8D77A38
	.incbin "graphics/pokemon/icons/marowak_icon.4bpp"
	@ .incbin "baserom.gba", 0xD77A38, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_marowak_footprint:: @ 8D77E38
	.incbin "graphics/pokemon/footprints/marowak_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD77E38, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_hitmonlee_still_front_pic:: @ 8D77E58
	.incbin "graphics/pokemon/front_pics/hitmonlee_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD77E58, 0x0374

	.align 2
gFile_graphics_pokemon_palettes_hitmonlee_palette:: @ 8D781CC
	.incbin "graphics/pokemon/palettes/hitmonlee_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD781CC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_hitmonlee_back_pic:: @ 8D781F4
	.incbin "graphics/pokemon/back_pics/hitmonlee_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD781F4, 0x02A4

	.align 2
gFile_graphics_pokemon_palettes_hitmonlee_shiny_palette:: @ 8D78498
	.incbin "graphics/pokemon/palettes/hitmonlee_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD78498, 0x0028

	.align 2
gFile_graphics_pokemon_icons_hitmonlee_icon:: @ 8D784C0
	.incbin "graphics/pokemon/icons/hitmonlee_icon.4bpp"
	@ .incbin "baserom.gba", 0xD784C0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_hitmonlee_footprint:: @ 8D788C0
	.incbin "graphics/pokemon/footprints/hitmonlee_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD788C0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_hitmonchan_still_front_pic:: @ 8D788E0
	.incbin "graphics/pokemon/front_pics/hitmonchan_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD788E0, 0x0340

	.align 2
gFile_graphics_pokemon_palettes_hitmonchan_palette:: @ 8D78C20
	.incbin "graphics/pokemon/palettes/hitmonchan_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD78C20, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_hitmonchan_back_pic:: @ 8D78C48
	.incbin "graphics/pokemon/back_pics/hitmonchan_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD78C48, 0x0344

	.align 2
gFile_graphics_pokemon_palettes_hitmonchan_shiny_palette:: @ 8D78F8C
	.incbin "graphics/pokemon/palettes/hitmonchan_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD78F8C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_hitmonchan_icon:: @ 8D78FB4
	.incbin "graphics/pokemon/icons/hitmonchan_icon.4bpp"
	@ .incbin "baserom.gba", 0xD78FB4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_hitmonchan_footprint:: @ 8D793B4
	.incbin "graphics/pokemon/footprints/hitmonchan_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD793B4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_lickitung_still_front_pic:: @ 8D793D4
	.incbin "graphics/pokemon/front_pics/lickitung_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD793D4, 0x03D8

	.align 2
gFile_graphics_pokemon_palettes_lickitung_palette:: @ 8D797AC
	.incbin "graphics/pokemon/palettes/lickitung_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD797AC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_lickitung_back_pic:: @ 8D797D4
	.incbin "graphics/pokemon/back_pics/lickitung_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD797D4, 0x02A4

	.align 2
gFile_graphics_pokemon_palettes_lickitung_shiny_palette:: @ 8D79A78
	.incbin "graphics/pokemon/palettes/lickitung_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD79A78, 0x0028

	.align 2
gFile_graphics_pokemon_icons_lickitung_icon:: @ 8D79AA0
	.incbin "graphics/pokemon/icons/lickitung_icon.4bpp"
	@ .incbin "baserom.gba", 0xD79AA0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_lickitung_footprint:: @ 8D79EA0
	.incbin "graphics/pokemon/footprints/lickitung_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD79EA0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_koffing_still_front_pic:: @ 8D79EC0
	.incbin "graphics/pokemon/front_pics/koffing_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD79EC0, 0x0300

	.align 2
gFile_graphics_pokemon_palettes_koffing_palette:: @ 8D7A1C0
	.incbin "graphics/pokemon/palettes/koffing_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7A1C0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_koffing_back_pic:: @ 8D7A1E8
	.incbin "graphics/pokemon/back_pics/koffing_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7A1E8, 0x0300

	.align 2
gFile_graphics_pokemon_palettes_koffing_shiny_palette:: @ 8D7A4E8
	.incbin "graphics/pokemon/palettes/koffing_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7A4E8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_koffing_icon:: @ 8D7A510
	.incbin "graphics/pokemon/icons/koffing_icon.4bpp"
	@ .incbin "baserom.gba", 0xD7A510, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_koffing_footprint:: @ 8D7A910
	.incbin "graphics/pokemon/footprints/koffing_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD7A910, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_weezing_still_front_pic:: @ 8D7A930
	.incbin "graphics/pokemon/front_pics/weezing_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7A930, 0x04BC

	.align 2
gFile_graphics_pokemon_palettes_weezing_palette:: @ 8D7ADEC
	.incbin "graphics/pokemon/palettes/weezing_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7ADEC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_weezing_back_pic:: @ 8D7AE14
	.incbin "graphics/pokemon/back_pics/weezing_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7AE14, 0x0384

	.align 2
gFile_graphics_pokemon_palettes_weezing_shiny_palette:: @ 8D7B198
	.incbin "graphics/pokemon/palettes/weezing_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7B198, 0x0028

	.align 2
gFile_graphics_pokemon_icons_weezing_icon:: @ 8D7B1C0
	.incbin "graphics/pokemon/icons/weezing_icon.4bpp"
	@ .incbin "baserom.gba", 0xD7B1C0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_weezing_footprint:: @ 8D7B5C0
	.incbin "graphics/pokemon/footprints/weezing_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD7B5C0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_rhyhorn_still_front_pic:: @ 8D7B5E0
	.incbin "graphics/pokemon/front_pics/rhyhorn_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7B5E0, 0x03FC

	.align 2
gFile_graphics_pokemon_palettes_rhyhorn_palette:: @ 8D7B9DC
	.incbin "graphics/pokemon/palettes/rhyhorn_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7B9DC, 0x0020

	.align 2
gFile_graphics_pokemon_back_pics_rhyhorn_back_pic:: @ 8D7B9FC
	.incbin "graphics/pokemon/back_pics/rhyhorn_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7B9FC, 0x0348

	.align 2
gFile_graphics_pokemon_palettes_rhyhorn_shiny_palette:: @ 8D7BD44
	.incbin "graphics/pokemon/palettes/rhyhorn_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7BD44, 0x0020

	.align 2
gFile_graphics_pokemon_icons_rhyhorn_icon:: @ 8D7BD64
	.incbin "graphics/pokemon/icons/rhyhorn_icon.4bpp"
	@ .incbin "baserom.gba", 0xD7BD64, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_rhyhorn_footprint:: @ 8D7C164
	.incbin "graphics/pokemon/footprints/rhyhorn_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD7C164, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_rhydon_still_front_pic:: @ 8D7C184
	.incbin "graphics/pokemon/front_pics/rhydon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7C184, 0x04F4

	.align 2
gFile_graphics_pokemon_palettes_rhydon_palette:: @ 8D7C678
	.incbin "graphics/pokemon/palettes/rhydon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7C678, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_rhydon_back_pic:: @ 8D7C6A0
	.incbin "graphics/pokemon/back_pics/rhydon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7C6A0, 0x0450

	.align 2
gFile_graphics_pokemon_palettes_rhydon_shiny_palette:: @ 8D7CAF0
	.incbin "graphics/pokemon/palettes/rhydon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7CAF0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_rhydon_icon:: @ 8D7CB18
	.incbin "graphics/pokemon/icons/rhydon_icon.4bpp"
	@ .incbin "baserom.gba", 0xD7CB18, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_rhydon_footprint:: @ 8D7CF18
	.incbin "graphics/pokemon/footprints/rhydon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD7CF18, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_chansey_still_front_pic:: @ 8D7CF38
	.incbin "graphics/pokemon/front_pics/chansey_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7CF38, 0x033C

	.align 2
gFile_graphics_pokemon_palettes_chansey_palette:: @ 8D7D274
	.incbin "graphics/pokemon/palettes/chansey_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7D274, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_chansey_back_pic:: @ 8D7D298
	.incbin "graphics/pokemon/back_pics/chansey_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7D298, 0x0250

	.align 2
gFile_graphics_pokemon_palettes_chansey_shiny_palette:: @ 8D7D4E8
	.incbin "graphics/pokemon/palettes/chansey_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7D4E8, 0x0024

	.align 2
gFile_graphics_pokemon_icons_chansey_icon:: @ 8D7D50C
	.incbin "graphics/pokemon/icons/chansey_icon.4bpp"
	@ .incbin "baserom.gba", 0xD7D50C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_chansey_footprint:: @ 8D7D90C
	.incbin "graphics/pokemon/footprints/chansey_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD7D90C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_tangela_still_front_pic:: @ 8D7D92C
	.incbin "graphics/pokemon/front_pics/tangela_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7D92C, 0x03D4

	.align 2
gFile_graphics_pokemon_palettes_tangela_palette:: @ 8D7DD00
	.incbin "graphics/pokemon/palettes/tangela_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7DD00, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_tangela_back_pic:: @ 8D7DD24
	.incbin "graphics/pokemon/back_pics/tangela_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7DD24, 0x03AC

	.align 2
gFile_graphics_pokemon_palettes_tangela_shiny_palette:: @ 8D7E0D0
	.incbin "graphics/pokemon/palettes/tangela_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7E0D0, 0x0024

	.align 2
gFile_graphics_pokemon_icons_tangela_icon:: @ 8D7E0F4
	.incbin "graphics/pokemon/icons/tangela_icon.4bpp"
	@ .incbin "baserom.gba", 0xD7E0F4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_tangela_footprint:: @ 8D7E4F4
	.incbin "graphics/pokemon/footprints/tangela_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD7E4F4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_kangaskhan_still_front_pic:: @ 8D7E514
	.incbin "graphics/pokemon/front_pics/kangaskhan_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7E514, 0x04A8

	.align 2
gFile_graphics_pokemon_palettes_kangaskhan_palette:: @ 8D7E9BC
	.incbin "graphics/pokemon/palettes/kangaskhan_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7E9BC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_kangaskhan_back_pic:: @ 8D7E9E4
	.incbin "graphics/pokemon/back_pics/kangaskhan_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7E9E4, 0x0430

	.align 2
gFile_graphics_pokemon_palettes_kangaskhan_shiny_palette:: @ 8D7EE14
	.incbin "graphics/pokemon/palettes/kangaskhan_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7EE14, 0x0028

	.align 2
gFile_graphics_pokemon_icons_kangaskhan_icon:: @ 8D7EE3C
	.incbin "graphics/pokemon/icons/kangaskhan_icon.4bpp"
	@ .incbin "baserom.gba", 0xD7EE3C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_kangaskhan_footprint:: @ 8D7F23C
	.incbin "graphics/pokemon/footprints/kangaskhan_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD7F23C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_horsea_still_front_pic:: @ 8D7F25C
	.incbin "graphics/pokemon/front_pics/horsea_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7F25C, 0x026C

	.align 2
gFile_graphics_pokemon_palettes_horsea_palette:: @ 8D7F4C8
	.incbin "graphics/pokemon/palettes/horsea_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7F4C8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_horsea_back_pic:: @ 8D7F4F0
	.incbin "graphics/pokemon/back_pics/horsea_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7F4F0, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_horsea_shiny_palette:: @ 8D7F7D0
	.incbin "graphics/pokemon/palettes/horsea_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7F7D0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_horsea_icon:: @ 8D7F7F8
	.incbin "graphics/pokemon/icons/horsea_icon.4bpp"
	@ .incbin "baserom.gba", 0xD7F7F8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_horsea_footprint:: @ 8D7FBF8
	.incbin "graphics/pokemon/footprints/horsea_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD7FBF8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_seadra_still_front_pic:: @ 8D7FC18
	.incbin "graphics/pokemon/front_pics/seadra_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7FC18, 0x0388

	.align 2
gFile_graphics_pokemon_palettes_seadra_palette:: @ 8D7FFA0
	.incbin "graphics/pokemon/palettes/seadra_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD7FFA0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_seadra_back_pic:: @ 8D7FFC8
	.incbin "graphics/pokemon/back_pics/seadra_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD7FFC8, 0x03A0

	.align 2
gFile_graphics_pokemon_palettes_seadra_shiny_palette:: @ 8D80368
	.incbin "graphics/pokemon/palettes/seadra_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD80368, 0x0028

	.align 2
gFile_graphics_pokemon_icons_seadra_icon:: @ 8D80390
	.incbin "graphics/pokemon/icons/seadra_icon.4bpp"
	@ .incbin "baserom.gba", 0xD80390, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_seadra_footprint:: @ 8D80790
	.incbin "graphics/pokemon/footprints/seadra_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD80790, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_goldeen_still_front_pic:: @ 8D807B0
	.incbin "graphics/pokemon/front_pics/goldeen_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD807B0, 0x0368

	.align 2
gFile_graphics_pokemon_palettes_goldeen_palette:: @ 8D80B18
	.incbin "graphics/pokemon/palettes/goldeen_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD80B18, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_goldeen_back_pic:: @ 8D80B40
	.incbin "graphics/pokemon/back_pics/goldeen_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD80B40, 0x0370

	.align 2
gFile_graphics_pokemon_palettes_goldeen_shiny_palette:: @ 8D80EB0
	.incbin "graphics/pokemon/palettes/goldeen_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD80EB0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_goldeen_icon:: @ 8D80ED8
	.incbin "graphics/pokemon/icons/goldeen_icon.4bpp"
	@ .incbin "baserom.gba", 0xD80ED8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_goldeen_footprint:: @ 8D812D8
	.incbin "graphics/pokemon/footprints/goldeen_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD812D8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_seaking_still_front_pic:: @ 8D812F8
	.incbin "graphics/pokemon/front_pics/seaking_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD812F8, 0x0474

	.align 2
gFile_graphics_pokemon_palettes_seaking_palette:: @ 8D8176C
	.incbin "graphics/pokemon/palettes/seaking_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8176C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_seaking_back_pic:: @ 8D81794
	.incbin "graphics/pokemon/back_pics/seaking_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD81794, 0x0350

	.align 2
gFile_graphics_pokemon_palettes_seaking_shiny_palette:: @ 8D81AE4
	.incbin "graphics/pokemon/palettes/seaking_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD81AE4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_seaking_icon:: @ 8D81B0C
	.incbin "graphics/pokemon/icons/seaking_icon.4bpp"
	@ .incbin "baserom.gba", 0xD81B0C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_seaking_footprint:: @ 8D81F0C
	.incbin "graphics/pokemon/footprints/seaking_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD81F0C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_staryu_still_front_pic:: @ 8D81F2C
	.incbin "graphics/pokemon/front_pics/staryu_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD81F2C, 0x02B0

	.align 2
gFile_graphics_pokemon_palettes_staryu_palette:: @ 8D821DC
	.incbin "graphics/pokemon/palettes/staryu_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD821DC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_staryu_back_pic:: @ 8D82204
	.incbin "graphics/pokemon/back_pics/staryu_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD82204, 0x0268

	.align 2
gFile_graphics_pokemon_palettes_staryu_shiny_palette:: @ 8D8246C
	.incbin "graphics/pokemon/palettes/staryu_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8246C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_staryu_icon:: @ 8D82494
	.incbin "graphics/pokemon/icons/staryu_icon.4bpp"
	@ .incbin "baserom.gba", 0xD82494, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_staryu_footprint:: @ 8D82894
	.incbin "graphics/pokemon/footprints/staryu_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD82894, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_starmie_still_front_pic:: @ 8D828B4
	.incbin "graphics/pokemon/front_pics/starmie_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD828B4, 0x03A0

	.align 2
gFile_graphics_pokemon_palettes_starmie_palette:: @ 8D82C54
	.incbin "graphics/pokemon/palettes/starmie_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD82C54, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_starmie_back_pic:: @ 8D82C7C
	.incbin "graphics/pokemon/back_pics/starmie_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD82C7C, 0x02A4

	.align 2
gFile_graphics_pokemon_palettes_starmie_shiny_palette:: @ 8D82F20
	.incbin "graphics/pokemon/palettes/starmie_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD82F20, 0x0028

	.align 2
gFile_graphics_pokemon_icons_starmie_icon:: @ 8D82F48
	.incbin "graphics/pokemon/icons/starmie_icon.4bpp"
	@ .incbin "baserom.gba", 0xD82F48, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_starmie_footprint:: @ 8D83348
	.incbin "graphics/pokemon/footprints/starmie_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD83348, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_mr_mime_still_front_pic:: @ 8D83368
	.incbin "graphics/pokemon/front_pics/mr_mime_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD83368, 0x03BC

	.align 2
gFile_graphics_pokemon_palettes_mr_mime_palette:: @ 8D83724
	.incbin "graphics/pokemon/palettes/mr_mime_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD83724, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_mr_mime_back_pic:: @ 8D8374C
	.incbin "graphics/pokemon/back_pics/mr_mime_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8374C, 0x0334

	.align 2
gFile_graphics_pokemon_palettes_mr_mime_shiny_palette:: @ 8D83A80
	.incbin "graphics/pokemon/palettes/mr_mime_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD83A80, 0x0028

	.align 2
gFile_graphics_pokemon_icons_mr_mime_icon:: @ 8D83AA8
	.incbin "graphics/pokemon/icons/mr_mime_icon.4bpp"
	@ .incbin "baserom.gba", 0xD83AA8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_mr_mime_footprint:: @ 8D83EA8
	.incbin "graphics/pokemon/footprints/mr_mime_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD83EA8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_scyther_still_front_pic:: @ 8D83EC8
	.incbin "graphics/pokemon/front_pics/scyther_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD83EC8, 0x0428

	.align 2
gFile_graphics_pokemon_palettes_scyther_palette:: @ 8D842F0
	.incbin "graphics/pokemon/palettes/scyther_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD842F0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_scyther_back_pic:: @ 8D84318
	.incbin "graphics/pokemon/back_pics/scyther_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD84318, 0x0418

	.align 2
gFile_graphics_pokemon_palettes_scyther_shiny_palette:: @ 8D84730
	.incbin "graphics/pokemon/palettes/scyther_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD84730, 0x0028

	.align 2
gFile_graphics_pokemon_icons_scyther_icon:: @ 8D84758
	.incbin "graphics/pokemon/icons/scyther_icon.4bpp"
	@ .incbin "baserom.gba", 0xD84758, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_scyther_footprint:: @ 8D84B58
	.incbin "graphics/pokemon/footprints/scyther_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD84B58, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_jynx_still_front_pic:: @ 8D84B78
	.incbin "graphics/pokemon/front_pics/jynx_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD84B78, 0x03CC

	.align 2
gFile_graphics_pokemon_palettes_jynx_palette:: @ 8D84F44
	.incbin "graphics/pokemon/palettes/jynx_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD84F44, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_jynx_back_pic:: @ 8D84F6C
	.incbin "graphics/pokemon/back_pics/jynx_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD84F6C, 0x02EC

	.align 2
gFile_graphics_pokemon_palettes_jynx_shiny_palette:: @ 8D85258
	.incbin "graphics/pokemon/palettes/jynx_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD85258, 0x0028

	.align 2
gFile_graphics_pokemon_icons_jynx_icon:: @ 8D85280
	.incbin "graphics/pokemon/icons/jynx_icon.4bpp"
	@ .incbin "baserom.gba", 0xD85280, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_jynx_footprint:: @ 8D85680
	.incbin "graphics/pokemon/footprints/jynx_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD85680, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_electabuzz_still_front_pic:: @ 8D856A0
	.incbin "graphics/pokemon/front_pics/electabuzz_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD856A0, 0x0458

	.align 2
gFile_graphics_pokemon_palettes_electabuzz_palette:: @ 8D85AF8
	.incbin "graphics/pokemon/palettes/electabuzz_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD85AF8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_electabuzz_back_pic:: @ 8D85B20
	.incbin "graphics/pokemon/back_pics/electabuzz_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD85B20, 0x0310

	.align 2
gFile_graphics_pokemon_palettes_electabuzz_shiny_palette:: @ 8D85E30
	.incbin "graphics/pokemon/palettes/electabuzz_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD85E30, 0x0028

	.align 2
gFile_graphics_pokemon_icons_electabuzz_icon:: @ 8D85E58
	.incbin "graphics/pokemon/icons/electabuzz_icon.4bpp"
	@ .incbin "baserom.gba", 0xD85E58, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_electabuzz_footprint:: @ 8D86258
	.incbin "graphics/pokemon/footprints/electabuzz_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD86258, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_magmar_still_front_pic:: @ 8D86278
	.incbin "graphics/pokemon/front_pics/magmar_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD86278, 0x0430

	.align 2
gFile_graphics_pokemon_palettes_magmar_palette:: @ 8D866A8
	.incbin "graphics/pokemon/palettes/magmar_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD866A8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_magmar_back_pic:: @ 8D866D0
	.incbin "graphics/pokemon/back_pics/magmar_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD866D0, 0x0338

	.align 2
gFile_graphics_pokemon_palettes_magmar_shiny_palette:: @ 8D86A08
	.incbin "graphics/pokemon/palettes/magmar_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD86A08, 0x0028

	.align 2
gFile_graphics_pokemon_icons_magmar_icon:: @ 8D86A30
	.incbin "graphics/pokemon/icons/magmar_icon.4bpp"
	@ .incbin "baserom.gba", 0xD86A30, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_magmar_footprint:: @ 8D86E30
	.incbin "graphics/pokemon/footprints/magmar_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD86E30, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_pinsir_still_front_pic:: @ 8D86E50
	.incbin "graphics/pokemon/front_pics/pinsir_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD86E50, 0x0430

	.align 2
gFile_graphics_pokemon_palettes_pinsir_palette:: @ 8D87280
	.incbin "graphics/pokemon/palettes/pinsir_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD87280, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_pinsir_back_pic:: @ 8D872A4
	.incbin "graphics/pokemon/back_pics/pinsir_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD872A4, 0x0354

	.align 2
gFile_graphics_pokemon_palettes_pinsir_shiny_palette:: @ 8D875F8
	.incbin "graphics/pokemon/palettes/pinsir_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD875F8, 0x0024

	.align 2
gFile_graphics_pokemon_icons_pinsir_icon:: @ 8D8761C
	.incbin "graphics/pokemon/icons/pinsir_icon.4bpp"
	@ .incbin "baserom.gba", 0xD8761C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_pinsir_footprint:: @ 8D87A1C
	.incbin "graphics/pokemon/footprints/pinsir_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD87A1C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_tauros_still_front_pic:: @ 8D87A3C
	.incbin "graphics/pokemon/front_pics/tauros_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD87A3C, 0x0460

	.align 2
gFile_graphics_pokemon_palettes_tauros_palette:: @ 8D87E9C
	.incbin "graphics/pokemon/palettes/tauros_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD87E9C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_tauros_back_pic:: @ 8D87EC4
	.incbin "graphics/pokemon/back_pics/tauros_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD87EC4, 0x02B4

	.align 2
gFile_graphics_pokemon_palettes_tauros_shiny_palette:: @ 8D88178
	.incbin "graphics/pokemon/palettes/tauros_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD88178, 0x0028

	.align 2
gFile_graphics_pokemon_icons_tauros_icon:: @ 8D881A0
	.incbin "graphics/pokemon/icons/tauros_icon.4bpp"
	@ .incbin "baserom.gba", 0xD881A0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_tauros_footprint:: @ 8D885A0
	.incbin "graphics/pokemon/footprints/tauros_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD885A0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_magikarp_still_front_pic:: @ 8D885C0
	.incbin "graphics/pokemon/front_pics/magikarp_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD885C0, 0x0348

	.align 2
gFile_graphics_pokemon_palettes_magikarp_palette:: @ 8D88908
	.incbin "graphics/pokemon/palettes/magikarp_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD88908, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_magikarp_back_pic:: @ 8D88930
	.incbin "graphics/pokemon/back_pics/magikarp_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD88930, 0x0330

	.align 2
gFile_graphics_pokemon_palettes_magikarp_shiny_palette:: @ 8D88C60
	.incbin "graphics/pokemon/palettes/magikarp_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD88C60, 0x0028

	.align 2
gFile_graphics_pokemon_icons_magikarp_icon:: @ 8D88C88
	.incbin "graphics/pokemon/icons/magikarp_icon.4bpp"
	@ .incbin "baserom.gba", 0xD88C88, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_magikarp_footprint:: @ 8D89088
	.incbin "graphics/pokemon/footprints/magikarp_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD89088, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_gyarados_still_front_pic:: @ 8D890A8
	.incbin "graphics/pokemon/front_pics/gyarados_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD890A8, 0x05A4

	.align 2
gFile_graphics_pokemon_palettes_gyarados_palette:: @ 8D8964C
	.incbin "graphics/pokemon/palettes/gyarados_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8964C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_gyarados_back_pic:: @ 8D89674
	.incbin "graphics/pokemon/back_pics/gyarados_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD89674, 0x04B8

	.align 2
gFile_graphics_pokemon_palettes_gyarados_shiny_palette:: @ 8D89B2C
	.incbin "graphics/pokemon/palettes/gyarados_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD89B2C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_gyarados_icon:: @ 8D89B54
	.incbin "graphics/pokemon/icons/gyarados_icon.4bpp"
	@ .incbin "baserom.gba", 0xD89B54, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_gyarados_footprint:: @ 8D89F54
	.incbin "graphics/pokemon/footprints/gyarados_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD89F54, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_lapras_still_front_pic:: @ 8D89F74
	.incbin "graphics/pokemon/front_pics/lapras_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD89F74, 0x03E0

	.align 2
gFile_graphics_pokemon_palettes_lapras_palette:: @ 8D8A354
	.incbin "graphics/pokemon/palettes/lapras_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8A354, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_lapras_back_pic:: @ 8D8A37C
	.incbin "graphics/pokemon/back_pics/lapras_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8A37C, 0x0344

	.align 2
gFile_graphics_pokemon_palettes_lapras_shiny_palette:: @ 8D8A6C0
	.incbin "graphics/pokemon/palettes/lapras_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8A6C0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_lapras_icon:: @ 8D8A6E8
	.incbin "graphics/pokemon/icons/lapras_icon.4bpp"
	@ .incbin "baserom.gba", 0xD8A6E8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_lapras_footprint:: @ 8D8AAE8
	.incbin "graphics/pokemon/footprints/lapras_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD8AAE8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ditto_still_front_pic:: @ 8D8AB08
	.incbin "graphics/pokemon/front_pics/ditto_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8AB08, 0x01F0

	.align 2
gFile_graphics_pokemon_palettes_ditto_palette:: @ 8D8ACF8
	.incbin "graphics/pokemon/palettes/ditto_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8ACF8, 0x0020

	.align 2
gFile_graphics_pokemon_back_pics_ditto_back_pic:: @ 8D8AD18
	.incbin "graphics/pokemon/back_pics/ditto_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8AD18, 0x0200

	.align 2
gFile_graphics_pokemon_palettes_ditto_shiny_palette:: @ 8D8AF18
	.incbin "graphics/pokemon/palettes/ditto_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8AF18, 0x0020

	.align 2
gFile_graphics_pokemon_icons_ditto_icon:: @ 8D8AF38
	.incbin "graphics/pokemon/icons/ditto_icon.4bpp"
	@ .incbin "baserom.gba", 0xD8AF38, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ditto_footprint:: @ 8D8B338
	.incbin "graphics/pokemon/footprints/ditto_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD8B338, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_eevee_still_front_pic:: @ 8D8B358
	.incbin "graphics/pokemon/front_pics/eevee_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8B358, 0x02EC

	.align 2
gFile_graphics_pokemon_palettes_eevee_palette:: @ 8D8B644
	.incbin "graphics/pokemon/palettes/eevee_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8B644, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_eevee_back_pic:: @ 8D8B66C
	.incbin "graphics/pokemon/back_pics/eevee_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8B66C, 0x0328

	.align 2
gFile_graphics_pokemon_palettes_eevee_shiny_palette:: @ 8D8B994
	.incbin "graphics/pokemon/palettes/eevee_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8B994, 0x0028

	.align 2
gFile_graphics_pokemon_icons_eevee_icon:: @ 8D8B9BC
	.incbin "graphics/pokemon/icons/eevee_icon.4bpp"
	@ .incbin "baserom.gba", 0xD8B9BC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_eevee_footprint:: @ 8D8BDBC
	.incbin "graphics/pokemon/footprints/eevee_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD8BDBC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_vaporeon_still_front_pic:: @ 8D8BDDC
	.incbin "graphics/pokemon/front_pics/vaporeon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8BDDC, 0x0394

	.align 2
gFile_graphics_pokemon_palettes_vaporeon_palette:: @ 8D8C170
	.incbin "graphics/pokemon/palettes/vaporeon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8C170, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_vaporeon_back_pic:: @ 8D8C198
	.incbin "graphics/pokemon/back_pics/vaporeon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8C198, 0x02C8

	.align 2
gFile_graphics_pokemon_palettes_vaporeon_shiny_palette:: @ 8D8C460
	.incbin "graphics/pokemon/palettes/vaporeon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8C460, 0x0028

	.align 2
gFile_graphics_pokemon_icons_vaporeon_icon:: @ 8D8C488
	.incbin "graphics/pokemon/icons/vaporeon_icon.4bpp"
	@ .incbin "baserom.gba", 0xD8C488, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_vaporeon_footprint:: @ 8D8C888
	.incbin "graphics/pokemon/footprints/vaporeon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD8C888, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_jolteon_still_front_pic:: @ 8D8C8A8
	.incbin "graphics/pokemon/front_pics/jolteon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8C8A8, 0x0350

	.align 2
gFile_graphics_pokemon_palettes_jolteon_palette:: @ 8D8CBF8
	.incbin "graphics/pokemon/palettes/jolteon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8CBF8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_jolteon_back_pic:: @ 8D8CC20
	.incbin "graphics/pokemon/back_pics/jolteon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8CC20, 0x03AC

	.align 2
gFile_graphics_pokemon_palettes_jolteon_shiny_palette:: @ 8D8CFCC
	.incbin "graphics/pokemon/palettes/jolteon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8CFCC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_jolteon_icon:: @ 8D8CFF4
	.incbin "graphics/pokemon/icons/jolteon_icon.4bpp"
	@ .incbin "baserom.gba", 0xD8CFF4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_jolteon_footprint:: @ 8D8D3F4
	.incbin "graphics/pokemon/footprints/jolteon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD8D3F4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_flareon_still_front_pic:: @ 8D8D414
	.incbin "graphics/pokemon/front_pics/flareon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8D414, 0x0384

	.align 2
gFile_graphics_pokemon_palettes_flareon_palette:: @ 8D8D798
	.incbin "graphics/pokemon/palettes/flareon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8D798, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_flareon_back_pic:: @ 8D8D7C0
	.incbin "graphics/pokemon/back_pics/flareon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8D7C0, 0x0390

	.align 2
gFile_graphics_pokemon_palettes_flareon_shiny_palette:: @ 8D8DB50
	.incbin "graphics/pokemon/palettes/flareon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8DB50, 0x0028

	.align 2
gFile_graphics_pokemon_icons_flareon_icon:: @ 8D8DB78
	.incbin "graphics/pokemon/icons/flareon_icon.4bpp"
	@ .incbin "baserom.gba", 0xD8DB78, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_flareon_footprint:: @ 8D8DF78
	.incbin "graphics/pokemon/footprints/flareon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD8DF78, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_porygon_still_front_pic:: @ 8D8DF98
	.incbin "graphics/pokemon/front_pics/porygon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8DF98, 0x02B8

	.align 2
gFile_graphics_pokemon_palettes_porygon_palette:: @ 8D8E250
	.incbin "graphics/pokemon/palettes/porygon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8E250, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_porygon_back_pic:: @ 8D8E274
	.incbin "graphics/pokemon/back_pics/porygon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8E274, 0x02B8

	.align 2
gFile_graphics_pokemon_palettes_porygon_shiny_palette:: @ 8D8E52C
	.incbin "graphics/pokemon/palettes/porygon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8E52C, 0x0024

	.align 2
gFile_graphics_pokemon_icons_porygon_icon:: @ 8D8E550
	.incbin "graphics/pokemon/icons/porygon_icon.4bpp"
	@ .incbin "baserom.gba", 0xD8E550, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_porygon_footprint:: @ 8D8E950
	.incbin "graphics/pokemon/footprints/porygon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD8E950, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_omanyte_still_front_pic:: @ 8D8E970
	.incbin "graphics/pokemon/front_pics/omanyte_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8E970, 0x0290

	.align 2
gFile_graphics_pokemon_palettes_omanyte_palette:: @ 8D8EC00
	.incbin "graphics/pokemon/palettes/omanyte_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8EC00, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_omanyte_back_pic:: @ 8D8EC28
	.incbin "graphics/pokemon/back_pics/omanyte_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8EC28, 0x034C

	.align 2
gFile_graphics_pokemon_palettes_omanyte_shiny_palette:: @ 8D8EF74
	.incbin "graphics/pokemon/palettes/omanyte_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8EF74, 0x0028

	.align 2
gFile_graphics_pokemon_icons_omanyte_icon:: @ 8D8EF9C
	.incbin "graphics/pokemon/icons/omanyte_icon.4bpp"
	@ .incbin "baserom.gba", 0xD8EF9C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_omanyte_footprint:: @ 8D8F39C
	.incbin "graphics/pokemon/footprints/omanyte_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD8F39C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_omastar_still_front_pic:: @ 8D8F3BC
	.incbin "graphics/pokemon/front_pics/omastar_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8F3BC, 0x03C0

	.align 2
gFile_graphics_pokemon_palettes_omastar_palette:: @ 8D8F77C
	.incbin "graphics/pokemon/palettes/omastar_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8F77C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_omastar_back_pic:: @ 8D8F7A4
	.incbin "graphics/pokemon/back_pics/omastar_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8F7A4, 0x0340

	.align 2
gFile_graphics_pokemon_palettes_omastar_shiny_palette:: @ 8D8FAE4
	.incbin "graphics/pokemon/palettes/omastar_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD8FAE4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_omastar_icon:: @ 8D8FB0C
	.incbin "graphics/pokemon/icons/omastar_icon.4bpp"
	@ .incbin "baserom.gba", 0xD8FB0C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_omastar_footprint:: @ 8D8FF0C
	.incbin "graphics/pokemon/footprints/omastar_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD8FF0C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_kabuto_still_front_pic:: @ 8D8FF2C
	.incbin "graphics/pokemon/front_pics/kabuto_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD8FF2C, 0x0228

	.align 2
gFile_graphics_pokemon_palettes_kabuto_palette:: @ 8D90154
	.incbin "graphics/pokemon/palettes/kabuto_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD90154, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_kabuto_back_pic:: @ 8D9017C
	.incbin "graphics/pokemon/back_pics/kabuto_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9017C, 0x0298

	.align 2
gFile_graphics_pokemon_palettes_kabuto_shiny_palette:: @ 8D90414
	.incbin "graphics/pokemon/palettes/kabuto_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD90414, 0x0028

	.align 2
gFile_graphics_pokemon_icons_kabuto_icon:: @ 8D9043C
	.incbin "graphics/pokemon/icons/kabuto_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9043C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_kabuto_footprint:: @ 8D9083C
	.incbin "graphics/pokemon/footprints/kabuto_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9083C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_kabutops_still_front_pic:: @ 8D9085C
	.incbin "graphics/pokemon/front_pics/kabutops_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9085C, 0x0410

	.align 2
gFile_graphics_pokemon_palettes_kabutops_palette:: @ 8D90C6C
	.incbin "graphics/pokemon/palettes/kabutops_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD90C6C, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_kabutops_back_pic:: @ 8D90C90
	.incbin "graphics/pokemon/back_pics/kabutops_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD90C90, 0x03A4

	.align 2
gFile_graphics_pokemon_palettes_kabutops_shiny_palette:: @ 8D91034
	.incbin "graphics/pokemon/palettes/kabutops_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD91034, 0x0024

	.align 2
gFile_graphics_pokemon_icons_kabutops_icon:: @ 8D91058
	.incbin "graphics/pokemon/icons/kabutops_icon.4bpp"
	@ .incbin "baserom.gba", 0xD91058, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_kabutops_footprint:: @ 8D91458
	.incbin "graphics/pokemon/footprints/kabutops_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD91458, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_aerodactyl_still_front_pic:: @ 8D91478
	.incbin "graphics/pokemon/front_pics/aerodactyl_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD91478, 0x0450

	.align 2
gFile_graphics_pokemon_palettes_aerodactyl_palette:: @ 8D918C8
	.incbin "graphics/pokemon/palettes/aerodactyl_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD918C8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_aerodactyl_back_pic:: @ 8D918F0
	.incbin "graphics/pokemon/back_pics/aerodactyl_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD918F0, 0x0304

	.align 2
gFile_graphics_pokemon_palettes_aerodactyl_shiny_palette:: @ 8D91BF4
	.incbin "graphics/pokemon/palettes/aerodactyl_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD91BF4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_aerodactyl_icon:: @ 8D91C1C
	.incbin "graphics/pokemon/icons/aerodactyl_icon.4bpp"
	@ .incbin "baserom.gba", 0xD91C1C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_aerodactyl_footprint:: @ 8D9201C
	.incbin "graphics/pokemon/footprints/aerodactyl_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9201C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_snorlax_still_front_pic:: @ 8D9203C
	.incbin "graphics/pokemon/front_pics/snorlax_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9203C, 0x03D4

	.align 2
gFile_graphics_pokemon_palettes_snorlax_palette:: @ 8D92410
	.incbin "graphics/pokemon/palettes/snorlax_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD92410, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_snorlax_back_pic:: @ 8D92438
	.incbin "graphics/pokemon/back_pics/snorlax_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD92438, 0x021C

	.align 2
gFile_graphics_pokemon_palettes_snorlax_shiny_palette:: @ 8D92654
	.incbin "graphics/pokemon/palettes/snorlax_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD92654, 0x0028

	.align 2
gFile_graphics_pokemon_icons_snorlax_icon:: @ 8D9267C
	.incbin "graphics/pokemon/icons/snorlax_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9267C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_snorlax_footprint:: @ 8D92A7C
	.incbin "graphics/pokemon/footprints/snorlax_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD92A7C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_articuno_still_front_pic:: @ 8D92A9C
	.incbin "graphics/pokemon/front_pics/articuno_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD92A9C, 0x04F8

	.align 2
gFile_graphics_pokemon_palettes_articuno_palette:: @ 8D92F94
	.incbin "graphics/pokemon/palettes/articuno_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD92F94, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_articuno_back_pic:: @ 8D92FBC
	.incbin "graphics/pokemon/back_pics/articuno_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD92FBC, 0x025C

	.align 2
gFile_graphics_pokemon_palettes_articuno_shiny_palette:: @ 8D93218
	.incbin "graphics/pokemon/palettes/articuno_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD93218, 0x0028

	.align 2
gFile_graphics_pokemon_icons_articuno_icon:: @ 8D93240
	.incbin "graphics/pokemon/icons/articuno_icon.4bpp"
	@ .incbin "baserom.gba", 0xD93240, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_articuno_footprint:: @ 8D93640
	.incbin "graphics/pokemon/footprints/articuno_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD93640, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_zapdos_still_front_pic:: @ 8D93660
	.incbin "graphics/pokemon/front_pics/zapdos_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD93660, 0x0450

	.align 2
gFile_graphics_pokemon_palettes_zapdos_palette:: @ 8D93AB0
	.incbin "graphics/pokemon/palettes/zapdos_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD93AB0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_zapdos_back_pic:: @ 8D93AD8
	.incbin "graphics/pokemon/back_pics/zapdos_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD93AD8, 0x033C

	.align 2
gFile_graphics_pokemon_palettes_zapdos_shiny_palette:: @ 8D93E14
	.incbin "graphics/pokemon/palettes/zapdos_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD93E14, 0x0028

	.align 2
gFile_graphics_pokemon_icons_zapdos_icon:: @ 8D93E3C
	.incbin "graphics/pokemon/icons/zapdos_icon.4bpp"
	@ .incbin "baserom.gba", 0xD93E3C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_zapdos_footprint:: @ 8D9423C
	.incbin "graphics/pokemon/footprints/zapdos_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9423C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_moltres_still_front_pic:: @ 8D9425C
	.incbin "graphics/pokemon/front_pics/moltres_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9425C, 0x04CC

	.align 2
gFile_graphics_pokemon_palettes_moltres_palette:: @ 8D94728
	.incbin "graphics/pokemon/palettes/moltres_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD94728, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_moltres_back_pic:: @ 8D94750
	.incbin "graphics/pokemon/back_pics/moltres_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD94750, 0x033C

	.align 2
gFile_graphics_pokemon_palettes_moltres_shiny_palette:: @ 8D94A8C
	.incbin "graphics/pokemon/palettes/moltres_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD94A8C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_moltres_icon:: @ 8D94AB4
	.incbin "graphics/pokemon/icons/moltres_icon.4bpp"
	@ .incbin "baserom.gba", 0xD94AB4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_moltres_footprint:: @ 8D94EB4
	.incbin "graphics/pokemon/footprints/moltres_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD94EB4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_dratini_still_front_pic:: @ 8D94ED4
	.incbin "graphics/pokemon/front_pics/dratini_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD94ED4, 0x02BC

	.align 2
gFile_graphics_pokemon_palettes_dratini_palette:: @ 8D95190
	.incbin "graphics/pokemon/palettes/dratini_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD95190, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_dratini_back_pic:: @ 8D951B4
	.incbin "graphics/pokemon/back_pics/dratini_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD951B4, 0x0290

	.align 2
gFile_graphics_pokemon_palettes_dratini_shiny_palette:: @ 8D95444
	.incbin "graphics/pokemon/palettes/dratini_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD95444, 0x0024

	.align 2
gFile_graphics_pokemon_icons_dratini_icon:: @ 8D95468
	.incbin "graphics/pokemon/icons/dratini_icon.4bpp"
	@ .incbin "baserom.gba", 0xD95468, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_dratini_footprint:: @ 8D95868
	.incbin "graphics/pokemon/footprints/dratini_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD95868, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_dragonair_still_front_pic:: @ 8D95888
	.incbin "graphics/pokemon/front_pics/dragonair_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD95888, 0x0398

	.align 2
gFile_graphics_pokemon_palettes_dragonair_palette:: @ 8D95C20
	.incbin "graphics/pokemon/palettes/dragonair_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD95C20, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_dragonair_back_pic:: @ 8D95C48
	.incbin "graphics/pokemon/back_pics/dragonair_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD95C48, 0x0310

	.align 2
gFile_graphics_pokemon_palettes_dragonair_shiny_palette:: @ 8D95F58
	.incbin "graphics/pokemon/palettes/dragonair_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD95F58, 0x0028

	.align 2
gFile_graphics_pokemon_icons_dragonair_icon:: @ 8D95F80
	.incbin "graphics/pokemon/icons/dragonair_icon.4bpp"
	@ .incbin "baserom.gba", 0xD95F80, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_dragonair_footprint:: @ 8D96380
	.incbin "graphics/pokemon/footprints/dragonair_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD96380, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_dragonite_still_front_pic:: @ 8D963A0
	.incbin "graphics/pokemon/front_pics/dragonite_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD963A0, 0x0550

	.align 2
gFile_graphics_pokemon_palettes_dragonite_palette:: @ 8D968F0
	.incbin "graphics/pokemon/palettes/dragonite_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD968F0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_dragonite_back_pic:: @ 8D96918
	.incbin "graphics/pokemon/back_pics/dragonite_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD96918, 0x02F8

	.align 2
gFile_graphics_pokemon_palettes_dragonite_shiny_palette:: @ 8D96C10
	.incbin "graphics/pokemon/palettes/dragonite_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD96C10, 0x0028

	.align 2
gFile_graphics_pokemon_icons_dragonite_icon:: @ 8D96C38
	.incbin "graphics/pokemon/icons/dragonite_icon.4bpp"
	@ .incbin "baserom.gba", 0xD96C38, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_dragonite_footprint:: @ 8D97038
	.incbin "graphics/pokemon/footprints/dragonite_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD97038, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_mewtwo_still_front_pic:: @ 8D97058
	.incbin "graphics/pokemon/front_pics/mewtwo_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD97058, 0x043C

	.align 2
gFile_graphics_pokemon_palettes_mewtwo_palette:: @ 8D97494
	.incbin "graphics/pokemon/palettes/mewtwo_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD97494, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_mewtwo_back_pic:: @ 8D974B8
	.incbin "graphics/pokemon/back_pics/mewtwo_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD974B8, 0x03CC

	.align 2
gFile_graphics_pokemon_palettes_mewtwo_shiny_palette:: @ 8D97884
	.incbin "graphics/pokemon/palettes/mewtwo_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD97884, 0x0024

	.align 2
gFile_graphics_pokemon_icons_mewtwo_icon:: @ 8D978A8
	.incbin "graphics/pokemon/icons/mewtwo_icon.4bpp"
	@ .incbin "baserom.gba", 0xD978A8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_mewtwo_footprint:: @ 8D97CA8
	.incbin "graphics/pokemon/footprints/mewtwo_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD97CA8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_mew_still_front_pic:: @ 8D97CC8
	.incbin "graphics/pokemon/front_pics/mew_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD97CC8, 0x02C0

	.align 2
gFile_graphics_pokemon_palettes_mew_palette:: @ 8D97F88
	.incbin "graphics/pokemon/palettes/mew_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD97F88, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_mew_back_pic:: @ 8D97FAC
	.incbin "graphics/pokemon/back_pics/mew_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD97FAC, 0x0350

	.align 2
gFile_graphics_pokemon_palettes_mew_shiny_palette:: @ 8D982FC
	.incbin "graphics/pokemon/palettes/mew_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD982FC, 0x0024

	.align 2
gFile_graphics_pokemon_icons_mew_icon:: @ 8D98320
	.incbin "graphics/pokemon/icons/mew_icon.4bpp"
	@ .incbin "baserom.gba", 0xD98320, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_mew_footprint:: @ 8D98720
	.incbin "graphics/pokemon/footprints/mew_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD98720, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_chikorita_still_front_pic:: @ 8D98740
	.incbin "graphics/pokemon/front_pics/chikorita_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD98740, 0x0268

	.align 2
gFile_graphics_pokemon_palettes_chikorita_palette:: @ 8D989A8
	.incbin "graphics/pokemon/palettes/chikorita_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD989A8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_chikorita_back_pic:: @ 8D989D0
	.incbin "graphics/pokemon/back_pics/chikorita_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD989D0, 0x02C4

	.align 2
gFile_graphics_pokemon_palettes_chikorita_shiny_palette:: @ 8D98C94
	.incbin "graphics/pokemon/palettes/chikorita_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD98C94, 0x0028

	.align 2
gFile_graphics_pokemon_icons_chikorita_icon:: @ 8D98CBC
	.incbin "graphics/pokemon/icons/chikorita_icon.4bpp"
	@ .incbin "baserom.gba", 0xD98CBC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_chikorita_footprint:: @ 8D990BC
	.incbin "graphics/pokemon/footprints/chikorita_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD990BC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_bayleef_still_front_pic:: @ 8D990DC
	.incbin "graphics/pokemon/front_pics/bayleef_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD990DC, 0x03D4

	.align 2
gFile_graphics_pokemon_palettes_bayleef_palette:: @ 8D994B0
	.incbin "graphics/pokemon/palettes/bayleef_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD994B0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_bayleef_back_pic:: @ 8D994D8
	.incbin "graphics/pokemon/back_pics/bayleef_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD994D8, 0x0390

	.align 2
gFile_graphics_pokemon_palettes_bayleef_shiny_palette:: @ 8D99868
	.incbin "graphics/pokemon/palettes/bayleef_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD99868, 0x0028

	.align 2
gFile_graphics_pokemon_icons_bayleef_icon:: @ 8D99890
	.incbin "graphics/pokemon/icons/bayleef_icon.4bpp"
	@ .incbin "baserom.gba", 0xD99890, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_bayleef_footprint:: @ 8D99C90
	.incbin "graphics/pokemon/footprints/bayleef_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD99C90, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_meganium_still_front_pic:: @ 8D99CB0
	.incbin "graphics/pokemon/front_pics/meganium_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD99CB0, 0x055C

	.align 2
gFile_graphics_pokemon_palettes_meganium_palette:: @ 8D9A20C
	.incbin "graphics/pokemon/palettes/meganium_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9A20C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_meganium_back_pic:: @ 8D9A234
	.incbin "graphics/pokemon/back_pics/meganium_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9A234, 0x0350

	.align 2
gFile_graphics_pokemon_palettes_meganium_shiny_palette:: @ 8D9A584
	.incbin "graphics/pokemon/palettes/meganium_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9A584, 0x0028

	.align 2
gFile_graphics_pokemon_icons_meganium_icon:: @ 8D9A5AC
	.incbin "graphics/pokemon/icons/meganium_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9A5AC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_meganium_footprint:: @ 8D9A9AC
	.incbin "graphics/pokemon/footprints/meganium_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9A9AC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_cyndaquil_still_front_pic:: @ 8D9A9CC
	.incbin "graphics/pokemon/front_pics/cyndaquil_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9A9CC, 0x028C

	.align 2
gFile_graphics_pokemon_palettes_cyndaquil_palette:: @ 8D9AC58
	.incbin "graphics/pokemon/palettes/cyndaquil_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9AC58, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_cyndaquil_back_pic:: @ 8D9AC80
	.incbin "graphics/pokemon/back_pics/cyndaquil_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9AC80, 0x032C

	.align 2
gFile_graphics_pokemon_palettes_cyndaquil_shiny_palette:: @ 8D9AFAC
	.incbin "graphics/pokemon/palettes/cyndaquil_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9AFAC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_cyndaquil_icon:: @ 8D9AFD4
	.incbin "graphics/pokemon/icons/cyndaquil_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9AFD4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_cyndaquil_footprint:: @ 8D9B3D4
	.incbin "graphics/pokemon/footprints/cyndaquil_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9B3D4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_quilava_still_front_pic:: @ 8D9B3F4
	.incbin "graphics/pokemon/front_pics/quilava_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9B3F4, 0x031C

	.align 2
gFile_graphics_pokemon_palettes_quilava_palette:: @ 8D9B710
	.incbin "graphics/pokemon/palettes/quilava_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9B710, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_quilava_back_pic:: @ 8D9B738
	.incbin "graphics/pokemon/back_pics/quilava_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9B738, 0x0374

	.align 2
gFile_graphics_pokemon_palettes_quilava_shiny_palette:: @ 8D9BAAC
	.incbin "graphics/pokemon/palettes/quilava_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9BAAC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_quilava_icon:: @ 8D9BAD4
	.incbin "graphics/pokemon/icons/quilava_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9BAD4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_quilava_footprint:: @ 8D9BED4
	.incbin "graphics/pokemon/footprints/quilava_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9BED4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_typhlosion_still_front_pic:: @ 8D9BEF4
	.incbin "graphics/pokemon/front_pics/typhlosion_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9BEF4, 0x0428

	.align 2
gFile_graphics_pokemon_palettes_typhlosion_palette:: @ 8D9C31C
	.incbin "graphics/pokemon/palettes/typhlosion_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9C31C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_typhlosion_back_pic:: @ 8D9C344
	.incbin "graphics/pokemon/back_pics/typhlosion_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9C344, 0x0404

	.align 2
gFile_graphics_pokemon_palettes_typhlosion_shiny_palette:: @ 8D9C748
	.incbin "graphics/pokemon/palettes/typhlosion_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9C748, 0x0028

	.align 2
gFile_graphics_pokemon_icons_typhlosion_icon:: @ 8D9C770
	.incbin "graphics/pokemon/icons/typhlosion_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9C770, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_typhlosion_footprint:: @ 8D9CB70
	.incbin "graphics/pokemon/footprints/typhlosion_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9CB70, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_totodile_still_front_pic:: @ 8D9CB90
	.incbin "graphics/pokemon/front_pics/totodile_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9CB90, 0x02A4

	.align 2
gFile_graphics_pokemon_palettes_totodile_palette:: @ 8D9CE34
	.incbin "graphics/pokemon/palettes/totodile_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9CE34, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_totodile_back_pic:: @ 8D9CE5C
	.incbin "graphics/pokemon/back_pics/totodile_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9CE5C, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_totodile_shiny_palette:: @ 8D9D13C
	.incbin "graphics/pokemon/palettes/totodile_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9D13C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_totodile_icon:: @ 8D9D164
	.incbin "graphics/pokemon/icons/totodile_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9D164, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_totodile_footprint:: @ 8D9D564
	.incbin "graphics/pokemon/footprints/totodile_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9D564, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_croconaw_still_front_pic:: @ 8D9D584
	.incbin "graphics/pokemon/front_pics/croconaw_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9D584, 0x0368

	.align 2
gFile_graphics_pokemon_palettes_croconaw_palette:: @ 8D9D8EC
	.incbin "graphics/pokemon/palettes/croconaw_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9D8EC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_croconaw_back_pic:: @ 8D9D914
	.incbin "graphics/pokemon/back_pics/croconaw_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9D914, 0x0350

	.align 2
gFile_graphics_pokemon_palettes_croconaw_shiny_palette:: @ 8D9DC64
	.incbin "graphics/pokemon/palettes/croconaw_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9DC64, 0x0028

	.align 2
gFile_graphics_pokemon_icons_croconaw_icon:: @ 8D9DC8C
	.incbin "graphics/pokemon/icons/croconaw_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9DC8C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_croconaw_footprint:: @ 8D9E08C
	.incbin "graphics/pokemon/footprints/croconaw_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9E08C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_feraligatr_still_front_pic:: @ 8D9E0AC
	.incbin "graphics/pokemon/front_pics/feraligatr_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9E0AC, 0x056C

	.align 2
gFile_graphics_pokemon_palettes_feraligatr_palette:: @ 8D9E618
	.incbin "graphics/pokemon/palettes/feraligatr_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9E618, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_feraligatr_back_pic:: @ 8D9E640
	.incbin "graphics/pokemon/back_pics/feraligatr_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9E640, 0x04CC

	.align 2
gFile_graphics_pokemon_palettes_feraligatr_shiny_palette:: @ 8D9EB0C
	.incbin "graphics/pokemon/palettes/feraligatr_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9EB0C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_feraligatr_icon:: @ 8D9EB34
	.incbin "graphics/pokemon/icons/feraligatr_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9EB34, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_feraligatr_footprint:: @ 8D9EF34
	.incbin "graphics/pokemon/footprints/feraligatr_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9EF34, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sentret_still_front_pic:: @ 8D9EF54
	.incbin "graphics/pokemon/front_pics/sentret_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9EF54, 0x02DC

	.align 2
gFile_graphics_pokemon_palettes_sentret_palette:: @ 8D9F230
	.incbin "graphics/pokemon/palettes/sentret_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9F230, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sentret_back_pic:: @ 8D9F258
	.incbin "graphics/pokemon/back_pics/sentret_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9F258, 0x02A4

	.align 2
gFile_graphics_pokemon_palettes_sentret_shiny_palette:: @ 8D9F4FC
	.incbin "graphics/pokemon/palettes/sentret_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9F4FC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sentret_icon:: @ 8D9F524
	.incbin "graphics/pokemon/icons/sentret_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9F524, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sentret_footprint:: @ 8D9F924
	.incbin "graphics/pokemon/footprints/sentret_footprint.1bpp"
	@ .incbin "baserom.gba", 0xD9F924, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_furret_still_front_pic:: @ 8D9F944
	.incbin "graphics/pokemon/front_pics/furret_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9F944, 0x0334

	.align 2
gFile_graphics_pokemon_palettes_furret_palette:: @ 8D9FC78
	.incbin "graphics/pokemon/palettes/furret_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9FC78, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_furret_back_pic:: @ 8D9FCA0
	.incbin "graphics/pokemon/back_pics/furret_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xD9FCA0, 0x0328

	.align 2
gFile_graphics_pokemon_palettes_furret_shiny_palette:: @ 8D9FFC8
	.incbin "graphics/pokemon/palettes/furret_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xD9FFC8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_furret_icon:: @ 8D9FFF0
	.incbin "graphics/pokemon/icons/furret_icon.4bpp"
	@ .incbin "baserom.gba", 0xD9FFF0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_furret_footprint:: @ 8DA03F0
	.incbin "graphics/pokemon/footprints/furret_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA03F0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_hoothoot_still_front_pic:: @ 8DA0410
	.incbin "graphics/pokemon/front_pics/hoothoot_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA0410, 0x0284

	.align 2
gFile_graphics_pokemon_palettes_hoothoot_palette:: @ 8DA0694
	.incbin "graphics/pokemon/palettes/hoothoot_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA0694, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_hoothoot_back_pic:: @ 8DA06BC
	.incbin "graphics/pokemon/back_pics/hoothoot_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA06BC, 0x0308

	.align 2
gFile_graphics_pokemon_palettes_hoothoot_shiny_palette:: @ 8DA09C4
	.incbin "graphics/pokemon/palettes/hoothoot_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA09C4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_hoothoot_icon:: @ 8DA09EC
	.incbin "graphics/pokemon/icons/hoothoot_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA09EC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_hoothoot_footprint:: @ 8DA0DEC
	.incbin "graphics/pokemon/footprints/hoothoot_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA0DEC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_noctowl_still_front_pic:: @ 8DA0E0C
	.incbin "graphics/pokemon/front_pics/noctowl_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA0E0C, 0x0354

	.align 2
gFile_graphics_pokemon_palettes_noctowl_palette:: @ 8DA1160
	.incbin "graphics/pokemon/palettes/noctowl_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA1160, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_noctowl_back_pic:: @ 8DA1188
	.incbin "graphics/pokemon/back_pics/noctowl_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA1188, 0x035C

	.align 2
gFile_graphics_pokemon_palettes_noctowl_shiny_palette:: @ 8DA14E4
	.incbin "graphics/pokemon/palettes/noctowl_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA14E4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_noctowl_icon:: @ 8DA150C
	.incbin "graphics/pokemon/icons/noctowl_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA150C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_noctowl_footprint:: @ 8DA190C
	.incbin "graphics/pokemon/footprints/noctowl_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA190C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ledyba_still_front_pic:: @ 8DA192C
	.incbin "graphics/pokemon/front_pics/ledyba_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA192C, 0x02F4

	.align 2
gFile_graphics_pokemon_palettes_ledyba_palette:: @ 8DA1C20
	.incbin "graphics/pokemon/palettes/ledyba_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA1C20, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ledyba_back_pic:: @ 8DA1C48
	.incbin "graphics/pokemon/back_pics/ledyba_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA1C48, 0x0330

	.align 2
gFile_graphics_pokemon_palettes_ledyba_shiny_palette:: @ 8DA1F78
	.incbin "graphics/pokemon/palettes/ledyba_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA1F78, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ledyba_icon:: @ 8DA1FA0
	.incbin "graphics/pokemon/icons/ledyba_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA1FA0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ledyba_footprint:: @ 8DA23A0
	.incbin "graphics/pokemon/footprints/ledyba_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA23A0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ledian_still_front_pic:: @ 8DA23C0
	.incbin "graphics/pokemon/front_pics/ledian_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA23C0, 0x0388

	.align 2
gFile_graphics_pokemon_palettes_ledian_palette:: @ 8DA2748
	.incbin "graphics/pokemon/palettes/ledian_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA2748, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ledian_back_pic:: @ 8DA2770
	.incbin "graphics/pokemon/back_pics/ledian_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA2770, 0x0358

	.align 2
gFile_graphics_pokemon_palettes_ledian_shiny_palette:: @ 8DA2AC8
	.incbin "graphics/pokemon/palettes/ledian_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA2AC8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ledian_icon:: @ 8DA2AF0
	.incbin "graphics/pokemon/icons/ledian_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA2AF0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ledian_footprint:: @ 8DA2EF0
	.incbin "graphics/pokemon/footprints/ledian_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA2EF0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_spinarak_still_front_pic:: @ 8DA2F10
	.incbin "graphics/pokemon/front_pics/spinarak_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA2F10, 0x0274

	.align 2
gFile_graphics_pokemon_palettes_spinarak_palette:: @ 8DA3184
	.incbin "graphics/pokemon/palettes/spinarak_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA3184, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_spinarak_back_pic:: @ 8DA31AC
	.incbin "graphics/pokemon/back_pics/spinarak_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA31AC, 0x0264

	.align 2
gFile_graphics_pokemon_palettes_spinarak_shiny_palette:: @ 8DA3410
	.incbin "graphics/pokemon/palettes/spinarak_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA3410, 0x0028

	.align 2
gFile_graphics_pokemon_icons_spinarak_icon:: @ 8DA3438
	.incbin "graphics/pokemon/icons/spinarak_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA3438, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_spinarak_footprint:: @ 8DA3838
	.incbin "graphics/pokemon/footprints/spinarak_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA3838, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ariados_still_front_pic:: @ 8DA3858
	.incbin "graphics/pokemon/front_pics/ariados_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA3858, 0x03C0

	.align 2
gFile_graphics_pokemon_palettes_ariados_palette:: @ 8DA3C18
	.incbin "graphics/pokemon/palettes/ariados_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA3C18, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ariados_back_pic:: @ 8DA3C40
	.incbin "graphics/pokemon/back_pics/ariados_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA3C40, 0x0378

	.align 2
gFile_graphics_pokemon_palettes_ariados_shiny_palette:: @ 8DA3FB8
	.incbin "graphics/pokemon/palettes/ariados_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA3FB8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ariados_icon:: @ 8DA3FE0
	.incbin "graphics/pokemon/icons/ariados_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA3FE0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ariados_footprint:: @ 8DA43E0
	.incbin "graphics/pokemon/footprints/ariados_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA43E0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_crobat_still_front_pic:: @ 8DA4400
	.incbin "graphics/pokemon/front_pics/crobat_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA4400, 0x03B0

	.align 2
gFile_graphics_pokemon_palettes_crobat_palette:: @ 8DA47B0
	.incbin "graphics/pokemon/palettes/crobat_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA47B0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_crobat_back_pic:: @ 8DA47D8
	.incbin "graphics/pokemon/back_pics/crobat_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA47D8, 0x0308

	.align 2
gFile_graphics_pokemon_palettes_crobat_shiny_palette:: @ 8DA4AE0
	.incbin "graphics/pokemon/palettes/crobat_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA4AE0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_crobat_icon:: @ 8DA4B08
	.incbin "graphics/pokemon/icons/crobat_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA4B08, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_crobat_footprint:: @ 8DA4F08
	.incbin "graphics/pokemon/footprints/crobat_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA4F08, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_chinchou_still_front_pic:: @ 8DA4F28
	.incbin "graphics/pokemon/front_pics/chinchou_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA4F28, 0x02D8

	.align 2
gFile_graphics_pokemon_palettes_chinchou_palette:: @ 8DA5200
	.incbin "graphics/pokemon/palettes/chinchou_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA5200, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_chinchou_back_pic:: @ 8DA5228
	.incbin "graphics/pokemon/back_pics/chinchou_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA5228, 0x02F8

	.align 2
gFile_graphics_pokemon_palettes_chinchou_shiny_palette:: @ 8DA5520
	.incbin "graphics/pokemon/palettes/chinchou_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA5520, 0x0028

	.align 2
gFile_graphics_pokemon_icons_chinchou_icon:: @ 8DA5548
	.incbin "graphics/pokemon/icons/chinchou_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA5548, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_chinchou_footprint:: @ 8DA5948
	.incbin "graphics/pokemon/footprints/chinchou_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA5948, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_lanturn_still_front_pic:: @ 8DA5968
	.incbin "graphics/pokemon/front_pics/lanturn_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA5968, 0x0370

	.align 2
gFile_graphics_pokemon_palettes_lanturn_palette:: @ 8DA5CD8
	.incbin "graphics/pokemon/palettes/lanturn_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA5CD8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_lanturn_back_pic:: @ 8DA5D00
	.incbin "graphics/pokemon/back_pics/lanturn_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA5D00, 0x0300

	.align 2
gFile_graphics_pokemon_palettes_lanturn_shiny_palette:: @ 8DA6000
	.incbin "graphics/pokemon/palettes/lanturn_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA6000, 0x0028

	.align 2
gFile_graphics_pokemon_icons_lanturn_icon:: @ 8DA6028
	.incbin "graphics/pokemon/icons/lanturn_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA6028, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_lanturn_footprint:: @ 8DA6428
	.incbin "graphics/pokemon/footprints/lanturn_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA6428, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_pichu_still_front_pic:: @ 8DA6448
	.incbin "graphics/pokemon/front_pics/pichu_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA6448, 0x021C

	.align 2
gFile_graphics_pokemon_palettes_pichu_palette:: @ 8DA6664
	.incbin "graphics/pokemon/palettes/pichu_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA6664, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_pichu_back_pic:: @ 8DA668C
	.incbin "graphics/pokemon/back_pics/pichu_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA668C, 0x025C

	.align 2
gFile_graphics_pokemon_palettes_pichu_shiny_palette:: @ 8DA68E8
	.incbin "graphics/pokemon/palettes/pichu_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA68E8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_pichu_icon:: @ 8DA6910
	.incbin "graphics/pokemon/icons/pichu_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA6910, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_pichu_footprint:: @ 8DA6D10
	.incbin "graphics/pokemon/footprints/pichu_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA6D10, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_cleffa_still_front_pic:: @ 8DA6D30
	.incbin "graphics/pokemon/front_pics/cleffa_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA6D30, 0x01E0

	.align 2
gFile_graphics_pokemon_palettes_cleffa_palette:: @ 8DA6F10
	.incbin "graphics/pokemon/palettes/cleffa_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA6F10, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_cleffa_back_pic:: @ 8DA6F38
	.incbin "graphics/pokemon/back_pics/cleffa_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA6F38, 0x023C

	.align 2
gFile_graphics_pokemon_palettes_cleffa_shiny_palette:: @ 8DA7174
	.incbin "graphics/pokemon/palettes/cleffa_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA7174, 0x0028

	.align 2
gFile_graphics_pokemon_icons_cleffa_icon:: @ 8DA719C
	.incbin "graphics/pokemon/icons/cleffa_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA719C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_cleffa_footprint:: @ 8DA759C
	.incbin "graphics/pokemon/footprints/cleffa_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA759C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_igglybuff_still_front_pic:: @ 8DA75BC
	.incbin "graphics/pokemon/front_pics/igglybuff_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA75BC, 0x01E8

	.align 2
gFile_graphics_pokemon_palettes_igglybuff_palette:: @ 8DA77A4
	.incbin "graphics/pokemon/palettes/igglybuff_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA77A4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_igglybuff_back_pic:: @ 8DA77CC
	.incbin "graphics/pokemon/back_pics/igglybuff_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA77CC, 0x023C

	.align 2
gFile_graphics_pokemon_palettes_igglybuff_shiny_palette:: @ 8DA7A08
	.incbin "graphics/pokemon/palettes/igglybuff_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA7A08, 0x0028

	.align 2
gFile_graphics_pokemon_icons_igglybuff_icon:: @ 8DA7A30
	.incbin "graphics/pokemon/icons/igglybuff_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA7A30, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_igglybuff_footprint:: @ 8DA7E30
	.incbin "graphics/pokemon/footprints/igglybuff_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA7E30, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_togepi_still_front_pic:: @ 8DA7E50
	.incbin "graphics/pokemon/front_pics/togepi_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA7E50, 0x01D4

	.align 2
gFile_graphics_pokemon_palettes_togepi_palette:: @ 8DA8024
	.incbin "graphics/pokemon/palettes/togepi_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA8024, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_togepi_back_pic:: @ 8DA804C
	.incbin "graphics/pokemon/back_pics/togepi_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA804C, 0x0274

	.align 2
gFile_graphics_pokemon_palettes_togepi_shiny_palette:: @ 8DA82C0
	.incbin "graphics/pokemon/palettes/togepi_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA82C0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_togepi_icon:: @ 8DA82E8
	.incbin "graphics/pokemon/icons/togepi_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA82E8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_togepi_footprint:: @ 8DA86E8
	.incbin "graphics/pokemon/footprints/togepi_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA86E8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_togetic_still_front_pic:: @ 8DA8708
	.incbin "graphics/pokemon/front_pics/togetic_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA8708, 0x0274

	.align 2
gFile_graphics_pokemon_palettes_togetic_palette:: @ 8DA897C
	.incbin "graphics/pokemon/palettes/togetic_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA897C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_togetic_back_pic:: @ 8DA89A4
	.incbin "graphics/pokemon/back_pics/togetic_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA89A4, 0x032C

	.align 2
gFile_graphics_pokemon_palettes_togetic_shiny_palette:: @ 8DA8CD0
	.incbin "graphics/pokemon/palettes/togetic_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA8CD0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_togetic_icon:: @ 8DA8CF8
	.incbin "graphics/pokemon/icons/togetic_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA8CF8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_togetic_footprint:: @ 8DA90F8
	.incbin "graphics/pokemon/footprints/togetic_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA90F8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_natu_still_front_pic:: @ 8DA9118
	.incbin "graphics/pokemon/front_pics/natu_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA9118, 0x01CC

	.align 2
gFile_graphics_pokemon_palettes_natu_palette:: @ 8DA92E4
	.incbin "graphics/pokemon/palettes/natu_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA92E4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_natu_back_pic:: @ 8DA930C
	.incbin "graphics/pokemon/back_pics/natu_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA930C, 0x0214

	.align 2
gFile_graphics_pokemon_palettes_natu_shiny_palette:: @ 8DA9520
	.incbin "graphics/pokemon/palettes/natu_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA9520, 0x0028

	.align 2
gFile_graphics_pokemon_icons_natu_icon:: @ 8DA9548
	.incbin "graphics/pokemon/icons/natu_icon.4bpp"
	@ .incbin "baserom.gba", 0xDA9548, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_natu_footprint:: @ 8DA9948
	.incbin "graphics/pokemon/footprints/natu_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDA9948, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_xatu_still_front_pic:: @ 8DA9968
	.incbin "graphics/pokemon/front_pics/xatu_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA9968, 0x02DC

	.align 2
gFile_graphics_pokemon_palettes_xatu_palette:: @ 8DA9C44
	.incbin "graphics/pokemon/palettes/xatu_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA9C44, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_xatu_back_pic:: @ 8DA9C6C
	.incbin "graphics/pokemon/back_pics/xatu_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDA9C6C, 0x0378

	.align 2
gFile_graphics_pokemon_palettes_xatu_shiny_palette:: @ 8DA9FE4
	.incbin "graphics/pokemon/palettes/xatu_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDA9FE4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_xatu_icon:: @ 8DAA00C
	.incbin "graphics/pokemon/icons/xatu_icon.4bpp"
	@ .incbin "baserom.gba", 0xDAA00C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_xatu_footprint:: @ 8DAA40C
	.incbin "graphics/pokemon/footprints/xatu_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDAA40C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_mareep_still_front_pic:: @ 8DAA42C
	.incbin "graphics/pokemon/front_pics/mareep_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAA42C, 0x02B4

	.align 2
gFile_graphics_pokemon_palettes_mareep_palette:: @ 8DAA6E0
	.incbin "graphics/pokemon/palettes/mareep_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAA6E0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_mareep_back_pic:: @ 8DAA708
	.incbin "graphics/pokemon/back_pics/mareep_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAA708, 0x02F4

	.align 2
gFile_graphics_pokemon_palettes_mareep_shiny_palette:: @ 8DAA9FC
	.incbin "graphics/pokemon/palettes/mareep_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAA9FC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_mareep_icon:: @ 8DAAA24
	.incbin "graphics/pokemon/icons/mareep_icon.4bpp"
	@ .incbin "baserom.gba", 0xDAAA24, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_mareep_footprint:: @ 8DAAE24
	.incbin "graphics/pokemon/footprints/mareep_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDAAE24, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_flaaffy_still_front_pic:: @ 8DAAE44
	.incbin "graphics/pokemon/front_pics/flaaffy_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAAE44, 0x0300

	.align 2
gFile_graphics_pokemon_palettes_flaaffy_palette:: @ 8DAB144
	.incbin "graphics/pokemon/palettes/flaaffy_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAB144, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_flaaffy_back_pic:: @ 8DAB16C
	.incbin "graphics/pokemon/back_pics/flaaffy_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAB16C, 0x031C

	.align 2
gFile_graphics_pokemon_palettes_flaaffy_shiny_palette:: @ 8DAB488
	.incbin "graphics/pokemon/palettes/flaaffy_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAB488, 0x0028

	.align 2
gFile_graphics_pokemon_icons_flaaffy_icon:: @ 8DAB4B0
	.incbin "graphics/pokemon/icons/flaaffy_icon.4bpp"
	@ .incbin "baserom.gba", 0xDAB4B0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_flaaffy_footprint:: @ 8DAB8B0
	.incbin "graphics/pokemon/footprints/flaaffy_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDAB8B0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ampharos_still_front_pic:: @ 8DAB8D0
	.incbin "graphics/pokemon/front_pics/ampharos_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAB8D0, 0x035C

	.align 2
gFile_graphics_pokemon_palettes_ampharos_palette:: @ 8DABC2C
	.incbin "graphics/pokemon/palettes/ampharos_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDABC2C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ampharos_back_pic:: @ 8DABC54
	.incbin "graphics/pokemon/back_pics/ampharos_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDABC54, 0x0378

	.align 2
gFile_graphics_pokemon_palettes_ampharos_shiny_palette:: @ 8DABFCC
	.incbin "graphics/pokemon/palettes/ampharos_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDABFCC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ampharos_icon:: @ 8DABFF4
	.incbin "graphics/pokemon/icons/ampharos_icon.4bpp"
	@ .incbin "baserom.gba", 0xDABFF4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ampharos_footprint:: @ 8DAC3F4
	.incbin "graphics/pokemon/footprints/ampharos_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDAC3F4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_bellossom_still_front_pic:: @ 8DAC414
	.incbin "graphics/pokemon/front_pics/bellossom_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAC414, 0x0270

	.align 2
gFile_graphics_pokemon_palettes_bellossom_palette:: @ 8DAC684
	.incbin "graphics/pokemon/palettes/bellossom_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAC684, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_bellossom_back_pic:: @ 8DAC6AC
	.incbin "graphics/pokemon/back_pics/bellossom_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAC6AC, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_bellossom_shiny_palette:: @ 8DAC9D0
	.incbin "graphics/pokemon/palettes/bellossom_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAC9D0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_bellossom_icon:: @ 8DAC9F8
	.incbin "graphics/pokemon/icons/bellossom_icon.4bpp"
	@ .incbin "baserom.gba", 0xDAC9F8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_bellossom_footprint:: @ 8DACDF8
	.incbin "graphics/pokemon/footprints/bellossom_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDACDF8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_marill_still_front_pic:: @ 8DACE18
	.incbin "graphics/pokemon/front_pics/marill_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDACE18, 0x02C4

	.align 2
gFile_graphics_pokemon_palettes_marill_palette:: @ 8DAD0DC
	.incbin "graphics/pokemon/palettes/marill_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAD0DC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_marill_back_pic:: @ 8DAD104
	.incbin "graphics/pokemon/back_pics/marill_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAD104, 0x02AC

	.align 2
gFile_graphics_pokemon_palettes_marill_shiny_palette:: @ 8DAD3B0
	.incbin "graphics/pokemon/palettes/marill_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAD3B0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_marill_icon:: @ 8DAD3D8
	.incbin "graphics/pokemon/icons/marill_icon.4bpp"
	@ .incbin "baserom.gba", 0xDAD3D8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_marill_footprint:: @ 8DAD7D8
	.incbin "graphics/pokemon/footprints/marill_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDAD7D8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_azumarill_still_front_pic:: @ 8DAD7F8
	.incbin "graphics/pokemon/front_pics/azumarill_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAD7F8, 0x0300

	.align 2
gFile_graphics_pokemon_palettes_azumarill_palette:: @ 8DADAF8
	.incbin "graphics/pokemon/palettes/azumarill_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDADAF8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_azumarill_back_pic:: @ 8DADB20
	.incbin "graphics/pokemon/back_pics/azumarill_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDADB20, 0x02BC

	.align 2
gFile_graphics_pokemon_palettes_azumarill_shiny_palette:: @ 8DADDDC
	.incbin "graphics/pokemon/palettes/azumarill_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDADDDC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_azumarill_icon:: @ 8DADE04
	.incbin "graphics/pokemon/icons/azumarill_icon.4bpp"
	@ .incbin "baserom.gba", 0xDADE04, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_azumarill_footprint:: @ 8DAE204
	.incbin "graphics/pokemon/footprints/azumarill_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDAE204, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sudowoodo_still_front_pic:: @ 8DAE224
	.incbin "graphics/pokemon/front_pics/sudowoodo_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAE224, 0x0318

	.align 2
gFile_graphics_pokemon_palettes_sudowoodo_palette:: @ 8DAE53C
	.incbin "graphics/pokemon/palettes/sudowoodo_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAE53C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sudowoodo_back_pic:: @ 8DAE564
	.incbin "graphics/pokemon/back_pics/sudowoodo_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAE564, 0x035C

	.align 2
gFile_graphics_pokemon_palettes_sudowoodo_shiny_palette:: @ 8DAE8C0
	.incbin "graphics/pokemon/palettes/sudowoodo_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAE8C0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sudowoodo_icon:: @ 8DAE8E8
	.incbin "graphics/pokemon/icons/sudowoodo_icon.4bpp"
	@ .incbin "baserom.gba", 0xDAE8E8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sudowoodo_footprint:: @ 8DAECE8
	.incbin "graphics/pokemon/footprints/sudowoodo_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDAECE8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_politoed_still_front_pic:: @ 8DAED08
	.incbin "graphics/pokemon/front_pics/politoed_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAED08, 0x033C

	.align 2
gFile_graphics_pokemon_palettes_politoed_palette:: @ 8DAF044
	.incbin "graphics/pokemon/palettes/politoed_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAF044, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_politoed_back_pic:: @ 8DAF06C
	.incbin "graphics/pokemon/back_pics/politoed_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAF06C, 0x02BC

	.align 2
gFile_graphics_pokemon_palettes_politoed_shiny_palette:: @ 8DAF328
	.incbin "graphics/pokemon/palettes/politoed_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAF328, 0x0028

	.align 2
gFile_graphics_pokemon_icons_politoed_icon:: @ 8DAF350
	.incbin "graphics/pokemon/icons/politoed_icon.4bpp"
	@ .incbin "baserom.gba", 0xDAF350, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_politoed_footprint:: @ 8DAF750
	.incbin "graphics/pokemon/footprints/politoed_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDAF750, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_hoppip_still_front_pic:: @ 8DAF770
	.incbin "graphics/pokemon/front_pics/hoppip_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAF770, 0x02B4

	.align 2
gFile_graphics_pokemon_palettes_hoppip_palette:: @ 8DAFA24
	.incbin "graphics/pokemon/palettes/hoppip_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAFA24, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_hoppip_back_pic:: @ 8DAFA4C
	.incbin "graphics/pokemon/back_pics/hoppip_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDAFA4C, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_hoppip_shiny_palette:: @ 8DAFD2C
	.incbin "graphics/pokemon/palettes/hoppip_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDAFD2C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_hoppip_icon:: @ 8DAFD54
	.incbin "graphics/pokemon/icons/hoppip_icon.4bpp"
	@ .incbin "baserom.gba", 0xDAFD54, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_hoppip_footprint:: @ 8DB0154
	.incbin "graphics/pokemon/footprints/hoppip_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB0154, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_skiploom_still_front_pic:: @ 8DB0174
	.incbin "graphics/pokemon/front_pics/skiploom_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB0174, 0x0288

	.align 2
gFile_graphics_pokemon_palettes_skiploom_palette:: @ 8DB03FC
	.incbin "graphics/pokemon/palettes/skiploom_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB03FC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_skiploom_back_pic:: @ 8DB0424
	.incbin "graphics/pokemon/back_pics/skiploom_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB0424, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_skiploom_shiny_palette:: @ 8DB0704
	.incbin "graphics/pokemon/palettes/skiploom_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB0704, 0x0028

	.align 2
gFile_graphics_pokemon_icons_skiploom_icon:: @ 8DB072C
	.incbin "graphics/pokemon/icons/skiploom_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB072C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_skiploom_footprint:: @ 8DB0B2C
	.incbin "graphics/pokemon/footprints/skiploom_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB0B2C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_jumpluff_still_front_pic:: @ 8DB0B4C
	.incbin "graphics/pokemon/front_pics/jumpluff_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB0B4C, 0x036C

	.align 2
gFile_graphics_pokemon_palettes_jumpluff_palette:: @ 8DB0EB8
	.incbin "graphics/pokemon/palettes/jumpluff_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB0EB8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_jumpluff_back_pic:: @ 8DB0EE0
	.incbin "graphics/pokemon/back_pics/jumpluff_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB0EE0, 0x03F8

	.align 2
gFile_graphics_pokemon_palettes_jumpluff_shiny_palette:: @ 8DB12D8
	.incbin "graphics/pokemon/palettes/jumpluff_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB12D8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_jumpluff_icon:: @ 8DB1300
	.incbin "graphics/pokemon/icons/jumpluff_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB1300, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_jumpluff_footprint:: @ 8DB1700
	.incbin "graphics/pokemon/footprints/jumpluff_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB1700, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_aipom_still_front_pic:: @ 8DB1720
	.incbin "graphics/pokemon/front_pics/aipom_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB1720, 0x02FC

	.align 2
gFile_graphics_pokemon_palettes_aipom_palette:: @ 8DB1A1C
	.incbin "graphics/pokemon/palettes/aipom_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB1A1C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_aipom_back_pic:: @ 8DB1A44
	.incbin "graphics/pokemon/back_pics/aipom_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB1A44, 0x02F4

	.align 2
gFile_graphics_pokemon_palettes_aipom_shiny_palette:: @ 8DB1D38
	.incbin "graphics/pokemon/palettes/aipom_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB1D38, 0x0028

	.align 2
gFile_graphics_pokemon_icons_aipom_icon:: @ 8DB1D60
	.incbin "graphics/pokemon/icons/aipom_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB1D60, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_aipom_footprint:: @ 8DB2160
	.incbin "graphics/pokemon/footprints/aipom_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB2160, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sunkern_still_front_pic:: @ 8DB2180
	.incbin "graphics/pokemon/front_pics/sunkern_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB2180, 0x0238

	.align 2
gFile_graphics_pokemon_palettes_sunkern_palette:: @ 8DB23B8
	.incbin "graphics/pokemon/palettes/sunkern_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB23B8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sunkern_back_pic:: @ 8DB23E0
	.incbin "graphics/pokemon/back_pics/sunkern_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB23E0, 0x02C4

	.align 2
gFile_graphics_pokemon_palettes_sunkern_shiny_palette:: @ 8DB26A4
	.incbin "graphics/pokemon/palettes/sunkern_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB26A4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sunkern_icon:: @ 8DB26CC
	.incbin "graphics/pokemon/icons/sunkern_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB26CC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sunkern_footprint:: @ 8DB2ACC
	.incbin "graphics/pokemon/footprints/sunkern_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB2ACC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sunflora_still_front_pic:: @ 8DB2AEC
	.incbin "graphics/pokemon/front_pics/sunflora_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB2AEC, 0x0358

	.align 2
gFile_graphics_pokemon_palettes_sunflora_palette:: @ 8DB2E44
	.incbin "graphics/pokemon/palettes/sunflora_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB2E44, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sunflora_back_pic:: @ 8DB2E6C
	.incbin "graphics/pokemon/back_pics/sunflora_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB2E6C, 0x03A0

	.align 2
gFile_graphics_pokemon_palettes_sunflora_shiny_palette:: @ 8DB320C
	.incbin "graphics/pokemon/palettes/sunflora_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB320C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sunflora_icon:: @ 8DB3234
	.incbin "graphics/pokemon/icons/sunflora_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB3234, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sunflora_footprint:: @ 8DB3634
	.incbin "graphics/pokemon/footprints/sunflora_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB3634, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_yanma_still_front_pic:: @ 8DB3654
	.incbin "graphics/pokemon/front_pics/yanma_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB3654, 0x0384

	.align 2
gFile_graphics_pokemon_palettes_yanma_palette:: @ 8DB39D8
	.incbin "graphics/pokemon/palettes/yanma_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB39D8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_yanma_back_pic:: @ 8DB3A00
	.incbin "graphics/pokemon/back_pics/yanma_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB3A00, 0x03B4

	.align 2
gFile_graphics_pokemon_palettes_yanma_shiny_palette:: @ 8DB3DB4
	.incbin "graphics/pokemon/palettes/yanma_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB3DB4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_yanma_icon:: @ 8DB3DDC
	.incbin "graphics/pokemon/icons/yanma_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB3DDC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_yanma_footprint:: @ 8DB41DC
	.incbin "graphics/pokemon/footprints/yanma_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB41DC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_wooper_still_front_pic:: @ 8DB41FC
	.incbin "graphics/pokemon/front_pics/wooper_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB41FC, 0x0240

	.align 2
gFile_graphics_pokemon_palettes_wooper_palette:: @ 8DB443C
	.incbin "graphics/pokemon/palettes/wooper_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB443C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_wooper_back_pic:: @ 8DB4464
	.incbin "graphics/pokemon/back_pics/wooper_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB4464, 0x028C

	.align 2
gFile_graphics_pokemon_palettes_wooper_shiny_palette:: @ 8DB46F0
	.incbin "graphics/pokemon/palettes/wooper_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB46F0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_wooper_icon:: @ 8DB4718
	.incbin "graphics/pokemon/icons/wooper_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB4718, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_wooper_footprint:: @ 8DB4B18
	.incbin "graphics/pokemon/footprints/wooper_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB4B18, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_quagsire_still_front_pic:: @ 8DB4B38
	.incbin "graphics/pokemon/front_pics/quagsire_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB4B38, 0x0374

	.align 2
gFile_graphics_pokemon_palettes_quagsire_palette:: @ 8DB4EAC
	.incbin "graphics/pokemon/palettes/quagsire_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB4EAC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_quagsire_back_pic:: @ 8DB4ED4
	.incbin "graphics/pokemon/back_pics/quagsire_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB4ED4, 0x02FC

	.align 2
gFile_graphics_pokemon_palettes_quagsire_shiny_palette:: @ 8DB51D0
	.incbin "graphics/pokemon/palettes/quagsire_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB51D0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_quagsire_icon:: @ 8DB51F8
	.incbin "graphics/pokemon/icons/quagsire_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB51F8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_quagsire_footprint:: @ 8DB55F8
	.incbin "graphics/pokemon/footprints/quagsire_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB55F8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_espeon_still_front_pic:: @ 8DB5618
	.incbin "graphics/pokemon/front_pics/espeon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB5618, 0x0340

	.align 2
gFile_graphics_pokemon_palettes_espeon_palette:: @ 8DB5958
	.incbin "graphics/pokemon/palettes/espeon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB5958, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_espeon_back_pic:: @ 8DB597C
	.incbin "graphics/pokemon/back_pics/espeon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB597C, 0x02DC

	.align 2
gFile_graphics_pokemon_palettes_espeon_shiny_palette:: @ 8DB5C58
	.incbin "graphics/pokemon/palettes/espeon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB5C58, 0x0024

	.align 2
gFile_graphics_pokemon_icons_espeon_icon:: @ 8DB5C7C
	.incbin "graphics/pokemon/icons/espeon_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB5C7C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_espeon_footprint:: @ 8DB607C
	.incbin "graphics/pokemon/footprints/espeon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB607C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_umbreon_still_front_pic:: @ 8DB609C
	.incbin "graphics/pokemon/front_pics/umbreon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB609C, 0x0314

	.align 2
gFile_graphics_pokemon_palettes_umbreon_palette:: @ 8DB63B0
	.incbin "graphics/pokemon/palettes/umbreon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB63B0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_umbreon_back_pic:: @ 8DB63D8
	.incbin "graphics/pokemon/back_pics/umbreon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB63D8, 0x0314

	.align 2
gFile_graphics_pokemon_palettes_umbreon_shiny_palette:: @ 8DB66EC
	.incbin "graphics/pokemon/palettes/umbreon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB66EC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_umbreon_icon:: @ 8DB6714
	.incbin "graphics/pokemon/icons/umbreon_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB6714, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_umbreon_footprint:: @ 8DB6B14
	.incbin "graphics/pokemon/footprints/umbreon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB6B14, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_murkrow_still_front_pic:: @ 8DB6B34
	.incbin "graphics/pokemon/front_pics/murkrow_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB6B34, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_murkrow_palette:: @ 8DB6E14
	.incbin "graphics/pokemon/palettes/murkrow_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB6E14, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_murkrow_back_pic:: @ 8DB6E3C
	.incbin "graphics/pokemon/back_pics/murkrow_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB6E3C, 0x0318

	.align 2
gFile_graphics_pokemon_palettes_murkrow_shiny_palette:: @ 8DB7154
	.incbin "graphics/pokemon/palettes/murkrow_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB7154, 0x0028

	.align 2
gFile_graphics_pokemon_icons_murkrow_icon:: @ 8DB717C
	.incbin "graphics/pokemon/icons/murkrow_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB717C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_murkrow_footprint:: @ 8DB757C
	.incbin "graphics/pokemon/footprints/murkrow_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB757C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_slowking_still_front_pic:: @ 8DB759C
	.incbin "graphics/pokemon/front_pics/slowking_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB759C, 0x03B4

	.align 2
gFile_graphics_pokemon_palettes_slowking_palette:: @ 8DB7950
	.incbin "graphics/pokemon/palettes/slowking_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB7950, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_slowking_back_pic:: @ 8DB7978
	.incbin "graphics/pokemon/back_pics/slowking_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB7978, 0x038C

	.align 2
gFile_graphics_pokemon_palettes_slowking_shiny_palette:: @ 8DB7D04
	.incbin "graphics/pokemon/palettes/slowking_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB7D04, 0x0028

	.align 2
gFile_graphics_pokemon_icons_slowking_icon:: @ 8DB7D2C
	.incbin "graphics/pokemon/icons/slowking_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB7D2C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_slowking_footprint:: @ 8DB812C
	.incbin "graphics/pokemon/footprints/slowking_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB812C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_misdreavus_still_front_pic:: @ 8DB814C
	.incbin "graphics/pokemon/front_pics/misdreavus_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB814C, 0x02C0

	.align 2
gFile_graphics_pokemon_palettes_misdreavus_palette:: @ 8DB840C
	.incbin "graphics/pokemon/palettes/misdreavus_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB840C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_misdreavus_back_pic:: @ 8DB8434
	.incbin "graphics/pokemon/back_pics/misdreavus_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB8434, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_misdreavus_shiny_palette:: @ 8DB8758
	.incbin "graphics/pokemon/palettes/misdreavus_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB8758, 0x0028

	.align 2
gFile_graphics_pokemon_icons_misdreavus_icon:: @ 8DB8780
	.incbin "graphics/pokemon/icons/misdreavus_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB8780, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_misdreavus_footprint:: @ 8DB8B80
	.incbin "graphics/pokemon/footprints/misdreavus_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB8B80, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_unown_a_still_front_pic:: @ 8DB8BA0
	.incbin "graphics/pokemon/front_pics/unown_a_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB8BA0, 0x01D4

	.align 2
gFile_graphics_pokemon_palettes_unown_palette:: @ 8DB8D74
	.incbin "graphics/pokemon/palettes/unown_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB8D74, 0x0020

	.align 2
gFile_graphics_pokemon_back_pics_unown_a_back_pic:: @ 8DB8D94
	.incbin "graphics/pokemon/back_pics/unown_a_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB8D94, 0x0200

	.align 2
gFile_graphics_pokemon_palettes_unown_shiny_palette:: @ 8DB8F94
	.incbin "graphics/pokemon/palettes/unown_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB8F94, 0x0020

	.align 2
gFile_graphics_pokemon_icons_unown_a_icon:: @ 8DB8FB4
	.incbin "graphics/pokemon/icons/unown_a_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB8FB4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_unown_footprint:: @ 8DB93B4
	.incbin "graphics/pokemon/footprints/unown_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB93B4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_wobbuffet_still_front_pic:: @ 8DB93D4
	.incbin "graphics/pokemon/front_pics/wobbuffet_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB93D4, 0x0350

	.align 2
gFile_graphics_pokemon_palettes_wobbuffet_palette:: @ 8DB9724
	.incbin "graphics/pokemon/palettes/wobbuffet_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB9724, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_wobbuffet_back_pic:: @ 8DB974C
	.incbin "graphics/pokemon/back_pics/wobbuffet_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB974C, 0x0244

	.align 2
gFile_graphics_pokemon_palettes_wobbuffet_shiny_palette:: @ 8DB9990
	.incbin "graphics/pokemon/palettes/wobbuffet_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDB9990, 0x0028

	.align 2
gFile_graphics_pokemon_icons_wobbuffet_icon:: @ 8DB99B8
	.incbin "graphics/pokemon/icons/wobbuffet_icon.4bpp"
	@ .incbin "baserom.gba", 0xDB99B8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_wobbuffet_footprint:: @ 8DB9DB8
	.incbin "graphics/pokemon/footprints/wobbuffet_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDB9DB8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_girafarig_still_front_pic:: @ 8DB9DD8
	.incbin "graphics/pokemon/front_pics/girafarig_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDB9DD8, 0x0404

	.align 2
gFile_graphics_pokemon_palettes_girafarig_palette:: @ 8DBA1DC
	.incbin "graphics/pokemon/palettes/girafarig_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBA1DC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_girafarig_back_pic:: @ 8DBA204
	.incbin "graphics/pokemon/back_pics/girafarig_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBA204, 0x03AC

	.align 2
gFile_graphics_pokemon_palettes_girafarig_shiny_palette:: @ 8DBA5B0
	.incbin "graphics/pokemon/palettes/girafarig_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBA5B0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_girafarig_icon:: @ 8DBA5D8
	.incbin "graphics/pokemon/icons/girafarig_icon.4bpp"
	@ .incbin "baserom.gba", 0xDBA5D8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_girafarig_footprint:: @ 8DBA9D8
	.incbin "graphics/pokemon/footprints/girafarig_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDBA9D8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_pineco_still_front_pic:: @ 8DBA9F8
	.incbin "graphics/pokemon/front_pics/pineco_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBA9F8, 0x0340

	.align 2
gFile_graphics_pokemon_palettes_pineco_palette:: @ 8DBAD38
	.incbin "graphics/pokemon/palettes/pineco_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBAD38, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_pineco_back_pic:: @ 8DBAD5C
	.incbin "graphics/pokemon/back_pics/pineco_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBAD5C, 0x02D8

	.align 2
gFile_graphics_pokemon_palettes_pineco_shiny_palette:: @ 8DBB034
	.incbin "graphics/pokemon/palettes/pineco_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBB034, 0x0024

	.align 2
gFile_graphics_pokemon_icons_pineco_icon:: @ 8DBB058
	.incbin "graphics/pokemon/icons/pineco_icon.4bpp"
	@ .incbin "baserom.gba", 0xDBB058, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_pineco_footprint:: @ 8DBB458
	.incbin "graphics/pokemon/footprints/pineco_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDBB458, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_forretress_still_front_pic:: @ 8DBB478
	.incbin "graphics/pokemon/front_pics/forretress_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBB478, 0x041C

	.align 2
gFile_graphics_pokemon_palettes_forretress_palette:: @ 8DBB894
	.incbin "graphics/pokemon/palettes/forretress_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBB894, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_forretress_back_pic:: @ 8DBB8BC
	.incbin "graphics/pokemon/back_pics/forretress_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBB8BC, 0x02C0

	.align 2
gFile_graphics_pokemon_palettes_forretress_shiny_palette:: @ 8DBBB7C
	.incbin "graphics/pokemon/palettes/forretress_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBBB7C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_forretress_icon:: @ 8DBBBA4
	.incbin "graphics/pokemon/icons/forretress_icon.4bpp"
	@ .incbin "baserom.gba", 0xDBBBA4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_forretress_footprint:: @ 8DBBFA4
	.incbin "graphics/pokemon/footprints/forretress_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDBBFA4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_dunsparce_still_front_pic:: @ 8DBBFC4
	.incbin "graphics/pokemon/front_pics/dunsparce_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBBFC4, 0x0310

	.align 2
gFile_graphics_pokemon_palettes_dunsparce_palette:: @ 8DBC2D4
	.incbin "graphics/pokemon/palettes/dunsparce_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBC2D4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_dunsparce_back_pic:: @ 8DBC2FC
	.incbin "graphics/pokemon/back_pics/dunsparce_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBC2FC, 0x02FC

	.align 2
gFile_graphics_pokemon_palettes_dunsparce_shiny_palette:: @ 8DBC5F8
	.incbin "graphics/pokemon/palettes/dunsparce_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBC5F8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_dunsparce_icon:: @ 8DBC620
	.incbin "graphics/pokemon/icons/dunsparce_icon.4bpp"
	@ .incbin "baserom.gba", 0xDBC620, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_dunsparce_footprint:: @ 8DBCA20
	.incbin "graphics/pokemon/footprints/dunsparce_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDBCA20, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_gligar_still_front_pic:: @ 8DBCA40
	.incbin "graphics/pokemon/front_pics/gligar_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBCA40, 0x0428

	.align 2
gFile_graphics_pokemon_palettes_gligar_palette:: @ 8DBCE68
	.incbin "graphics/pokemon/palettes/gligar_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBCE68, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_gligar_back_pic:: @ 8DBCE90
	.incbin "graphics/pokemon/back_pics/gligar_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBCE90, 0x03D8

	.align 2
gFile_graphics_pokemon_palettes_gligar_shiny_palette:: @ 8DBD268
	.incbin "graphics/pokemon/palettes/gligar_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBD268, 0x0028

	.align 2
gFile_graphics_pokemon_icons_gligar_icon:: @ 8DBD290
	.incbin "graphics/pokemon/icons/gligar_icon.4bpp"
	@ .incbin "baserom.gba", 0xDBD290, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_gligar_footprint:: @ 8DBD690
	.incbin "graphics/pokemon/footprints/gligar_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDBD690, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_steelix_still_front_pic:: @ 8DBD6B0
	.incbin "graphics/pokemon/front_pics/steelix_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBD6B0, 0x04C8

	.align 2
gFile_graphics_pokemon_palettes_steelix_palette:: @ 8DBDB78
	.incbin "graphics/pokemon/palettes/steelix_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBDB78, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_steelix_back_pic:: @ 8DBDB9C
	.incbin "graphics/pokemon/back_pics/steelix_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBDB9C, 0x040C

	.align 2
gFile_graphics_pokemon_palettes_steelix_shiny_palette:: @ 8DBDFA8
	.incbin "graphics/pokemon/palettes/steelix_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBDFA8, 0x0024

	.align 2
gFile_graphics_pokemon_icons_steelix_icon:: @ 8DBDFCC
	.incbin "graphics/pokemon/icons/steelix_icon.4bpp"
	@ .incbin "baserom.gba", 0xDBDFCC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_steelix_footprint:: @ 8DBE3CC
	.incbin "graphics/pokemon/footprints/steelix_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDBE3CC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_snubbull_still_front_pic:: @ 8DBE3EC
	.incbin "graphics/pokemon/front_pics/snubbull_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBE3EC, 0x02D4

	.align 2
gFile_graphics_pokemon_palettes_snubbull_palette:: @ 8DBE6C0
	.incbin "graphics/pokemon/palettes/snubbull_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBE6C0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_snubbull_back_pic:: @ 8DBE6E8
	.incbin "graphics/pokemon/back_pics/snubbull_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBE6E8, 0x0328

	.align 2
gFile_graphics_pokemon_palettes_snubbull_shiny_palette:: @ 8DBEA10
	.incbin "graphics/pokemon/palettes/snubbull_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBEA10, 0x0028

	.align 2
gFile_graphics_pokemon_icons_snubbull_icon:: @ 8DBEA38
	.incbin "graphics/pokemon/icons/snubbull_icon.4bpp"
	@ .incbin "baserom.gba", 0xDBEA38, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_snubbull_footprint:: @ 8DBEE38
	.incbin "graphics/pokemon/footprints/snubbull_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDBEE38, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_granbull_still_front_pic:: @ 8DBEE58
	.incbin "graphics/pokemon/front_pics/granbull_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBEE58, 0x038C

	.align 2
gFile_graphics_pokemon_palettes_granbull_palette:: @ 8DBF1E4
	.incbin "graphics/pokemon/palettes/granbull_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBF1E4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_granbull_back_pic:: @ 8DBF20C
	.incbin "graphics/pokemon/back_pics/granbull_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBF20C, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_granbull_shiny_palette:: @ 8DBF530
	.incbin "graphics/pokemon/palettes/granbull_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBF530, 0x0028

	.align 2
gFile_graphics_pokemon_icons_granbull_icon:: @ 8DBF558
	.incbin "graphics/pokemon/icons/granbull_icon.4bpp"
	@ .incbin "baserom.gba", 0xDBF558, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_granbull_footprint:: @ 8DBF958
	.incbin "graphics/pokemon/footprints/granbull_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDBF958, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_qwilfish_still_front_pic:: @ 8DBF978
	.incbin "graphics/pokemon/front_pics/qwilfish_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBF978, 0x02C0

	.align 2
gFile_graphics_pokemon_palettes_qwilfish_palette:: @ 8DBFC38
	.incbin "graphics/pokemon/palettes/qwilfish_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBFC38, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_qwilfish_back_pic:: @ 8DBFC60
	.incbin "graphics/pokemon/back_pics/qwilfish_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDBFC60, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_qwilfish_shiny_palette:: @ 8DBFF40
	.incbin "graphics/pokemon/palettes/qwilfish_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDBFF40, 0x0028

	.align 2
gFile_graphics_pokemon_icons_qwilfish_icon:: @ 8DBFF68
	.incbin "graphics/pokemon/icons/qwilfish_icon.4bpp"
	@ .incbin "baserom.gba", 0xDBFF68, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_qwilfish_footprint:: @ 8DC0368
	.incbin "graphics/pokemon/footprints/qwilfish_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC0368, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_scizor_still_front_pic:: @ 8DC0388
	.incbin "graphics/pokemon/front_pics/scizor_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC0388, 0x04E8

	.align 2
gFile_graphics_pokemon_palettes_scizor_palette:: @ 8DC0870
	.incbin "graphics/pokemon/palettes/scizor_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC0870, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_scizor_back_pic:: @ 8DC0898
	.incbin "graphics/pokemon/back_pics/scizor_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC0898, 0x0380

	.align 2
gFile_graphics_pokemon_palettes_scizor_shiny_palette:: @ 8DC0C18
	.incbin "graphics/pokemon/palettes/scizor_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC0C18, 0x0028

	.align 2
gFile_graphics_pokemon_icons_scizor_icon:: @ 8DC0C40
	.incbin "graphics/pokemon/icons/scizor_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC0C40, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_scizor_footprint:: @ 8DC1040
	.incbin "graphics/pokemon/footprints/scizor_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC1040, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_shuckle_still_front_pic:: @ 8DC1060
	.incbin "graphics/pokemon/front_pics/shuckle_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC1060, 0x02C8

	.align 2
gFile_graphics_pokemon_palettes_shuckle_palette:: @ 8DC1328
	.incbin "graphics/pokemon/palettes/shuckle_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC1328, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_shuckle_back_pic:: @ 8DC1350
	.incbin "graphics/pokemon/back_pics/shuckle_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC1350, 0x0258

	.align 2
gFile_graphics_pokemon_palettes_shuckle_shiny_palette:: @ 8DC15A8
	.incbin "graphics/pokemon/palettes/shuckle_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC15A8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_shuckle_icon:: @ 8DC15D0
	.incbin "graphics/pokemon/icons/shuckle_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC15D0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_shuckle_footprint:: @ 8DC19D0
	.incbin "graphics/pokemon/footprints/shuckle_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC19D0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_heracross_still_front_pic:: @ 8DC19F0
	.incbin "graphics/pokemon/front_pics/heracross_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC19F0, 0x03F0

	.align 2
gFile_graphics_pokemon_palettes_heracross_palette:: @ 8DC1DE0
	.incbin "graphics/pokemon/palettes/heracross_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC1DE0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_heracross_back_pic:: @ 8DC1E08
	.incbin "graphics/pokemon/back_pics/heracross_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC1E08, 0x0370

	.align 2
gFile_graphics_pokemon_palettes_heracross_shiny_palette:: @ 8DC2178
	.incbin "graphics/pokemon/palettes/heracross_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC2178, 0x0028

	.align 2
gFile_graphics_pokemon_icons_heracross_icon:: @ 8DC21A0
	.incbin "graphics/pokemon/icons/heracross_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC21A0, 0x0400

gUnknown_heracross_icon:: @ 8DC25A0
	.incbin "baserom.gba", 0xDC25A0, 0x400

	.align 2
gFile_graphics_pokemon_footprints_heracross_footprint:: @ 8DC29A0
	.incbin "graphics/pokemon/footprints/heracross_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC29A0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sneasel_still_front_pic:: @ 8DC29C0
	.incbin "graphics/pokemon/front_pics/sneasel_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC29C0, 0x0344

	.align 2
gFile_graphics_pokemon_palettes_sneasel_palette:: @ 8DC2D04
	.incbin "graphics/pokemon/palettes/sneasel_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC2D04, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sneasel_back_pic:: @ 8DC2D2C
	.incbin "graphics/pokemon/back_pics/sneasel_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC2D2C, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_sneasel_shiny_palette:: @ 8DC3050
	.incbin "graphics/pokemon/palettes/sneasel_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC3050, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sneasel_icon:: @ 8DC3078
	.incbin "graphics/pokemon/icons/sneasel_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC3078, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sneasel_footprint:: @ 8DC3478
	.incbin "graphics/pokemon/footprints/sneasel_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC3478, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_teddiursa_still_front_pic:: @ 8DC3498
	.incbin "graphics/pokemon/front_pics/teddiursa_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC3498, 0x02A8

	.align 2
gFile_graphics_pokemon_palettes_teddiursa_palette:: @ 8DC3740
	.incbin "graphics/pokemon/palettes/teddiursa_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC3740, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_teddiursa_back_pic:: @ 8DC3768
	.incbin "graphics/pokemon/back_pics/teddiursa_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC3768, 0x0278

	.align 2
gFile_graphics_pokemon_palettes_teddiursa_shiny_palette:: @ 8DC39E0
	.incbin "graphics/pokemon/palettes/teddiursa_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC39E0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_teddiursa_icon:: @ 8DC3A08
	.incbin "graphics/pokemon/icons/teddiursa_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC3A08, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_teddiursa_footprint:: @ 8DC3E08
	.incbin "graphics/pokemon/footprints/teddiursa_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC3E08, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ursaring_still_front_pic:: @ 8DC3E28
	.incbin "graphics/pokemon/front_pics/ursaring_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC3E28, 0x0438

	.align 2
gFile_graphics_pokemon_palettes_ursaring_palette:: @ 8DC4260
	.incbin "graphics/pokemon/palettes/ursaring_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC4260, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ursaring_back_pic:: @ 8DC4288
	.incbin "graphics/pokemon/back_pics/ursaring_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC4288, 0x0388

	.align 2
gFile_graphics_pokemon_palettes_ursaring_shiny_palette:: @ 8DC4610
	.incbin "graphics/pokemon/palettes/ursaring_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC4610, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ursaring_icon:: @ 8DC4638
	.incbin "graphics/pokemon/icons/ursaring_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC4638, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ursaring_footprint:: @ 8DC4A38
	.incbin "graphics/pokemon/footprints/ursaring_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC4A38, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_slugma_still_front_pic:: @ 8DC4A58
	.incbin "graphics/pokemon/front_pics/slugma_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC4A58, 0x0274

	.align 2
gFile_graphics_pokemon_palettes_slugma_palette:: @ 8DC4CCC
	.incbin "graphics/pokemon/palettes/slugma_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC4CCC, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_slugma_back_pic:: @ 8DC4CF0
	.incbin "graphics/pokemon/back_pics/slugma_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC4CF0, 0x02E8

	.align 2
gFile_graphics_pokemon_palettes_slugma_shiny_palette:: @ 8DC4FD8
	.incbin "graphics/pokemon/palettes/slugma_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC4FD8, 0x0024

	.align 2
gFile_graphics_pokemon_icons_slugma_icon:: @ 8DC4FFC
	.incbin "graphics/pokemon/icons/slugma_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC4FFC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_slugma_footprint:: @ 8DC53FC
	.incbin "graphics/pokemon/footprints/slugma_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC53FC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_magcargo_still_front_pic:: @ 8DC541C
	.incbin "graphics/pokemon/front_pics/magcargo_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC541C, 0x0348

	.align 2
gFile_graphics_pokemon_palettes_magcargo_palette:: @ 8DC5764
	.incbin "graphics/pokemon/palettes/magcargo_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC5764, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_magcargo_back_pic:: @ 8DC578C
	.incbin "graphics/pokemon/back_pics/magcargo_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC578C, 0x0418

	.align 2
gFile_graphics_pokemon_palettes_magcargo_shiny_palette:: @ 8DC5BA4
	.incbin "graphics/pokemon/palettes/magcargo_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC5BA4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_magcargo_icon:: @ 8DC5BCC
	.incbin "graphics/pokemon/icons/magcargo_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC5BCC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_magcargo_footprint:: @ 8DC5FCC
	.incbin "graphics/pokemon/footprints/magcargo_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC5FCC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_swinub_still_front_pic:: @ 8DC5FEC
	.incbin "graphics/pokemon/front_pics/swinub_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC5FEC, 0x01FC

	.align 2
gFile_graphics_pokemon_palettes_swinub_palette:: @ 8DC61E8
	.incbin "graphics/pokemon/palettes/swinub_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC61E8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_swinub_back_pic:: @ 8DC6210
	.incbin "graphics/pokemon/back_pics/swinub_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC6210, 0x023C

	.align 2
gFile_graphics_pokemon_palettes_swinub_shiny_palette:: @ 8DC644C
	.incbin "graphics/pokemon/palettes/swinub_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC644C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_swinub_icon:: @ 8DC6474
	.incbin "graphics/pokemon/icons/swinub_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC6474, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_swinub_footprint:: @ 8DC6874
	.incbin "graphics/pokemon/footprints/swinub_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC6874, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_piloswine_still_front_pic:: @ 8DC6894
	.incbin "graphics/pokemon/front_pics/piloswine_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC6894, 0x0328

	.align 2
gFile_graphics_pokemon_palettes_piloswine_palette:: @ 8DC6BBC
	.incbin "graphics/pokemon/palettes/piloswine_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC6BBC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_piloswine_back_pic:: @ 8DC6BE4
	.incbin "graphics/pokemon/back_pics/piloswine_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC6BE4, 0x024C

	.align 2
gFile_graphics_pokemon_palettes_piloswine_shiny_palette:: @ 8DC6E30
	.incbin "graphics/pokemon/palettes/piloswine_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC6E30, 0x0028

	.align 2
gFile_graphics_pokemon_icons_piloswine_icon:: @ 8DC6E58
	.incbin "graphics/pokemon/icons/piloswine_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC6E58, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_piloswine_footprint:: @ 8DC7258
	.incbin "graphics/pokemon/footprints/piloswine_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC7258, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_corsola_still_front_pic:: @ 8DC7278
	.incbin "graphics/pokemon/front_pics/corsola_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC7278, 0x02E8

	.align 2
gFile_graphics_pokemon_palettes_corsola_palette:: @ 8DC7560
	.incbin "graphics/pokemon/palettes/corsola_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC7560, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_corsola_back_pic:: @ 8DC7588
	.incbin "graphics/pokemon/back_pics/corsola_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC7588, 0x02C0

	.align 2
gFile_graphics_pokemon_palettes_corsola_shiny_palette:: @ 8DC7848
	.incbin "graphics/pokemon/palettes/corsola_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC7848, 0x0028

	.align 2
gFile_graphics_pokemon_icons_corsola_icon:: @ 8DC7870
	.incbin "graphics/pokemon/icons/corsola_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC7870, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_corsola_footprint:: @ 8DC7C70
	.incbin "graphics/pokemon/footprints/corsola_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC7C70, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_remoraid_still_front_pic:: @ 8DC7C90
	.incbin "graphics/pokemon/front_pics/remoraid_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC7C90, 0x0268

	.align 2
gFile_graphics_pokemon_palettes_remoraid_palette:: @ 8DC7EF8
	.incbin "graphics/pokemon/palettes/remoraid_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC7EF8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_remoraid_back_pic:: @ 8DC7F20
	.incbin "graphics/pokemon/back_pics/remoraid_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC7F20, 0x0314

	.align 2
gFile_graphics_pokemon_palettes_remoraid_shiny_palette:: @ 8DC8234
	.incbin "graphics/pokemon/palettes/remoraid_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC8234, 0x0028

	.align 2
gFile_graphics_pokemon_icons_remoraid_icon:: @ 8DC825C
	.incbin "graphics/pokemon/icons/remoraid_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC825C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_remoraid_footprint:: @ 8DC865C
	.incbin "graphics/pokemon/footprints/remoraid_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC865C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_octillery_still_front_pic:: @ 8DC867C
	.incbin "graphics/pokemon/front_pics/octillery_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC867C, 0x0334

	.align 2
gFile_graphics_pokemon_palettes_octillery_palette:: @ 8DC89B0
	.incbin "graphics/pokemon/palettes/octillery_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC89B0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_octillery_back_pic:: @ 8DC89D8
	.incbin "graphics/pokemon/back_pics/octillery_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC89D8, 0x02B8

	.align 2
gFile_graphics_pokemon_palettes_octillery_shiny_palette:: @ 8DC8C90
	.incbin "graphics/pokemon/palettes/octillery_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC8C90, 0x0028

	.align 2
gFile_graphics_pokemon_icons_octillery_icon:: @ 8DC8CB8
	.incbin "graphics/pokemon/icons/octillery_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC8CB8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_octillery_footprint:: @ 8DC90B8
	.incbin "graphics/pokemon/footprints/octillery_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC90B8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_delibird_still_front_pic:: @ 8DC90D8
	.incbin "graphics/pokemon/front_pics/delibird_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC90D8, 0x0370

	.align 2
gFile_graphics_pokemon_palettes_delibird_palette:: @ 8DC9448
	.incbin "graphics/pokemon/palettes/delibird_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC9448, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_delibird_back_pic:: @ 8DC9470
	.incbin "graphics/pokemon/back_pics/delibird_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC9470, 0x03C0

	.align 2
gFile_graphics_pokemon_palettes_delibird_shiny_palette:: @ 8DC9830
	.incbin "graphics/pokemon/palettes/delibird_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDC9830, 0x0028

	.align 2
gFile_graphics_pokemon_icons_delibird_icon:: @ 8DC9858
	.incbin "graphics/pokemon/icons/delibird_icon.4bpp"
	@ .incbin "baserom.gba", 0xDC9858, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_delibird_footprint:: @ 8DC9C58
	.incbin "graphics/pokemon/footprints/delibird_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDC9C58, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_mantine_still_front_pic:: @ 8DC9C78
	.incbin "graphics/pokemon/front_pics/mantine_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDC9C78, 0x049C

	.align 2
gFile_graphics_pokemon_palettes_mantine_palette:: @ 8DCA114
	.incbin "graphics/pokemon/palettes/mantine_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCA114, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_mantine_back_pic:: @ 8DCA13C
	.incbin "graphics/pokemon/back_pics/mantine_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCA13C, 0x02A0

	.align 2
gFile_graphics_pokemon_palettes_mantine_shiny_palette:: @ 8DCA3DC
	.incbin "graphics/pokemon/palettes/mantine_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCA3DC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_mantine_icon:: @ 8DCA404
	.incbin "graphics/pokemon/icons/mantine_icon.4bpp"
	@ .incbin "baserom.gba", 0xDCA404, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_mantine_footprint:: @ 8DCA804
	.incbin "graphics/pokemon/footprints/mantine_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDCA804, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_skarmory_still_front_pic:: @ 8DCA824
	.incbin "graphics/pokemon/front_pics/skarmory_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCA824, 0x04E0

	.align 2
gFile_graphics_pokemon_palettes_skarmory_palette:: @ 8DCAD04
	.incbin "graphics/pokemon/palettes/skarmory_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCAD04, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_skarmory_back_pic:: @ 8DCAD2C
	.incbin "graphics/pokemon/back_pics/skarmory_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCAD2C, 0x0304

	.align 2
gFile_graphics_pokemon_palettes_skarmory_shiny_palette:: @ 8DCB030
	.incbin "graphics/pokemon/palettes/skarmory_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCB030, 0x0028

	.align 2
gFile_graphics_pokemon_icons_skarmory_icon:: @ 8DCB058
	.incbin "graphics/pokemon/icons/skarmory_icon.4bpp"
	@ .incbin "baserom.gba", 0xDCB058, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_skarmory_footprint:: @ 8DCB458
	.incbin "graphics/pokemon/footprints/skarmory_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDCB458, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_houndour_still_front_pic:: @ 8DCB478
	.incbin "graphics/pokemon/front_pics/houndour_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCB478, 0x02B8

	.align 2
gFile_graphics_pokemon_palettes_houndour_palette:: @ 8DCB730
	.incbin "graphics/pokemon/palettes/houndour_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCB730, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_houndour_back_pic:: @ 8DCB758
	.incbin "graphics/pokemon/back_pics/houndour_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCB758, 0x0280

	.align 2
gFile_graphics_pokemon_palettes_houndour_shiny_palette:: @ 8DCB9D8
	.incbin "graphics/pokemon/palettes/houndour_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCB9D8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_houndour_icon:: @ 8DCBA00
	.incbin "graphics/pokemon/icons/houndour_icon.4bpp"
	@ .incbin "baserom.gba", 0xDCBA00, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_houndour_footprint:: @ 8DCBE00
	.incbin "graphics/pokemon/footprints/houndour_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDCBE00, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_houndoom_still_front_pic:: @ 8DCBE20
	.incbin "graphics/pokemon/front_pics/houndoom_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCBE20, 0x0400

	.align 2
gFile_graphics_pokemon_palettes_houndoom_palette:: @ 8DCC220
	.incbin "graphics/pokemon/palettes/houndoom_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCC220, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_houndoom_back_pic:: @ 8DCC248
	.incbin "graphics/pokemon/back_pics/houndoom_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCC248, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_houndoom_shiny_palette:: @ 8DCC56C
	.incbin "graphics/pokemon/palettes/houndoom_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCC56C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_houndoom_icon:: @ 8DCC594
	.incbin "graphics/pokemon/icons/houndoom_icon.4bpp"
	@ .incbin "baserom.gba", 0xDCC594, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_houndoom_footprint:: @ 8DCC994
	.incbin "graphics/pokemon/footprints/houndoom_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDCC994, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_kingdra_still_front_pic:: @ 8DCC9B4
	.incbin "graphics/pokemon/front_pics/kingdra_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCC9B4, 0x0420

	.align 2
gFile_graphics_pokemon_palettes_kingdra_palette:: @ 8DCCDD4
	.incbin "graphics/pokemon/palettes/kingdra_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCCDD4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_kingdra_back_pic:: @ 8DCCDFC
	.incbin "graphics/pokemon/back_pics/kingdra_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCCDFC, 0x03B4

	.align 2
gFile_graphics_pokemon_palettes_kingdra_shiny_palette:: @ 8DCD1B0
	.incbin "graphics/pokemon/palettes/kingdra_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCD1B0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_kingdra_icon:: @ 8DCD1D8
	.incbin "graphics/pokemon/icons/kingdra_icon.4bpp"
	@ .incbin "baserom.gba", 0xDCD1D8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_kingdra_footprint:: @ 8DCD5D8
	.incbin "graphics/pokemon/footprints/kingdra_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDCD5D8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_phanpy_still_front_pic:: @ 8DCD5F8
	.incbin "graphics/pokemon/front_pics/phanpy_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCD5F8, 0x025C

	.align 2
gFile_graphics_pokemon_palettes_phanpy_palette:: @ 8DCD854
	.incbin "graphics/pokemon/palettes/phanpy_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCD854, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_phanpy_back_pic:: @ 8DCD87C
	.incbin "graphics/pokemon/back_pics/phanpy_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCD87C, 0x02C4

	.align 2
gFile_graphics_pokemon_palettes_phanpy_shiny_palette:: @ 8DCDB40
	.incbin "graphics/pokemon/palettes/phanpy_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCDB40, 0x0028

	.align 2
gFile_graphics_pokemon_icons_phanpy_icon:: @ 8DCDB68
	.incbin "graphics/pokemon/icons/phanpy_icon.4bpp"
	@ .incbin "baserom.gba", 0xDCDB68, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_phanpy_footprint:: @ 8DCDF68
	.incbin "graphics/pokemon/footprints/phanpy_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDCDF68, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_donphan_still_front_pic:: @ 8DCDF88
	.incbin "graphics/pokemon/front_pics/donphan_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCDF88, 0x0474

	.align 2
gFile_graphics_pokemon_palettes_donphan_palette:: @ 8DCE3FC
	.incbin "graphics/pokemon/palettes/donphan_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCE3FC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_donphan_back_pic:: @ 8DCE424
	.incbin "graphics/pokemon/back_pics/donphan_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCE424, 0x02FC

	.align 2
gFile_graphics_pokemon_palettes_donphan_shiny_palette:: @ 8DCE720
	.incbin "graphics/pokemon/palettes/donphan_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCE720, 0x0028

	.align 2
gFile_graphics_pokemon_icons_donphan_icon:: @ 8DCE748
	.incbin "graphics/pokemon/icons/donphan_icon.4bpp"
	@ .incbin "baserom.gba", 0xDCE748, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_donphan_footprint:: @ 8DCEB48
	.incbin "graphics/pokemon/footprints/donphan_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDCEB48, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_porygon2_still_front_pic:: @ 8DCEB68
	.incbin "graphics/pokemon/front_pics/porygon2_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCEB68, 0x0288

	.align 2
gFile_graphics_pokemon_palettes_porygon2_palette:: @ 8DCEDF0
	.incbin "graphics/pokemon/palettes/porygon2_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCEDF0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_porygon2_back_pic:: @ 8DCEE18
	.incbin "graphics/pokemon/back_pics/porygon2_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCEE18, 0x031C

	.align 2
gFile_graphics_pokemon_palettes_porygon2_shiny_palette:: @ 8DCF134
	.incbin "graphics/pokemon/palettes/porygon2_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCF134, 0x0028

	.align 2
gFile_graphics_pokemon_icons_porygon2_icon:: @ 8DCF15C
	.incbin "graphics/pokemon/icons/porygon2_icon.4bpp"
	@ .incbin "baserom.gba", 0xDCF15C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_porygon2_footprint:: @ 8DCF55C
	.incbin "graphics/pokemon/footprints/porygon2_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDCF55C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_stantler_still_front_pic:: @ 8DCF57C
	.incbin "graphics/pokemon/front_pics/stantler_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCF57C, 0x0414

	.align 2
gFile_graphics_pokemon_palettes_stantler_palette:: @ 8DCF990
	.incbin "graphics/pokemon/palettes/stantler_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCF990, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_stantler_back_pic:: @ 8DCF9B8
	.incbin "graphics/pokemon/back_pics/stantler_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDCF9B8, 0x034C

	.align 2
gFile_graphics_pokemon_palettes_stantler_shiny_palette:: @ 8DCFD04
	.incbin "graphics/pokemon/palettes/stantler_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDCFD04, 0x0028

	.align 2
gFile_graphics_pokemon_icons_stantler_icon:: @ 8DCFD2C
	.incbin "graphics/pokemon/icons/stantler_icon.4bpp"
	@ .incbin "baserom.gba", 0xDCFD2C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_stantler_footprint:: @ 8DD012C
	.incbin "graphics/pokemon/footprints/stantler_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD012C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_smeargle_still_front_pic:: @ 8DD014C
	.incbin "graphics/pokemon/front_pics/smeargle_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD014C, 0x0394

	.align 2
gFile_graphics_pokemon_palettes_smeargle_palette:: @ 8DD04E0
	.incbin "graphics/pokemon/palettes/smeargle_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD04E0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_smeargle_back_pic:: @ 8DD0508
	.incbin "graphics/pokemon/back_pics/smeargle_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD0508, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_smeargle_shiny_palette:: @ 8DD082C
	.incbin "graphics/pokemon/palettes/smeargle_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD082C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_smeargle_icon:: @ 8DD0854
	.incbin "graphics/pokemon/icons/smeargle_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD0854, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_smeargle_footprint:: @ 8DD0C54
	.incbin "graphics/pokemon/footprints/smeargle_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD0C54, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_tyrogue_still_front_pic:: @ 8DD0C74
	.incbin "graphics/pokemon/front_pics/tyrogue_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD0C74, 0x028C

	.align 2
gFile_graphics_pokemon_palettes_tyrogue_palette:: @ 8DD0F00
	.incbin "graphics/pokemon/palettes/tyrogue_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD0F00, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_tyrogue_back_pic:: @ 8DD0F28
	.incbin "graphics/pokemon/back_pics/tyrogue_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD0F28, 0x031C

	.align 2
gFile_graphics_pokemon_palettes_tyrogue_shiny_palette:: @ 8DD1244
	.incbin "graphics/pokemon/palettes/tyrogue_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD1244, 0x0028

	.align 2
gFile_graphics_pokemon_icons_tyrogue_icon:: @ 8DD126C
	.incbin "graphics/pokemon/icons/tyrogue_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD126C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_tyrogue_footprint:: @ 8DD166C
	.incbin "graphics/pokemon/footprints/tyrogue_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD166C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_hitmontop_still_front_pic:: @ 8DD168C
	.incbin "graphics/pokemon/front_pics/hitmontop_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD168C, 0x038C

	.align 2
gFile_graphics_pokemon_palettes_hitmontop_palette:: @ 8DD1A18
	.incbin "graphics/pokemon/palettes/hitmontop_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD1A18, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_hitmontop_back_pic:: @ 8DD1A40
	.incbin "graphics/pokemon/back_pics/hitmontop_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD1A40, 0x0428

	.align 2
gFile_graphics_pokemon_palettes_hitmontop_shiny_palette:: @ 8DD1E68
	.incbin "graphics/pokemon/palettes/hitmontop_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD1E68, 0x0028

	.align 2
gFile_graphics_pokemon_icons_hitmontop_icon:: @ 8DD1E90
	.incbin "graphics/pokemon/icons/hitmontop_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD1E90, 0x0400

gUnknown_hitmontop_blank_space:: @ 8DD2290
	@.space 0x200
	.incbin "baserom.gba", 0xDD2290, 0x200

	.align 2
gFile_graphics_pokemon_footprints_hitmontop_footprint:: @ 8DD2490
	.incbin "graphics/pokemon/footprints/hitmontop_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD2490, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_smoochum_still_front_pic:: @ 8DD24B0
	.incbin "graphics/pokemon/front_pics/smoochum_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD24B0, 0x0258

	.align 2
gFile_graphics_pokemon_palettes_smoochum_palette:: @ 8DD2708
	.incbin "graphics/pokemon/palettes/smoochum_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD2708, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_smoochum_back_pic:: @ 8DD2730
	.incbin "graphics/pokemon/back_pics/smoochum_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD2730, 0x0278

	.align 2
gFile_graphics_pokemon_palettes_smoochum_shiny_palette:: @ 8DD29A8
	.incbin "graphics/pokemon/palettes/smoochum_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD29A8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_smoochum_icon:: @ 8DD29D0
	.incbin "graphics/pokemon/icons/smoochum_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD29D0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_smoochum_footprint:: @ 8DD2DD0
	.incbin "graphics/pokemon/footprints/smoochum_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD2DD0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_elekid_still_front_pic:: @ 8DD2DF0
	.incbin "graphics/pokemon/front_pics/elekid_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD2DF0, 0x0308

	.align 2
gFile_graphics_pokemon_palettes_elekid_palette:: @ 8DD30F8
	.incbin "graphics/pokemon/palettes/elekid_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD30F8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_elekid_back_pic:: @ 8DD3120
	.incbin "graphics/pokemon/back_pics/elekid_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD3120, 0x0358

	.align 2
gFile_graphics_pokemon_palettes_elekid_shiny_palette:: @ 8DD3478
	.incbin "graphics/pokemon/palettes/elekid_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD3478, 0x0028

	.align 2
gFile_graphics_pokemon_icons_elekid_icon:: @ 8DD34A0
	.incbin "graphics/pokemon/icons/elekid_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD34A0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_elekid_footprint:: @ 8DD38A0
	.incbin "graphics/pokemon/footprints/elekid_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD38A0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_magby_still_front_pic:: @ 8DD38C0
	.incbin "graphics/pokemon/front_pics/magby_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD38C0, 0x0284

	.align 2
gFile_graphics_pokemon_palettes_magby_palette:: @ 8DD3B44
	.incbin "graphics/pokemon/palettes/magby_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD3B44, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_magby_back_pic:: @ 8DD3B6C
	.incbin "graphics/pokemon/back_pics/magby_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD3B6C, 0x02AC

	.align 2
gFile_graphics_pokemon_palettes_magby_shiny_palette:: @ 8DD3E18
	.incbin "graphics/pokemon/palettes/magby_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD3E18, 0x0028

	.align 2
gFile_graphics_pokemon_icons_magby_icon:: @ 8DD3E40
	.incbin "graphics/pokemon/icons/magby_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD3E40, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_magby_footprint:: @ 8DD4240
	.incbin "graphics/pokemon/footprints/magby_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD4240, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_miltank_still_front_pic:: @ 8DD4260
	.incbin "graphics/pokemon/front_pics/miltank_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD4260, 0x03B0

	.align 2
gFile_graphics_pokemon_palettes_miltank_palette:: @ 8DD4610
	.incbin "graphics/pokemon/palettes/miltank_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD4610, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_miltank_back_pic:: @ 8DD4638
	.incbin "graphics/pokemon/back_pics/miltank_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD4638, 0x039C

	.align 2
gFile_graphics_pokemon_palettes_miltank_shiny_palette:: @ 8DD49D4
	.incbin "graphics/pokemon/palettes/miltank_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD49D4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_miltank_icon:: @ 8DD49FC
	.incbin "graphics/pokemon/icons/miltank_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD49FC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_miltank_footprint:: @ 8DD4DFC
	.incbin "graphics/pokemon/footprints/miltank_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD4DFC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_blissey_still_front_pic:: @ 8DD4E1C
	.incbin "graphics/pokemon/front_pics/blissey_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD4E1C, 0x03E8

	.align 2
gFile_graphics_pokemon_palettes_blissey_palette:: @ 8DD5204
	.incbin "graphics/pokemon/palettes/blissey_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD5204, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_blissey_back_pic:: @ 8DD522C
	.incbin "graphics/pokemon/back_pics/blissey_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD522C, 0x02CC

	.align 2
gFile_graphics_pokemon_palettes_blissey_shiny_palette:: @ 8DD54F8
	.incbin "graphics/pokemon/palettes/blissey_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD54F8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_blissey_icon:: @ 8DD5520
	.incbin "graphics/pokemon/icons/blissey_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD5520, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_blissey_footprint:: @ 8DD5920
	.incbin "graphics/pokemon/footprints/blissey_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD5920, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_raikou_still_front_pic:: @ 8DD5940
	.incbin "graphics/pokemon/front_pics/raikou_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD5940, 0x057C

	.align 2
gFile_graphics_pokemon_palettes_raikou_palette:: @ 8DD5EBC
	.incbin "graphics/pokemon/palettes/raikou_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD5EBC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_raikou_back_pic:: @ 8DD5EE4
	.incbin "graphics/pokemon/back_pics/raikou_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD5EE4, 0x03A8

	.align 2
gFile_graphics_pokemon_palettes_raikou_shiny_palette:: @ 8DD628C
	.incbin "graphics/pokemon/palettes/raikou_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD628C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_raikou_icon:: @ 8DD62B4
	.incbin "graphics/pokemon/icons/raikou_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD62B4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_raikou_footprint:: @ 8DD66B4
	.incbin "graphics/pokemon/footprints/raikou_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD66B4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_entei_still_front_pic:: @ 8DD66D4
	.incbin "graphics/pokemon/front_pics/entei_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD66D4, 0x05FC

	.align 2
gFile_graphics_pokemon_palettes_entei_palette:: @ 8DD6CD0
	.incbin "graphics/pokemon/palettes/entei_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD6CD0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_entei_back_pic:: @ 8DD6CF8
	.incbin "graphics/pokemon/back_pics/entei_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD6CF8, 0x0424

	.align 2
gFile_graphics_pokemon_palettes_entei_shiny_palette:: @ 8DD711C
	.incbin "graphics/pokemon/palettes/entei_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD711C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_entei_icon:: @ 8DD7144
	.incbin "graphics/pokemon/icons/entei_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD7144, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_entei_footprint:: @ 8DD7544
	.incbin "graphics/pokemon/footprints/entei_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD7544, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_suicune_still_front_pic:: @ 8DD7564
	.incbin "graphics/pokemon/front_pics/suicune_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD7564, 0x0584

	.align 2
gFile_graphics_pokemon_palettes_suicune_palette:: @ 8DD7AE8
	.incbin "graphics/pokemon/palettes/suicune_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD7AE8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_suicune_back_pic:: @ 8DD7B10
	.incbin "graphics/pokemon/back_pics/suicune_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD7B10, 0x04DC

	.align 2
gFile_graphics_pokemon_palettes_suicune_shiny_palette:: @ 8DD7FEC
	.incbin "graphics/pokemon/palettes/suicune_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD7FEC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_suicune_icon:: @ 8DD8014
	.incbin "graphics/pokemon/icons/suicune_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD8014, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_suicune_footprint:: @ 8DD8414
	.incbin "graphics/pokemon/footprints/suicune_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD8414, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_larvitar_still_front_pic:: @ 8DD8434
	.incbin "graphics/pokemon/front_pics/larvitar_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD8434, 0x025C

	.align 2
gFile_graphics_pokemon_palettes_larvitar_palette:: @ 8DD8690
	.incbin "graphics/pokemon/palettes/larvitar_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD8690, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_larvitar_back_pic:: @ 8DD86B8
	.incbin "graphics/pokemon/back_pics/larvitar_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD86B8, 0x02AC

	.align 2
gFile_graphics_pokemon_palettes_larvitar_shiny_palette:: @ 8DD8964
	.incbin "graphics/pokemon/palettes/larvitar_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD8964, 0x0028

	.align 2
gFile_graphics_pokemon_icons_larvitar_icon:: @ 8DD898C
	.incbin "graphics/pokemon/icons/larvitar_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD898C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_larvitar_footprint:: @ 8DD8D8C
	.incbin "graphics/pokemon/footprints/larvitar_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD8D8C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_pupitar_still_front_pic:: @ 8DD8DAC
	.incbin "graphics/pokemon/front_pics/pupitar_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD8DAC, 0x02F0

	.align 2
gFile_graphics_pokemon_palettes_pupitar_palette:: @ 8DD909C
	.incbin "graphics/pokemon/palettes/pupitar_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD909C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_pupitar_back_pic:: @ 8DD90C4
	.incbin "graphics/pokemon/back_pics/pupitar_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD90C4, 0x0338

	.align 2
gFile_graphics_pokemon_palettes_pupitar_shiny_palette:: @ 8DD93FC
	.incbin "graphics/pokemon/palettes/pupitar_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD93FC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_pupitar_icon:: @ 8DD9424
	.incbin "graphics/pokemon/icons/pupitar_icon.4bpp"
	@ .incbin "baserom.gba", 0xDD9424, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_pupitar_footprint:: @ 8DD9824
	.incbin "graphics/pokemon/footprints/pupitar_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDD9824, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_tyranitar_still_front_pic:: @ 8DD9844
	.incbin "graphics/pokemon/front_pics/tyranitar_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD9844, 0x053C

	.align 2
gFile_graphics_pokemon_palettes_tyranitar_palette:: @ 8DD9D80
	.incbin "graphics/pokemon/palettes/tyranitar_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDD9D80, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_tyranitar_back_pic:: @ 8DD9DA8
	.incbin "graphics/pokemon/back_pics/tyranitar_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDD9DA8, 0x03EC

	.align 2
gFile_graphics_pokemon_palettes_tyranitar_shiny_palette:: @ 8DDA194
	.incbin "graphics/pokemon/palettes/tyranitar_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDA194, 0x0028

	.align 2
gFile_graphics_pokemon_icons_tyranitar_icon:: @ 8DDA1BC
	.incbin "graphics/pokemon/icons/tyranitar_icon.4bpp"
	@ .incbin "baserom.gba", 0xDDA1BC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_tyranitar_footprint:: @ 8DDA5BC
	.incbin "graphics/pokemon/footprints/tyranitar_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDDA5BC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_lugia_still_front_pic:: @ 8DDA5DC
	.incbin "graphics/pokemon/front_pics/lugia_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDA5DC, 0x04C4

	.align 2
gFile_graphics_pokemon_palettes_lugia_palette:: @ 8DDAAA0
	.incbin "graphics/pokemon/palettes/lugia_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDAAA0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_lugia_back_pic:: @ 8DDAAC8
	.incbin "graphics/pokemon/back_pics/lugia_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDAAC8, 0x03D4

	.align 2
gFile_graphics_pokemon_palettes_lugia_shiny_palette:: @ 8DDAE9C
	.incbin "graphics/pokemon/palettes/lugia_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDAE9C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_lugia_icon:: @ 8DDAEC4
	.incbin "graphics/pokemon/icons/lugia_icon.4bpp"
	@ .incbin "baserom.gba", 0xDDAEC4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_lugia_footprint:: @ 8DDB2C4
	.incbin "graphics/pokemon/footprints/lugia_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDDB2C4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ho_oh_still_front_pic:: @ 8DDB2E4
	.incbin "graphics/pokemon/front_pics/ho_oh_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDB2E4, 0x0654

	.align 2
gFile_graphics_pokemon_palettes_ho_oh_palette:: @ 8DDB938
	.incbin "graphics/pokemon/palettes/ho_oh_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDB938, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ho_oh_back_pic:: @ 8DDB960
	.incbin "graphics/pokemon/back_pics/ho_oh_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDB960, 0x0410

	.align 2
gFile_graphics_pokemon_palettes_ho_oh_shiny_palette:: @ 8DDBD70
	.incbin "graphics/pokemon/palettes/ho_oh_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDBD70, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ho_oh_icon:: @ 8DDBD98
	.incbin "graphics/pokemon/icons/ho_oh_icon.4bpp"
	@ .incbin "baserom.gba", 0xDDBD98, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ho_oh_footprint:: @ 8DDC198
	.incbin "graphics/pokemon/footprints/ho_oh_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDDC198, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_celebi_still_front_pic:: @ 8DDC1B8
	.incbin "graphics/pokemon/front_pics/celebi_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDC1B8, 0x0278

	.align 2
gFile_graphics_pokemon_palettes_celebi_palette:: @ 8DDC430
	.incbin "graphics/pokemon/palettes/celebi_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDC430, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_celebi_back_pic:: @ 8DDC458
	.incbin "graphics/pokemon/back_pics/celebi_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDC458, 0x03AC

	.align 2
gFile_graphics_pokemon_palettes_celebi_shiny_palette:: @ 8DDC804
	.incbin "graphics/pokemon/palettes/celebi_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDC804, 0x0028

	.align 2
gFile_graphics_pokemon_icons_celebi_icon:: @ 8DDC82C
	.incbin "graphics/pokemon/icons/celebi_icon.4bpp"
	@ .incbin "baserom.gba", 0xDDC82C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_celebi_footprint:: @ 8DDCC2C
	.incbin "graphics/pokemon/footprints/celebi_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDDCC2C, 0x0020


	.align 2
gFile_graphics_pokemon_back_pics_double_question_mark_back_pic:: @ 8DDCC4C
	.incbin "graphics/pokemon/back_pics/double_question_mark_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDCC4C, 0x0184

	.align 2
gFile_graphics_pokemon_palettes_double_question_mark_palette:: @ 8DDCDD0
	.incbin "graphics/pokemon/palettes/double_question_mark_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDCDD0, 0x0014

	.align 2
gFile_graphics_pokemon_back_pics_double_question_mark_back_pic2:: @ 8DDCDE4
	@ .incbin "graphics/pokemon/back_pics/double_question_mark_back_pic.4bpp.lz"
	.incbin "baserom.gba", 0xDDCDE4, 0x0184

	.align 2
gFile_graphics_pokemon_palettes_double_question_mark_shiny_palette:: @ 8DDCF68
	.incbin "graphics/pokemon/palettes/double_question_mark_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDCF68, 0x0014


	.align 2
gFile_graphics_pokemon_front_pics_treecko_still_front_pic:: @ 8DDCF7C
	.incbin "graphics/pokemon/front_pics/treecko_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDCF7C, 0x0308

	.align 2
gFile_graphics_pokemon_palettes_treecko_palette:: @ 8DDD284
	.incbin "graphics/pokemon/palettes/treecko_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDD284, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_treecko_back_pic:: @ 8DDD2AC
	.incbin "graphics/pokemon/back_pics/treecko_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDD2AC, 0x0300

	.align 2
gFile_graphics_pokemon_palettes_treecko_shiny_palette:: @ 8DDD5AC
	.incbin "graphics/pokemon/palettes/treecko_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDD5AC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_treecko_icon:: @ 8DDD5D4
	.incbin "graphics/pokemon/icons/treecko_icon.4bpp"
	@ .incbin "baserom.gba", 0xDDD5D4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_treecko_footprint:: @ 8DDD9D4
	.incbin "graphics/pokemon/footprints/treecko_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDDD9D4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_grovyle_still_front_pic:: @ 8DDD9F4
	.incbin "graphics/pokemon/front_pics/grovyle_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDD9F4, 0x048C

	.align 2
gFile_graphics_pokemon_palettes_grovyle_palette:: @ 8DDDE80
	.incbin "graphics/pokemon/palettes/grovyle_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDDE80, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_grovyle_back_pic:: @ 8DDDEA8
	.incbin "graphics/pokemon/back_pics/grovyle_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDDEA8, 0x033C

	.align 2
gFile_graphics_pokemon_palettes_grovyle_shiny_palette:: @ 8DDE1E4
	.incbin "graphics/pokemon/palettes/grovyle_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDE1E4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_grovyle_icon:: @ 8DDE20C
	.incbin "graphics/pokemon/icons/grovyle_icon.4bpp"
	@ .incbin "baserom.gba", 0xDDE20C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_grovyle_footprint:: @ 8DDE60C
	.incbin "graphics/pokemon/footprints/grovyle_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDDE60C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sceptile_still_front_pic:: @ 8DDE62C
	.incbin "graphics/pokemon/front_pics/sceptile_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDE62C, 0x0504

	.align 2
gFile_graphics_pokemon_palettes_sceptile_palette:: @ 8DDEB30
	.incbin "graphics/pokemon/palettes/sceptile_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDEB30, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sceptile_back_pic:: @ 8DDEB58
	.incbin "graphics/pokemon/back_pics/sceptile_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDEB58, 0x03FC

	.align 2
gFile_graphics_pokemon_palettes_sceptile_shiny_palette:: @ 8DDEF54
	.incbin "graphics/pokemon/palettes/sceptile_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDEF54, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sceptile_icon:: @ 8DDEF7C
	.incbin "graphics/pokemon/icons/sceptile_icon.4bpp"
	@ .incbin "baserom.gba", 0xDDEF7C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sceptile_footprint:: @ 8DDF37C
	.incbin "graphics/pokemon/footprints/sceptile_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDDF37C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_torchic_still_front_pic:: @ 8DDF39C
	.incbin "graphics/pokemon/front_pics/torchic_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDF39C, 0x029C

	.align 2
gFile_graphics_pokemon_palettes_torchic_palette:: @ 8DDF638
	.incbin "graphics/pokemon/palettes/torchic_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDF638, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_torchic_back_pic:: @ 8DDF660
	.incbin "graphics/pokemon/back_pics/torchic_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDF660, 0x02D8

	.align 2
gFile_graphics_pokemon_palettes_torchic_shiny_palette:: @ 8DDF938
	.incbin "graphics/pokemon/palettes/torchic_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDDF938, 0x0028

	.align 2
gFile_graphics_pokemon_icons_torchic_icon:: @ 8DDF960
	.incbin "graphics/pokemon/icons/torchic_icon.4bpp"
	@ .incbin "baserom.gba", 0xDDF960, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_torchic_footprint:: @ 8DDFD60
	.incbin "graphics/pokemon/footprints/torchic_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDDFD60, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_combusken_still_front_pic:: @ 8DDFD80
	.incbin "graphics/pokemon/front_pics/combusken_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDDFD80, 0x03EC

	.align 2
gFile_graphics_pokemon_palettes_combusken_palette:: @ 8DE016C
	.incbin "graphics/pokemon/palettes/combusken_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE016C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_combusken_back_pic:: @ 8DE0194
	.incbin "graphics/pokemon/back_pics/combusken_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE0194, 0x03D0

	.align 2
gFile_graphics_pokemon_palettes_combusken_shiny_palette:: @ 8DE0564
	.incbin "graphics/pokemon/palettes/combusken_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE0564, 0x0028

	.align 2
gFile_graphics_pokemon_icons_combusken_icon:: @ 8DE058C
	.incbin "graphics/pokemon/icons/combusken_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE058C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_combusken_footprint:: @ 8DE098C
	.incbin "graphics/pokemon/footprints/combusken_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE098C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_blaziken_still_front_pic:: @ 8DE09AC
	@ .incbin "graphics/pokemon/front_pics/blaziken_still_front_pic.4bpp.lz"
	.incbin "baserom.gba", 0xDE09AC, 0x0478

	.align 2
gFile_graphics_pokemon_palettes_blaziken_palette:: @ 8DE0E24
	.incbin "graphics/pokemon/palettes/blaziken_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE0E24, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_blaziken_back_pic:: @ 8DE0E4C
	.incbin "graphics/pokemon/back_pics/blaziken_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE0E4C, 0x03DC

	.align 2
gFile_graphics_pokemon_palettes_blaziken_shiny_palette:: @ 8DE1228
	.incbin "graphics/pokemon/palettes/blaziken_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE1228, 0x0028

	.align 2
gFile_graphics_pokemon_icons_blaziken_icon:: @ 8DE1250
	.incbin "graphics/pokemon/icons/blaziken_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE1250, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_blaziken_footprint:: @ 8DE1650
	.incbin "graphics/pokemon/footprints/blaziken_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE1650, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_mudkip_still_front_pic:: @ 8DE1670
	.incbin "graphics/pokemon/front_pics/mudkip_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE1670, 0x02B8

	.align 2
gFile_graphics_pokemon_palettes_mudkip_palette:: @ 8DE1928
	.incbin "graphics/pokemon/palettes/mudkip_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE1928, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_mudkip_back_pic:: @ 8DE1950
	.incbin "graphics/pokemon/back_pics/mudkip_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE1950, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_mudkip_shiny_palette:: @ 8DE1C30
	.incbin "graphics/pokemon/palettes/mudkip_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE1C30, 0x0028

	.align 2
gFile_graphics_pokemon_icons_mudkip_icon:: @ 8DE1C58
	.incbin "graphics/pokemon/icons/mudkip_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE1C58, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_mudkip_footprint:: @ 8DE2058
	.incbin "graphics/pokemon/footprints/mudkip_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE2058, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_marshtomp_still_front_pic:: @ 8DE2078
	.incbin "graphics/pokemon/front_pics/marshtomp_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE2078, 0x0388

	.align 2
gFile_graphics_pokemon_palettes_marshtomp_palette:: @ 8DE2400
	.incbin "graphics/pokemon/palettes/marshtomp_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE2400, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_marshtomp_back_pic:: @ 8DE2428
	.incbin "graphics/pokemon/back_pics/marshtomp_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE2428, 0x03B0

	.align 2
gFile_graphics_pokemon_palettes_marshtomp_shiny_palette:: @ 8DE27D8
	.incbin "graphics/pokemon/palettes/marshtomp_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE27D8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_marshtomp_icon:: @ 8DE2800
	.incbin "graphics/pokemon/icons/marshtomp_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE2800, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_marshtomp_footprint:: @ 8DE2C00
	.incbin "graphics/pokemon/footprints/marshtomp_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE2C00, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_swampert_still_front_pic:: @ 8DE2C20
	.incbin "graphics/pokemon/front_pics/swampert_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE2C20, 0x057C

	.align 2
gFile_graphics_pokemon_palettes_swampert_palette:: @ 8DE319C
	.incbin "graphics/pokemon/palettes/swampert_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE319C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_swampert_back_pic:: @ 8DE31C4
	.incbin "graphics/pokemon/back_pics/swampert_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE31C4, 0x03B4

	.align 2
gFile_graphics_pokemon_palettes_swampert_shiny_palette:: @ 8DE3578
	.incbin "graphics/pokemon/palettes/swampert_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE3578, 0x0028

	.align 2
gFile_graphics_pokemon_icons_swampert_icon:: @ 8DE35A0
	.incbin "graphics/pokemon/icons/swampert_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE35A0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_swampert_footprint:: @ 8DE39A0
	.incbin "graphics/pokemon/footprints/swampert_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE39A0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_poochyena_still_front_pic:: @ 8DE39C0
	.incbin "graphics/pokemon/front_pics/poochyena_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE39C0, 0x02C8

	.align 2
gFile_graphics_pokemon_palettes_poochyena_palette:: @ 8DE3C88
	.incbin "graphics/pokemon/palettes/poochyena_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE3C88, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_poochyena_back_pic:: @ 8DE3CB0
	.incbin "graphics/pokemon/back_pics/poochyena_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE3CB0, 0x032C

	.align 2
gFile_graphics_pokemon_palettes_poochyena_shiny_palette:: @ 8DE3FDC
	.incbin "graphics/pokemon/palettes/poochyena_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE3FDC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_poochyena_icon:: @ 8DE4004
	.incbin "graphics/pokemon/icons/poochyena_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE4004, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_poochyena_footprint:: @ 8DE4404
	.incbin "graphics/pokemon/footprints/poochyena_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE4404, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_mightyena_still_front_pic:: @ 8DE4424
	.incbin "graphics/pokemon/front_pics/mightyena_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE4424, 0x0438

	.align 2
gFile_graphics_pokemon_palettes_mightyena_palette:: @ 8DE485C
	.incbin "graphics/pokemon/palettes/mightyena_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE485C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_mightyena_back_pic:: @ 8DE4884
	.incbin "graphics/pokemon/back_pics/mightyena_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE4884, 0x0378

	.align 2
gFile_graphics_pokemon_palettes_mightyena_shiny_palette:: @ 8DE4BFC
	.incbin "graphics/pokemon/palettes/mightyena_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE4BFC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_mightyena_icon:: @ 8DE4C24
	.incbin "graphics/pokemon/icons/mightyena_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE4C24, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_mightyena_footprint:: @ 8DE5024
	.incbin "graphics/pokemon/footprints/mightyena_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE5024, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_zigzagoon_still_front_pic:: @ 8DE5044
	.incbin "graphics/pokemon/front_pics/zigzagoon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE5044, 0x03D0

	.align 2
gFile_graphics_pokemon_palettes_zigzagoon_palette:: @ 8DE5414
	.incbin "graphics/pokemon/palettes/zigzagoon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE5414, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_zigzagoon_back_pic:: @ 8DE543C
	.incbin "graphics/pokemon/back_pics/zigzagoon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE543C, 0x0340

	.align 2
gFile_graphics_pokemon_palettes_zigzagoon_shiny_palette:: @ 8DE577C
	.incbin "graphics/pokemon/palettes/zigzagoon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE577C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_zigzagoon_icon:: @ 8DE57A4
	.incbin "graphics/pokemon/icons/zigzagoon_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE57A4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_zigzagoon_footprint:: @ 8DE5BA4
	.incbin "graphics/pokemon/footprints/zigzagoon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE5BA4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_linoone_still_front_pic:: @ 8DE5BC4
	.incbin "graphics/pokemon/front_pics/linoone_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE5BC4, 0x0370

	.align 2
gFile_graphics_pokemon_palettes_linoone_palette:: @ 8DE5F34
	.incbin "graphics/pokemon/palettes/linoone_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE5F34, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_linoone_back_pic:: @ 8DE5F5C
	.incbin "graphics/pokemon/back_pics/linoone_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE5F5C, 0x02D4

	.align 2
gFile_graphics_pokemon_palettes_linoone_shiny_palette:: @ 8DE6230
	.incbin "graphics/pokemon/palettes/linoone_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE6230, 0x0028

	.align 2
gFile_graphics_pokemon_icons_linoone_icon:: @ 8DE6258
	.incbin "graphics/pokemon/icons/linoone_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE6258, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_linoone_footprint:: @ 8DE6658
	.incbin "graphics/pokemon/footprints/linoone_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE6658, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_wurmple_still_front_pic:: @ 8DE6678
	.incbin "graphics/pokemon/front_pics/wurmple_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE6678, 0x0288

	.align 2
gFile_graphics_pokemon_palettes_wurmple_palette:: @ 8DE6900
	.incbin "graphics/pokemon/palettes/wurmple_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE6900, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_wurmple_back_pic:: @ 8DE6928
	.incbin "graphics/pokemon/back_pics/wurmple_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE6928, 0x024C

	.align 2
gFile_graphics_pokemon_palettes_wurmple_shiny_palette:: @ 8DE6B74
	.incbin "graphics/pokemon/palettes/wurmple_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE6B74, 0x0028

	.align 2
gFile_graphics_pokemon_icons_wurmple_icon:: @ 8DE6B9C
	.incbin "graphics/pokemon/icons/wurmple_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE6B9C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_wurmple_footprint:: @ 8DE6F9C
	.incbin "graphics/pokemon/footprints/wurmple_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE6F9C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_silcoon_still_front_pic:: @ 8DE6FBC
	.incbin "graphics/pokemon/front_pics/silcoon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE6FBC, 0x0280

	.align 2
gFile_graphics_pokemon_palettes_silcoon_palette:: @ 8DE723C
	.incbin "graphics/pokemon/palettes/silcoon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE723C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_silcoon_back_pic:: @ 8DE7264
	.incbin "graphics/pokemon/back_pics/silcoon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE7264, 0x021C

	.align 2
gFile_graphics_pokemon_palettes_silcoon_shiny_palette:: @ 8DE7480
	.incbin "graphics/pokemon/palettes/silcoon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE7480, 0x0028

	.align 2
gFile_graphics_pokemon_icons_silcoon_icon:: @ 8DE74A8
	.incbin "graphics/pokemon/icons/silcoon_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE74A8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_silcoon_footprint:: @ 8DE78A8
	.incbin "graphics/pokemon/footprints/silcoon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE78A8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_beautifly_still_front_pic:: @ 8DE78C8
	.incbin "graphics/pokemon/front_pics/beautifly_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE78C8, 0x0358

	.align 2
gFile_graphics_pokemon_palettes_beautifly_palette:: @ 8DE7C20
	.incbin "graphics/pokemon/palettes/beautifly_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE7C20, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_beautifly_back_pic:: @ 8DE7C48
	.incbin "graphics/pokemon/back_pics/beautifly_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE7C48, 0x03B0

	.align 2
gFile_graphics_pokemon_palettes_beautifly_shiny_palette:: @ 8DE7FF8
	.incbin "graphics/pokemon/palettes/beautifly_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE7FF8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_beautifly_icon:: @ 8DE8020
	.incbin "graphics/pokemon/icons/beautifly_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE8020, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_beautifly_footprint:: @ 8DE8420
	.incbin "graphics/pokemon/footprints/beautifly_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE8420, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_cascoon_still_front_pic:: @ 8DE8440
	.incbin "graphics/pokemon/front_pics/cascoon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE8440, 0x026C

	.align 2
gFile_graphics_pokemon_palettes_cascoon_palette:: @ 8DE86AC
	.incbin "graphics/pokemon/palettes/cascoon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE86AC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_cascoon_back_pic:: @ 8DE86D4
	.incbin "graphics/pokemon/back_pics/cascoon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE86D4, 0x0210

	.align 2
gFile_graphics_pokemon_palettes_cascoon_shiny_palette:: @ 8DE88E4
	.incbin "graphics/pokemon/palettes/cascoon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE88E4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_cascoon_icon:: @ 8DE890C
	.incbin "graphics/pokemon/icons/cascoon_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE890C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_cascoon_footprint:: @ 8DE8D0C
	.incbin "graphics/pokemon/footprints/cascoon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE8D0C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_dustox_still_front_pic:: @ 8DE8D2C
	.incbin "graphics/pokemon/front_pics/dustox_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE8D2C, 0x0368

	.align 2
gFile_graphics_pokemon_palettes_dustox_palette:: @ 8DE9094
	.incbin "graphics/pokemon/palettes/dustox_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE9094, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_dustox_back_pic:: @ 8DE90BC
	.incbin "graphics/pokemon/back_pics/dustox_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE90BC, 0x0258

	.align 2
gFile_graphics_pokemon_palettes_dustox_shiny_palette:: @ 8DE9314
	.incbin "graphics/pokemon/palettes/dustox_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE9314, 0x0028

	.align 2
gFile_graphics_pokemon_icons_dustox_icon:: @ 8DE933C
	.incbin "graphics/pokemon/icons/dustox_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE933C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_dustox_footprint:: @ 8DE973C
	.incbin "graphics/pokemon/footprints/dustox_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDE973C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_lotad_still_front_pic:: @ 8DE975C
	.incbin "graphics/pokemon/front_pics/lotad_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE975C, 0x0260

	.align 2
gFile_graphics_pokemon_palettes_lotad_palette:: @ 8DE99BC
	.incbin "graphics/pokemon/palettes/lotad_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE99BC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_lotad_back_pic:: @ 8DE99E4
	.incbin "graphics/pokemon/back_pics/lotad_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDE99E4, 0x02E8

	.align 2
gFile_graphics_pokemon_palettes_lotad_shiny_palette:: @ 8DE9CCC
	.incbin "graphics/pokemon/palettes/lotad_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDE9CCC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_lotad_icon:: @ 8DE9CF4
	.incbin "graphics/pokemon/icons/lotad_icon.4bpp"
	@ .incbin "baserom.gba", 0xDE9CF4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_lotad_footprint:: @ 8DEA0F4
	.incbin "graphics/pokemon/footprints/lotad_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDEA0F4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_lombre_still_front_pic:: @ 8DEA114
	.incbin "graphics/pokemon/front_pics/lombre_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEA114, 0x0318

	.align 2
gFile_graphics_pokemon_palettes_lombre_palette:: @ 8DEA42C
	.incbin "graphics/pokemon/palettes/lombre_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEA42C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_lombre_back_pic:: @ 8DEA454
	.incbin "graphics/pokemon/back_pics/lombre_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEA454, 0x02FC

	.align 2
gFile_graphics_pokemon_palettes_lombre_shiny_palette:: @ 8DEA750
	.incbin "graphics/pokemon/palettes/lombre_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEA750, 0x0028

	.align 2
gFile_graphics_pokemon_icons_lombre_icon:: @ 8DEA778
	.incbin "graphics/pokemon/icons/lombre_icon.4bpp"
	@ .incbin "baserom.gba", 0xDEA778, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_lombre_footprint:: @ 8DEAB78
	.incbin "graphics/pokemon/footprints/lombre_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDEAB78, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ludicolo_still_front_pic:: @ 8DEAB98
	.incbin "graphics/pokemon/front_pics/ludicolo_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEAB98, 0x04E4

	.align 2
gFile_graphics_pokemon_palettes_ludicolo_palette:: @ 8DEB07C
	.incbin "graphics/pokemon/palettes/ludicolo_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEB07C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ludicolo_back_pic:: @ 8DEB0A4
	.incbin "graphics/pokemon/back_pics/ludicolo_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEB0A4, 0x02FC

	.align 2
gFile_graphics_pokemon_palettes_ludicolo_shiny_palette:: @ 8DEB3A0
	.incbin "graphics/pokemon/palettes/ludicolo_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEB3A0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ludicolo_icon:: @ 8DEB3C8
	.incbin "graphics/pokemon/icons/ludicolo_icon.4bpp"
	@ .incbin "baserom.gba", 0xDEB3C8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ludicolo_footprint:: @ 8DEB7C8
	.incbin "graphics/pokemon/footprints/ludicolo_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDEB7C8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_seedot_still_front_pic:: @ 8DEB7E8
	.incbin "graphics/pokemon/front_pics/seedot_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEB7E8, 0x0294

	.align 2
gFile_graphics_pokemon_palettes_seedot_palette:: @ 8DEBA7C
	.incbin "graphics/pokemon/palettes/seedot_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEBA7C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_seedot_back_pic:: @ 8DEBAA4
	.incbin "graphics/pokemon/back_pics/seedot_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEBAA4, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_seedot_shiny_palette:: @ 8DEBD84
	.incbin "graphics/pokemon/palettes/seedot_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEBD84, 0x0028

	.align 2
gFile_graphics_pokemon_icons_seedot_icon:: @ 8DEBDAC
	.incbin "graphics/pokemon/icons/seedot_icon.4bpp"
	@ .incbin "baserom.gba", 0xDEBDAC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_seedot_footprint:: @ 8DEC1AC
	.incbin "graphics/pokemon/footprints/seedot_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDEC1AC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_nuzleaf_still_front_pic:: @ 8DEC1CC
	.incbin "graphics/pokemon/front_pics/nuzleaf_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEC1CC, 0x02EC

	.align 2
gFile_graphics_pokemon_palettes_nuzleaf_palette:: @ 8DEC4B8
	.incbin "graphics/pokemon/palettes/nuzleaf_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEC4B8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_nuzleaf_back_pic:: @ 8DEC4E0
	.incbin "graphics/pokemon/back_pics/nuzleaf_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEC4E0, 0x02C8

	.align 2
gFile_graphics_pokemon_palettes_nuzleaf_shiny_palette:: @ 8DEC7A8
	.incbin "graphics/pokemon/palettes/nuzleaf_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEC7A8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_nuzleaf_icon:: @ 8DEC7D0
	.incbin "graphics/pokemon/icons/nuzleaf_icon.4bpp"
	@ .incbin "baserom.gba", 0xDEC7D0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_nuzleaf_footprint:: @ 8DECBD0
	.incbin "graphics/pokemon/footprints/nuzleaf_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDECBD0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_shiftry_still_front_pic:: @ 8DECBF0
	.incbin "graphics/pokemon/front_pics/shiftry_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDECBF0, 0x04BC

	.align 2
gFile_graphics_pokemon_palettes_shiftry_palette:: @ 8DED0AC
	.incbin "graphics/pokemon/palettes/shiftry_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDED0AC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_shiftry_back_pic:: @ 8DED0D4
	.incbin "graphics/pokemon/back_pics/shiftry_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDED0D4, 0x02C4

	.align 2
gFile_graphics_pokemon_palettes_shiftry_shiny_palette:: @ 8DED398
	.incbin "graphics/pokemon/palettes/shiftry_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDED398, 0x0028

	.align 2
gFile_graphics_pokemon_icons_shiftry_icon:: @ 8DED3C0
	.incbin "graphics/pokemon/icons/shiftry_icon.4bpp"
	@ .incbin "baserom.gba", 0xDED3C0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_shiftry_footprint:: @ 8DED7C0
	.incbin "graphics/pokemon/footprints/shiftry_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDED7C0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_nincada_still_front_pic:: @ 8DED7E0
	.incbin "graphics/pokemon/front_pics/nincada_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDED7E0, 0x02A0

	.align 2
gFile_graphics_pokemon_palettes_nincada_palette:: @ 8DEDA80
	.incbin "graphics/pokemon/palettes/nincada_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEDA80, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_nincada_back_pic:: @ 8DEDAA8
	.incbin "graphics/pokemon/back_pics/nincada_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEDAA8, 0x02B8

	.align 2
gFile_graphics_pokemon_palettes_nincada_shiny_palette:: @ 8DEDD60
	.incbin "graphics/pokemon/palettes/nincada_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEDD60, 0x0028

	.align 2
gFile_graphics_pokemon_icons_nincada_icon:: @ 8DEDD88
	.incbin "graphics/pokemon/icons/nincada_icon.4bpp"
	@ .incbin "baserom.gba", 0xDEDD88, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_nincada_footprint:: @ 8DEE188
	.incbin "graphics/pokemon/footprints/nincada_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDEE188, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ninjask_still_front_pic:: @ 8DEE1A8
	.incbin "graphics/pokemon/front_pics/ninjask_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEE1A8, 0x0370

	.align 2
gFile_graphics_pokemon_palettes_ninjask_palette:: @ 8DEE518
	.incbin "graphics/pokemon/palettes/ninjask_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEE518, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ninjask_back_pic:: @ 8DEE540
	.incbin "graphics/pokemon/back_pics/ninjask_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEE540, 0x03CC

	.align 2
gFile_graphics_pokemon_palettes_ninjask_shiny_palette:: @ 8DEE90C
	.incbin "graphics/pokemon/palettes/ninjask_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEE90C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ninjask_icon:: @ 8DEE934
	.incbin "graphics/pokemon/icons/ninjask_icon.4bpp"
	@ .incbin "baserom.gba", 0xDEE934, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ninjask_footprint:: @ 8DEED34
	.incbin "graphics/pokemon/footprints/ninjask_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDEED34, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_shedinja_still_front_pic:: @ 8DEED54
	.incbin "graphics/pokemon/front_pics/shedinja_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEED54, 0x0320

	.align 2
gFile_graphics_pokemon_palettes_shedinja_palette:: @ 8DEF074
	.incbin "graphics/pokemon/palettes/shedinja_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEF074, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_shedinja_back_pic:: @ 8DEF09C
	.incbin "graphics/pokemon/back_pics/shedinja_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEF09C, 0x03A0

	.align 2
gFile_graphics_pokemon_palettes_shedinja_shiny_palette:: @ 8DEF43C
	.incbin "graphics/pokemon/palettes/shedinja_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEF43C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_shedinja_icon:: @ 8DEF464
	.incbin "graphics/pokemon/icons/shedinja_icon.4bpp"
	@ .incbin "baserom.gba", 0xDEF464, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_shedinja_footprint:: @ 8DEF864
	.incbin "graphics/pokemon/footprints/shedinja_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDEF864, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_taillow_still_front_pic:: @ 8DEF884
	.incbin "graphics/pokemon/front_pics/taillow_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEF884, 0x0258

	.align 2
gFile_graphics_pokemon_palettes_taillow_palette:: @ 8DEFADC
	.incbin "graphics/pokemon/palettes/taillow_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEFADC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_taillow_back_pic:: @ 8DEFB04
	.incbin "graphics/pokemon/back_pics/taillow_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDEFB04, 0x0220

	.align 2
gFile_graphics_pokemon_palettes_taillow_shiny_palette:: @ 8DEFD24
	.incbin "graphics/pokemon/palettes/taillow_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDEFD24, 0x0028

	.align 2
gFile_graphics_pokemon_icons_taillow_icon:: @ 8DEFD4C
	.incbin "graphics/pokemon/icons/taillow_icon.4bpp"
	@ .incbin "baserom.gba", 0xDEFD4C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_taillow_footprint:: @ 8DF014C
	.incbin "graphics/pokemon/footprints/taillow_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF014C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_swellow_still_front_pic:: @ 8DF016C
	.incbin "graphics/pokemon/front_pics/swellow_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF016C, 0x03C4

	.align 2
gFile_graphics_pokemon_palettes_swellow_palette:: @ 8DF0530
	.incbin "graphics/pokemon/palettes/swellow_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF0530, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_swellow_back_pic:: @ 8DF0558
	.incbin "graphics/pokemon/back_pics/swellow_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF0558, 0x0338

	.align 2
gFile_graphics_pokemon_palettes_swellow_shiny_palette:: @ 8DF0890
	.incbin "graphics/pokemon/palettes/swellow_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF0890, 0x0028

	.align 2
gFile_graphics_pokemon_icons_swellow_icon:: @ 8DF08B8
	.incbin "graphics/pokemon/icons/swellow_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF08B8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_swellow_footprint:: @ 8DF0CB8
	.incbin "graphics/pokemon/footprints/swellow_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF0CB8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_shroomish_still_front_pic:: @ 8DF0CD8
	.incbin "graphics/pokemon/front_pics/shroomish_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF0CD8, 0x0268

	.align 2
gFile_graphics_pokemon_palettes_shroomish_palette:: @ 8DF0F40
	.incbin "graphics/pokemon/palettes/shroomish_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF0F40, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_shroomish_back_pic:: @ 8DF0F68
	.incbin "graphics/pokemon/back_pics/shroomish_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF0F68, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_shroomish_shiny_palette:: @ 8DF1248
	.incbin "graphics/pokemon/palettes/shroomish_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF1248, 0x0028

	.align 2
gFile_graphics_pokemon_icons_shroomish_icon:: @ 8DF1270
	.incbin "graphics/pokemon/icons/shroomish_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF1270, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_shroomish_footprint:: @ 8DF1670
	.incbin "graphics/pokemon/footprints/shroomish_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF1670, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_breloom_still_front_pic:: @ 8DF1690
	.incbin "graphics/pokemon/front_pics/breloom_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF1690, 0x03E8

	.align 2
gFile_graphics_pokemon_palettes_breloom_palette:: @ 8DF1A78
	.incbin "graphics/pokemon/palettes/breloom_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF1A78, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_breloom_back_pic:: @ 8DF1AA0
	.incbin "graphics/pokemon/back_pics/breloom_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF1AA0, 0x03E0

	.align 2
gFile_graphics_pokemon_palettes_breloom_shiny_palette:: @ 8DF1E80
	.incbin "graphics/pokemon/palettes/breloom_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF1E80, 0x0028

	.align 2
gFile_graphics_pokemon_icons_breloom_icon:: @ 8DF1EA8
	.incbin "graphics/pokemon/icons/breloom_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF1EA8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_breloom_footprint:: @ 8DF22A8
	.incbin "graphics/pokemon/footprints/breloom_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF22A8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_spinda_still_front_pic:: @ 8DF22C8
	.incbin "graphics/pokemon/front_pics/spinda_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF22C8, 0x0300

	.align 2
gFile_graphics_pokemon_palettes_spinda_palette:: @ 8DF25C8
	.incbin "graphics/pokemon/palettes/spinda_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF25C8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_spinda_back_pic:: @ 8DF25F0
	.incbin "graphics/pokemon/back_pics/spinda_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF25F0, 0x033C

	.align 2
gFile_graphics_pokemon_palettes_spinda_shiny_palette:: @ 8DF292C
	.incbin "graphics/pokemon/palettes/spinda_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF292C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_spinda_icon:: @ 8DF2954
	.incbin "graphics/pokemon/icons/spinda_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF2954, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_spinda_footprint:: @ 8DF2D54
	.incbin "graphics/pokemon/footprints/spinda_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF2D54, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_wingull_still_front_pic:: @ 8DF2D74
	.incbin "graphics/pokemon/front_pics/wingull_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF2D74, 0x023C

	.align 2
gFile_graphics_pokemon_palettes_wingull_palette:: @ 8DF2FB0
	.incbin "graphics/pokemon/palettes/wingull_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF2FB0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_wingull_back_pic:: @ 8DF2FD8
	.incbin "graphics/pokemon/back_pics/wingull_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF2FD8, 0x0350

	.align 2
gFile_graphics_pokemon_palettes_wingull_shiny_palette:: @ 8DF3328
	.incbin "graphics/pokemon/palettes/wingull_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF3328, 0x0028

	.align 2
gFile_graphics_pokemon_icons_wingull_icon:: @ 8DF3350
	.incbin "graphics/pokemon/icons/wingull_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF3350, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_wingull_footprint:: @ 8DF3750
	.incbin "graphics/pokemon/footprints/wingull_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF3750, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_pelipper_still_front_pic:: @ 8DF3770
	.incbin "graphics/pokemon/front_pics/pelipper_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF3770, 0x0398

	.align 2
gFile_graphics_pokemon_palettes_pelipper_palette:: @ 8DF3B08
	.incbin "graphics/pokemon/palettes/pelipper_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF3B08, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_pelipper_back_pic:: @ 8DF3B30
	.incbin "graphics/pokemon/back_pics/pelipper_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF3B30, 0x0380

	.align 2
gFile_graphics_pokemon_palettes_pelipper_shiny_palette:: @ 8DF3EB0
	.incbin "graphics/pokemon/palettes/pelipper_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF3EB0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_pelipper_icon:: @ 8DF3ED8
	.incbin "graphics/pokemon/icons/pelipper_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF3ED8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_pelipper_footprint:: @ 8DF42D8
	.incbin "graphics/pokemon/footprints/pelipper_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF42D8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_surskit_still_front_pic:: @ 8DF42F8
	.incbin "graphics/pokemon/front_pics/surskit_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF42F8, 0x020C

	.align 2
gFile_graphics_pokemon_palettes_surskit_palette:: @ 8DF4504
	.incbin "graphics/pokemon/palettes/surskit_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF4504, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_surskit_back_pic:: @ 8DF452C
	.incbin "graphics/pokemon/back_pics/surskit_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF452C, 0x0238

	.align 2
gFile_graphics_pokemon_palettes_surskit_shiny_palette:: @ 8DF4764
	.incbin "graphics/pokemon/palettes/surskit_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF4764, 0x0028

	.align 2
gFile_graphics_pokemon_icons_surskit_icon:: @ 8DF478C
	.incbin "graphics/pokemon/icons/surskit_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF478C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_surskit_footprint:: @ 8DF4B8C
	.incbin "graphics/pokemon/footprints/surskit_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF4B8C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_masquerain_still_front_pic:: @ 8DF4BAC
	.incbin "graphics/pokemon/front_pics/masquerain_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF4BAC, 0x039C

	.align 2
gFile_graphics_pokemon_palettes_masquerain_palette:: @ 8DF4F48
	.incbin "graphics/pokemon/palettes/masquerain_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF4F48, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_masquerain_back_pic:: @ 8DF4F70
	.incbin "graphics/pokemon/back_pics/masquerain_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF4F70, 0x0358

	.align 2
gFile_graphics_pokemon_palettes_masquerain_shiny_palette:: @ 8DF52C8
	.incbin "graphics/pokemon/palettes/masquerain_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF52C8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_masquerain_icon:: @ 8DF52F0
	.incbin "graphics/pokemon/icons/masquerain_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF52F0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_masquerain_footprint:: @ 8DF56F0
	.incbin "graphics/pokemon/footprints/masquerain_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF56F0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_wailmer_still_front_pic:: @ 8DF5710
	.incbin "graphics/pokemon/front_pics/wailmer_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF5710, 0x02E0

	.align 2
gFile_graphics_pokemon_palettes_wailmer_palette:: @ 8DF59F0
	.incbin "graphics/pokemon/palettes/wailmer_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF59F0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_wailmer_back_pic:: @ 8DF5A18
	.incbin "graphics/pokemon/back_pics/wailmer_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF5A18, 0x01E4

	.align 2
gFile_graphics_pokemon_palettes_wailmer_shiny_palette:: @ 8DF5BFC
	.incbin "graphics/pokemon/palettes/wailmer_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF5BFC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_wailmer_icon:: @ 8DF5C24
	.incbin "graphics/pokemon/icons/wailmer_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF5C24, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_wailmer_footprint:: @ 8DF6024
	.incbin "graphics/pokemon/footprints/wailmer_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF6024, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_wailord_still_front_pic:: @ 8DF6044
	.incbin "graphics/pokemon/front_pics/wailord_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF6044, 0x03C4

	.align 2
gFile_graphics_pokemon_palettes_wailord_palette:: @ 8DF6408
	.incbin "graphics/pokemon/palettes/wailord_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF6408, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_wailord_back_pic:: @ 8DF6430
	.incbin "graphics/pokemon/back_pics/wailord_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF6430, 0x0218

	.align 2
gFile_graphics_pokemon_palettes_wailord_shiny_palette:: @ 8DF6648
	.incbin "graphics/pokemon/palettes/wailord_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF6648, 0x0028

	.align 2
gFile_graphics_pokemon_icons_wailord_icon:: @ 8DF6670
	.incbin "graphics/pokemon/icons/wailord_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF6670, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_wailord_footprint:: @ 8DF6A70
	.incbin "graphics/pokemon/footprints/wailord_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF6A70, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_skitty_still_front_pic:: @ 8DF6A90
	.incbin "graphics/pokemon/front_pics/skitty_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF6A90, 0x0300

	.align 2
gFile_graphics_pokemon_palettes_skitty_palette:: @ 8DF6D90
	.incbin "graphics/pokemon/palettes/skitty_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF6D90, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_skitty_back_pic:: @ 8DF6DB8
	.incbin "graphics/pokemon/back_pics/skitty_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF6DB8, 0x0348

	.align 2
gFile_graphics_pokemon_palettes_skitty_shiny_palette:: @ 8DF7100
	.incbin "graphics/pokemon/palettes/skitty_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF7100, 0x0028

	.align 2
gFile_graphics_pokemon_icons_skitty_icon:: @ 8DF7128
	.incbin "graphics/pokemon/icons/skitty_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF7128, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_skitty_footprint:: @ 8DF7528
	.incbin "graphics/pokemon/footprints/skitty_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF7528, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_delcatty_still_front_pic:: @ 8DF7548
	.incbin "graphics/pokemon/front_pics/delcatty_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF7548, 0x038C

	.align 2
gFile_graphics_pokemon_palettes_delcatty_palette:: @ 8DF78D4
	.incbin "graphics/pokemon/palettes/delcatty_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF78D4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_delcatty_back_pic:: @ 8DF78FC
	.incbin "graphics/pokemon/back_pics/delcatty_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF78FC, 0x039C

	.align 2
gFile_graphics_pokemon_palettes_delcatty_shiny_palette:: @ 8DF7C98
	.incbin "graphics/pokemon/palettes/delcatty_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF7C98, 0x0028

	.align 2
gFile_graphics_pokemon_icons_delcatty_icon:: @ 8DF7CC0
	.incbin "graphics/pokemon/icons/delcatty_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF7CC0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_delcatty_footprint:: @ 8DF80C0
	.incbin "graphics/pokemon/footprints/delcatty_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF80C0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_kecleon_still_front_pic:: @ 8DF80E0
	.incbin "graphics/pokemon/front_pics/kecleon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF80E0, 0x0380

	.align 2
gFile_graphics_pokemon_palettes_kecleon_palette:: @ 8DF8460
	.incbin "graphics/pokemon/palettes/kecleon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF8460, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_kecleon_back_pic:: @ 8DF8488
	.incbin "graphics/pokemon/back_pics/kecleon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF8488, 0x03D8

	.align 2
gFile_graphics_pokemon_palettes_kecleon_shiny_palette:: @ 8DF8860
	.incbin "graphics/pokemon/palettes/kecleon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF8860, 0x0028

	.align 2
gFile_graphics_pokemon_icons_kecleon_icon:: @ 8DF8888
	.incbin "graphics/pokemon/icons/kecleon_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF8888, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_kecleon_footprint:: @ 8DF8C88
	.incbin "graphics/pokemon/footprints/kecleon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF8C88, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_baltoy_still_front_pic:: @ 8DF8CA8
	.incbin "graphics/pokemon/front_pics/baltoy_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF8CA8, 0x0224

	.align 2
gFile_graphics_pokemon_palettes_baltoy_palette:: @ 8DF8ECC
	.incbin "graphics/pokemon/palettes/baltoy_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF8ECC, 0x0020

	.align 2
gFile_graphics_pokemon_back_pics_baltoy_back_pic:: @ 8DF8EEC
	.incbin "graphics/pokemon/back_pics/baltoy_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF8EEC, 0x02A8

	.align 2
gFile_graphics_pokemon_palettes_baltoy_shiny_palette:: @ 8DF9194
	.incbin "graphics/pokemon/palettes/baltoy_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF9194, 0x0020

	.align 2
gFile_graphics_pokemon_icons_baltoy_icon:: @ 8DF91B4
	.incbin "graphics/pokemon/icons/baltoy_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF91B4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_baltoy_footprint:: @ 8DF95B4
	.incbin "graphics/pokemon/footprints/baltoy_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDF95B4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_claydol_still_front_pic:: @ 8DF95D4
	.incbin "graphics/pokemon/front_pics/claydol_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF95D4, 0x03B8

	.align 2
gFile_graphics_pokemon_palettes_claydol_palette:: @ 8DF998C
	.incbin "graphics/pokemon/palettes/claydol_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF998C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_claydol_back_pic:: @ 8DF99B4
	.incbin "graphics/pokemon/back_pics/claydol_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDF99B4, 0x03D4

	.align 2
gFile_graphics_pokemon_palettes_claydol_shiny_palette:: @ 8DF9D88
	.incbin "graphics/pokemon/palettes/claydol_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDF9D88, 0x0028

	.align 2
gFile_graphics_pokemon_icons_claydol_icon:: @ 8DF9DB0
	.incbin "graphics/pokemon/icons/claydol_icon.4bpp"
	@ .incbin "baserom.gba", 0xDF9DB0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_claydol_footprint:: @ 8DFA1B0
	.incbin "graphics/pokemon/footprints/claydol_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDFA1B0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_nosepass_still_front_pic:: @ 8DFA1D0
	.incbin "graphics/pokemon/front_pics/nosepass_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFA1D0, 0x02CC

	.align 2
gFile_graphics_pokemon_palettes_nosepass_palette:: @ 8DFA49C
	.incbin "graphics/pokemon/palettes/nosepass_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFA49C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_nosepass_back_pic:: @ 8DFA4C4
	.incbin "graphics/pokemon/back_pics/nosepass_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFA4C4, 0x02A0

	.align 2
gFile_graphics_pokemon_palettes_nosepass_shiny_palette:: @ 8DFA764
	.incbin "graphics/pokemon/palettes/nosepass_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFA764, 0x0028

	.align 2
gFile_graphics_pokemon_icons_nosepass_icon:: @ 8DFA78C
	.incbin "graphics/pokemon/icons/nosepass_icon.4bpp"
	@ .incbin "baserom.gba", 0xDFA78C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_nosepass_footprint:: @ 8DFAB8C
	.incbin "graphics/pokemon/footprints/nosepass_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDFAB8C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_torkoal_still_front_pic:: @ 8DFABAC
	.incbin "graphics/pokemon/front_pics/torkoal_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFABAC, 0x04AC

	.align 2
gFile_graphics_pokemon_palettes_torkoal_palette:: @ 8DFB058
	.incbin "graphics/pokemon/palettes/torkoal_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFB058, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_torkoal_back_pic:: @ 8DFB080
	.incbin "graphics/pokemon/back_pics/torkoal_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFB080, 0x02C8

	.align 2
gFile_graphics_pokemon_palettes_torkoal_shiny_palette:: @ 8DFB348
	.incbin "graphics/pokemon/palettes/torkoal_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFB348, 0x0028

	.align 2
gFile_graphics_pokemon_icons_torkoal_icon:: @ 8DFB370
	.incbin "graphics/pokemon/icons/torkoal_icon.4bpp"
	@ .incbin "baserom.gba", 0xDFB370, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_torkoal_footprint:: @ 8DFB770
	.incbin "graphics/pokemon/footprints/torkoal_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDFB770, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sableye_still_front_pic:: @ 8DFB790
	.incbin "graphics/pokemon/front_pics/sableye_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFB790, 0x02D4

	.align 2
gFile_graphics_pokemon_palettes_sableye_palette:: @ 8DFBA64
	.incbin "graphics/pokemon/palettes/sableye_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFBA64, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sableye_back_pic:: @ 8DFBA8C
	.incbin "graphics/pokemon/back_pics/sableye_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFBA8C, 0x0328

	.align 2
gFile_graphics_pokemon_palettes_sableye_shiny_palette:: @ 8DFBDB4
	.incbin "graphics/pokemon/palettes/sableye_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFBDB4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sableye_icon:: @ 8DFBDDC
	.incbin "graphics/pokemon/icons/sableye_icon.4bpp"
	@ .incbin "baserom.gba", 0xDFBDDC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sableye_footprint:: @ 8DFC1DC
	.incbin "graphics/pokemon/footprints/sableye_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDFC1DC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_barboach_still_front_pic:: @ 8DFC1FC
	.incbin "graphics/pokemon/front_pics/barboach_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFC1FC, 0x0290

	.align 2
gFile_graphics_pokemon_palettes_barboach_palette:: @ 8DFC48C
	.incbin "graphics/pokemon/palettes/barboach_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFC48C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_barboach_back_pic:: @ 8DFC4B4
	.incbin "graphics/pokemon/back_pics/barboach_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFC4B4, 0x0290

	.align 2
gFile_graphics_pokemon_palettes_barboach_shiny_palette:: @ 8DFC744
	.incbin "graphics/pokemon/palettes/barboach_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFC744, 0x0028

	.align 2
gFile_graphics_pokemon_icons_barboach_icon:: @ 8DFC76C
	.incbin "graphics/pokemon/icons/barboach_icon.4bpp"
	@ .incbin "baserom.gba", 0xDFC76C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_barboach_footprint:: @ 8DFCB6C
	.incbin "graphics/pokemon/footprints/barboach_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDFCB6C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_whiscash_still_front_pic:: @ 8DFCB8C
	.incbin "graphics/pokemon/front_pics/whiscash_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFCB8C, 0x0378

	.align 2
gFile_graphics_pokemon_palettes_whiscash_palette:: @ 8DFCF04
	.incbin "graphics/pokemon/palettes/whiscash_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFCF04, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_whiscash_back_pic:: @ 8DFCF2C
	.incbin "graphics/pokemon/back_pics/whiscash_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFCF2C, 0x034C

	.align 2
gFile_graphics_pokemon_palettes_whiscash_shiny_palette:: @ 8DFD278
	.incbin "graphics/pokemon/palettes/whiscash_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFD278, 0x0028

	.align 2
gFile_graphics_pokemon_icons_whiscash_icon:: @ 8DFD2A0
	.incbin "graphics/pokemon/icons/whiscash_icon.4bpp"
	@ .incbin "baserom.gba", 0xDFD2A0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_whiscash_footprint:: @ 8DFD6A0
	.incbin "graphics/pokemon/footprints/whiscash_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDFD6A0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_luvdisc_still_front_pic:: @ 8DFD6C0
	.incbin "graphics/pokemon/front_pics/luvdisc_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFD6C0, 0x01C0

	.align 2
gFile_graphics_pokemon_palettes_luvdisc_palette:: @ 8DFD880
	.incbin "graphics/pokemon/palettes/luvdisc_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFD880, 0x0024

	.align 2
gFile_graphics_pokemon_back_pics_luvdisc_back_pic:: @ 8DFD8A4
	.incbin "graphics/pokemon/back_pics/luvdisc_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFD8A4, 0x01D4

	.align 2
gFile_graphics_pokemon_palettes_luvdisc_shiny_palette:: @ 8DFDA78
	.incbin "graphics/pokemon/palettes/luvdisc_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFDA78, 0x0024

	.align 2
gFile_graphics_pokemon_icons_luvdisc_icon:: @ 8DFDA9C
	.incbin "graphics/pokemon/icons/luvdisc_icon.4bpp"
	@ .incbin "baserom.gba", 0xDFDA9C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_luvdisc_footprint:: @ 8DFDE9C
	.incbin "graphics/pokemon/footprints/luvdisc_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDFDE9C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_corphish_still_front_pic:: @ 8DFDEBC
	.incbin "graphics/pokemon/front_pics/corphish_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFDEBC, 0x035C

	.align 2
gFile_graphics_pokemon_palettes_corphish_palette:: @ 8DFE218
	.incbin "graphics/pokemon/palettes/corphish_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFE218, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_corphish_back_pic:: @ 8DFE240
	.incbin "graphics/pokemon/back_pics/corphish_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFE240, 0x031C

	.align 2
gFile_graphics_pokemon_palettes_corphish_shiny_palette:: @ 8DFE55C
	.incbin "graphics/pokemon/palettes/corphish_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFE55C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_corphish_icon:: @ 8DFE584
	.incbin "graphics/pokemon/icons/corphish_icon.4bpp"
	@ .incbin "baserom.gba", 0xDFE584, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_corphish_footprint:: @ 8DFE984
	.incbin "graphics/pokemon/footprints/corphish_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDFE984, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_crawdaunt_still_front_pic:: @ 8DFE9A4
	.incbin "graphics/pokemon/front_pics/crawdaunt_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFE9A4, 0x0490

	.align 2
gFile_graphics_pokemon_palettes_crawdaunt_palette:: @ 8DFEE34
	.incbin "graphics/pokemon/palettes/crawdaunt_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFEE34, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_crawdaunt_back_pic:: @ 8DFEE5C
	.incbin "graphics/pokemon/back_pics/crawdaunt_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFEE5C, 0x03E4

	.align 2
gFile_graphics_pokemon_palettes_crawdaunt_shiny_palette:: @ 8DFF240
	.incbin "graphics/pokemon/palettes/crawdaunt_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFF240, 0x0028

	.align 2
gFile_graphics_pokemon_icons_crawdaunt_icon:: @ 8DFF268
	.incbin "graphics/pokemon/icons/crawdaunt_icon.4bpp"
	@ .incbin "baserom.gba", 0xDFF268, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_crawdaunt_footprint:: @ 8DFF668
	.incbin "graphics/pokemon/footprints/crawdaunt_footprint.1bpp"
	@ .incbin "baserom.gba", 0xDFF668, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_feebas_still_front_pic:: @ 8DFF688
	.incbin "graphics/pokemon/front_pics/feebas_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFF688, 0x028C

	.align 2
gFile_graphics_pokemon_palettes_feebas_palette:: @ 8DFF914
	.incbin "graphics/pokemon/palettes/feebas_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFF914, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_feebas_back_pic:: @ 8DFF93C
	.incbin "graphics/pokemon/back_pics/feebas_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xDFF93C, 0x0338

	.align 2
gFile_graphics_pokemon_palettes_feebas_shiny_palette:: @ 8DFFC74
	.incbin "graphics/pokemon/palettes/feebas_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xDFFC74, 0x0028

	.align 2
gFile_graphics_pokemon_icons_feebas_icon:: @ 8DFFC9C
	.incbin "graphics/pokemon/icons/feebas_icon.4bpp"
	@ .incbin "baserom.gba", 0xDFFC9C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_feebas_footprint:: @ 8E0009C
	.incbin "graphics/pokemon/footprints/feebas_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0009C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_milotic_still_front_pic:: @ 8E000BC
	.incbin "graphics/pokemon/front_pics/milotic_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE000BC, 0x0490

	.align 2
gFile_graphics_pokemon_palettes_milotic_palette:: @ 8E0054C
	.incbin "graphics/pokemon/palettes/milotic_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0054C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_milotic_back_pic:: @ 8E00574
	.incbin "graphics/pokemon/back_pics/milotic_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE00574, 0x02F4

	.align 2
gFile_graphics_pokemon_palettes_milotic_shiny_palette:: @ 8E00868
	.incbin "graphics/pokemon/palettes/milotic_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE00868, 0x0028

	.align 2
gFile_graphics_pokemon_icons_milotic_icon:: @ 8E00890
	.incbin "graphics/pokemon/icons/milotic_icon.4bpp"
	@ .incbin "baserom.gba", 0xE00890, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_milotic_footprint:: @ 8E00C90
	.incbin "graphics/pokemon/footprints/milotic_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE00C90, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_carvanha_still_front_pic:: @ 8E00CB0
	.incbin "graphics/pokemon/front_pics/carvanha_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE00CB0, 0x032C

	.align 2
gFile_graphics_pokemon_palettes_carvanha_palette:: @ 8E00FDC
	.incbin "graphics/pokemon/palettes/carvanha_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE00FDC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_carvanha_back_pic:: @ 8E01004
	.incbin "graphics/pokemon/back_pics/carvanha_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE01004, 0x0310

	.align 2
gFile_graphics_pokemon_palettes_carvanha_shiny_palette:: @ 8E01314
	.incbin "graphics/pokemon/palettes/carvanha_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE01314, 0x0028

	.align 2
gFile_graphics_pokemon_icons_carvanha_icon:: @ 8E0133C
	.incbin "graphics/pokemon/icons/carvanha_icon.4bpp"
	@ .incbin "baserom.gba", 0xE0133C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_carvanha_footprint:: @ 8E0173C
	.incbin "graphics/pokemon/footprints/carvanha_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0173C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sharpedo_still_front_pic:: @ 8E0175C
	.incbin "graphics/pokemon/front_pics/sharpedo_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0175C, 0x0390

	.align 2
gFile_graphics_pokemon_palettes_sharpedo_palette:: @ 8E01AEC
	.incbin "graphics/pokemon/palettes/sharpedo_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE01AEC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sharpedo_back_pic:: @ 8E01B14
	.incbin "graphics/pokemon/back_pics/sharpedo_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE01B14, 0x0358

	.align 2
gFile_graphics_pokemon_palettes_sharpedo_shiny_palette:: @ 8E01E6C
	.incbin "graphics/pokemon/palettes/sharpedo_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE01E6C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sharpedo_icon:: @ 8E01E94
	.incbin "graphics/pokemon/icons/sharpedo_icon.4bpp"
	@ .incbin "baserom.gba", 0xE01E94, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sharpedo_footprint:: @ 8E02294
	.incbin "graphics/pokemon/footprints/sharpedo_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE02294, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_trapinch_still_front_pic:: @ 8E022B4
	.incbin "graphics/pokemon/front_pics/trapinch_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE022B4, 0x021C

	.align 2
gFile_graphics_pokemon_palettes_trapinch_palette:: @ 8E024D0
	.incbin "graphics/pokemon/palettes/trapinch_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE024D0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_trapinch_back_pic:: @ 8E024F8
	.incbin "graphics/pokemon/back_pics/trapinch_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE024F8, 0x0220

	.align 2
gFile_graphics_pokemon_palettes_trapinch_shiny_palette:: @ 8E02718
	.incbin "graphics/pokemon/palettes/trapinch_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE02718, 0x0028

	.align 2
gFile_graphics_pokemon_icons_trapinch_icon:: @ 8E02740
	.incbin "graphics/pokemon/icons/trapinch_icon.4bpp"
	@ .incbin "baserom.gba", 0xE02740, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_trapinch_footprint:: @ 8E02B40
	.incbin "graphics/pokemon/footprints/trapinch_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE02B40, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_vibrava_still_front_pic:: @ 8E02B60
	.incbin "graphics/pokemon/front_pics/vibrava_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE02B60, 0x0370

	.align 2
gFile_graphics_pokemon_palettes_vibrava_palette:: @ 8E02ED0
	.incbin "graphics/pokemon/palettes/vibrava_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE02ED0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_vibrava_back_pic:: @ 8E02EF8
	.incbin "graphics/pokemon/back_pics/vibrava_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE02EF8, 0x0278

	.align 2
gFile_graphics_pokemon_palettes_vibrava_shiny_palette:: @ 8E03170
	.incbin "graphics/pokemon/palettes/vibrava_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE03170, 0x0028

	.align 2
gFile_graphics_pokemon_icons_vibrava_icon:: @ 8E03198
	.incbin "graphics/pokemon/icons/vibrava_icon.4bpp"
	@ .incbin "baserom.gba", 0xE03198, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_vibrava_footprint:: @ 8E03598
	.incbin "graphics/pokemon/footprints/vibrava_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE03598, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_flygon_still_front_pic:: @ 8E035B8
	.incbin "graphics/pokemon/front_pics/flygon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE035B8, 0x04F0

	.align 2
gFile_graphics_pokemon_palettes_flygon_palette:: @ 8E03AA8
	.incbin "graphics/pokemon/palettes/flygon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE03AA8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_flygon_back_pic:: @ 8E03AD0
	.incbin "graphics/pokemon/back_pics/flygon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE03AD0, 0x043C

	.align 2
gFile_graphics_pokemon_palettes_flygon_shiny_palette:: @ 8E03F0C
	.incbin "graphics/pokemon/palettes/flygon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE03F0C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_flygon_icon:: @ 8E03F34
	.incbin "graphics/pokemon/icons/flygon_icon.4bpp"
	@ .incbin "baserom.gba", 0xE03F34, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_flygon_footprint:: @ 8E04334
	.incbin "graphics/pokemon/footprints/flygon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE04334, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_makuhita_still_front_pic:: @ 8E04354
	.incbin "graphics/pokemon/front_pics/makuhita_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE04354, 0x0318

	.align 2
gFile_graphics_pokemon_palettes_makuhita_palette:: @ 8E0466C
	.incbin "graphics/pokemon/palettes/makuhita_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0466C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_makuhita_back_pic:: @ 8E04694
	.incbin "graphics/pokemon/back_pics/makuhita_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE04694, 0x02F0

	.align 2
gFile_graphics_pokemon_palettes_makuhita_shiny_palette:: @ 8E04984
	.incbin "graphics/pokemon/palettes/makuhita_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE04984, 0x0024

	.align 2
gFile_graphics_pokemon_icons_makuhita_icon:: @ 8E049A8
	.incbin "graphics/pokemon/icons/makuhita_icon.4bpp"
	@ .incbin "baserom.gba", 0xE049A8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_makuhita_footprint:: @ 8E04DA8
	.incbin "graphics/pokemon/footprints/makuhita_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE04DA8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_hariyama_still_front_pic:: @ 8E04DC8
	.incbin "graphics/pokemon/front_pics/hariyama_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE04DC8, 0x04B0

	.align 2
gFile_graphics_pokemon_palettes_hariyama_palette:: @ 8E05278
	.incbin "graphics/pokemon/palettes/hariyama_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE05278, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_hariyama_back_pic:: @ 8E052A0
	.incbin "graphics/pokemon/back_pics/hariyama_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE052A0, 0x03E0

	.align 2
gFile_graphics_pokemon_palettes_hariyama_shiny_palette:: @ 8E05680
	.incbin "graphics/pokemon/palettes/hariyama_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE05680, 0x0028

	.align 2
gFile_graphics_pokemon_icons_hariyama_icon:: @ 8E056A8
	.incbin "graphics/pokemon/icons/hariyama_icon.4bpp"
	@ .incbin "baserom.gba", 0xE056A8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_hariyama_footprint:: @ 8E05AA8
	.incbin "graphics/pokemon/footprints/hariyama_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE05AA8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_electrike_still_front_pic:: @ 8E05AC8
	.incbin "graphics/pokemon/front_pics/electrike_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE05AC8, 0x0290

	.align 2
gFile_graphics_pokemon_palettes_electrike_palette:: @ 8E05D58
	.incbin "graphics/pokemon/palettes/electrike_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE05D58, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_electrike_back_pic:: @ 8E05D80
	.incbin "graphics/pokemon/back_pics/electrike_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE05D80, 0x028C

	.align 2
gFile_graphics_pokemon_palettes_electrike_shiny_palette:: @ 8E0600C
	.incbin "graphics/pokemon/palettes/electrike_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0600C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_electrike_icon:: @ 8E06034
	.incbin "graphics/pokemon/icons/electrike_icon.4bpp"
	@ .incbin "baserom.gba", 0xE06034, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_electrike_footprint:: @ 8E06434
	.incbin "graphics/pokemon/footprints/electrike_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE06434, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_manectric_still_front_pic:: @ 8E06454
	.incbin "graphics/pokemon/front_pics/manectric_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE06454, 0x0330

	.align 2
gFile_graphics_pokemon_palettes_manectric_palette:: @ 8E06784
	.incbin "graphics/pokemon/palettes/manectric_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE06784, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_manectric_back_pic:: @ 8E067AC
	.incbin "graphics/pokemon/back_pics/manectric_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE067AC, 0x022C

	.align 2
gFile_graphics_pokemon_palettes_manectric_shiny_palette:: @ 8E069D8
	.incbin "graphics/pokemon/palettes/manectric_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE069D8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_manectric_icon:: @ 8E06A00
	.incbin "graphics/pokemon/icons/manectric_icon.4bpp"
	@ .incbin "baserom.gba", 0xE06A00, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_manectric_footprint:: @ 8E06E00
	.incbin "graphics/pokemon/footprints/manectric_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE06E00, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_numel_still_front_pic:: @ 8E06E20
	.incbin "graphics/pokemon/front_pics/numel_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE06E20, 0x02D0

	.align 2
gFile_graphics_pokemon_palettes_numel_palette:: @ 8E070F0
	.incbin "graphics/pokemon/palettes/numel_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE070F0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_numel_back_pic:: @ 8E07118
	.incbin "graphics/pokemon/back_pics/numel_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE07118, 0x02BC

	.align 2
gFile_graphics_pokemon_palettes_numel_shiny_palette:: @ 8E073D4
	.incbin "graphics/pokemon/palettes/numel_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE073D4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_numel_icon:: @ 8E073FC
	.incbin "graphics/pokemon/icons/numel_icon.4bpp"
	@ .incbin "baserom.gba", 0xE073FC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_numel_footprint:: @ 8E077FC
	.incbin "graphics/pokemon/footprints/numel_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE077FC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_camerupt_still_front_pic:: @ 8E0781C
	.incbin "graphics/pokemon/front_pics/camerupt_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0781C, 0x0418

	.align 2
gFile_graphics_pokemon_palettes_camerupt_palette:: @ 8E07C34
	.incbin "graphics/pokemon/palettes/camerupt_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE07C34, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_camerupt_back_pic:: @ 8E07C5C
	.incbin "graphics/pokemon/back_pics/camerupt_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE07C5C, 0x02C4

	.align 2
gFile_graphics_pokemon_palettes_camerupt_shiny_palette:: @ 8E07F20
	.incbin "graphics/pokemon/palettes/camerupt_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE07F20, 0x0028

	.align 2
gFile_graphics_pokemon_icons_camerupt_icon:: @ 8E07F48
	.incbin "graphics/pokemon/icons/camerupt_icon.4bpp"
	@ .incbin "baserom.gba", 0xE07F48, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_camerupt_footprint:: @ 8E08348
	.incbin "graphics/pokemon/footprints/camerupt_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE08348, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_spheal_still_front_pic:: @ 8E08368
	.incbin "graphics/pokemon/front_pics/spheal_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE08368, 0x0274

	.align 2
gFile_graphics_pokemon_palettes_spheal_palette:: @ 8E085DC
	.incbin "graphics/pokemon/palettes/spheal_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE085DC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_spheal_back_pic:: @ 8E08604
	.incbin "graphics/pokemon/back_pics/spheal_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE08604, 0x01FC

	.align 2
gFile_graphics_pokemon_palettes_spheal_shiny_palette:: @ 8E08800
	.incbin "graphics/pokemon/palettes/spheal_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE08800, 0x0028

	.align 2
gFile_graphics_pokemon_icons_spheal_icon:: @ 8E08828
	.incbin "graphics/pokemon/icons/spheal_icon.4bpp"
	@ .incbin "baserom.gba", 0xE08828, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_spheal_footprint:: @ 8E08C28
	.incbin "graphics/pokemon/footprints/spheal_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE08C28, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_sealeo_still_front_pic:: @ 8E08C48
	.incbin "graphics/pokemon/front_pics/sealeo_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE08C48, 0x0380

	.align 2
gFile_graphics_pokemon_palettes_sealeo_palette:: @ 8E08FC8
	.incbin "graphics/pokemon/palettes/sealeo_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE08FC8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_sealeo_back_pic:: @ 8E08FF0
	.incbin "graphics/pokemon/back_pics/sealeo_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE08FF0, 0x027C

	.align 2
gFile_graphics_pokemon_palettes_sealeo_shiny_palette:: @ 8E0926C
	.incbin "graphics/pokemon/palettes/sealeo_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0926C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_sealeo_icon:: @ 8E09294
	.incbin "graphics/pokemon/icons/sealeo_icon.4bpp"
	@ .incbin "baserom.gba", 0xE09294, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_sealeo_footprint:: @ 8E09694
	.incbin "graphics/pokemon/footprints/sealeo_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE09694, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_walrein_still_front_pic:: @ 8E096B4
	.incbin "graphics/pokemon/front_pics/walrein_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE096B4, 0x04A0

	.align 2
gFile_graphics_pokemon_palettes_walrein_palette:: @ 8E09B54
	.incbin "graphics/pokemon/palettes/walrein_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE09B54, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_walrein_back_pic:: @ 8E09B7C
	.incbin "graphics/pokemon/back_pics/walrein_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE09B7C, 0x0388

	.align 2
gFile_graphics_pokemon_palettes_walrein_shiny_palette:: @ 8E09F04
	.incbin "graphics/pokemon/palettes/walrein_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE09F04, 0x0028

	.align 2
gFile_graphics_pokemon_icons_walrein_icon:: @ 8E09F2C
	.incbin "graphics/pokemon/icons/walrein_icon.4bpp"
	@ .incbin "baserom.gba", 0xE09F2C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_walrein_footprint:: @ 8E0A32C
	.incbin "graphics/pokemon/footprints/walrein_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0A32C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_cacnea_still_front_pic:: @ 8E0A34C
	.incbin "graphics/pokemon/front_pics/cacnea_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0A34C, 0x0310

	.align 2
gFile_graphics_pokemon_palettes_cacnea_palette:: @ 8E0A65C
	.incbin "graphics/pokemon/palettes/cacnea_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0A65C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_cacnea_back_pic:: @ 8E0A684
	.incbin "graphics/pokemon/back_pics/cacnea_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0A684, 0x0360

	.align 2
gFile_graphics_pokemon_palettes_cacnea_shiny_palette:: @ 8E0A9E4
	.incbin "graphics/pokemon/palettes/cacnea_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0A9E4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_cacnea_icon:: @ 8E0AA0C
	.incbin "graphics/pokemon/icons/cacnea_icon.4bpp"
	@ .incbin "baserom.gba", 0xE0AA0C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_cacnea_footprint:: @ 8E0AE0C
	.incbin "graphics/pokemon/footprints/cacnea_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0AE0C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_cacturne_still_front_pic:: @ 8E0AE2C
	.incbin "graphics/pokemon/front_pics/cacturne_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0AE2C, 0x0438

	.align 2
gFile_graphics_pokemon_palettes_cacturne_palette:: @ 8E0B264
	.incbin "graphics/pokemon/palettes/cacturne_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0B264, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_cacturne_back_pic:: @ 8E0B28C
	.incbin "graphics/pokemon/back_pics/cacturne_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0B28C, 0x0300

	.align 2
gFile_graphics_pokemon_palettes_cacturne_shiny_palette:: @ 8E0B58C
	.incbin "graphics/pokemon/palettes/cacturne_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0B58C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_cacturne_icon:: @ 8E0B5B4
	.incbin "graphics/pokemon/icons/cacturne_icon.4bpp"
	@ .incbin "baserom.gba", 0xE0B5B4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_cacturne_footprint:: @ 8E0B9B4
	.incbin "graphics/pokemon/footprints/cacturne_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0B9B4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_snorunt_still_front_pic:: @ 8E0B9D4
	.incbin "graphics/pokemon/front_pics/snorunt_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0B9D4, 0x02C4

	.align 2
gFile_graphics_pokemon_palettes_snorunt_palette:: @ 8E0BC98
	.incbin "graphics/pokemon/palettes/snorunt_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0BC98, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_snorunt_back_pic:: @ 8E0BCC0
	.incbin "graphics/pokemon/back_pics/snorunt_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0BCC0, 0x02E4

	.align 2
gFile_graphics_pokemon_palettes_snorunt_shiny_palette:: @ 8E0BFA4
	.incbin "graphics/pokemon/palettes/snorunt_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0BFA4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_snorunt_icon:: @ 8E0BFCC
	.incbin "graphics/pokemon/icons/snorunt_icon.4bpp"
	@ .incbin "baserom.gba", 0xE0BFCC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_snorunt_footprint:: @ 8E0C3CC
	.incbin "graphics/pokemon/footprints/snorunt_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0C3CC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_glalie_still_front_pic:: @ 8E0C3EC
	.incbin "graphics/pokemon/front_pics/glalie_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0C3EC, 0x03C8

	.align 2
gFile_graphics_pokemon_palettes_glalie_palette:: @ 8E0C7B4
	.incbin "graphics/pokemon/palettes/glalie_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0C7B4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_glalie_back_pic:: @ 8E0C7DC
	.incbin "graphics/pokemon/back_pics/glalie_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0C7DC, 0x03B0

	.align 2
gFile_graphics_pokemon_palettes_glalie_shiny_palette:: @ 8E0CB8C
	.incbin "graphics/pokemon/palettes/glalie_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0CB8C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_glalie_icon:: @ 8E0CBB4
	.incbin "graphics/pokemon/icons/glalie_icon.4bpp"
	@ .incbin "baserom.gba", 0xE0CBB4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_glalie_footprint:: @ 8E0CFB4
	.incbin "graphics/pokemon/footprints/glalie_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0CFB4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_lunatone_still_front_pic:: @ 8E0CFD4
	.incbin "graphics/pokemon/front_pics/lunatone_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0CFD4, 0x0328

	.align 2
gFile_graphics_pokemon_palettes_lunatone_palette:: @ 8E0D2FC
	.incbin "graphics/pokemon/palettes/lunatone_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0D2FC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_lunatone_back_pic:: @ 8E0D324
	.incbin "graphics/pokemon/back_pics/lunatone_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0D324, 0x0358

	.align 2
gFile_graphics_pokemon_palettes_lunatone_shiny_palette:: @ 8E0D67C
	.incbin "graphics/pokemon/palettes/lunatone_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0D67C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_lunatone_icon:: @ 8E0D6A4
	.incbin "graphics/pokemon/icons/lunatone_icon.4bpp"
	@ .incbin "baserom.gba", 0xE0D6A4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_lunatone_footprint:: @ 8E0DAA4
	.incbin "graphics/pokemon/footprints/lunatone_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0DAA4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_solrock_still_front_pic:: @ 8E0DAC4
	.incbin "graphics/pokemon/front_pics/solrock_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0DAC4, 0x044C

	.align 2
gFile_graphics_pokemon_palettes_solrock_palette:: @ 8E0DF10
	.incbin "graphics/pokemon/palettes/solrock_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0DF10, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_solrock_back_pic:: @ 8E0DF38
	.incbin "graphics/pokemon/back_pics/solrock_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0DF38, 0x03EC

	.align 2
gFile_graphics_pokemon_palettes_solrock_shiny_palette:: @ 8E0E324
	.incbin "graphics/pokemon/palettes/solrock_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0E324, 0x0028

	.align 2
gFile_graphics_pokemon_icons_solrock_icon:: @ 8E0E34C
	.incbin "graphics/pokemon/icons/solrock_icon.4bpp"
	@ .incbin "baserom.gba", 0xE0E34C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_solrock_footprint:: @ 8E0E74C
	.incbin "graphics/pokemon/footprints/solrock_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0E74C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_azurill_still_front_pic:: @ 8E0E76C
	.incbin "graphics/pokemon/front_pics/azurill_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0E76C, 0x02C8

	.align 2
gFile_graphics_pokemon_palettes_azurill_palette:: @ 8E0EA34
	.incbin "graphics/pokemon/palettes/azurill_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0EA34, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_azurill_back_pic:: @ 8E0EA5C
	.incbin "graphics/pokemon/back_pics/azurill_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0EA5C, 0x0318

	.align 2
gFile_graphics_pokemon_palettes_azurill_shiny_palette:: @ 8E0ED74
	.incbin "graphics/pokemon/palettes/azurill_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0ED74, 0x0028

	.align 2
gFile_graphics_pokemon_icons_azurill_icon:: @ 8E0ED9C
	.incbin "graphics/pokemon/icons/azurill_icon.4bpp"
	@ .incbin "baserom.gba", 0xE0ED9C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_azurill_footprint:: @ 8E0F19C
	.incbin "graphics/pokemon/footprints/azurill_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0F19C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_spoink_still_front_pic:: @ 8E0F1BC
	.incbin "graphics/pokemon/front_pics/spoink_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0F1BC, 0x026C

	.align 2
gFile_graphics_pokemon_palettes_spoink_palette:: @ 8E0F428
	.incbin "graphics/pokemon/palettes/spoink_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0F428, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_spoink_back_pic:: @ 8E0F450
	.incbin "graphics/pokemon/back_pics/spoink_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0F450, 0x0240

	.align 2
gFile_graphics_pokemon_palettes_spoink_shiny_palette:: @ 8E0F690
	.incbin "graphics/pokemon/palettes/spoink_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0F690, 0x0028

	.align 2
gFile_graphics_pokemon_icons_spoink_icon:: @ 8E0F6B8
	.incbin "graphics/pokemon/icons/spoink_icon.4bpp"
	@ .incbin "baserom.gba", 0xE0F6B8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_spoink_footprint:: @ 8E0FAB8
	.incbin "graphics/pokemon/footprints/spoink_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE0FAB8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_grumpig_still_front_pic:: @ 8E0FAD8
	.incbin "graphics/pokemon/front_pics/grumpig_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0FAD8, 0x03BC

	.align 2
gFile_graphics_pokemon_palettes_grumpig_palette:: @ 8E0FE94
	.incbin "graphics/pokemon/palettes/grumpig_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE0FE94, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_grumpig_back_pic:: @ 8E0FEBC
	.incbin "graphics/pokemon/back_pics/grumpig_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE0FEBC, 0x0360

	.align 2
gFile_graphics_pokemon_palettes_grumpig_shiny_palette:: @ 8E1021C
	.incbin "graphics/pokemon/palettes/grumpig_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1021C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_grumpig_icon:: @ 8E10244
	.incbin "graphics/pokemon/icons/grumpig_icon.4bpp"
	@ .incbin "baserom.gba", 0xE10244, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_grumpig_footprint:: @ 8E10644
	.incbin "graphics/pokemon/footprints/grumpig_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE10644, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_plusle_still_front_pic:: @ 8E10664
	.incbin "graphics/pokemon/front_pics/plusle_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE10664, 0x028C

	.align 2
gFile_graphics_pokemon_palettes_plusle_palette:: @ 8E108F0
	.incbin "graphics/pokemon/palettes/plusle_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE108F0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_plusle_back_pic:: @ 8E10918
	.incbin "graphics/pokemon/back_pics/plusle_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE10918, 0x02B8

	.align 2
gFile_graphics_pokemon_palettes_plusle_shiny_palette:: @ 8E10BD0
	.incbin "graphics/pokemon/palettes/plusle_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE10BD0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_plusle_icon:: @ 8E10BF8
	.incbin "graphics/pokemon/icons/plusle_icon.4bpp"
	@ .incbin "baserom.gba", 0xE10BF8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_plusle_footprint:: @ 8E10FF8
	.incbin "graphics/pokemon/footprints/plusle_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE10FF8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_minun_still_front_pic:: @ 8E11018
	.incbin "graphics/pokemon/front_pics/minun_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE11018, 0x0268

	.align 2
gFile_graphics_pokemon_palettes_minun_palette:: @ 8E11280
	.incbin "graphics/pokemon/palettes/minun_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE11280, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_minun_back_pic:: @ 8E112A8
	.incbin "graphics/pokemon/back_pics/minun_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE112A8, 0x02C8

	.align 2
gFile_graphics_pokemon_palettes_minun_shiny_palette:: @ 8E11570
	.incbin "graphics/pokemon/palettes/minun_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE11570, 0x0028

	.align 2
gFile_graphics_pokemon_icons_minun_icon:: @ 8E11598
	.incbin "graphics/pokemon/icons/minun_icon.4bpp"
	@ .incbin "baserom.gba", 0xE11598, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_minun_footprint:: @ 8E11998
	.incbin "graphics/pokemon/footprints/minun_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE11998, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_mawile_still_front_pic:: @ 8E119B8
	.incbin "graphics/pokemon/front_pics/mawile_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE119B8, 0x03BC

	.align 2
gFile_graphics_pokemon_palettes_mawile_palette:: @ 8E11D74
	.incbin "graphics/pokemon/palettes/mawile_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE11D74, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_mawile_back_pic:: @ 8E11D9C
	.incbin "graphics/pokemon/back_pics/mawile_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE11D9C, 0x0400

	.align 2
gFile_graphics_pokemon_palettes_mawile_shiny_palette:: @ 8E1219C
	.incbin "graphics/pokemon/palettes/mawile_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1219C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_mawile_icon:: @ 8E121C4
	.incbin "graphics/pokemon/icons/mawile_icon.4bpp"
	@ .incbin "baserom.gba", 0xE121C4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_mawile_footprint:: @ 8E125C4
	.incbin "graphics/pokemon/footprints/mawile_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE125C4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_meditite_still_front_pic:: @ 8E125E4
	.incbin "graphics/pokemon/front_pics/meditite_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE125E4, 0x02B8

	.align 2
gFile_graphics_pokemon_palettes_meditite_palette:: @ 8E1289C
	.incbin "graphics/pokemon/palettes/meditite_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1289C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_meditite_back_pic:: @ 8E128C4
	.incbin "graphics/pokemon/back_pics/meditite_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE128C4, 0x02C8

	.align 2
gFile_graphics_pokemon_palettes_meditite_shiny_palette:: @ 8E12B8C
	.incbin "graphics/pokemon/palettes/meditite_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE12B8C, 0x0024

	.align 2
gFile_graphics_pokemon_icons_meditite_icon:: @ 8E12BB0
	.incbin "graphics/pokemon/icons/meditite_icon.4bpp"
	@ .incbin "baserom.gba", 0xE12BB0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_meditite_footprint:: @ 8E12FB0
	.incbin "graphics/pokemon/footprints/meditite_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE12FB0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_medicham_still_front_pic:: @ 8E12FD0
	.incbin "graphics/pokemon/front_pics/medicham_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE12FD0, 0x0330

	.align 2
gFile_graphics_pokemon_palettes_medicham_palette:: @ 8E13300
	.incbin "graphics/pokemon/palettes/medicham_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE13300, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_medicham_back_pic:: @ 8E13328
	.incbin "graphics/pokemon/back_pics/medicham_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE13328, 0x0338

	.align 2
gFile_graphics_pokemon_palettes_medicham_shiny_palette:: @ 8E13660
	.incbin "graphics/pokemon/palettes/medicham_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE13660, 0x0028

	.align 2
gFile_graphics_pokemon_icons_medicham_icon:: @ 8E13688
	.incbin "graphics/pokemon/icons/medicham_icon.4bpp"
	@ .incbin "baserom.gba", 0xE13688, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_medicham_footprint:: @ 8E13A88
	.incbin "graphics/pokemon/footprints/medicham_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE13A88, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_swablu_still_front_pic:: @ 8E13AA8
	.incbin "graphics/pokemon/front_pics/swablu_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE13AA8, 0x02D8

	.align 2
gFile_graphics_pokemon_palettes_swablu_palette:: @ 8E13D80
	.incbin "graphics/pokemon/palettes/swablu_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE13D80, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_swablu_back_pic:: @ 8E13DA8
	.incbin "graphics/pokemon/back_pics/swablu_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE13DA8, 0x03B8

	.align 2
gFile_graphics_pokemon_palettes_swablu_shiny_palette:: @ 8E14160
	.incbin "graphics/pokemon/palettes/swablu_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE14160, 0x0028

	.align 2
gFile_graphics_pokemon_icons_swablu_icon:: @ 8E14188
	.incbin "graphics/pokemon/icons/swablu_icon.4bpp"
	@ .incbin "baserom.gba", 0xE14188, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_swablu_footprint:: @ 8E14588
	.incbin "graphics/pokemon/footprints/swablu_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE14588, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_altaria_still_front_pic:: @ 8E145A8
	.incbin "graphics/pokemon/front_pics/altaria_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE145A8, 0x03DC

	.align 2
gFile_graphics_pokemon_palettes_altaria_palette:: @ 8E14984
	.incbin "graphics/pokemon/palettes/altaria_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE14984, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_altaria_back_pic:: @ 8E149AC
	.incbin "graphics/pokemon/back_pics/altaria_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE149AC, 0x0378

	.align 2
gFile_graphics_pokemon_palettes_altaria_shiny_palette:: @ 8E14D24
	.incbin "graphics/pokemon/palettes/altaria_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE14D24, 0x0028

	.align 2
gFile_graphics_pokemon_icons_altaria_icon:: @ 8E14D4C
	.incbin "graphics/pokemon/icons/altaria_icon.4bpp"
	@ .incbin "baserom.gba", 0xE14D4C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_altaria_footprint:: @ 8E1514C
	.incbin "graphics/pokemon/footprints/altaria_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE1514C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_wynaut_still_front_pic:: @ 8E1516C
	.incbin "graphics/pokemon/front_pics/wynaut_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1516C, 0x0298

	.align 2
gFile_graphics_pokemon_palettes_wynaut_palette:: @ 8E15404
	.incbin "graphics/pokemon/palettes/wynaut_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE15404, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_wynaut_back_pic:: @ 8E1542C
	.incbin "graphics/pokemon/back_pics/wynaut_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1542C, 0x0290

	.align 2
gFile_graphics_pokemon_palettes_wynaut_shiny_palette:: @ 8E156BC
	.incbin "graphics/pokemon/palettes/wynaut_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE156BC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_wynaut_icon:: @ 8E156E4
	.incbin "graphics/pokemon/icons/wynaut_icon.4bpp"
	@ .incbin "baserom.gba", 0xE156E4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_wynaut_footprint:: @ 8E15AE4
	.incbin "graphics/pokemon/footprints/wynaut_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE15AE4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_duskull_still_front_pic:: @ 8E15B04
	.incbin "graphics/pokemon/front_pics/duskull_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE15B04, 0x02F0

	.align 2
gFile_graphics_pokemon_palettes_duskull_palette:: @ 8E15DF4
	.incbin "graphics/pokemon/palettes/duskull_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE15DF4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_duskull_back_pic:: @ 8E15E1C
	.incbin "graphics/pokemon/back_pics/duskull_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE15E1C, 0x02B0

	.align 2
gFile_graphics_pokemon_palettes_duskull_shiny_palette:: @ 8E160CC
	.incbin "graphics/pokemon/palettes/duskull_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE160CC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_duskull_icon:: @ 8E160F4
	.incbin "graphics/pokemon/icons/duskull_icon.4bpp"
	@ .incbin "baserom.gba", 0xE160F4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_duskull_footprint:: @ 8E164F4
	.incbin "graphics/pokemon/footprints/duskull_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE164F4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_dusclops_still_front_pic:: @ 8E16514
	.incbin "graphics/pokemon/front_pics/dusclops_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE16514, 0x03A0

	.align 2
gFile_graphics_pokemon_palettes_dusclops_palette:: @ 8E168B4
	.incbin "graphics/pokemon/palettes/dusclops_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE168B4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_dusclops_back_pic:: @ 8E168DC
	.incbin "graphics/pokemon/back_pics/dusclops_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE168DC, 0x02EC

	.align 2
gFile_graphics_pokemon_palettes_dusclops_shiny_palette:: @ 8E16BC8
	.incbin "graphics/pokemon/palettes/dusclops_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE16BC8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_dusclops_icon:: @ 8E16BF0
	.incbin "graphics/pokemon/icons/dusclops_icon.4bpp"
	@ .incbin "baserom.gba", 0xE16BF0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_dusclops_footprint:: @ 8E16FF0
	.incbin "graphics/pokemon/footprints/dusclops_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE16FF0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_roselia_still_front_pic:: @ 8E17010
	.incbin "graphics/pokemon/front_pics/roselia_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE17010, 0x036C

	.align 2
gFile_graphics_pokemon_palettes_roselia_palette:: @ 8E1737C
	.incbin "graphics/pokemon/palettes/roselia_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1737C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_roselia_back_pic:: @ 8E173A4
	.incbin "graphics/pokemon/back_pics/roselia_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE173A4, 0x03C8

	.align 2
gFile_graphics_pokemon_palettes_roselia_shiny_palette:: @ 8E1776C
	.incbin "graphics/pokemon/palettes/roselia_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1776C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_roselia_icon:: @ 8E17794
	.incbin "graphics/pokemon/icons/roselia_icon.4bpp"
	@ .incbin "baserom.gba", 0xE17794, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_roselia_footprint:: @ 8E17B94
	.incbin "graphics/pokemon/footprints/roselia_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE17B94, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_slakoth_still_front_pic:: @ 8E17BB4
	.incbin "graphics/pokemon/front_pics/slakoth_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE17BB4, 0x02E8

	.align 2
gFile_graphics_pokemon_palettes_slakoth_palette:: @ 8E17E9C
	.incbin "graphics/pokemon/palettes/slakoth_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE17E9C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_slakoth_back_pic:: @ 8E17EC4
	.incbin "graphics/pokemon/back_pics/slakoth_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE17EC4, 0x02E8

	.align 2
gFile_graphics_pokemon_palettes_slakoth_shiny_palette:: @ 8E181AC
	.incbin "graphics/pokemon/palettes/slakoth_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE181AC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_slakoth_icon:: @ 8E181D4
	.incbin "graphics/pokemon/icons/slakoth_icon.4bpp"
	@ .incbin "baserom.gba", 0xE181D4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_slakoth_footprint:: @ 8E185D4
	.incbin "graphics/pokemon/footprints/slakoth_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE185D4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_vigoroth_still_front_pic:: @ 8E185F4
	.incbin "graphics/pokemon/front_pics/vigoroth_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE185F4, 0x03FC

	.align 2
gFile_graphics_pokemon_palettes_vigoroth_palette:: @ 8E189F0
	.incbin "graphics/pokemon/palettes/vigoroth_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE189F0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_vigoroth_back_pic:: @ 8E18A18
	.incbin "graphics/pokemon/back_pics/vigoroth_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE18A18, 0x02C8

	.align 2
gFile_graphics_pokemon_palettes_vigoroth_shiny_palette:: @ 8E18CE0
	.incbin "graphics/pokemon/palettes/vigoroth_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE18CE0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_vigoroth_icon:: @ 8E18D08
	.incbin "graphics/pokemon/icons/vigoroth_icon.4bpp"
	@ .incbin "baserom.gba", 0xE18D08, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_vigoroth_footprint:: @ 8E19108
	.incbin "graphics/pokemon/footprints/vigoroth_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE19108, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_slaking_still_front_pic:: @ 8E19128
	.incbin "graphics/pokemon/front_pics/slaking_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE19128, 0x04D4

	.align 2
gFile_graphics_pokemon_palettes_slaking_palette:: @ 8E195FC
	.incbin "graphics/pokemon/palettes/slaking_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE195FC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_slaking_back_pic:: @ 8E19624
	.incbin "graphics/pokemon/back_pics/slaking_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE19624, 0x03C4

	.align 2
gFile_graphics_pokemon_palettes_slaking_shiny_palette:: @ 8E199E8
	.incbin "graphics/pokemon/palettes/slaking_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE199E8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_slaking_icon:: @ 8E19A10
	.incbin "graphics/pokemon/icons/slaking_icon.4bpp"
	@ .incbin "baserom.gba", 0xE19A10, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_slaking_footprint:: @ 8E19E10
	.incbin "graphics/pokemon/footprints/slaking_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE19E10, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_gulpin_still_front_pic:: @ 8E19E30
	.incbin "graphics/pokemon/front_pics/gulpin_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE19E30, 0x0218

	.align 2
gFile_graphics_pokemon_palettes_gulpin_palette:: @ 8E1A048
	.incbin "graphics/pokemon/palettes/gulpin_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1A048, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_gulpin_back_pic:: @ 8E1A070
	.incbin "graphics/pokemon/back_pics/gulpin_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1A070, 0x0284

	.align 2
gFile_graphics_pokemon_palettes_gulpin_shiny_palette:: @ 8E1A2F4
	.incbin "graphics/pokemon/palettes/gulpin_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1A2F4, 0x0028

	.align 2
gFile_graphics_pokemon_icons_gulpin_icon:: @ 8E1A31C
	.incbin "graphics/pokemon/icons/gulpin_icon.4bpp"
	@ .incbin "baserom.gba", 0xE1A31C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_gulpin_footprint:: @ 8E1A71C
	.incbin "graphics/pokemon/footprints/gulpin_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE1A71C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_swalot_still_front_pic:: @ 8E1A73C
	.incbin "graphics/pokemon/front_pics/swalot_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1A73C, 0x0344

	.align 2
gFile_graphics_pokemon_palettes_swalot_palette:: @ 8E1AA80
	.incbin "graphics/pokemon/palettes/swalot_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1AA80, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_swalot_back_pic:: @ 8E1AAA8
	.incbin "graphics/pokemon/back_pics/swalot_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1AAA8, 0x0348

	.align 2
gFile_graphics_pokemon_palettes_swalot_shiny_palette:: @ 8E1ADF0
	.incbin "graphics/pokemon/palettes/swalot_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1ADF0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_swalot_icon:: @ 8E1AE18
	.incbin "graphics/pokemon/icons/swalot_icon.4bpp"
	@ .incbin "baserom.gba", 0xE1AE18, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_swalot_footprint:: @ 8E1B218
	.incbin "graphics/pokemon/footprints/swalot_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE1B218, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_tropius_still_front_pic:: @ 8E1B238
	.incbin "graphics/pokemon/front_pics/tropius_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1B238, 0x0578

	.align 2
gFile_graphics_pokemon_palettes_tropius_palette:: @ 8E1B7B0
	.incbin "graphics/pokemon/palettes/tropius_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1B7B0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_tropius_back_pic:: @ 8E1B7D8
	.incbin "graphics/pokemon/back_pics/tropius_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1B7D8, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_tropius_shiny_palette:: @ 8E1BAFC
	.incbin "graphics/pokemon/palettes/tropius_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1BAFC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_tropius_icon:: @ 8E1BB24
	.incbin "graphics/pokemon/icons/tropius_icon.4bpp"
	@ .incbin "baserom.gba", 0xE1BB24, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_tropius_footprint:: @ 8E1BF24
	.incbin "graphics/pokemon/footprints/tropius_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE1BF24, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_whismur_still_front_pic:: @ 8E1BF44
	.incbin "graphics/pokemon/front_pics/whismur_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1BF44, 0x0294

	.align 2
gFile_graphics_pokemon_palettes_whismur_palette:: @ 8E1C1D8
	.incbin "graphics/pokemon/palettes/whismur_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1C1D8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_whismur_back_pic:: @ 8E1C200
	.incbin "graphics/pokemon/back_pics/whismur_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1C200, 0x0270

	.align 2
gFile_graphics_pokemon_palettes_whismur_shiny_palette:: @ 8E1C470
	.incbin "graphics/pokemon/palettes/whismur_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1C470, 0x0028

	.align 2
gFile_graphics_pokemon_icons_whismur_icon:: @ 8E1C498
	.incbin "graphics/pokemon/icons/whismur_icon.4bpp"
	@ .incbin "baserom.gba", 0xE1C498, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_whismur_footprint:: @ 8E1C898
	.incbin "graphics/pokemon/footprints/whismur_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE1C898, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_loudred_still_front_pic:: @ 8E1C8B8
	.incbin "graphics/pokemon/front_pics/loudred_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1C8B8, 0x0478

	.align 2
gFile_graphics_pokemon_palettes_loudred_palette:: @ 8E1CD30
	.incbin "graphics/pokemon/palettes/loudred_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1CD30, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_loudred_back_pic:: @ 8E1CD58
	.incbin "graphics/pokemon/back_pics/loudred_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1CD58, 0x0370

	.align 2
gFile_graphics_pokemon_palettes_loudred_shiny_palette:: @ 8E1D0C8
	.incbin "graphics/pokemon/palettes/loudred_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1D0C8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_loudred_icon:: @ 8E1D0F0
	.incbin "graphics/pokemon/icons/loudred_icon.4bpp"
	@ .incbin "baserom.gba", 0xE1D0F0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_loudred_footprint:: @ 8E1D4F0
	.incbin "graphics/pokemon/footprints/loudred_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE1D4F0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_exploud_still_front_pic:: @ 8E1D510
	.incbin "graphics/pokemon/front_pics/exploud_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1D510, 0x0568

	.align 2
gFile_graphics_pokemon_palettes_exploud_palette:: @ 8E1DA78
	.incbin "graphics/pokemon/palettes/exploud_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1DA78, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_exploud_back_pic:: @ 8E1DAA0
	.incbin "graphics/pokemon/back_pics/exploud_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1DAA0, 0x040C

	.align 2
gFile_graphics_pokemon_palettes_exploud_shiny_palette:: @ 8E1DEAC
	.incbin "graphics/pokemon/palettes/exploud_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1DEAC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_exploud_icon:: @ 8E1DED4
	.incbin "graphics/pokemon/icons/exploud_icon.4bpp"
	@ .incbin "baserom.gba", 0xE1DED4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_exploud_footprint:: @ 8E1E2D4
	.incbin "graphics/pokemon/footprints/exploud_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE1E2D4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_clamperl_still_front_pic:: @ 8E1E2F4
	.incbin "graphics/pokemon/front_pics/clamperl_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1E2F4, 0x02D8

	.align 2
gFile_graphics_pokemon_palettes_clamperl_palette:: @ 8E1E5CC
	.incbin "graphics/pokemon/palettes/clamperl_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1E5CC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_clamperl_back_pic:: @ 8E1E5F4
	.incbin "graphics/pokemon/back_pics/clamperl_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1E5F4, 0x0294

	.align 2
gFile_graphics_pokemon_palettes_clamperl_shiny_palette:: @ 8E1E888
	.incbin "graphics/pokemon/palettes/clamperl_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1E888, 0x0028

	.align 2
gFile_graphics_pokemon_icons_clamperl_icon:: @ 8E1E8B0
	.incbin "graphics/pokemon/icons/clamperl_icon.4bpp"
	@ .incbin "baserom.gba", 0xE1E8B0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_clamperl_footprint:: @ 8E1ECB0
	.incbin "graphics/pokemon/footprints/clamperl_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE1ECB0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_huntail_still_front_pic:: @ 8E1ECD0
	.incbin "graphics/pokemon/front_pics/huntail_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1ECD0, 0x03CC

	.align 2
gFile_graphics_pokemon_palettes_huntail_palette:: @ 8E1F09C
	.incbin "graphics/pokemon/palettes/huntail_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1F09C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_huntail_back_pic:: @ 8E1F0C4
	.incbin "graphics/pokemon/back_pics/huntail_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1F0C4, 0x0354

	.align 2
gFile_graphics_pokemon_palettes_huntail_shiny_palette:: @ 8E1F418
	.incbin "graphics/pokemon/palettes/huntail_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1F418, 0x0028

	.align 2
gFile_graphics_pokemon_icons_huntail_icon:: @ 8E1F440
	.incbin "graphics/pokemon/icons/huntail_icon.4bpp"
	@ .incbin "baserom.gba", 0xE1F440, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_huntail_footprint:: @ 8E1F840
	.incbin "graphics/pokemon/footprints/huntail_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE1F840, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_gorebyss_still_front_pic:: @ 8E1F860
	.incbin "graphics/pokemon/front_pics/gorebyss_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1F860, 0x0310

	.align 2
gFile_graphics_pokemon_palettes_gorebyss_palette:: @ 8E1FB70
	.incbin "graphics/pokemon/palettes/gorebyss_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1FB70, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_gorebyss_back_pic:: @ 8E1FB98
	.incbin "graphics/pokemon/back_pics/gorebyss_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE1FB98, 0x02E8

	.align 2
gFile_graphics_pokemon_palettes_gorebyss_shiny_palette:: @ 8E1FE80
	.incbin "graphics/pokemon/palettes/gorebyss_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE1FE80, 0x0028

	.align 2
gFile_graphics_pokemon_icons_gorebyss_icon:: @ 8E1FEA8
	.incbin "graphics/pokemon/icons/gorebyss_icon.4bpp"
	@ .incbin "baserom.gba", 0xE1FEA8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_gorebyss_footprint:: @ 8E202A8
	.incbin "graphics/pokemon/footprints/gorebyss_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE202A8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_absol_still_front_pic:: @ 8E202C8
	.incbin "graphics/pokemon/front_pics/absol_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE202C8, 0x0430

	.align 2
gFile_graphics_pokemon_palettes_absol_palette:: @ 8E206F8
	.incbin "graphics/pokemon/palettes/absol_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE206F8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_absol_back_pic:: @ 8E20720
	.incbin "graphics/pokemon/back_pics/absol_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE20720, 0x0360

	.align 2
gFile_graphics_pokemon_palettes_absol_shiny_palette:: @ 8E20A80
	.incbin "graphics/pokemon/palettes/absol_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE20A80, 0x0028

	.align 2
gFile_graphics_pokemon_icons_absol_icon:: @ 8E20AA8
	.incbin "graphics/pokemon/icons/absol_icon.4bpp"
	@ .incbin "baserom.gba", 0xE20AA8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_absol_footprint:: @ 8E20EA8
	.incbin "graphics/pokemon/footprints/absol_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE20EA8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_shuppet_still_front_pic:: @ 8E20EC8
	.incbin "graphics/pokemon/front_pics/shuppet_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE20EC8, 0x0238

	.align 2
gFile_graphics_pokemon_palettes_shuppet_palette:: @ 8E21100
	.incbin "graphics/pokemon/palettes/shuppet_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE21100, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_shuppet_back_pic:: @ 8E21128
	.incbin "graphics/pokemon/back_pics/shuppet_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE21128, 0x0298

	.align 2
gFile_graphics_pokemon_palettes_shuppet_shiny_palette:: @ 8E213C0
	.incbin "graphics/pokemon/palettes/shuppet_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE213C0, 0x0028

	.align 2
gFile_graphics_pokemon_icons_shuppet_icon:: @ 8E213E8
	.incbin "graphics/pokemon/icons/shuppet_icon.4bpp"
	@ .incbin "baserom.gba", 0xE213E8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_shuppet_footprint:: @ 8E217E8
	.incbin "graphics/pokemon/footprints/shuppet_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE217E8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_banette_still_front_pic:: @ 8E21808
	.incbin "graphics/pokemon/front_pics/banette_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE21808, 0x02B4

	.align 2
gFile_graphics_pokemon_palettes_banette_palette:: @ 8E21ABC
	.incbin "graphics/pokemon/palettes/banette_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE21ABC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_banette_back_pic:: @ 8E21AE4
	.incbin "graphics/pokemon/back_pics/banette_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE21AE4, 0x027C

	.align 2
gFile_graphics_pokemon_palettes_banette_shiny_palette:: @ 8E21D60
	.incbin "graphics/pokemon/palettes/banette_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE21D60, 0x0028

	.align 2
gFile_graphics_pokemon_icons_banette_icon:: @ 8E21D88
	.incbin "graphics/pokemon/icons/banette_icon.4bpp"
	@ .incbin "baserom.gba", 0xE21D88, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_banette_footprint:: @ 8E22188
	.incbin "graphics/pokemon/footprints/banette_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE22188, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_seviper_still_front_pic:: @ 8E221A8
	.incbin "graphics/pokemon/front_pics/seviper_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE221A8, 0x0420

	.align 2
gFile_graphics_pokemon_palettes_seviper_palette:: @ 8E225C8
	.incbin "graphics/pokemon/palettes/seviper_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE225C8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_seviper_back_pic:: @ 8E225F0
	.incbin "graphics/pokemon/back_pics/seviper_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE225F0, 0x048C

	.align 2
gFile_graphics_pokemon_palettes_seviper_shiny_palette:: @ 8E22A7C
	.incbin "graphics/pokemon/palettes/seviper_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE22A7C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_seviper_icon:: @ 8E22AA4
	.incbin "graphics/pokemon/icons/seviper_icon.4bpp"
	@ .incbin "baserom.gba", 0xE22AA4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_seviper_footprint:: @ 8E22EA4
	.incbin "graphics/pokemon/footprints/seviper_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE22EA4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_zangoose_still_front_pic:: @ 8E22EC4
	.incbin "graphics/pokemon/front_pics/zangoose_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE22EC4, 0x03CC

	.align 2
gFile_graphics_pokemon_palettes_zangoose_palette:: @ 8E23290
	.incbin "graphics/pokemon/palettes/zangoose_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE23290, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_zangoose_back_pic:: @ 8E232B8
	.incbin "graphics/pokemon/back_pics/zangoose_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE232B8, 0x0374

	.align 2
gFile_graphics_pokemon_palettes_zangoose_shiny_palette:: @ 8E2362C
	.incbin "graphics/pokemon/palettes/zangoose_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2362C, 0x0028

	.align 2
gFile_graphics_pokemon_icons_zangoose_icon:: @ 8E23654
	.incbin "graphics/pokemon/icons/zangoose_icon.4bpp"
	@ .incbin "baserom.gba", 0xE23654, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_zangoose_footprint:: @ 8E23A54
	.incbin "graphics/pokemon/footprints/zangoose_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE23A54, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_relicanth_still_front_pic:: @ 8E23A74
	.incbin "graphics/pokemon/front_pics/relicanth_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE23A74, 0x0394

	.align 2
gFile_graphics_pokemon_palettes_relicanth_palette:: @ 8E23E08
	.incbin "graphics/pokemon/palettes/relicanth_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE23E08, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_relicanth_back_pic:: @ 8E23E30
	.incbin "graphics/pokemon/back_pics/relicanth_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE23E30, 0x0358

	.align 2
gFile_graphics_pokemon_palettes_relicanth_shiny_palette:: @ 8E24188
	.incbin "graphics/pokemon/palettes/relicanth_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE24188, 0x0028

	.align 2
gFile_graphics_pokemon_icons_relicanth_icon:: @ 8E241B0
	.incbin "graphics/pokemon/icons/relicanth_icon.4bpp"
	@ .incbin "baserom.gba", 0xE241B0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_relicanth_footprint:: @ 8E245B0
	.incbin "graphics/pokemon/footprints/relicanth_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE245B0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_aron_still_front_pic:: @ 8E245D0
	.incbin "graphics/pokemon/front_pics/aron_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE245D0, 0x01E8

	.align 2
gFile_graphics_pokemon_palettes_aron_palette:: @ 8E247B8
	.incbin "graphics/pokemon/palettes/aron_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE247B8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_aron_back_pic:: @ 8E247E0
	.incbin "graphics/pokemon/back_pics/aron_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE247E0, 0x0228

	.align 2
gFile_graphics_pokemon_palettes_aron_shiny_palette:: @ 8E24A08
	.incbin "graphics/pokemon/palettes/aron_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE24A08, 0x0028

	.align 2
gFile_graphics_pokemon_icons_aron_icon:: @ 8E24A30
	.incbin "graphics/pokemon/icons/aron_icon.4bpp"
	@ .incbin "baserom.gba", 0xE24A30, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_aron_footprint:: @ 8E24E30
	.incbin "graphics/pokemon/footprints/aron_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE24E30, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_lairon_still_front_pic:: @ 8E24E50
	.incbin "graphics/pokemon/front_pics/lairon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE24E50, 0x03CC

	.align 2
gFile_graphics_pokemon_palettes_lairon_palette:: @ 8E2521C
	.incbin "graphics/pokemon/palettes/lairon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2521C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_lairon_back_pic:: @ 8E25244
	.incbin "graphics/pokemon/back_pics/lairon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE25244, 0x02EC

	.align 2
gFile_graphics_pokemon_palettes_lairon_shiny_palette:: @ 8E25530
	.incbin "graphics/pokemon/palettes/lairon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE25530, 0x0028

	.align 2
gFile_graphics_pokemon_icons_lairon_icon:: @ 8E25558
	.incbin "graphics/pokemon/icons/lairon_icon.4bpp"
	@ .incbin "baserom.gba", 0xE25558, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_lairon_footprint:: @ 8E25958
	.incbin "graphics/pokemon/footprints/lairon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE25958, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_aggron_still_front_pic:: @ 8E25978
	.incbin "graphics/pokemon/front_pics/aggron_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE25978, 0x057C

	.align 2
gFile_graphics_pokemon_palettes_aggron_palette:: @ 8E25EF4
	.incbin "graphics/pokemon/palettes/aggron_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE25EF4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_aggron_back_pic:: @ 8E25F1C
	.incbin "graphics/pokemon/back_pics/aggron_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE25F1C, 0x0428

	.align 2
gFile_graphics_pokemon_palettes_aggron_shiny_palette:: @ 8E26344
	.incbin "graphics/pokemon/palettes/aggron_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE26344, 0x0028

	.align 2
gFile_graphics_pokemon_icons_aggron_icon:: @ 8E2636C
	.incbin "graphics/pokemon/icons/aggron_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2636C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_aggron_footprint:: @ 8E2676C
	.incbin "graphics/pokemon/footprints/aggron_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2676C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_castform_still_front_pic:: @ 8E2678C
	.incbin "graphics/pokemon/front_pics/castform_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2678C, 0x0A88

	.align 2
gFile_graphics_pokemon_palettes_castform_palette:: @ 8E27214
	.incbin "graphics/pokemon/palettes/castform_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE27214, 0x0080

	.align 2
gFile_graphics_pokemon_back_pics_castform_back_pic:: @ 8E27294
	.incbin "graphics/pokemon/back_pics/castform_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE27294, 0x09BC

	.align 2
gFile_graphics_pokemon_palettes_castform_shiny_palette:: @ 8E27C50
	.incbin "graphics/pokemon/palettes/castform_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE27C50, 0x007C

	.align 2
gFile_graphics_pokemon_icons_castform_icon:: @ 8E27CCC
	.incbin "graphics/pokemon/icons/castform_icon.4bpp"
	@ .incbin "baserom.gba", 0xE27CCC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_castform_footprint:: @ 8E280CC
	.incbin "graphics/pokemon/footprints/castform_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE280CC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_volbeat_still_front_pic:: @ 8E280EC
	.incbin "graphics/pokemon/front_pics/volbeat_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE280EC, 0x0390

	.align 2
gFile_graphics_pokemon_palettes_volbeat_palette:: @ 8E2847C
	.incbin "graphics/pokemon/palettes/volbeat_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2847C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_volbeat_back_pic:: @ 8E284A4
	.incbin "graphics/pokemon/back_pics/volbeat_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE284A4, 0x0360

	.align 2
gFile_graphics_pokemon_palettes_volbeat_shiny_palette:: @ 8E28804
	.incbin "graphics/pokemon/palettes/volbeat_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE28804, 0x0028

	.align 2
gFile_graphics_pokemon_icons_volbeat_icon:: @ 8E2882C
	.incbin "graphics/pokemon/icons/volbeat_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2882C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_volbeat_footprint:: @ 8E28C2C
	.incbin "graphics/pokemon/footprints/volbeat_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE28C2C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_illumise_still_front_pic:: @ 8E28C4C
	.incbin "graphics/pokemon/front_pics/illumise_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE28C4C, 0x0374

	.align 2
gFile_graphics_pokemon_palettes_illumise_palette:: @ 8E28FC0
	.incbin "graphics/pokemon/palettes/illumise_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE28FC0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_illumise_back_pic:: @ 8E28FE8
	.incbin "graphics/pokemon/back_pics/illumise_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE28FE8, 0x031C

	.align 2
gFile_graphics_pokemon_palettes_illumise_shiny_palette:: @ 8E29304
	.incbin "graphics/pokemon/palettes/illumise_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE29304, 0x0028

	.align 2
gFile_graphics_pokemon_icons_illumise_icon:: @ 8E2932C
	.incbin "graphics/pokemon/icons/illumise_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2932C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_illumise_footprint:: @ 8E2972C
	.incbin "graphics/pokemon/footprints/illumise_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2972C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_lileep_still_front_pic:: @ 8E2974C
	.incbin "graphics/pokemon/front_pics/lileep_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2974C, 0x0344

	.align 2
gFile_graphics_pokemon_palettes_lileep_palette:: @ 8E29A90
	.incbin "graphics/pokemon/palettes/lileep_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE29A90, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_lileep_back_pic:: @ 8E29AB8
	.incbin "graphics/pokemon/back_pics/lileep_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE29AB8, 0x0344

	.align 2
gFile_graphics_pokemon_palettes_lileep_shiny_palette:: @ 8E29DFC
	.incbin "graphics/pokemon/palettes/lileep_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE29DFC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_lileep_icon:: @ 8E29E24
	.incbin "graphics/pokemon/icons/lileep_icon.4bpp"
	@ .incbin "baserom.gba", 0xE29E24, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_lileep_footprint:: @ 8E2A224
	.incbin "graphics/pokemon/footprints/lileep_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2A224, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_cradily_still_front_pic:: @ 8E2A244
	.incbin "graphics/pokemon/front_pics/cradily_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2A244, 0x041C

	.align 2
gFile_graphics_pokemon_palettes_cradily_palette:: @ 8E2A660
	.incbin "graphics/pokemon/palettes/cradily_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2A660, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_cradily_back_pic:: @ 8E2A688
	.incbin "graphics/pokemon/back_pics/cradily_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2A688, 0x03FC

	.align 2
gFile_graphics_pokemon_palettes_cradily_shiny_palette:: @ 8E2AA84
	.incbin "graphics/pokemon/palettes/cradily_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2AA84, 0x0028

	.align 2
gFile_graphics_pokemon_icons_cradily_icon:: @ 8E2AAAC
	.incbin "graphics/pokemon/icons/cradily_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2AAAC, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_cradily_footprint:: @ 8E2AEAC
	.incbin "graphics/pokemon/footprints/cradily_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2AEAC, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_anorith_still_front_pic:: @ 8E2AECC
	.incbin "graphics/pokemon/front_pics/anorith_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2AECC, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_anorith_palette:: @ 8E2B1F0
	.incbin "graphics/pokemon/palettes/anorith_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2B1F0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_anorith_back_pic:: @ 8E2B218
	.incbin "graphics/pokemon/back_pics/anorith_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2B218, 0x0248

	.align 2
gFile_graphics_pokemon_palettes_anorith_shiny_palette:: @ 8E2B460
	.incbin "graphics/pokemon/palettes/anorith_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2B460, 0x0028

	.align 2
gFile_graphics_pokemon_icons_anorith_icon:: @ 8E2B488
	.incbin "graphics/pokemon/icons/anorith_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2B488, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_anorith_footprint:: @ 8E2B888
	.incbin "graphics/pokemon/footprints/anorith_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2B888, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_armaldo_still_front_pic:: @ 8E2B8A8
	.incbin "graphics/pokemon/front_pics/armaldo_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2B8A8, 0x0580

	.align 2
gFile_graphics_pokemon_palettes_armaldo_palette:: @ 8E2BE28
	.incbin "graphics/pokemon/palettes/armaldo_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2BE28, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_armaldo_back_pic:: @ 8E2BE50
	.incbin "graphics/pokemon/back_pics/armaldo_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2BE50, 0x0438

	.align 2
gFile_graphics_pokemon_palettes_armaldo_shiny_palette:: @ 8E2C288
	.incbin "graphics/pokemon/palettes/armaldo_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2C288, 0x0028

	.align 2
gFile_graphics_pokemon_icons_armaldo_icon:: @ 8E2C2B0
	.incbin "graphics/pokemon/icons/armaldo_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2C2B0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_armaldo_footprint:: @ 8E2C6B0
	.incbin "graphics/pokemon/footprints/armaldo_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2C6B0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_ralts_still_front_pic:: @ 8E2C6D0
	.incbin "graphics/pokemon/front_pics/ralts_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2C6D0, 0x0230

	.align 2
gFile_graphics_pokemon_palettes_ralts_palette:: @ 8E2C900
	.incbin "graphics/pokemon/palettes/ralts_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2C900, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_ralts_back_pic:: @ 8E2C928
	.incbin "graphics/pokemon/back_pics/ralts_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2C928, 0x023C

	.align 2
gFile_graphics_pokemon_palettes_ralts_shiny_palette:: @ 8E2CB64
	.incbin "graphics/pokemon/palettes/ralts_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2CB64, 0x0028

	.align 2
gFile_graphics_pokemon_icons_ralts_icon:: @ 8E2CB8C
	.incbin "graphics/pokemon/icons/ralts_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2CB8C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_ralts_footprint:: @ 8E2CF8C
	.incbin "graphics/pokemon/footprints/ralts_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2CF8C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_kirlia_still_front_pic:: @ 8E2CFAC
	.incbin "graphics/pokemon/front_pics/kirlia_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2CFAC, 0x02FC

	.align 2
gFile_graphics_pokemon_palettes_kirlia_palette:: @ 8E2D2A8
	.incbin "graphics/pokemon/palettes/kirlia_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2D2A8, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_kirlia_back_pic:: @ 8E2D2D0
	.incbin "graphics/pokemon/back_pics/kirlia_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2D2D0, 0x0374

	.align 2
gFile_graphics_pokemon_palettes_kirlia_shiny_palette:: @ 8E2D644
	.incbin "graphics/pokemon/palettes/kirlia_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2D644, 0x0028

	.align 2
gFile_graphics_pokemon_icons_kirlia_icon:: @ 8E2D66C
	.incbin "graphics/pokemon/icons/kirlia_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2D66C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_kirlia_footprint:: @ 8E2DA6C
	.incbin "graphics/pokemon/footprints/kirlia_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2DA6C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_gardevoir_still_front_pic:: @ 8E2DA8C
	.incbin "graphics/pokemon/front_pics/gardevoir_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2DA8C, 0x037C

	.align 2
gFile_graphics_pokemon_palettes_gardevoir_palette:: @ 8E2DE08
	.incbin "graphics/pokemon/palettes/gardevoir_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2DE08, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_gardevoir_back_pic:: @ 8E2DE30
	.incbin "graphics/pokemon/back_pics/gardevoir_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2DE30, 0x0334

	.align 2
gFile_graphics_pokemon_palettes_gardevoir_shiny_palette:: @ 8E2E164
	.incbin "graphics/pokemon/palettes/gardevoir_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2E164, 0x0028

	.align 2
gFile_graphics_pokemon_icons_gardevoir_icon:: @ 8E2E18C
	.incbin "graphics/pokemon/icons/gardevoir_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2E18C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_gardevoir_footprint:: @ 8E2E58C
	.incbin "graphics/pokemon/footprints/gardevoir_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2E58C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_bagon_still_front_pic:: @ 8E2E5AC
	.incbin "graphics/pokemon/front_pics/bagon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2E5AC, 0x0278

	.align 2
gFile_graphics_pokemon_palettes_bagon_palette:: @ 8E2E824
	.incbin "graphics/pokemon/palettes/bagon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2E824, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_bagon_back_pic:: @ 8E2E84C
	.incbin "graphics/pokemon/back_pics/bagon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2E84C, 0x02E8

	.align 2
gFile_graphics_pokemon_palettes_bagon_shiny_palette:: @ 8E2EB34
	.incbin "graphics/pokemon/palettes/bagon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2EB34, 0x0028

	.align 2
gFile_graphics_pokemon_icons_bagon_icon:: @ 8E2EB5C
	.incbin "graphics/pokemon/icons/bagon_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2EB5C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_bagon_footprint:: @ 8E2EF5C
	.incbin "graphics/pokemon/footprints/bagon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2EF5C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_shelgon_still_front_pic:: @ 8E2EF7C
	.incbin "graphics/pokemon/front_pics/shelgon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2EF7C, 0x0304

	.align 2
gFile_graphics_pokemon_palettes_shelgon_palette:: @ 8E2F280
	.incbin "graphics/pokemon/palettes/shelgon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2F280, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_shelgon_back_pic:: @ 8E2F2A8
	.incbin "graphics/pokemon/back_pics/shelgon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2F2A8, 0x02E8

	.align 2
gFile_graphics_pokemon_palettes_shelgon_shiny_palette:: @ 8E2F590
	.incbin "graphics/pokemon/palettes/shelgon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2F590, 0x0028

	.align 2
gFile_graphics_pokemon_icons_shelgon_icon:: @ 8E2F5B8
	.incbin "graphics/pokemon/icons/shelgon_icon.4bpp"
	@ .incbin "baserom.gba", 0xE2F5B8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_shelgon_footprint:: @ 8E2F9B8
	.incbin "graphics/pokemon/footprints/shelgon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE2F9B8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_salamence_still_front_pic:: @ 8E2F9D8
	.incbin "graphics/pokemon/front_pics/salamence_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2F9D8, 0x0464

	.align 2
gFile_graphics_pokemon_palettes_salamence_palette:: @ 8E2FE3C
	.incbin "graphics/pokemon/palettes/salamence_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE2FE3C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_salamence_back_pic:: @ 8E2FE64
	.incbin "graphics/pokemon/back_pics/salamence_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE2FE64, 0x02E4

	.align 2
gFile_graphics_pokemon_palettes_salamence_shiny_palette:: @ 8E30148
	.incbin "graphics/pokemon/palettes/salamence_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE30148, 0x0028

	.align 2
gFile_graphics_pokemon_icons_salamence_icon:: @ 8E30170
	.incbin "graphics/pokemon/icons/salamence_icon.4bpp"
	@ .incbin "baserom.gba", 0xE30170, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_salamence_footprint:: @ 8E30570
	.incbin "graphics/pokemon/footprints/salamence_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE30570, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_beldum_still_front_pic:: @ 8E30590
	.incbin "graphics/pokemon/front_pics/beldum_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE30590, 0x0270

	.align 2
gFile_graphics_pokemon_palettes_beldum_palette:: @ 8E30800
	.incbin "graphics/pokemon/palettes/beldum_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE30800, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_beldum_back_pic:: @ 8E30828
	.incbin "graphics/pokemon/back_pics/beldum_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE30828, 0x02F0

	.align 2
gFile_graphics_pokemon_palettes_beldum_shiny_palette:: @ 8E30B18
	.incbin "graphics/pokemon/palettes/beldum_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE30B18, 0x0028

	.align 2
gFile_graphics_pokemon_icons_beldum_icon:: @ 8E30B40
	.incbin "graphics/pokemon/icons/beldum_icon.4bpp"
	@ .incbin "baserom.gba", 0xE30B40, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_beldum_footprint:: @ 8E30F40
	.incbin "graphics/pokemon/footprints/beldum_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE30F40, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_metang_still_front_pic:: @ 8E30F60
	.incbin "graphics/pokemon/front_pics/metang_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE30F60, 0x045C

	.align 2
gFile_graphics_pokemon_palettes_metang_palette:: @ 8E313BC
	.incbin "graphics/pokemon/palettes/metang_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE313BC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_metang_back_pic:: @ 8E313E4
	.incbin "graphics/pokemon/back_pics/metang_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE313E4, 0x0324

	.align 2
gFile_graphics_pokemon_palettes_metang_shiny_palette:: @ 8E31708
	.incbin "graphics/pokemon/palettes/metang_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE31708, 0x0028

	.align 2
gFile_graphics_pokemon_icons_metang_icon:: @ 8E31730
	.incbin "graphics/pokemon/icons/metang_icon.4bpp"
	@ .incbin "baserom.gba", 0xE31730, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_metang_footprint:: @ 8E31B30
	.incbin "graphics/pokemon/footprints/metang_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE31B30, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_metagross_still_front_pic:: @ 8E31B50
	.incbin "graphics/pokemon/front_pics/metagross_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE31B50, 0x0464

	.align 2
gFile_graphics_pokemon_palettes_metagross_palette:: @ 8E31FB4
	.incbin "graphics/pokemon/palettes/metagross_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE31FB4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_metagross_back_pic:: @ 8E31FDC
	.incbin "graphics/pokemon/back_pics/metagross_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE31FDC, 0x02CC

	.align 2
gFile_graphics_pokemon_palettes_metagross_shiny_palette:: @ 8E322A8
	.incbin "graphics/pokemon/palettes/metagross_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE322A8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_metagross_icon:: @ 8E322D0
	.incbin "graphics/pokemon/icons/metagross_icon.4bpp"
	@ .incbin "baserom.gba", 0xE322D0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_metagross_footprint:: @ 8E326D0
	.incbin "graphics/pokemon/footprints/metagross_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE326D0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_regirock_still_front_pic:: @ 8E326F0
	.incbin "graphics/pokemon/front_pics/regirock_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE326F0, 0x04BC

	.align 2
gFile_graphics_pokemon_palettes_regirock_palette:: @ 8E32BAC
	.incbin "graphics/pokemon/palettes/regirock_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE32BAC, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_regirock_back_pic:: @ 8E32BD4
	.incbin "graphics/pokemon/back_pics/regirock_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE32BD4, 0x044C

	.align 2
gFile_graphics_pokemon_palettes_regirock_shiny_palette:: @ 8E33020
	.incbin "graphics/pokemon/palettes/regirock_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE33020, 0x0028

	.align 2
gFile_graphics_pokemon_icons_regirock_icon:: @ 8E33048
	.incbin "graphics/pokemon/icons/regirock_icon.4bpp"
	@ .incbin "baserom.gba", 0xE33048, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_regirock_footprint:: @ 8E33448
	.incbin "graphics/pokemon/footprints/regirock_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE33448, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_regice_still_front_pic:: @ 8E33468
	.incbin "graphics/pokemon/front_pics/regice_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE33468, 0x0448

	.align 2
gFile_graphics_pokemon_palettes_regice_palette:: @ 8E338B0
	.incbin "graphics/pokemon/palettes/regice_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE338B0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_regice_back_pic:: @ 8E338D8
	.incbin "graphics/pokemon/back_pics/regice_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE338D8, 0x02F0

	.align 2
gFile_graphics_pokemon_palettes_regice_shiny_palette:: @ 8E33BC8
	.incbin "graphics/pokemon/palettes/regice_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE33BC8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_regice_icon:: @ 8E33BF0
	.incbin "graphics/pokemon/icons/regice_icon.4bpp"
	@ .incbin "baserom.gba", 0xE33BF0, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_regice_footprint:: @ 8E33FF0
	.incbin "graphics/pokemon/footprints/regice_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE33FF0, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_registeel_still_front_pic:: @ 8E34010
	.incbin "graphics/pokemon/front_pics/registeel_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE34010, 0x0488

	.align 2
gFile_graphics_pokemon_palettes_registeel_palette:: @ 8E34498
	.incbin "graphics/pokemon/palettes/registeel_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE34498, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_registeel_back_pic:: @ 8E344C0
	.incbin "graphics/pokemon/back_pics/registeel_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE344C0, 0x0338

	.align 2
gFile_graphics_pokemon_palettes_registeel_shiny_palette:: @ 8E347F8
	.incbin "graphics/pokemon/palettes/registeel_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE347F8, 0x0028

	.align 2
gFile_graphics_pokemon_icons_registeel_icon:: @ 8E34820
	.incbin "graphics/pokemon/icons/registeel_icon.4bpp"
	@ .incbin "baserom.gba", 0xE34820, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_registeel_footprint:: @ 8E34C20
	.incbin "graphics/pokemon/footprints/registeel_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE34C20, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_kyogre_still_front_pic:: @ 8E34C40
	.incbin "graphics/pokemon/front_pics/kyogre_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE34C40, 0x0470

	.align 2
gFile_graphics_pokemon_palettes_kyogre_palette:: @ 8E350B0
	.incbin "graphics/pokemon/palettes/kyogre_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE350B0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_kyogre_back_pic:: @ 8E350D8
	.incbin "graphics/pokemon/back_pics/kyogre_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE350D8, 0x0278

	.align 2
gFile_graphics_pokemon_palettes_kyogre_shiny_palette:: @ 8E35350
	.incbin "graphics/pokemon/palettes/kyogre_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE35350, 0x0028

	.align 2
gFile_graphics_pokemon_icons_kyogre_icon:: @ 8E35378
	.incbin "graphics/pokemon/icons/kyogre_icon.4bpp"
	@ .incbin "baserom.gba", 0xE35378, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_kyogre_footprint:: @ 8E35778
	.incbin "graphics/pokemon/footprints/kyogre_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE35778, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_groudon_still_front_pic:: @ 8E35798
	.incbin "graphics/pokemon/front_pics/groudon_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE35798, 0x0594

	.align 2
gFile_graphics_pokemon_palettes_groudon_palette:: @ 8E35D2C
	.incbin "graphics/pokemon/palettes/groudon_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE35D2C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_groudon_back_pic:: @ 8E35D54
	.incbin "graphics/pokemon/back_pics/groudon_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE35D54, 0x0468

	.align 2
gFile_graphics_pokemon_palettes_groudon_shiny_palette:: @ 8E361BC
	.incbin "graphics/pokemon/palettes/groudon_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE361BC, 0x0028

	.align 2
gFile_graphics_pokemon_icons_groudon_icon:: @ 8E361E4
	.incbin "graphics/pokemon/icons/groudon_icon.4bpp"
	@ .incbin "baserom.gba", 0xE361E4, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_groudon_footprint:: @ 8E365E4
	.incbin "graphics/pokemon/footprints/groudon_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE365E4, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_rayquaza_still_front_pic:: @ 8E36604
	.incbin "graphics/pokemon/front_pics/rayquaza_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE36604, 0x0510

	.align 2
gFile_graphics_pokemon_palettes_rayquaza_palette:: @ 8E36B14
	.incbin "graphics/pokemon/palettes/rayquaza_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE36B14, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_rayquaza_back_pic:: @ 8E36B3C
	.incbin "graphics/pokemon/back_pics/rayquaza_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE36B3C, 0x0338

	.align 2
gFile_graphics_pokemon_palettes_rayquaza_shiny_palette:: @ 8E36E74
	.incbin "graphics/pokemon/palettes/rayquaza_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE36E74, 0x0028

	.align 2
gFile_graphics_pokemon_icons_rayquaza_icon:: @ 8E36E9C
	.incbin "graphics/pokemon/icons/rayquaza_icon.4bpp"
	@ .incbin "baserom.gba", 0xE36E9C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_rayquaza_footprint:: @ 8E3729C
	.incbin "graphics/pokemon/footprints/rayquaza_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE3729C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_latias_still_front_pic:: @ 8E372BC
	.incbin "graphics/pokemon/front_pics/latias_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE372BC, 0x0424

	.align 2
gFile_graphics_pokemon_palettes_latias_palette:: @ 8E376E0
	.incbin "graphics/pokemon/palettes/latias_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE376E0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_latias_back_pic:: @ 8E37708
	.incbin "graphics/pokemon/back_pics/latias_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE37708, 0x02FC

	.align 2
gFile_graphics_pokemon_palettes_latias_shiny_palette:: @ 8E37A04
	.incbin "graphics/pokemon/palettes/latias_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE37A04, 0x0028

	.align 2
gFile_graphics_pokemon_icons_latias_icon:: @ 8E37A2C
	.incbin "graphics/pokemon/icons/latias_icon.4bpp"
	@ .incbin "baserom.gba", 0xE37A2C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_latias_footprint:: @ 8E37E2C
	.incbin "graphics/pokemon/footprints/latias_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE37E2C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_latios_still_front_pic:: @ 8E37E4C
	.incbin "graphics/pokemon/front_pics/latios_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE37E4C, 0x0454

	.align 2
gFile_graphics_pokemon_palettes_latios_palette:: @ 8E382A0
	.incbin "graphics/pokemon/palettes/latios_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE382A0, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_latios_back_pic:: @ 8E382C8
	.incbin "graphics/pokemon/back_pics/latios_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE382C8, 0x0360

	.align 2
gFile_graphics_pokemon_palettes_latios_shiny_palette:: @ 8E38628
	.incbin "graphics/pokemon/palettes/latios_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE38628, 0x0028

	.align 2
gFile_graphics_pokemon_icons_latios_icon:: @ 8E38650
	.incbin "graphics/pokemon/icons/latios_icon.4bpp"
	@ .incbin "baserom.gba", 0xE38650, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_latios_footprint:: @ 8E38A50
	.incbin "graphics/pokemon/footprints/latios_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE38A50, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_jirachi_still_front_pic:: @ 8E38A70
	.incbin "graphics/pokemon/front_pics/jirachi_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE38A70, 0x030C

	.align 2
gFile_graphics_pokemon_palettes_jirachi_palette:: @ 8E38D7C
	.incbin "graphics/pokemon/palettes/jirachi_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE38D7C, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_jirachi_back_pic:: @ 8E38DA4
	.incbin "graphics/pokemon/back_pics/jirachi_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE38DA4, 0x03A0

	.align 2
gFile_graphics_pokemon_palettes_jirachi_shiny_palette:: @ 8E39144
	.incbin "graphics/pokemon/palettes/jirachi_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE39144, 0x0028

	.align 2
gFile_graphics_pokemon_icons_jirachi_icon:: @ 8E3916C
	.incbin "graphics/pokemon/icons/jirachi_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3916C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_jirachi_footprint:: @ 8E3956C
	.incbin "graphics/pokemon/footprints/jirachi_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE3956C, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_deoxys_still_front_pic:: @ 8E3958C
	.incbin "graphics/pokemon/front_pics/deoxys_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3958C, 0x07BC

	.align 2
gFile_graphics_pokemon_palettes_deoxys_palette:: @ 8E39D48
	.incbin "graphics/pokemon/palettes/deoxys_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE39D48, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_deoxys_back_pic:: @ 8E39D70
	.incbin "graphics/pokemon/back_pics/deoxys_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE39D70, 0x05F0

	.align 2
gFile_graphics_pokemon_palettes_deoxys_shiny_palette:: @ 8E3A360
	.incbin "graphics/pokemon/palettes/deoxys_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE3A360, 0x0028

	.align 2
gFile_graphics_pokemon_icons_deoxys_icon:: @ 8E3A388
	.incbin "graphics/pokemon/icons/deoxys_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3A388, 0x0400

	.align 2
gFile_graphics_pokemon_icons_deoxys_speed_icon:: @ 8E3A788
	.incbin "graphics/pokemon/icons/deoxys_speed_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3A788, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_deoxys_footprint:: @ 8E3AB88
	.incbin "graphics/pokemon/footprints/deoxys_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE3AB88, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_chimecho_still_front_pic:: @ 8E3ABA8
	.incbin "graphics/pokemon/front_pics/chimecho_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3ABA8, 0x024C

	.align 2
gFile_graphics_pokemon_palettes_chimecho_palette:: @ 8E3ADF4
	.incbin "graphics/pokemon/palettes/chimecho_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE3ADF4, 0x0028

	.align 2
gFile_graphics_pokemon_back_pics_chimecho_back_pic:: @ 8E3AE1C
	.incbin "graphics/pokemon/back_pics/chimecho_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3AE1C, 0x0274

	.align 2
gFile_graphics_pokemon_palettes_chimecho_shiny_palette:: @ 8E3B090
	.incbin "graphics/pokemon/palettes/chimecho_shiny_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE3B090, 0x0028

	.align 2
gFile_graphics_pokemon_icons_chimecho_icon:: @ 8E3B0B8
	.incbin "graphics/pokemon/icons/chimecho_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3B0B8, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_chimecho_footprint:: @ 8E3B4B8
	.incbin "graphics/pokemon/footprints/chimecho_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE3B4B8, 0x0020


	.align 2
gFile_graphics_pokemon_front_pics_egg_still_front_pic:: @ 8E3B4D8
	.incbin "graphics/pokemon/front_pics/egg_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3B4D8, 0x01B4

	.align 2
gFile_graphics_pokemon_palettes_egg_palette:: @ 8E3B68C
	.incbin "graphics/pokemon/palettes/egg_palette.gbapal.lz"
	@ .incbin "baserom.gba", 0xE3B68C, 0x0020

	.align 2
gFile_graphics_pokemon_front_pics_unown_b_still_front_pic:: @ 8E3B6AC
	.incbin "graphics/pokemon/front_pics/unown_b_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3B6AC, 0x01D8

	.align 2
gFile_graphics_pokemon_back_pics_unown_b_back_pic:: @ 8E3B884
	.incbin "graphics/pokemon/back_pics/unown_b_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3B884, 0x0204

	.align 2
gFile_graphics_pokemon_icons_unown_B_icon:: @ 8E3BA88
	.incbin "graphics/pokemon/icons/unown_B_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3BA88, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_c_still_front_pic:: @ 8E3BE88
	.incbin "graphics/pokemon/front_pics/unown_c_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3BE88, 0x0214

	.align 2
gFile_graphics_pokemon_back_pics_unown_c_back_pic:: @ 8E3C09C
	.incbin "graphics/pokemon/back_pics/unown_c_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3C09C, 0x02AC

	.align 2
gFile_graphics_pokemon_icons_unown_C_icon:: @ 8E3C348
	.incbin "graphics/pokemon/icons/unown_C_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3C348, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_d_still_front_pic:: @ 8E3C748
	.incbin "graphics/pokemon/front_pics/unown_d_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3C748, 0x01F8

	.align 2
gFile_graphics_pokemon_back_pics_unown_d_back_pic:: @ 8E3C940
	.incbin "graphics/pokemon/back_pics/unown_d_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3C940, 0x0258

	.align 2
gFile_graphics_pokemon_icons_unown_D_icon:: @ 8E3CB98
	.incbin "graphics/pokemon/icons/unown_D_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3CB98, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_e_still_front_pic:: @ 8E3CF98
	.incbin "graphics/pokemon/front_pics/unown_e_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3CF98, 0x01B8

	.align 2
gFile_graphics_pokemon_back_pics_unown_e_back_pic:: @ 8E3D150
	.incbin "graphics/pokemon/back_pics/unown_e_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3D150, 0x0200

	.align 2
gFile_graphics_pokemon_icons_unown_E_icon:: @ 8E3D350
	.incbin "graphics/pokemon/icons/unown_E_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3D350, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_f_still_front_pic:: @ 8E3D750
	.incbin "graphics/pokemon/front_pics/unown_f_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3D750, 0x01F4

	.align 2
gFile_graphics_pokemon_back_pics_unown_f_back_pic:: @ 8E3D944
	.incbin "graphics/pokemon/back_pics/unown_f_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3D944, 0x021C

	.align 2
gFile_graphics_pokemon_icons_unown_F_icon:: @ 8E3DB60
	.incbin "graphics/pokemon/icons/unown_F_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3DB60, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_g_still_front_pic:: @ 8E3DF60
	.incbin "graphics/pokemon/front_pics/unown_g_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3DF60, 0x01DC

	.align 2
gFile_graphics_pokemon_back_pics_unown_g_back_pic:: @ 8E3E13C
	.incbin "graphics/pokemon/back_pics/unown_g_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3E13C, 0x024C

	.align 2
gFile_graphics_pokemon_icons_unown_G_icon:: @ 8E3E388
	.incbin "graphics/pokemon/icons/unown_G_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3E388, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_h_still_front_pic:: @ 8E3E788
	.incbin "graphics/pokemon/front_pics/unown_h_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3E788, 0x0244

	.align 2
gFile_graphics_pokemon_back_pics_unown_h_back_pic:: @ 8E3E9CC
	.incbin "graphics/pokemon/back_pics/unown_h_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3E9CC, 0x02C4

	.align 2
gFile_graphics_pokemon_icons_unown_H_icon:: @ 8E3EC90
	.incbin "graphics/pokemon/icons/unown_H_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3EC90, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_i_still_front_pic:: @ 8E3F090
	.incbin "graphics/pokemon/front_pics/unown_i_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3F090, 0x0198

	.align 2
gFile_graphics_pokemon_back_pics_unown_i_back_pic:: @ 8E3F228
	.incbin "graphics/pokemon/back_pics/unown_i_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3F228, 0x01A8

	.align 2
gFile_graphics_pokemon_icons_unown_I_icon:: @ 8E3F3D0
	.incbin "graphics/pokemon/icons/unown_I_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3F3D0, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_j_still_front_pic:: @ 8E3F7D0
	.incbin "graphics/pokemon/front_pics/unown_j_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3F7D0, 0x01C4

	.align 2
gFile_graphics_pokemon_back_pics_unown_j_back_pic:: @ 8E3F994
	.incbin "graphics/pokemon/back_pics/unown_j_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3F994, 0x01E8

	.align 2
gFile_graphics_pokemon_icons_unown_J_icon:: @ 8E3FB7C
	.incbin "graphics/pokemon/icons/unown_J_icon.4bpp"
	@ .incbin "baserom.gba", 0xE3FB7C, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_k_still_front_pic:: @ 8E3FF7C
	.incbin "graphics/pokemon/front_pics/unown_k_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE3FF7C, 0x01D0

	.align 2
gFile_graphics_pokemon_back_pics_unown_k_back_pic:: @ 8E4014C
	.incbin "graphics/pokemon/back_pics/unown_k_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4014C, 0x01F8

	.align 2
gFile_graphics_pokemon_icons_unown_K_icon:: @ 8E40344
	.incbin "graphics/pokemon/icons/unown_K_icon.4bpp"
	@ .incbin "baserom.gba", 0xE40344, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_l_still_front_pic:: @ 8E40744
	.incbin "graphics/pokemon/front_pics/unown_l_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE40744, 0x01B0

	.align 2
gFile_graphics_pokemon_back_pics_unown_l_back_pic:: @ 8E408F4
	.incbin "graphics/pokemon/back_pics/unown_l_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE408F4, 0x01D4

	.align 2
gFile_graphics_pokemon_icons_unown_L_icon:: @ 8E40AC8
	.incbin "graphics/pokemon/icons/unown_L_icon.4bpp"
	@ .incbin "baserom.gba", 0xE40AC8, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_m_still_front_pic:: @ 8E40EC8
	.incbin "graphics/pokemon/front_pics/unown_m_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE40EC8, 0x0224

	.align 2
gFile_graphics_pokemon_back_pics_unown_m_back_pic:: @ 8E410EC
	.incbin "graphics/pokemon/back_pics/unown_m_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE410EC, 0x02A8

	.align 2
gFile_graphics_pokemon_icons_unown_M_icon:: @ 8E41394
	.incbin "graphics/pokemon/icons/unown_M_icon.4bpp"
	@ .incbin "baserom.gba", 0xE41394, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_n_still_front_pic:: @ 8E41794
	.incbin "graphics/pokemon/front_pics/unown_n_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE41794, 0x01F8

	.align 2
gFile_graphics_pokemon_back_pics_unown_n_back_pic:: @ 8E4198C
	.incbin "graphics/pokemon/back_pics/unown_n_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4198C, 0x026C

	.align 2
gFile_graphics_pokemon_icons_unown_N_icon:: @ 8E41BF8
	.incbin "graphics/pokemon/icons/unown_N_icon.4bpp"
	@ .incbin "baserom.gba", 0xE41BF8, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_o_still_front_pic:: @ 8E41FF8
	.incbin "graphics/pokemon/front_pics/unown_o_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE41FF8, 0x0238

	.align 2
gFile_graphics_pokemon_back_pics_unown_o_back_pic:: @ 8E42230
	.incbin "graphics/pokemon/back_pics/unown_o_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE42230, 0x02C0

	.align 2
gFile_graphics_pokemon_icons_unown_O_icon:: @ 8E424F0
	.incbin "graphics/pokemon/icons/unown_O_icon.4bpp"
	@ .incbin "baserom.gba", 0xE424F0, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_p_still_front_pic:: @ 8E428F0
	.incbin "graphics/pokemon/front_pics/unown_p_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE428F0, 0x01A0

	.align 2
gFile_graphics_pokemon_back_pics_unown_p_back_pic:: @ 8E42A90
	.incbin "graphics/pokemon/back_pics/unown_p_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE42A90, 0x01C4

	.align 2
gFile_graphics_pokemon_icons_unown_P_icon:: @ 8E42C54
	.incbin "graphics/pokemon/icons/unown_P_icon.4bpp"
	@ .incbin "baserom.gba", 0xE42C54, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_q_still_front_pic:: @ 8E43054
	.incbin "graphics/pokemon/front_pics/unown_q_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE43054, 0x01B4

	.align 2
gFile_graphics_pokemon_back_pics_unown_q_back_pic:: @ 8E43208
	.incbin "graphics/pokemon/back_pics/unown_q_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE43208, 0x01CC

	.align 2
gFile_graphics_pokemon_icons_unown_Q_icon:: @ 8E433D4
	.incbin "graphics/pokemon/icons/unown_Q_icon.4bpp"
	@ .incbin "baserom.gba", 0xE433D4, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_r_still_front_pic:: @ 8E437D4
	.incbin "graphics/pokemon/front_pics/unown_r_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE437D4, 0x01A4

	.align 2
gFile_graphics_pokemon_back_pics_unown_r_back_pic:: @ 8E43978
	.incbin "graphics/pokemon/back_pics/unown_r_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE43978, 0x01C8

	.align 2
gFile_graphics_pokemon_icons_unown_R_icon:: @ 8E43B40
	.incbin "graphics/pokemon/icons/unown_R_icon.4bpp"
	@ .incbin "baserom.gba", 0xE43B40, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_s_still_front_pic:: @ 8E43F40
	.incbin "graphics/pokemon/front_pics/unown_s_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE43F40, 0x01E8

	.align 2
gFile_graphics_pokemon_back_pics_unown_s_back_pic:: @ 8E44128
	.incbin "graphics/pokemon/back_pics/unown_s_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE44128, 0x0254

	.align 2
gFile_graphics_pokemon_icons_unown_S_icon:: @ 8E4437C
	.incbin "graphics/pokemon/icons/unown_S_icon.4bpp"
	@ .incbin "baserom.gba", 0xE4437C, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_t_still_front_pic:: @ 8E4477C
	.incbin "graphics/pokemon/front_pics/unown_t_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4477C, 0x01B0

	.align 2
gFile_graphics_pokemon_back_pics_unown_t_back_pic:: @ 8E4492C
	.incbin "graphics/pokemon/back_pics/unown_t_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4492C, 0x01B4

	.align 2
gFile_graphics_pokemon_icons_unown_T_icon:: @ 8E44AE0
	.incbin "graphics/pokemon/icons/unown_T_icon.4bpp"
	@ .incbin "baserom.gba", 0xE44AE0, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_u_still_front_pic:: @ 8E44EE0
	.incbin "graphics/pokemon/front_pics/unown_u_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE44EE0, 0x0218

	.align 2
gFile_graphics_pokemon_back_pics_unown_u_back_pic:: @ 8E450F8
	.incbin "graphics/pokemon/back_pics/unown_u_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE450F8, 0x0254

	.align 2
gFile_graphics_pokemon_icons_unown_U_icon:: @ 8E4534C
	.incbin "graphics/pokemon/icons/unown_U_icon.4bpp"
	@ .incbin "baserom.gba", 0xE4534C, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_v_still_front_pic:: @ 8E4574C
	.incbin "graphics/pokemon/front_pics/unown_v_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4574C, 0x01E4

	.align 2
gFile_graphics_pokemon_back_pics_unown_v_back_pic:: @ 8E45930
	.incbin "graphics/pokemon/back_pics/unown_v_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE45930, 0x0230

	.align 2
gFile_graphics_pokemon_icons_unown_V_icon:: @ 8E45B60
	.incbin "graphics/pokemon/icons/unown_V_icon.4bpp"
	@ .incbin "baserom.gba", 0xE45B60, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_w_still_front_pic:: @ 8E45F60
	.incbin "graphics/pokemon/front_pics/unown_w_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE45F60, 0x01D4

	.align 2
gFile_graphics_pokemon_back_pics_unown_w_back_pic:: @ 8E46134
	.incbin "graphics/pokemon/back_pics/unown_w_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE46134, 0x0204

	.align 2
gFile_graphics_pokemon_icons_unown_W_icon:: @ 8E46338
	.incbin "graphics/pokemon/icons/unown_W_icon.4bpp"
	@ .incbin "baserom.gba", 0xE46338, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_x_still_front_pic:: @ 8E46738
	.incbin "graphics/pokemon/front_pics/unown_x_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE46738, 0x01C4

	.align 2
gFile_graphics_pokemon_back_pics_unown_x_back_pic:: @ 8E468FC
	.incbin "graphics/pokemon/back_pics/unown_x_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE468FC, 0x01F0

	.align 2
gFile_graphics_pokemon_icons_unown_X_icon:: @ 8E46AEC
	.incbin "graphics/pokemon/icons/unown_X_icon.4bpp"
	@ .incbin "baserom.gba", 0xE46AEC, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_y_still_front_pic:: @ 8E46EEC
	.incbin "graphics/pokemon/front_pics/unown_y_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE46EEC, 0x01D8

	.align 2
gFile_graphics_pokemon_back_pics_unown_y_back_pic:: @ 8E470C4
	.incbin "graphics/pokemon/back_pics/unown_y_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE470C4, 0x01F4

	.align 2
gFile_graphics_pokemon_icons_unown_Y_icon:: @ 8E472B8
	.incbin "graphics/pokemon/icons/unown_Y_icon.4bpp"
	@ .incbin "baserom.gba", 0xE472B8, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_z_still_front_pic:: @ 8E476B8
	.incbin "graphics/pokemon/front_pics/unown_z_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE476B8, 0x01B0

	.align 2
gFile_graphics_pokemon_back_pics_unown_z_back_pic:: @ 8E47868
	.incbin "graphics/pokemon/back_pics/unown_z_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE47868, 0x01DC

	.align 2
gFile_graphics_pokemon_icons_unown_Z_icon:: @ 8E47A44
	.incbin "graphics/pokemon/icons/unown_Z_icon.4bpp"
	@ .incbin "baserom.gba", 0xE47A44, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_exclamation_mark_still_front_pic:: @ 8E47E44
	.incbin "graphics/pokemon/front_pics/unown_exclamation_mark_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE47E44, 0x0190

	.align 2
gFile_graphics_pokemon_back_pics_unown_exclamation_mark_back_pic:: @ 8E47FD4
	.incbin "graphics/pokemon/back_pics/unown_exclamation_mark_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE47FD4, 0x01C8

	.align 2
gFile_graphics_pokemon_icons_unown_exclamation_mark_icon:: @ 8E4819C
	.incbin "graphics/pokemon/icons/unown_exclamation_mark_icon.4bpp"
	@ .incbin "baserom.gba", 0xE4819C, 0x0400

	.align 2
gFile_graphics_pokemon_front_pics_unown_question_mark_still_front_pic:: @ 8E4859C
	.incbin "graphics/pokemon/front_pics/unown_question_mark_still_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4859C, 0x01BC

	.align 2
gFile_graphics_pokemon_back_pics_unown_question_mark_back_pic:: @ 8E48758
	.incbin "graphics/pokemon/back_pics/unown_question_mark_back_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE48758, 0x0200

	.align 2
gFile_graphics_pokemon_icons_unown_question_mark_icon:: @ 8E48958
	.incbin "graphics/pokemon/icons/unown_question_mark_icon.4bpp"
	@ .incbin "baserom.gba", 0xE48958, 0x0400


	.align 2
gFile_graphics_trainers_front_pics_aqua_leader_archie_front_pic:: @ 8E48D58
	.incbin "graphics/trainers/front_pics/aqua_leader_archie_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE48D58, 0x033C

	.align 2
gFile_graphics_trainers_palettes_aqua_leader_archie:: @ 8E49094
	.incbin "graphics/trainers/palettes/aqua_leader_archie.gbapal.lz"
	@ .incbin "baserom.gba", 0xE49094, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_aqua_grunt_m_front_pic:: @ 8E490BC
	.incbin "graphics/trainers/front_pics/aqua_grunt_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE490BC, 0x0360

	.align 2
gFile_graphics_trainers_palettes_aqua_grunt_m:: @ 8E4941C
	.incbin "graphics/trainers/palettes/aqua_grunt_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4941C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_aqua_grunt_f_front_pic:: @ 8E49444
	.incbin "graphics/trainers/front_pics/aqua_grunt_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE49444, 0x033C

	.align 2
gFile_graphics_trainers_palettes_aqua_grunt_f:: @ 8E49780
	.incbin "graphics/trainers/palettes/aqua_grunt_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE49780, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_aroma_lady_front_pic:: @ 8E497A8
	.incbin "graphics/trainers/front_pics/emerald_aroma_lady_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE497A8, 0x02C4

	.align 2
gFile_graphics_trainers_palettes_emerald_aroma_lady:: @ 8E49A6C
	.incbin "graphics/trainers/palettes/emerald_aroma_lady.gbapal.lz"
	@ .incbin "baserom.gba", 0xE49A6C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_ruin_maniac_front_pic:: @ 8E49A94
	.incbin "graphics/trainers/front_pics/emerald_ruin_maniac_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE49A94, 0x039C

	.align 2
gFile_graphics_trainers_palettes_emerald_ruin_maniac:: @ 8E49E30
	.incbin "graphics/trainers/palettes/emerald_ruin_maniac.gbapal.lz"
	@ .incbin "baserom.gba", 0xE49E30, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_interviewer_front_pic:: @ 8E49E58
	.incbin "graphics/trainers/front_pics/interviewer_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE49E58, 0x04A4

	.align 2
gFile_graphics_trainers_palettes_interviewer:: @ 8E4A2FC
	.incbin "graphics/trainers/palettes/interviewer.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4A2FC, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_tuber_f_front_pic:: @ 8E4A324
	.incbin "graphics/trainers/front_pics/emerald_tuber_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4A324, 0x02A4

	.align 2
gFile_graphics_trainers_palettes_emerald_tuber_f:: @ 8E4A5C8
	.incbin "graphics/trainers/palettes/emerald_tuber_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4A5C8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_tuber_m_front_pic:: @ 8E4A5F0
	.incbin "graphics/trainers/front_pics/emerald_tuber_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4A5F0, 0x028C

	.align 2
gFile_graphics_trainers_palettes_emerald_tuber_m:: @ 8E4A87C
	.incbin "graphics/trainers/palettes/emerald_tuber_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4A87C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_cool_trainer_m_front_pic:: @ 8E4A8A4
	.incbin "graphics/trainers/front_pics/emerald_cool_trainer_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4A8A4, 0x02E8

	.align 2
gFile_graphics_trainers_palettes_emerald_cool_trainer_m:: @ 8E4AB8C
	.incbin "graphics/trainers/palettes/emerald_cool_trainer_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4AB8C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_cool_trainer_f_front_pic:: @ 8E4ABB4
	.incbin "graphics/trainers/front_pics/emerald_cool_trainer_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4ABB4, 0x0314

	.align 2
gFile_graphics_trainers_palettes_emerald_cool_trainer_f:: @ 8E4AEC8
	.incbin "graphics/trainers/palettes/emerald_cool_trainer_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4AEC8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_hex_maniac_front_pic:: @ 8E4AEF0
	.incbin "graphics/trainers/front_pics/hex_maniac_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4AEF0, 0x036C

	.align 2
gFile_graphics_trainers_palettes_hex_maniac:: @ 8E4B25C
	.incbin "graphics/trainers/palettes/hex_maniac.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4B25C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_lady_front_pic:: @ 8E4B284
	.incbin "graphics/trainers/front_pics/emerald_lady_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4B284, 0x03B4

	.align 2
gFile_graphics_trainers_palettes_emerald_lady:: @ 8E4B638
	.incbin "graphics/trainers/palettes/emerald_lady.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4B638, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_beauty_front_pic:: @ 8E4B660
	.incbin "graphics/trainers/front_pics/emerald_beauty_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4B660, 0x02E8

	.align 2
gFile_graphics_trainers_palettes_emerald_beauty:: @ 8E4B948
	.incbin "graphics/trainers/palettes/emerald_beauty.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4B948, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_rich_boy_front_pic:: @ 8E4B970
	.incbin "graphics/trainers/front_pics/rich_boy_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4B970, 0x02B4

	.align 2
gFile_graphics_trainers_palettes_rich_boy:: @ 8E4BC24
	.incbin "graphics/trainers/palettes/rich_boy.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4BC24, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_pokemaniac_front_pic:: @ 8E4BC4C
	.incbin "graphics/trainers/front_pics/emerald_pokemaniac_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4BC4C, 0x0370

	.align 2
gFile_graphics_trainers_palettes_emerald_pokemaniac:: @ 8E4BFBC
	@ .incbin "graphics/trainers/palettes/emerald_pokemaniac.gbapal.lz"
	.incbin "baserom.gba", 0xE4BFBC, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_swimmer_m_front_pic:: @ 8E4BFE4
	.incbin "graphics/trainers/front_pics/emerald_swimmer_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4BFE4, 0x02C0

	.align 2
gFile_graphics_trainers_palettes_emerald_swimmer_m:: @ 8E4C2A4
	.incbin "graphics/trainers/palettes/emerald_swimmer_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4C2A4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_black_belt_front_pic:: @ 8E4C2CC
	.incbin "graphics/trainers/front_pics/emerald_black_belt_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4C2CC, 0x0364

	.align 2
gFile_graphics_trainers_palettes_black_belt:: @ 8E4C630
	.incbin "graphics/trainers/palettes/black_belt.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4C630, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_guitarist_front_pic:: @ 8E4C658
	.incbin "graphics/trainers/front_pics/guitarist_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4C658, 0x0384

	.align 2
gFile_graphics_trainers_palettes_guitarist:: @ 8E4C9DC
	.incbin "graphics/trainers/palettes/guitarist.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4C9DC, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_kindler_front_pic:: @ 8E4CA04
	.incbin "graphics/trainers/front_pics/kindler_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4CA04, 0x036C

	.align 2
gFile_graphics_trainers_palettes_kindler:: @ 8E4CD70
	.incbin "graphics/trainers/palettes/kindler.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4CD70, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_camper_front_pic:: @ 8E4CD98
	.incbin "graphics/trainers/front_pics/emerald_camper_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4CD98, 0x02E8

	.align 2
gFile_graphics_trainers_palettes_emerald_camper:: @ 8E4D080
	.incbin "graphics/trainers/palettes/emerald_camper.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4D080, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_bug_maniac_front_pic:: @ 8E4D0A8
	.incbin "graphics/trainers/front_pics/bug_maniac_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4D0A8, 0x0450

	.align 2
gFile_graphics_trainers_palettes_bug_maniac:: @ 8E4D4F8
	.incbin "graphics/trainers/palettes/bug_maniac.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4D4F8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_psychic_m_front_pic:: @ 8E4D520
	.incbin "graphics/trainers/front_pics/emerald_psychic_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4D520, 0x032C

	.align 2
gFile_graphics_trainers_palettes_emerald_psychic_m:: @ 8E4D84C
	.incbin "graphics/trainers/palettes/emerald_psychic_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4D84C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_psychic_f_front_pic:: @ 8E4D874
	.incbin "graphics/trainers/front_pics/emerald_psychic_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4D874, 0x0328

	.align 2
gFile_graphics_trainers_palettes_emerald_psychic_f:: @ 8E4DB9C
	.incbin "graphics/trainers/palettes/emerald_psychic_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4DB9C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_gentleman_front_pic:: @ 8E4DBC4
	.incbin "graphics/trainers/front_pics/emerald_gentleman_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4DBC4, 0x0300

	.align 2
gFile_graphics_trainers_palettes_emerald_gentleman:: @ 8E4DEC4
	.incbin "graphics/trainers/palettes/emerald_gentleman.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4DEC4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_elite_four_sidney_front_pic:: @ 8E4DEEC
	.incbin "graphics/trainers/front_pics/elite_four_sidney_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4DEEC, 0x0334

	.align 2
gFile_graphics_trainers_palettes_elite_four_sidney:: @ 8E4E220
	.incbin "graphics/trainers/palettes/elite_four_sidney.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4E220, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_elite_four_phoebe_front_pic:: @ 8E4E248
	.incbin "graphics/trainers/front_pics/elite_four_phoebe_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4E248, 0x0300

	.align 2
gFile_graphics_trainers_palettes_elite_four_phoebe:: @ 8E4E548
	.incbin "graphics/trainers/palettes/elite_four_phoebe.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4E548, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_roxanne_front_pic:: @ 8E4E570
	.incbin "graphics/trainers/front_pics/leader_roxanne_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4E570, 0x02EC

	.align 2
gFile_graphics_trainers_palettes_leader_roxanne:: @ 8E4E85C
	.incbin "graphics/trainers/palettes/leader_roxanne.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4E85C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_brawly_front_pic:: @ 8E4E884
	.incbin "graphics/trainers/front_pics/leader_brawly_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4E884, 0x0394

	.align 2
gFile_graphics_trainers_palettes_leader_brawly:: @ 8E4EC18
	.incbin "graphics/trainers/palettes/leader_brawly.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4EC18, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_tate_and_liza_front_pic:: @ 8E4EC40
	.incbin "graphics/trainers/front_pics/leader_tate_and_liza_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4EC40, 0x0444

	.align 2
gFile_graphics_trainers_palettes_leader_tate_and_liza:: @ 8E4F084
	.incbin "graphics/trainers/palettes/leader_tate_and_liza.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4F084, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_school_kid_m_front_pic:: @ 8E4F0AC
	.incbin "graphics/trainers/front_pics/school_kid_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4F0AC, 0x02C0

	.align 2
gFile_graphics_trainers_palettes_school_kid_m:: @ 8E4F36C
	.incbin "graphics/trainers/palettes/school_kid_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4F36C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_school_kid_f_front_pic:: @ 8E4F394
	.incbin "graphics/trainers/front_pics/school_kid_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4F394, 0x029C

	.align 2
gFile_graphics_trainers_palettes_school_kid_f:: @ 8E4F630
	.incbin "graphics/trainers/palettes/school_kid_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4F630, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_sr_and_jr_front_pic:: @ 8E4F658
	.incbin "graphics/trainers/front_pics/sr_and_jr_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4F658, 0x0470

	.align 2
gFile_graphics_trainers_palettes_sr_and_jr:: @ 8E4FAC8
	.incbin "graphics/trainers/palettes/sr_and_jr.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4FAC8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_winstrate_m_front_pic:: @ 8E4FAF0
	.incbin "graphics/trainers/front_pics/winstrate_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4FAF0, 0x03BC

	.align 2
gFile_graphics_trainers_palettes_winstrate_m:: @ 8E4FEAC
	.incbin "graphics/trainers/palettes/winstrate_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE4FEAC, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_winstrate_f_front_pic:: @ 8E4FED4
	.incbin "graphics/trainers/front_pics/winstrate_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE4FED4, 0x03CC

	.align 2
gFile_graphics_trainers_palettes_winstrate_f:: @ 8E502A0
	.incbin "graphics/trainers/palettes/winstrate_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE502A0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_expert_m_front_pic:: @ 8E502C8
	.incbin "graphics/trainers/front_pics/expert_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE502C8, 0x0340

	.align 2
gFile_graphics_trainers_palettes_expert_m:: @ 8E50608
	.incbin "graphics/trainers/palettes/expert_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE50608, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_expert_f_front_pic:: @ 8E50630
	.incbin "graphics/trainers/front_pics/expert_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE50630, 0x031C

	.align 2
gFile_graphics_trainers_palettes_expert_f:: @ 8E5094C
	.incbin "graphics/trainers/palettes/expert_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5094C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_youngster_front_pic:: @ 8E50974
	.incbin "graphics/trainers/front_pics/emerald_youngster_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE50974, 0x02A8

	.align 2
gFile_graphics_trainers_palettes_emerald_youngster:: @ 8E50C1C
	.incbin "graphics/trainers/palettes/emerald_youngster.gbapal.lz"
	@ .incbin "baserom.gba", 0xE50C1C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_steven_front_pic:: @ 8E50C44
	.incbin "graphics/trainers/front_pics/steven_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE50C44, 0x0338

	.align 2
gFile_graphics_trainers_palettes_steven:: @ 8E50F7C
	.incbin "graphics/trainers/palettes/steven.gbapal.lz"
	@ .incbin "baserom.gba", 0xE50F7C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_fisherman_front_pic:: @ 8E50FA4
	.incbin "graphics/trainers/front_pics/emerald_fisherman_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE50FA4, 0x03E4

	.align 2
gFile_graphics_trainers_palettes_emerald_fisherman:: @ 8E51388
	.incbin "graphics/trainers/palettes/emerald_fisherman.gbapal.lz"
	@ .incbin "baserom.gba", 0xE51388, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_cycling_triathlete_m_front_pic:: @ 8E513B0
	.incbin "graphics/trainers/front_pics/cycling_triathlete_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE513B0, 0x0410

	.align 2
gFile_graphics_trainers_palettes_cycling_triathlete_m:: @ 8E517C0
	.incbin "graphics/trainers/palettes/cycling_triathlete_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE517C0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_cycling_triathlete_f_front_pic:: @ 8E517E8
	.incbin "graphics/trainers/front_pics/cycling_triathlete_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE517E8, 0x040C

	.align 2
gFile_graphics_trainers_palettes_cycling_triathlete_f:: @ 8E51BF4
	.incbin "graphics/trainers/palettes/cycling_triathlete_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE51BF4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_running_triathlete_m_front_pic:: @ 8E51C1C
	.incbin "graphics/trainers/front_pics/running_triathlete_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE51C1C, 0x02B8

	.align 2
gFile_graphics_trainers_palettes_running_triathlete_m:: @ 8E51ED4
	.incbin "graphics/trainers/palettes/running_triathlete_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE51ED4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_running_triathlete_f_front_pic:: @ 8E51EFC
	.incbin "graphics/trainers/front_pics/running_triathlete_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE51EFC, 0x02A4

	.align 2
gFile_graphics_trainers_palettes_running_triathlete_f:: @ 8E521A0
	.incbin "graphics/trainers/palettes/running_triathlete_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE521A0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_swimming_triathlete_m_front_pic:: @ 8E521C8
	.incbin "graphics/trainers/front_pics/swimming_triathlete_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE521C8, 0x032C

	.align 2
gFile_graphics_trainers_palettes_swimming_triathlete_m:: @ 8E524F4
	.incbin "graphics/trainers/palettes/swimming_triathlete_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE524F4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_swimming_triathlete_f_front_pic:: @ 8E5251C
	.incbin "graphics/trainers/front_pics/swimming_triathlete_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5251C, 0x02DC

	.align 2
gFile_graphics_trainers_palettes_swimming_triathlete_f:: @ 8E527F8
	.incbin "graphics/trainers/palettes/swimming_triathlete_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE527F8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_dragon_tamer_front_pic:: @ 8E52820
	.incbin "graphics/trainers/front_pics/dragon_tamer_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE52820, 0x0354

	.align 2
gFile_graphics_trainers_palettes_dragon_tamer:: @ 8E52B74
	.incbin "graphics/trainers/palettes/dragon_tamer.gbapal.lz"
	@ .incbin "baserom.gba", 0xE52B74, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_bird_keeper_front_pic:: @ 8E52B9C
	.incbin "graphics/trainers/front_pics/emerald_bird_keeper_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE52B9C, 0x0338

	.align 2
gFile_graphics_trainers_palettes_emerald_bird_keeper:: @ 8E52ED4
	.incbin "graphics/trainers/palettes/emerald_bird_keeper.gbapal.lz"
	@ .incbin "baserom.gba", 0xE52ED4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_ninja_boy_front_pic:: @ 8E52EFC
	.incbin "graphics/trainers/front_pics/ninja_boy_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE52EFC, 0x02DC

	.align 2
gFile_graphics_trainers_palettes_ninja_boy:: @ 8E531D8
	.incbin "graphics/trainers/palettes/ninja_boy.gbapal.lz"
	@ .incbin "baserom.gba", 0xE531D8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_battle_girl_front_pic:: @ 8E53200
	.incbin "graphics/trainers/front_pics/battle_girl_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE53200, 0x0320

	.align 2
gFile_graphics_trainers_palettes_battle_girl:: @ 8E53520
	.incbin "graphics/trainers/palettes/battle_girl.gbapal.lz"
	@ .incbin "baserom.gba", 0xE53520, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_parasol_lady_front_pic:: @ 8E53548
	.incbin "graphics/trainers/front_pics/parasol_lady_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE53548, 0x0338

	.align 2
gFile_graphics_trainers_palettes_parasol_lady:: @ 8E53880
	.incbin "graphics/trainers/palettes/parasol_lady.gbapal.lz"
	@ .incbin "baserom.gba", 0xE53880, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_swimmer_f_front_pic:: @ 8E538A8
	.incbin "graphics/trainers/front_pics/emerald_swimmer_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE538A8, 0x02D0

	.align 2
gFile_graphics_trainers_palettes_emerald_swimmer_f:: @ 8E53B78
	.incbin "graphics/trainers/palettes/emerald_swimmer_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE53B78, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_picnicker_front_pic:: @ 8E53BA0
	.incbin "graphics/trainers/front_pics/emerald_picnicker_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE53BA0, 0x02E0

	.align 2
gFile_graphics_trainers_palettes_emerald_picnicker:: @ 8E53E80
	.incbin "graphics/trainers/palettes/emerald_picnicker.gbapal.lz"
	@ .incbin "baserom.gba", 0xE53E80, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_twins_front_pic:: @ 8E53EA8
	.incbin "graphics/trainers/front_pics/emerald_twins_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE53EA8, 0x03C4

	.align 2
gFile_graphics_trainers_palettes_emerald_twins:: @ 8E5426C
	.incbin "graphics/trainers/palettes/emerald_twins.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5426C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_sailor_front_pic:: @ 8E54294
	.incbin "graphics/trainers/front_pics/emerald_sailor_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE54294, 0x03B0

	.align 2
gFile_graphics_trainers_palettes_emerald_sailor:: @ 8E54644
	.incbin "graphics/trainers/palettes/emerald_sailor.gbapal.lz"
	@ .incbin "baserom.gba", 0xE54644, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_collector_front_pic:: @ 8E5466C
	.incbin "graphics/trainers/front_pics/collector_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5466C, 0x0404

	.align 2
gFile_graphics_trainers_palettes_collector:: @ 8E54A70
	.incbin "graphics/trainers/palettes/collector.gbapal.lz"
	@ .incbin "baserom.gba", 0xE54A70, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_wally_front_pic:: @ 8E54A98
	.incbin "graphics/trainers/front_pics/wally_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE54A98, 0x02D0

	.align 2
gFile_graphics_trainers_palettes_wally:: @ 8E54D68
	.incbin "graphics/trainers/palettes/wally.gbapal.lz"
	@ .incbin "baserom.gba", 0xE54D68, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_ruby_sapphire_brendan_front_pic:: @ 8E54D90
	.incbin "graphics/trainers/front_pics/ruby_sapphire_brendan_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE54D90, 0x0314

	.align 2
gFile_graphics_trainers_palettes_ruby_sapphire_brendan:: @ 8E550A4
	.incbin "graphics/trainers/palettes/ruby_sapphire_brendan.gbapal.lz"
	@ .incbin "baserom.gba", 0xE550A4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_ruby_sapphire_may_front_pic:: @ 8E550CC
	.incbin "graphics/trainers/front_pics/ruby_sapphire_may_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE550CC, 0x0300

	.align 2
gFile_graphics_trainers_palettes_ruby_sapphire_may:: @ 8E553CC
	.incbin "graphics/trainers/palettes/ruby_sapphire_may.gbapal.lz"
	@ .incbin "baserom.gba", 0xE553CC, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_pokemon_breeder_m_front_pic:: @ 8E553F4
	.incbin "graphics/trainers/front_pics/emerald_pokemon_breeder_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE553F4, 0x0330

	.align 2
gFile_graphics_trainers_palettes_emerald_pokemon_breeder_m:: @ 8E55724
	.incbin "graphics/trainers/palettes/emerald_pokemon_breeder_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE55724, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_pokemon_breeder_f_front_pic:: @ 8E5574C
	.incbin "graphics/trainers/front_pics/emerald_pokemon_breeder_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5574C, 0x0334

	.align 2
gFile_graphics_trainers_palettes_emerald_pokemon_breeder_f:: @ 8E55A80
	.incbin "graphics/trainers/palettes/emerald_pokemon_breeder_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE55A80, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_pokemon_ranger_m_front_pic:: @ 8E55AA8
	.incbin "graphics/trainers/front_pics/emerald_pokemon_ranger_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE55AA8, 0x0348

	.align 2
gFile_graphics_trainers_palettes_emerald_pokemon_ranger_m:: @ 8E55DF0
	.incbin "graphics/trainers/palettes/emerald_pokemon_ranger_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE55DF0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_pokemon_ranger_f_front_pic:: @ 8E55E18
	.incbin "graphics/trainers/front_pics/emerald_pokemon_ranger_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE55E18, 0x0334

	.align 2
gFile_graphics_trainers_palettes_emerald_pokemon_ranger_f:: @ 8E5614C
	.incbin "graphics/trainers/palettes/emerald_pokemon_ranger_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5614C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_magma_leader_maxie_front_pic:: @ 8E56174
	.incbin "graphics/trainers/front_pics/magma_leader_maxie_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE56174, 0x02F4

	.align 2
gFile_graphics_trainers_palettes_magma_leader_maxie:: @ 8E56468
	.incbin "graphics/trainers/palettes/magma_leader_maxie.gbapal.lz"
	@ .incbin "baserom.gba", 0xE56468, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_magma_grunt_m_front_pic:: @ 8E56490
	.incbin "graphics/trainers/front_pics/magma_grunt_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE56490, 0x0380

	.align 2
gFile_graphics_trainers_palettes_magma_grunt_m:: @ 8E56810
	.incbin "graphics/trainers/palettes/magma_grunt_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE56810, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_magma_grunt_f_front_pic:: @ 8E56838
	.incbin "graphics/trainers/front_pics/magma_grunt_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE56838, 0x038C

	.align 2
gFile_graphics_trainers_palettes_magma_grunt_f:: @ 8E56BC4
	.incbin "graphics/trainers/palettes/magma_grunt_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE56BC4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_lass_front_pic:: @ 8E56BEC
	.incbin "graphics/trainers/front_pics/emerald_lass_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE56BEC, 0x02D8

	.align 2
gFile_graphics_trainers_palettes_emerald_lass:: @ 8E56EC4
	.incbin "graphics/trainers/palettes/emerald_lass.gbapal.lz"
	@ .incbin "baserom.gba", 0xE56EC4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_bug_catcher_front_pic:: @ 8E56EEC
	.incbin "graphics/trainers/front_pics/emerald_bug_catcher_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE56EEC, 0x032C

	.align 2
gFile_graphics_trainers_palettes_emerald_bug_catcher:: @ 8E57218
	.incbin "graphics/trainers/palettes/emerald_bug_catcher.gbapal.lz"
	@ .incbin "baserom.gba", 0xE57218, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_hiker_front_pic:: @ 8E57240
	.incbin "graphics/trainers/front_pics/emerald_hiker_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE57240, 0x0480

	.align 2
gFile_graphics_trainers_palettes_emerald_hiker:: @ 8E576C0
	.incbin "graphics/trainers/palettes/emerald_hiker.gbapal.lz"
	@ .incbin "baserom.gba", 0xE576C0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_young_couple_front_pic:: @ 8E576E8
	.incbin "graphics/trainers/front_pics/emerald_young_couple_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE576E8, 0x03C0

	.align 2
gFile_graphics_trainers_palettes_emerald_young_couple:: @ 8E57AA8
	.incbin "graphics/trainers/palettes/emerald_young_couple.gbapal.lz"
	@ .incbin "baserom.gba", 0xE57AA8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_old_couple_front_pic:: @ 8E57AD0
	.incbin "graphics/trainers/front_pics/old_couple_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE57AD0, 0x0510

	.align 2
gFile_graphics_trainers_palettes_old_couple:: @ 8E57FE0
	.incbin "graphics/trainers/palettes/old_couple.gbapal.lz"
	@ .incbin "baserom.gba", 0xE57FE0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_emerald_sis_and_bro_front_pic:: @ 8E58008
	.incbin "graphics/trainers/front_pics/emerald_sis_and_bro_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE58008, 0x044C

	.align 2
gFile_graphics_trainers_palettes_emerald_sis_and_bro:: @ 8E58454
	.incbin "graphics/trainers/palettes/emerald_sis_and_bro.gbapal.lz"
	@ .incbin "baserom.gba", 0xE58454, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_aqua_admin_m_front_pic:: @ 8E5847C
	.incbin "graphics/trainers/front_pics/aqua_admin_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5847C, 0x03B4

	.align 2
gFile_graphics_trainers_palettes_aqua_admin_m:: @ 8E58830
	.incbin "graphics/trainers/palettes/aqua_admin_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE58830, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_aqua_admin_f_front_pic:: @ 8E58858
	.incbin "graphics/trainers/front_pics/aqua_admin_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE58858, 0x03C4

	.align 2
gFile_graphics_trainers_palettes_aqua_admin_f:: @ 8E58C1C
	.incbin "graphics/trainers/palettes/aqua_admin_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE58C1C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_magma_admin_front_pic:: @ 8E58C44
	.incbin "graphics/trainers/front_pics/magma_admin_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE58C44, 0x03D8

	.align 2
gFile_graphics_trainers_palettes_magma_admin:: @ 8E5901C
	.incbin "graphics/trainers/palettes/magma_admin.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5901C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_ruby_magma_admin_f_front_pic:: @ 8E59044
	.incbin "graphics/trainers/front_pics/ruby_magma_admin_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE59044, 0x03B0

	.align 2
gFile_graphics_trainers_palettes_ruby_magma_admin_f:: @ 8E593F4
	.incbin "graphics/trainers/palettes/ruby_magma_admin_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE593F4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_wattson_front_pic:: @ 8E5941C
	.incbin "graphics/trainers/front_pics/leader_wattson_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5941C, 0x0348

	.align 2
gFile_graphics_trainers_palettes_leader_wattson:: @ 8E59764
	.incbin "graphics/trainers/palettes/leader_wattson.gbapal.lz"
	@ .incbin "baserom.gba", 0xE59764, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_flannery_front_pic:: @ 8E5978C
	.incbin "graphics/trainers/front_pics/leader_flannery_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5978C, 0x0380

	.align 2
gFile_graphics_trainers_palettes_leader_flannery:: @ 8E59B0C
	.incbin "graphics/trainers/palettes/leader_flannery.gbapal.lz"
	@ .incbin "baserom.gba", 0xE59B0C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_norman_front_pic:: @ 8E59B34
	.incbin "graphics/trainers/front_pics/leader_norman_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE59B34, 0x033C

	.align 2
gFile_graphics_trainers_palettes_leader_norman:: @ 8E59E70
	.incbin "graphics/trainers/palettes/leader_norman.gbapal.lz"
	@ .incbin "baserom.gba", 0xE59E70, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_winona_front_pic:: @ 8E59E98
	.incbin "graphics/trainers/front_pics/leader_winona_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE59E98, 0x0380

	.align 2
gFile_graphics_trainers_palettes_leader_winona:: @ 8E5A218
	.incbin "graphics/trainers/palettes/leader_winona.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5A218, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_ruby_sapphire_champion_wallace_front_pic:: @ 8E5A240
	.incbin "graphics/trainers/front_pics/ruby_sapphire_champion_wallace_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5A240, 0x0378

	.align 2
gFile_graphics_trainers_palettes_champion_wallace:: @ 8E5A5B8
	.incbin "graphics/trainers/palettes/champion_wallace.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5A5B8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_elite_four_glacia_front_pic:: @ 8E5A5E0
	.incbin "graphics/trainers/front_pics/elite_four_glacia_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5A5E0, 0x0384

	.align 2
gFile_graphics_trainers_palettes_elite_four_glacia:: @ 8E5A964
	.incbin "graphics/trainers/palettes/elite_four_glacia.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5A964, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_elite_four_drake_front_pic:: @ 8E5A98C
	.incbin "graphics/trainers/front_pics/elite_four_drake_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5A98C, 0x03A8

	.align 2
gFile_graphics_trainers_palettes_elite_four_drake:: @ 8E5AD34
	.incbin "graphics/trainers/palettes/elite_four_drake.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5AD34, 0x0028


	.align 2
gFile_graphics_trainers_front_pics_youngster_front_pic:: @ 8E5AD5C
	.incbin "graphics/trainers/front_pics/youngster_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5AD5C, 0x02A0

	.align 2
gFile_graphics_trainers_palettes_youngster:: @ 8E5AFFC
	.incbin "graphics/trainers/palettes/youngster.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5AFFC, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_bug_catcher_front_pic:: @ 8E5B024
	.incbin "graphics/trainers/front_pics/bug_catcher_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5B024, 0x0348

	.align 2
gFile_graphics_trainers_palettes_bug_catcher:: @ 8E5B36C
	.incbin "graphics/trainers/palettes/bug_catcher.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5B36C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_lass_front_pic:: @ 8E5B394
	.incbin "graphics/trainers/front_pics/lass_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5B394, 0x02EC

	.align 2
gFile_graphics_trainers_palettes_lass:: @ 8E5B680
	.incbin "graphics/trainers/palettes/lass.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5B680, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_sailor_front_pic:: @ 8E5B6A8
	.incbin "graphics/trainers/front_pics/sailor_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5B6A8, 0x0320

	.align 2
gFile_graphics_trainers_palettes_sailor:: @ 8E5B9C8
	.incbin "graphics/trainers/palettes/sailor.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5B9C8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_camper_front_pic:: @ 8E5B9F0
	.incbin "graphics/trainers/front_pics/camper_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5B9F0, 0x02E0

	.align 2
gFile_graphics_trainers_palettes_camper:: @ 8E5BCD0
	.incbin "graphics/trainers/palettes/camper.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5BCD0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_picnicker_front_pic:: @ 8E5BCF8
	.incbin "graphics/trainers/front_pics/picnicker_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5BCF8, 0x02E8

	.align 2
gFile_graphics_trainers_palettes_picnicker:: @ 8E5BFE0
	.incbin "graphics/trainers/palettes/picnicker.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5BFE0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_pokemaniac_front_pic:: @ 8E5C008
	.incbin "graphics/trainers/front_pics/pokemaniac_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5C008, 0x03BC

	.align 2
gFile_graphics_trainers_palettes_pokemaniac:: @ 8E5C3C4
	@ .incbin "graphics/trainers/palettes/pokemaniac.gbapal.lz"
	.incbin "baserom.gba", 0xE5C3C4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_super_nerd_front_pic:: @ 8E5C3EC
	.incbin "graphics/trainers/front_pics/super_nerd_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5C3EC, 0x0318

	.align 2
gFile_graphics_trainers_palettes_super_nerd:: @ 8E5C704
	.incbin "graphics/trainers/palettes/super_nerd.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5C704, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_hiker_front_pic:: @ 8E5C72C
	.incbin "graphics/trainers/front_pics/hiker_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5C72C, 0x0470

	.align 2
gFile_graphics_trainers_palettes_hiker:: @ 8E5CB9C
	.incbin "graphics/trainers/palettes/hiker.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5CB9C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_biker_front_pic:: @ 8E5CBC4
	.incbin "graphics/trainers/front_pics/biker_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5CBC4, 0x0568

	.align 2
gFile_graphics_trainers_palettes_biker:: @ 8E5D12C
	.incbin "graphics/trainers/palettes/biker.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5D12C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_burglar_front_pic:: @ 8E5D154
	.incbin "graphics/trainers/front_pics/burglar_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5D154, 0x034C

	.align 2
gFile_graphics_trainers_palettes_burglar:: @ 8E5D4A0
	.incbin "graphics/trainers/palettes/burglar.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5D4A0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_engineer_front_pic:: @ 8E5D4C8
	.incbin "graphics/trainers/front_pics/engineer_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5D4C8, 0x040C

	.align 2
gFile_graphics_trainers_palettes_engineer:: @ 8E5D8D4
	.incbin "graphics/trainers/palettes/engineer.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5D8D4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_fisherman_front_pic:: @ 8E5D8FC
	.incbin "graphics/trainers/front_pics/fisherman_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5D8FC, 0x03AC

	.align 2
gFile_graphics_trainers_palettes_fisherman:: @ 8E5DCA8
	.incbin "graphics/trainers/palettes/fisherman.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5DCA8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_swimmer_m_front_pic:: @ 8E5DCD0
	.incbin "graphics/trainers/front_pics/swimmer_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5DCD0, 0x02D8

	.align 2
gFile_graphics_trainers_palettes_swimmer_m:: @ 8E5DFA8
	.incbin "graphics/trainers/palettes/swimmer_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5DFA8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_roughneck_front_pic:: @ 8E5DFD0
	.incbin "graphics/trainers/front_pics/roughneck_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5DFD0, 0x05C8

	.align 2
gFile_graphics_trainers_palettes_roughneck:: @ 8E5E598
	.incbin "graphics/trainers/palettes/roughneck.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5E598, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_gamer_front_pic:: @ 8E5E5C0
	.incbin "graphics/trainers/front_pics/gamer_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5E5C0, 0x0394

	.align 2
gFile_graphics_trainers_palettes_gamer:: @ 8E5E954
	.incbin "graphics/trainers/palettes/gamer.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5E954, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_beauty_front_pic:: @ 8E5E97C
	.incbin "graphics/trainers/front_pics/beauty_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5E97C, 0x035C

	.align 2
gFile_graphics_trainers_palettes_beauty:: @ 8E5ECD8
	.incbin "graphics/trainers/palettes/beauty.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5ECD8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_swimmer_f_front_pic:: @ 8E5ED00
	.incbin "graphics/trainers/front_pics/swimmer_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5ED00, 0x02EC

	.align 2
gFile_graphics_trainers_palettes_swimmer_f:: @ 8E5EFEC
	.incbin "graphics/trainers/palettes/swimmer_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5EFEC, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_psychic_m_front_pic:: @ 8E5F014
	.incbin "graphics/trainers/front_pics/psychic_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5F014, 0x0360

	.align 2
gFile_graphics_trainers_palettes_psychic_m:: @ 8E5F374
	.incbin "graphics/trainers/palettes/psychic_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5F374, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_rocker_front_pic:: @ 8E5F39C
	.incbin "graphics/trainers/front_pics/rocker_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5F39C, 0x045C

	.align 2
gFile_graphics_trainers_palettes_rocker:: @ 8E5F7F8
	.incbin "graphics/trainers/palettes/rocker.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5F7F8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_juggler_front_pic:: @ 8E5F820
	.incbin "graphics/trainers/front_pics/juggler_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5F820, 0x043C

	.align 2
gFile_graphics_trainers_palettes_juggler:: @ 8E5FC5C
	.incbin "graphics/trainers/palettes/juggler.gbapal.lz"
	@ .incbin "baserom.gba", 0xE5FC5C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_tamer_front_pic:: @ 8E5FC84
	.incbin "graphics/trainers/front_pics/tamer_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE5FC84, 0x03B4

	.align 2
gFile_graphics_trainers_palettes_tamer:: @ 8E60038
	.incbin "graphics/trainers/palettes/tamer.gbapal.lz"
	@ .incbin "baserom.gba", 0xE60038, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_bird_keeper_front_pic:: @ 8E60060
	.incbin "graphics/trainers/front_pics/bird_keeper_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE60060, 0x03C4

	.align 2
gFile_graphics_trainers_palettes_bird_keeper:: @ 8E60424
	.incbin "graphics/trainers/palettes/bird_keeper.gbapal.lz"
	@ .incbin "baserom.gba", 0xE60424, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_black_belt_front_pic:: @ 8E6044C
	.incbin "graphics/trainers/front_pics/black_belt_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE6044C, 0x0420

	.align 2
gFile_graphics_trainers_palettes_black_belt2:: @ 8E6086C
	.incbin "graphics/trainers/palettes/black_belt.gbapal.lz"
	@ .incbin "baserom.gba", 0xE6086C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_blue_1_front_pic:: @ 8E60894
	.incbin "graphics/trainers/front_pics/blue_1_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE60894, 0x02B8

	.align 2
gFile_graphics_trainers_palettes_blue_1:: @ 8E60B4C
	.incbin "graphics/trainers/palettes/blue_1.gbapal.lz"
	@ .incbin "baserom.gba", 0xE60B4C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_scientist_front_pic:: @ 8E60B74
	.incbin "graphics/trainers/front_pics/scientist_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE60B74, 0x03DC

	.align 2
gFile_graphics_trainers_palettes_scientist:: @ 8E60F50
	.incbin "graphics/trainers/palettes/scientist.gbapal.lz"
	@ .incbin "baserom.gba", 0xE60F50, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_giovanni_front_pic:: @ 8E60F78
	.incbin "graphics/trainers/front_pics/giovanni_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE60F78, 0x0310

	.align 2
gFile_graphics_trainers_palettes_giovanni:: @ 8E61288
	.incbin "graphics/trainers/palettes/giovanni.gbapal.lz"
	@ .incbin "baserom.gba", 0xE61288, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_rocket_grunt_m_front_pic:: @ 8E612B0
	.incbin "graphics/trainers/front_pics/rocket_grunt_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE612B0, 0x0334

	.align 2
gFile_graphics_trainers_palettes_rocket_grunt_m:: @ 8E615E4
	.incbin "graphics/trainers/palettes/rocket_grunt_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE615E4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_cool_trainer_m_front_pic:: @ 8E6160C
	.incbin "graphics/trainers/front_pics/cool_trainer_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE6160C, 0x02D0

	.align 2
gFile_graphics_trainers_palettes_cool_trainer_m:: @ 8E618DC
	.incbin "graphics/trainers/palettes/cool_trainer_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE618DC, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_cool_trainer_f_front_pic:: @ 8E61904
	.incbin "graphics/trainers/front_pics/cool_trainer_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE61904, 0x0318

	.align 2
gFile_graphics_trainers_palettes_cool_trainer_f:: @ 8E61C1C
	.incbin "graphics/trainers/palettes/cool_trainer_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE61C1C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_elite_four_lorelei_front_pic:: @ 8E61C44
	.incbin "graphics/trainers/front_pics/elite_four_lorelei_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE61C44, 0x032C

	.align 2
gFile_graphics_trainers_palettes_elite_four_lorelei:: @ 8E61F70
	.incbin "graphics/trainers/palettes/elite_four_lorelei.gbapal.lz"
	@ .incbin "baserom.gba", 0xE61F70, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_elite_four_bruno_front_pic:: @ 8E61F98
	.incbin "graphics/trainers/front_pics/elite_four_bruno_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE61F98, 0x044C

	.align 2
gFile_graphics_trainers_palettes_elite_four_bruno:: @ 8E623E4
	.incbin "graphics/trainers/palettes/elite_four_bruno.gbapal.lz"
	@ .incbin "baserom.gba", 0xE623E4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_elite_four_agatha_front_pic:: @ 8E6240C
	.incbin "graphics/trainers/front_pics/elite_four_agatha_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE6240C, 0x031C

	.align 2
gFile_graphics_trainers_palettes_elite_four_agatha:: @ 8E62728
	.incbin "graphics/trainers/palettes/elite_four_agatha.gbapal.lz"
	@ .incbin "baserom.gba", 0xE62728, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_elite_four_lance_front_pic:: @ 8E62750
	.incbin "graphics/trainers/front_pics/elite_four_lance_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE62750, 0x03C8

	.align 2
gFile_graphics_trainers_palettes_elite_four_lance:: @ 8E62B18
	.incbin "graphics/trainers/palettes/elite_four_lance.gbapal.lz"
	@ .incbin "baserom.gba", 0xE62B18, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_brock_front_pic:: @ 8E62B40
	.incbin "graphics/trainers/front_pics/leader_brock_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE62B40, 0x034C

	.align 2
gFile_graphics_trainers_palettes_leader_brock:: @ 8E62E8C
	.incbin "graphics/trainers/palettes/leader_brock.gbapal.lz"
	@ .incbin "baserom.gba", 0xE62E8C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_misty_front_pic:: @ 8E62EB4
	.incbin "graphics/trainers/front_pics/leader_misty_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE62EB4, 0x0300

	.align 2
gFile_graphics_trainers_palettes_leader_misty:: @ 8E631B4
	.incbin "graphics/trainers/palettes/leader_misty.gbapal.lz"
	@ .incbin "baserom.gba", 0xE631B4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_lt_surge_front_pic:: @ 8E631DC
	.incbin "graphics/trainers/front_pics/leader_lt_surge_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE631DC, 0x0390

	.align 2
gFile_graphics_trainers_palettes_leader_lt_surge:: @ 8E6356C
	.incbin "graphics/trainers/palettes/leader_lt_surge.gbapal.lz"
	@ .incbin "baserom.gba", 0xE6356C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_erika_front_pic:: @ 8E63594
	.incbin "graphics/trainers/front_pics/leader_erika_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE63594, 0x02F4

	.align 2
gFile_graphics_trainers_palettes_leader_erika:: @ 8E63888
	.incbin "graphics/trainers/palettes/leader_erika.gbapal.lz"
	@ .incbin "baserom.gba", 0xE63888, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_koga_front_pic:: @ 8E638B0
	.incbin "graphics/trainers/front_pics/leader_koga_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE638B0, 0x0368

	.align 2
gFile_graphics_trainers_palettes_leader_koga:: @ 8E63C18
	.incbin "graphics/trainers/palettes/leader_koga.gbapal.lz"
	@ .incbin "baserom.gba", 0xE63C18, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_blaine_front_pic:: @ 8E63C40
	.incbin "graphics/trainers/front_pics/leader_blaine_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE63C40, 0x040C

	.align 2
gFile_graphics_trainers_palettes_leader_blaine:: @ 8E6404C
	.incbin "graphics/trainers/palettes/leader_blaine.gbapal.lz"
	@ .incbin "baserom.gba", 0xE6404C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leader_sabrina_front_pic:: @ 8E64074
	.incbin "graphics/trainers/front_pics/leader_sabrina_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE64074, 0x0308

	.align 2
gFile_graphics_trainers_palettes_leader_sabrina:: @ 8E6437C
	.incbin "graphics/trainers/palettes/leader_sabrina.gbapal.lz"
	@ .incbin "baserom.gba", 0xE6437C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_gentleman_front_pic:: @ 8E643A4
	.incbin "graphics/trainers/front_pics/gentleman_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE643A4, 0x0338

	.align 2
gFile_graphics_trainers_palettes_gentleman:: @ 8E646DC
	.incbin "graphics/trainers/palettes/gentleman.gbapal.lz"
	@ .incbin "baserom.gba", 0xE646DC, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_blue_2_front_pic:: @ 8E64704
	.incbin "graphics/trainers/front_pics/blue_2_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE64704, 0x02F4

	.align 2
gFile_graphics_trainers_palettes_blue_2:: @ 8E649F8
	.incbin "graphics/trainers/palettes/blue_2.gbapal.lz"
	@ .incbin "baserom.gba", 0xE649F8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_champion_blue_front_pic:: @ 8E64A20
	.incbin "graphics/trainers/front_pics/champion_blue_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE64A20, 0x02FC

	.align 2
gFile_graphics_trainers_palettes_champion_blue:: @ 8E64D1C
	.incbin "graphics/trainers/palettes/champion_blue.gbapal.lz"
	@ .incbin "baserom.gba", 0xE64D1C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_channeler_front_pic:: @ 8E64D44
	.incbin "graphics/trainers/front_pics/channeler_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE64D44, 0x03D8

	.align 2
gFile_graphics_trainers_palettes_channeler:: @ 8E6511C
	.incbin "graphics/trainers/palettes/channeler.gbapal.lz"
	@ .incbin "baserom.gba", 0xE6511C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_twins_front_pic:: @ 8E65144
	.incbin "graphics/trainers/front_pics/twins_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE65144, 0x0350

	.align 2
gFile_graphics_trainers_palettes_twins:: @ 8E65494
	.incbin "graphics/trainers/palettes/twins.gbapal.lz"
	@ .incbin "baserom.gba", 0xE65494, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_cool_couple_front_pic:: @ 8E654BC
	.incbin "graphics/trainers/front_pics/cool_couple_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE654BC, 0x04E0

	.align 2
gFile_graphics_trainers_palettes_cool_couple:: @ 8E6599C
	.incbin "graphics/trainers/palettes/cool_couple.gbapal.lz"
	@ .incbin "baserom.gba", 0xE6599C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_young_couple_front_pic:: @ 8E659C4
	.incbin "graphics/trainers/front_pics/young_couple_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE659C4, 0x044C

	.align 2
gFile_graphics_trainers_palettes_young_couple:: @ 8E65E10
	.incbin "graphics/trainers/palettes/young_couple.gbapal.lz"
	@ .incbin "baserom.gba", 0xE65E10, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_crush_kin_front_pic:: @ 8E65E38
	.incbin "graphics/trainers/front_pics/crush_kin_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE65E38, 0x05A0

	.align 2
gFile_graphics_trainers_palettes_crush_kin:: @ 8E663D8
	.incbin "graphics/trainers/palettes/crush_kin.gbapal.lz"
	@ .incbin "baserom.gba", 0xE663D8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_sis_and_bro_front_pic:: @ 8E66400
	.incbin "graphics/trainers/front_pics/sis_and_bro_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE66400, 0x0460

	.align 2
gFile_graphics_trainers_palettes_sis_and_bro:: @ 8E66860
	.incbin "graphics/trainers/palettes/sis_and_bro.gbapal.lz"
	@ .incbin "baserom.gba", 0xE66860, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_oak_front_pic:: @ 8E66888
	.incbin "graphics/trainers/front_pics/oak_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE66888, 0x036C

	.align 2
gFile_graphics_trainers_palettes_oak:: @ 8E66BF4
	.incbin "graphics/trainers/palettes/oak.gbapal.lz"
	@ .incbin "baserom.gba", 0xE66BF4, 0x0028


	.align 2
gFile_graphics_trainers_front_pics_ruby_sapphire_brendan_front_pic2:: @ 8E66C1C
	.incbin "graphics/trainers/front_pics/ruby_sapphire_brendan_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE66C1C, 0x0314

	.align 2
gFile_graphics_trainers_palettes_ruby_sapphire_brendan2:: @ 8E66F30
	.incbin "graphics/trainers/palettes/ruby_sapphire_brendan.gbapal.lz"
	@ .incbin "baserom.gba", 0xE66F30, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_ruby_sapphire_may_front_pic2:: @ 8E66F58
	.incbin "graphics/trainers/front_pics/ruby_sapphire_may_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE66F58, 0x0300

	.align 2
gFile_graphics_trainers_palettes_ruby_sapphire_may2:: @ 8E67258
	.incbin "graphics/trainers/palettes/ruby_sapphire_may.gbapal.lz"
	@ .incbin "baserom.gba", 0xE67258, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_red_front_pic:: @ 8E67280
	.incbin "graphics/trainers/front_pics/red_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE67280, 0x030C

	.align 2
gFile_graphics_trainers_palettes_red:: @ 8E6758C
	.incbin "graphics/trainers/palettes/red.gbapal.lz"
	@ .incbin "baserom.gba", 0xE6758C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_leaf_front_pic:: @ 8E675B4
	.incbin "graphics/trainers/front_pics/leaf_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE675B4, 0x033C

	.align 2
gFile_graphics_trainers_palettes_leaf:: @ 8E678F0
	.incbin "graphics/trainers/palettes/leaf.gbapal.lz"
	@ .incbin "baserom.gba", 0xE678F0, 0x0028


	.align 2
gFile_graphics_trainers_front_pics_rocket_grunt_f_front_pic:: @ 8E67918
	.incbin "graphics/trainers/front_pics/rocket_grunt_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE67918, 0x0318

	.align 2
gFile_graphics_trainers_palettes_rocket_grunt_f:: @ 8E67C30
	.incbin "graphics/trainers/palettes/rocket_grunt_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE67C30, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_psychic_f_front_pic:: @ 8E67C58
	.incbin "graphics/trainers/front_pics/psychic_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE67C58, 0x03A0

	.align 2
gFile_graphics_trainers_palettes_psychic_f:: @ 8E67FF8
	.incbin "graphics/trainers/palettes/psychic_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE67FF8, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_crush_girl_front_pic:: @ 8E68020
	.incbin "graphics/trainers/front_pics/crush_girl_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE68020, 0x030C

	.align 2
gFile_graphics_trainers_palettes_crush_girl:: @ 8E6832C
	.incbin "graphics/trainers/palettes/crush_girl.gbapal.lz"
	@ .incbin "baserom.gba", 0xE6832C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_tuber_front_pic:: @ 8E68354
	.incbin "graphics/trainers/front_pics/tuber_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE68354, 0x0304

	.align 2
gFile_graphics_trainers_palettes_tuber:: @ 8E68658
	.incbin "graphics/trainers/palettes/tuber.gbapal.lz"
	@ .incbin "baserom.gba", 0xE68658, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_pokemon_breeder_front_pic:: @ 8E68680
	.incbin "graphics/trainers/front_pics/pokemon_breeder_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE68680, 0x0340

	.align 2
gFile_graphics_trainers_palettes_pokemon_breeder:: @ 8E689C0
	.incbin "graphics/trainers/palettes/pokemon_breeder.gbapal.lz"
	@ .incbin "baserom.gba", 0xE689C0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_pokemon_ranger_m_front_pic:: @ 8E689E8
	.incbin "graphics/trainers/front_pics/pokemon_ranger_m_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE689E8, 0x0360

	.align 2
gFile_graphics_trainers_palettes_pokemon_ranger_m:: @ 8E68D48
	.incbin "graphics/trainers/palettes/pokemon_ranger_m.gbapal.lz"
	@ .incbin "baserom.gba", 0xE68D48, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_pokemon_ranger_f_front_pic:: @ 8E68D70
	.incbin "graphics/trainers/front_pics/pokemon_ranger_f_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE68D70, 0x0334

	.align 2
gFile_graphics_trainers_palettes_pokemon_ranger_f:: @ 8E690A4
	.incbin "graphics/trainers/palettes/pokemon_ranger_f.gbapal.lz"
	@ .incbin "baserom.gba", 0xE690A4, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_aroma_lady_front_pic:: @ 8E690CC
	.incbin "graphics/trainers/front_pics/aroma_lady_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE690CC, 0x0350

	.align 2
gFile_graphics_trainers_palettes_aroma_lady:: @ 8E6941C
	.incbin "graphics/trainers/palettes/aroma_lady.gbapal.lz"
	@ .incbin "baserom.gba", 0xE6941C, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_ruin_maniac_front_pic:: @ 8E69444
	.incbin "graphics/trainers/front_pics/ruin_maniac_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE69444, 0x040C

	.align 2
gFile_graphics_trainers_palettes_ruin_maniac:: @ 8E69850
	.incbin "graphics/trainers/palettes/ruin_maniac.gbapal.lz"
	@ .incbin "baserom.gba", 0xE69850, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_lady_front_pic:: @ 8E69878
	.incbin "graphics/trainers/front_pics/lady_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE69878, 0x0328

	.align 2
gFile_graphics_trainers_palettes_lady:: @ 8E69BA0
	.incbin "graphics/trainers/palettes/lady.gbapal.lz"
	@ .incbin "baserom.gba", 0xE69BA0, 0x0028

	.align 2
gFile_graphics_trainers_front_pics_painter_front_pic:: @ 8E69BC8
	.incbin "graphics/trainers/front_pics/painter_front_pic.4bpp.lz"
	@ .incbin "baserom.gba", 0xE69BC8, 0x02CC

	.align 2
gFile_graphics_trainers_palettes_painter:: @ 8E69E94
	.incbin "graphics/trainers/palettes/painter.gbapal.lz"
	@ .incbin "baserom.gba", 0xE69E94, 0x0028

	
	.align 2
gFile_graphics_trainers_back_pics_red_back_pic:: @ 8E69EBC
	.incbin "graphics/trainers/back_pics/red_back_pic.4bpp"
	@ .incbin "baserom.gba", 0xE69EBC, 0x2800

	.align 2
gFile_graphics_trainers_back_pics_leaf_back_pic:: @ 8E6C6BC
	.incbin "graphics/trainers/back_pics/leaf_back_pic.4bpp"
	@ .incbin "baserom.gba", 0xE6C6BC, 0x2800

	.align 2
gFile_graphics_trainers_back_pics_pokedude_back_pic:: @ 8E6EEBC
	.incbin "graphics/trainers/back_pics/pokedude_back_pic.4bpp"
	@ .incbin "baserom.gba", 0xE6EEBC, 0x2000

	.align 2
gFile_graphics_trainers_back_pics_old_man_back_pic:: @ 8E70EBC
	.incbin "graphics/trainers/back_pics/old_man_back_pic.4bpp"
	@ .incbin "baserom.gba", 0xE70EBC, 0x2000

	.align 2
gFile_graphics_trainers_back_pics_ruby_sapphire_brendan_back_pic:: @ 8E72EBC
	.incbin "graphics/trainers/back_pics/ruby_sapphire_brendan_back_pic.4bpp"
	@ .incbin "baserom.gba", 0xE72EBC, 0x2000

	.align 2
gFile_graphics_trainers_back_pics_ruby_sapphire_may_back_pic:: @ 8E74EBC
	.incbin "graphics/trainers/back_pics/ruby_sapphire_may_back_pic.4bpp"
	@ .incbin "baserom.gba", 0xE74EBC, 0x2000


	.align 2
gFile_graphics_trainers_palettes_leaf_back_pic:: @ 8E76EBC
	.incbin "graphics/trainers/palettes/leaf_back_pic.gbapal.lz"
	@ .incbin "baserom.gba", 0xE76EBC, 0x0028

	.align 2
gFile_graphics_trainers_palettes_red_back_pic:: @ 8E76EE4
	.incbin "graphics/trainers/palettes/red_back_pic.gbapal.lz"
	@ .incbin "baserom.gba", 0xE76EE4, 0x0028

	.align 2
gFile_graphics_trainers_palettes_pokedude_back_pic:: @ 8E76F0C
	.incbin "graphics/trainers/palettes/pokedude_back_pic.gbapal.lz"
	@ .incbin "baserom.gba", 0xE76F0C, 0x0028

	.align 2
gFile_graphics_trainers_palettes_old_man_back_pic:: @ 8E76F34
	.incbin "graphics/trainers/palettes/old_man_back_pic.gbapal.lz"
	@ .incbin "baserom.gba", 0xE76F34, 0x0028

	.align 2
gFile_graphics_pokemon_icons_question_mark_icon:: @ 8E76F5C
	.incbin "graphics/pokemon/icons/question_mark_icon.4bpp"
	@ .incbin "baserom.gba", 0xE76F5C, 0x0400

	.align 2
gFile_graphics_pokemon_footprints_question_mark_footprint:: @ 8E7735C
	.incbin "graphics/pokemon/footprints/question_mark_footprint.1bpp"
	@ .incbin "baserom.gba", 0xE7735C, 0x0020


	.align 2
	@ THIS IS ./graphics/battle_transitions/vs_frame.4bpp.lz
gUnknown_8E7737C:: @ 8E7737C
	.incbin "baserom.gba", 0xE7737C, 0xE8

gUnknown_8E77464:: @ 8E77464
	.incbin "baserom.gba", 0xE77464, 0x10C

gUnknown_8E77570:: @ 8E77570
	.incbin "baserom.gba", 0xE77570, 0x28

gUnknown_8E77598:: @ 8E77598
	.incbin "baserom.gba", 0xE77598, 0x1DBC

gUnknown_8E79354:: @ 8E79354
	.incbin "baserom.gba", 0xE79354, 0x17C

gUnknown_8E794D0:: @ 8E794D0
	.incbin "baserom.gba", 0xE794D0, 0x52C

gUnknown_8E799FC:: @ 8E799FC
	.incbin "baserom.gba", 0xE799FC, 0x20B4

gUnknown_8E7BAB0:: @ 8E7BAB0
	.incbin "baserom.gba", 0xE7BAB0, 0x3744

gUnknown_8E7F1F4:: @ 8E7F1F4
	.incbin "baserom.gba", 0xE7F1F4, 0x2B8

gUnknown_8E7F4AC:: @ 8E7F4AC
	.incbin "baserom.gba", 0xE7F4AC, 0x1E4

gUnknown_8E7F690:: @ 8E7F690
	.incbin "baserom.gba", 0xE7F690, 0x1E4

gUnknown_8E7F874:: @ 8E7F874
	.incbin "baserom.gba", 0xE7F874, 0x1158

gUnknown_8E809CC:: @ 8E809CC
	.incbin "baserom.gba", 0xE809CC, 0x1320

gUnknown_8E81CEC:: @ 8E81CEC
	.incbin "baserom.gba", 0xE81CEC, 0x28

gUnknown_8E81D14:: @ 8E81D14
	.incbin "baserom.gba", 0xE81D14, 0x2D0

gUnknown_8E81FE4:: @ 8E81FE4
	.incbin "baserom.gba", 0xE81FE4, 0x2D4

gUnknown_8E822B8:: @ 8E822B8
	.incbin "baserom.gba", 0xE822B8, 0x448

gUnknown_8E82700:: @ 8E82700
	.incbin "baserom.gba", 0xE82700, 0x2C8

gUnknown_8E829C8:: @ 8E829C8
	.incbin "baserom.gba", 0xE829C8, 0xE8

gUnknown_8E82AB0:: @ 8E82AB0
	.incbin "baserom.gba", 0xE82AB0, 0x61C

gUnknown_8E830CC:: @ 8E830CC
	.incbin "baserom.gba", 0xE830CC, 0x1F4

gUnknown_8E832C0:: @ 8E832C0
	.incbin "baserom.gba", 0xE832C0, 0x184

gUnknown_8E83444:: @ 8E83444
	.incbin "baserom.gba", 0xE83444, 0x170

gUnknown_8E835B4:: @ 8E835B4
	.incbin "baserom.gba", 0xE835B4, 0x50

gUnknown_8E83604:: @ 8E83604
	.incbin "baserom.gba", 0xE83604, 0xFD4

gUnknown_8E845D8:: @ 8E845D8
	.incbin "baserom.gba", 0xE845D8, 0x44C

gUnknown_8E84A24:: @ 8E84A24
	.incbin "baserom.gba", 0xE84A24, 0x14C

gUnknown_8E84B70:: @ 8E84B70
	.incbin "baserom.gba", 0xE84B70, 0x140

gUnknown_8E84CB0:: @ 8E84CB0
	.incbin "baserom.gba", 0xE84CB0, 0x70

gUnknown_8E84D20:: @ 8E84D20
	.incbin "baserom.gba", 0xE84D20, 0x200

gUnknown_8E84F20:: @ 8E84F20
	.incbin "baserom.gba", 0xE84F20, 0x148

gUnknown_8E85068:: @ 8E85068
	.incbin "baserom.gba", 0xE85068, 0x28

gUnknown_8E85090:: @ 8E85090
	.incbin "baserom.gba", 0xE85090, 0x378

gUnknown_8E85408:: @ 8E85408
	.incbin "baserom.gba", 0xE85408, 0x50

gUnknown_8E85458:: @ 8E85458
	.incbin "baserom.gba", 0xE85458, 0x578

gUnknown_8E859D0:: @ 8E859D0
	.incbin "baserom.gba", 0xE859D0, 0x1D4

gUnknown_8E85BA4:: @ 8E85BA4
	.incbin "baserom.gba", 0xE85BA4, 0x50

gUnknown_8E85BF4:: @ 8E85BF4
	.incbin "baserom.gba", 0xE85BF4, 0x50

gUnknown_8E85C44:: @ 8E85C44
	.incbin "baserom.gba", 0xE85C44, 0x184

gUnknown_8E85DC8:: @ 8E85DC8
	.incbin "baserom.gba", 0xE85DC8, 0x134

gUnknown_8E85EFC:: @ 8E85EFC
	.incbin "baserom.gba", 0xE85EFC, 0x13C

gUnknown_8E86038:: @ 8E86038
	.incbin "baserom.gba", 0xE86038, 0x138

gUnknown_8E86170:: @ 8E86170
	.incbin "baserom.gba", 0xE86170, 0xD0

gUnknown_8E86240:: @ 8E86240
	.incbin "baserom.gba", 0xE86240, 0x9A8

gUnknown_8E86BE8:: @ 8E86BE8
	.incbin "baserom.gba", 0xE86BE8, 0x184

gUnknown_8E86D6C:: @ 8E86D6C
	.incbin "baserom.gba", 0xE86D6C, 0x22C

gUnknown_8E86F98:: @ 8E86F98
	.incbin "baserom.gba", 0xE86F98, 0xCB7C

gUnknown_8E93B14:: @ 8E93B14
	.incbin "baserom.gba", 0xE93B14, 0x24

gUnknown_8E93B38:: @ 8E93B38
	.incbin "baserom.gba", 0xE93B38, 0x2264

gUnknown_8E95D9C:: @ 8E95D9C
	.incbin "baserom.gba", 0xE95D9C, 0x20

gUnknown_8E95DBC:: @ 8E95DBC
	.incbin "baserom.gba", 0xE95DBC, 0x20

gUnknown_8E95DDC:: @ 8E95DDC
	.incbin "baserom.gba", 0xE95DDC, 0x2000

gUnknown_8E97DDC:: @ 8E97DDC
	.incbin "baserom.gba", 0xE97DDC, 0x20

gUnknown_8E97DFC:: @ 8E97DFC
	.incbin "baserom.gba", 0xE97DFC, 0xC8

gUnknown_8E97EC4:: @ 8E97EC4
	.incbin "baserom.gba", 0xE97EC4, 0x120

gUnknown_8E97FE4:: @ 8E97FE4
	.incbin "baserom.gba", 0xE97FE4, 0x40

gUnknown_8E98024:: @ 8E98024
	.incbin "baserom.gba", 0xE98024, 0xC0

gUnknown_8E980E4:: @ 8E980E4
	.incbin "baserom.gba", 0xE980E4, 0x1D8

gUnknown_8E982BC:: @ 8E982BC
	.incbin "baserom.gba", 0xE982BC, 0xDC

gUnknown_8E98398:: @ 8E98398
	.incbin "baserom.gba", 0xE98398, 0xC0

gUnknown_8E98458:: @ 8E98458
	.incbin "baserom.gba", 0xE98458, 0xCC0

gUnknown_8E99118:: @ 8E99118
	.incbin "baserom.gba", 0xE99118, 0xE0

gUnknown_8E991F8:: @ 8E991F8
	.incbin "baserom.gba", 0xE991F8, 0x6D4

gUnknown_8E998CC:: @ 8E998CC
	.incbin "baserom.gba", 0xE998CC, 0x4C0

gUnknown_8E99D8C:: @ 8E99D8C
	.incbin "baserom.gba", 0xE99D8C, 0x20

gUnknown_8E99DAC:: @ 8E99DAC
	.incbin "baserom.gba", 0xE99DAC, 0xC8

gUnknown_8E99E74:: @ 8E99E74
	.incbin "baserom.gba", 0xE99E74, 0x5EC

gUnknown_8E9A460:: @ 8E9A460
	.incbin "baserom.gba", 0xE9A460, 0xEB0

gUnknown_8E9B310:: @ 8E9B310
	.incbin "baserom.gba", 0xE9B310, 0xC0

gUnknown_8E9B3D0:: @ 8E9B3D0
	.incbin "baserom.gba", 0xE9B3D0, 0x20

gUnknown_8E9B3F0:: @ 8E9B3F0
	.incbin "baserom.gba", 0xE9B3F0, 0xC8

gUnknown_8E9B4B8:: @ 8E9B4B8
	.incbin "baserom.gba", 0xE9B4B8, 0xC0

gUnknown_8E9B578:: @ 8E9B578
	.incbin "baserom.gba", 0xE9B578, 0x20

gUnknown_8E9B598:: @ 8E9B598
	.incbin "baserom.gba", 0xE9B598, 0x1B8

gUnknown_8E9B750:: @ 8E9B750
	.incbin "baserom.gba", 0xE9B750, 0x200

gUnknown_8E9B950:: @ 8E9B950
	.incbin "baserom.gba", 0xE9B950, 0x14C

gUnknown_8E9BA9C:: @ 8E9BA9C
	.incbin "baserom.gba", 0xE9BA9C, 0x130

gUnknown_8E9BBCC:: @ 8E9BBCC
	.incbin "baserom.gba", 0xE9BBCC, 0x35C

gUnknown_8E9BF28:: @ 8E9BF28
	.incbin "baserom.gba", 0xE9BF28, 0x20

gUnknown_8E9BF48:: @ 8E9BF48
	.incbin "baserom.gba", 0xE9BF48, 0x490

gUnknown_8E9C3D8:: @ 8E9C3D8
	.incbin "baserom.gba", 0xE9C3D8, 0x20

gUnknown_8E9C3F8:: @ 8E9C3F8
	.incbin "baserom.gba", 0xE9C3F8, 0x20

gUnknown_8E9C418:: @ 8E9C418
	.incbin "baserom.gba", 0xE9C418, 0x20

gUnknown_8E9C438:: @ 8E9C438
	.incbin "baserom.gba", 0xE9C438, 0x6B4

gUnknown_8E9CAEC:: @ 8E9CAEC
	.incbin "baserom.gba", 0xE9CAEC, 0xB0

gUnknown_8E9CB9C:: @ 8E9CB9C
	.incbin "baserom.gba", 0xE9CB9C, 0x20

gUnknown_8E9CBBC:: @ 8E9CBBC
	.incbin "baserom.gba", 0xE9CBBC, 0x320

gUnknown_8E9CEDC:: @ 8E9CEDC
	.incbin "baserom.gba", 0xE9CEDC, 0x80

gUnknown_8E9CF5C:: @ 8E9CF5C
	.incbin "baserom.gba", 0xE9CF5C, 0x1AA0

gUnknown_8E9E9FC:: @ 8E9E9FC
	.incbin "baserom.gba", 0xE9E9FC, 0x800

gUnknown_8E9F1FC:: @ 8E9F1FC
	.incbin "baserom.gba", 0xE9F1FC, 0x24

gUnknown_8E9F220:: @ 8E9F220
	.incbin "baserom.gba", 0xE9F220, 0x40

gUnknown_8E9F260:: @ 8E9F260
	.incbin "baserom.gba", 0xE9F260, 0x14A0

gUnknown_8EA0700:: @ 8EA0700
	.incbin "baserom.gba", 0xEA0700, 0x800

gUnknown_8EA0F00:: @ 8EA0F00
	.incbin "baserom.gba", 0xEA0F00, 0x800

gUnknown_8EA1700:: @ 8EA1700
	.incbin "baserom.gba", 0xEA1700, 0x20

gUnknown_8EA1720:: @ 8EA1720
	.incbin "baserom.gba", 0xEA1720, 0x238

gUnknown_8EA1958:: @ 8EA1958
	.incbin "baserom.gba", 0xEA1958, 0x9098

gUnknown_8EAA9F0:: @ 8EAA9F0
	.incbin "baserom.gba", 0xEAA9F0, 0x20

gUnknown_8EAAA10:: @ 8EAAA10
	.incbin "baserom.gba", 0xEAAA10, 0x5C

gUnknown_8EAAA6C:: @ 8EAAA6C
	.incbin "baserom.gba", 0xEAAA6C, 0xAC

gUnknown_8EAAB18:: @ 8EAAB18
	.incbin "baserom.gba", 0xEAAB18, 0x80

gUnknown_8EAAB98:: @ 8EAAB98
	.incbin "baserom.gba", 0xEAAB98, 0x774

gUnknown_8EAB30C:: @ 8EAB30C
	.incbin "baserom.gba", 0xEAB30C, 0x3B8

gUnknown_8EAB6C4:: @ 8EAB6C4
	.incbin "baserom.gba", 0xEAB6C4, 0x200

gUnknown_8EAB8C4:: @ 8EAB8C4
	.incbin "baserom.gba", 0xEAB8C4, 0x1ACC

gUnknown_8EAD390:: @ 8EAD390
	.incbin "baserom.gba", 0xEAD390, 0x258

gUnknown_8EAD5E8:: @ 8EAD5E8
	.incbin "baserom.gba", 0xEAD5E8, 0x20

gUnknown_8EAD608:: @ 8EAD608
	.incbin "baserom.gba", 0xEAD608, 0x8DC

gUnknown_8EADEE4:: @ 8EADEE4
	.incbin "baserom.gba", 0xEADEE4, 0x1B0

gUnknown_8EAE094:: @ 8EAE094
	.incbin "baserom.gba", 0xEAE094, 0x20

gUnknown_8EAE0B4:: @ 8EAE0B4
	.incbin "baserom.gba", 0xEAE0B4, 0x2C0

gUnknown_8EAE374:: @ 8EAE374
	.incbin "baserom.gba", 0xEAE374, 0x114

gUnknown_8EAE488:: @ 8EAE488
	.incbin "baserom.gba", 0xEAE488, 0x598

gUnknown_8EAEA20:: @ 8EAEA20
	.incbin "baserom.gba", 0xEAEA20, 0x60

gUnknown_8EAEA80:: @ 8EAEA80
	.incbin "baserom.gba", 0xEAEA80, 0x1420

gUnknown_8EAFEA0:: @ 8EAFEA0
	.incbin "baserom.gba", 0xEAFEA0, 0x120

gUnknown_8EAFFC0:: @ 8EAFFC0
	.incbin "baserom.gba", 0xEAFFC0, 0xB1C

gUnknown_8EB0ADC:: @ 8EB0ADC
	.incbin "baserom.gba", 0xEB0ADC
