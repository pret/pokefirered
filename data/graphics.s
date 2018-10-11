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
	
	@ INSERT POKEMANS HERE
gUnknown_8D2FBD4:: @ 8D2FBD4
	.incbin "baserom.gba", 0xD2FBD4, 0x119184
	
	@ INSERT TRAINERS HERE
gUnknown_8E48D58:: @ 8E48D58
	.incbin "baserom.gba", 0xE48D58, 0x21164
	
gUnknown_8E69EBC:: @ 8E69EBC
	.incbin "baserom.gba", 0xE69EBC, 0xD0A0
	
gUnknown_8E76F5C:: @ 8E76F5C
	.incbin "baserom.gba", 0xE76F5C, 0x420
	
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
