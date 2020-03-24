	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2
gReflectionEffectPaletteMap:: @ 835B934
	.byte 0x01, 0x01, 0x06, 0x07, 0x08, 0x09, 0x06, 0x07, 0x08, 0x09, 0x0b, 0x0b, 0x00, 0x00, 0x00, 0x00

gCameraSpriteTemplate:: @ 835B944
	spr_template 0, 65535, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, ObjectCB_CameraObject

gCameraObjectFuncs:: @ 835B95C
	.4byte CameraObject_0
	.4byte CameraObject_1
	.4byte CameraObject_2

gUnknown_835B968:: @ 835B968
	.incbin "graphics/object_events/0.gbapal"

gUnknown_835B988::
	.incbin "graphics/object_events/unk_835B988.gbapal"

gUnknown_835B9A0::
	.space 0x1C0

gUnknown_835BB68:: @ 835BB68
	.incbin "graphics/object_events/000.4bpp"

gUnknown_835C468:: @ 835C468
	.incbin "graphics/object_events/002.4bpp"

gUnknown_835D268:: @ 835D268
	.incbin "graphics/object_events/007.4bpp"

gUnknown_835DB68:: @ 835DB68
	.incbin "graphics/object_events/009.4bpp"

gUnknown_835E968:: @ 835E968
	.incbin "graphics/object_events/1.gbapal"

gUnknown_835E988:: @ 835E988
	.incbin "graphics/object_events/2.gbapal"

gUnknown_835E9A8:: @ 835E9A8
	.incbin "graphics/object_events/005.4bpp"

gUnknown_835F2A8:: @ 835F2A8
	.incbin "graphics/object_events/012.4bpp"

gObjectEventPic_MaleSurfing:: @ 835FBA8
	.incbin "graphics/object_events/male_surf.4bpp"

gObjectEventPic_FemaleSurfing:: @ 360DA8
	.incbin "graphics/object_events/female_surf.4bpp"

gUnknown_8361FA8:: @ 8361FA8
	.incbin "graphics/object_events/001.4bpp"

gUnknown_83631A8:: @ 83631A8
	.incbin "graphics/object_events/006.4bpp"

gUnknown_8363DA8:: @ 8363DA8
	.incbin "graphics/object_events/008.4bpp"

gUnknown_8364FA8:: @ 8364FA8
	.incbin "graphics/object_events/013.4bpp"

gUnknown_8365BA8:: @ 8365BA8
	.incbin "graphics/object_events/014.4bpp"

gUnknown_83664A8:: @ 83664A8
	.incbin "graphics/object_events/015.4bpp"

gUnknown_8366DA8:: @ 8366DA8
	.incbin "graphics/object_events/004.4bpp"

gUnknown_83685A8:: @ 83685A8
	.incbin "graphics/object_events/011.4bpp"

gUnknown_8369DA8:: @ 8369DA8
	.incbin "graphics/object_events/094.4bpp"

gUnknown_8369E28:: @ 8369E28
	.incbin "graphics/object_events/093.4bpp"

@ 8369F28
	.incbin "graphics/object_events/unk_8369F28.4bpp"

gUnknown_836A228:: @ 836A228
	.incbin "graphics/object_events/087.4bpp"

gUnknown_836AB28:: @ 836AB28
	.incbin "graphics/object_events/086.4bpp"

gUnknown_836AE28:: @ 836AE28
	.incbin "graphics/object_events/085.4bpp"

gUnknown_836B128:: @ 836B128
	.incbin "graphics/object_events/076.4bpp"

gUnknown_836BA28:: @ 836BA28
	.incbin "graphics/object_events/077.4bpp"

gUnknown_836C328:: @ 836C328
	.incbin "graphics/object_events/083.4bpp"

gUnknown_836C628:: @ 836C628
	.incbin "graphics/object_events/084.4bpp"

gUnknown_836C928:: @ 836C928
	.incbin "graphics/object_events/080.4bpp"

gUnknown_836CC28:: @ 836CC28
	.incbin "graphics/object_events/082.4bpp"

gUnknown_836CF28:: @ 836CF28
	.incbin "graphics/object_events/073.4bpp"

gUnknown_836D828:: @ 836D828
	.incbin "graphics/object_events/3.gbapal"

gUnknown_836D848:: @ 836D848
	.incbin "graphics/object_events/4.gbapal"

gUnknown_836D868:: @ 836D868
	.incbin "graphics/object_events/5.gbapal"

gUnknown_836D888:: @ 836D888
	.incbin "graphics/object_events/6.gbapal"

gUnknown_836D8A8:: @ 836D8A8
	.incbin "graphics/object_events/7.gbapal"

gUnknown_836D8C8:: @ 836D8C8
	.incbin "graphics/object_events/8.gbapal"

gUnknown_836D8E8:: @ 836D8E8
	.incbin "graphics/object_events/9.gbapal"

gUnknown_836D908:: @ 836D908
	.incbin "graphics/object_events/10.gbapal"

gUnknown_836D928:: @ 836D928
	.incbin "graphics/object_events/016.4bpp"

gUnknown_836DDA8:: @ 836DDA8
	.incbin "graphics/object_events/017.4bpp"

gUnknown_836E2A8:: @ 836E2A8
	.incbin "graphics/object_events/021.4bpp"

gUnknown_836E5A8:: @ 836E5A8
	.incbin "graphics/object_events/022.4bpp"

gUnknown_836EFA8:: @ 836EFA8
	.incbin "graphics/object_events/018.4bpp"

gUnknown_836F9A8:: @ 836F9A8
	.incbin "graphics/object_events/019.4bpp"

gUnknown_83703A8:: @ 83703A8
	.incbin "graphics/object_events/023.4bpp"

gUnknown_8370DA8:: @ 8370DA8
	.incbin "graphics/object_events/031.4bpp"

gUnknown_83716A8:: @ 83716A8
	.incbin "graphics/object_events/020.4bpp"

gUnknown_83720A8:: @ 83720A8
	.incbin "graphics/object_events/024.4bpp"

gUnknown_8372AA8:: @ 8372AA8
	.incbin "graphics/object_events/unk_8372AA8.4bpp"

gUnknown_83733A8:: @ 83733A8
	.incbin "graphics/object_events/027.4bpp"

gUnknown_8373CA8:: @ 8373CA8
	.incbin "graphics/object_events/030.4bpp"

gUnknown_83746A8:: @ 83746A8
	.incbin "graphics/object_events/028.4bpp"

gUnknown_83750A8:: @ 83750A8
	.incbin "graphics/object_events/032.4bpp"

gUnknown_8375AA8:: @ 8375AA8
	.incbin "graphics/object_events/034.4bpp"

gUnknown_8375CA8:: @ 8375CA8
	.incbin "graphics/object_events/047.4bpp"

gUnknown_83766A8:: @ 83766A8
	.incbin "graphics/object_events/048.4bpp"

gUnknown_83770A8:: @ 83770A8
	.incbin "graphics/object_events/029.4bpp"

gUnknown_8377AA8:: @ 8377AA8
	.incbin "graphics/object_events/059.4bpp"

gUnknown_83783A8:: @ 83783A8
	.incbin "graphics/object_events/033.4bpp"

gUnknown_8378CA8:: @ 8378CA8
	.incbin "graphics/object_events/035.4bpp"

gUnknown_83795A8:: @ 83795A8
	.incbin "graphics/object_events/039.4bpp"

gUnknown_8379FA8:: @ 8379FA8
	.incbin "graphics/object_events/040.4bpp"

gUnknown_837A9A8:: @ 837A9A8
	.incbin "graphics/object_events/041.4bpp"

gUnknown_837B3A8:: @ 837B3A8
	.incbin "graphics/object_events/042.4bpp"

gUnknown_837BDA8:: @ 837BDA8
	.incbin "graphics/object_events/121.4bpp"

gUnknown_837BF28:: @ 837BF28
	.incbin "graphics/object_events/052.4bpp"

gUnknown_837C928:: @ 837C928
	.incbin "graphics/object_events/058.4bpp"

gUnknown_837D328:: @ 837D328
	.incbin "graphics/object_events/050.4bpp"

gUnknown_837DC28:: @ 837DC28
	.incbin "graphics/object_events/043.4bpp"

gUnknown_837E628:: @ 837E628
	.incbin "graphics/object_events/044.4bpp"

gUnknown_837F028:: @ 837F028
	.incbin "graphics/object_events/045.4bpp"

gUnknown_837FA28:: @ 837FA28
	.incbin "graphics/object_events/046.4bpp"

gUnknown_8380428:: @ 8380428
	.incbin "graphics/object_events/054.4bpp"

gUnknown_8380E28:: @ 8380E28
	.incbin "graphics/object_events/055.4bpp"

gUnknown_8381828:: @ 8381828
	.incbin "graphics/object_events/061.4bpp"

gUnknown_8382228:: @ 8382228
	.incbin "graphics/object_events/062.4bpp"

gUnknown_8382C28:: @ 8382C28
	.incbin "graphics/object_events/063.4bpp"

gUnknown_8383528:: @ 8383528
	.incbin "graphics/object_events/057.4bpp"

gUnknown_8383F28:: @ 8383F28
	.incbin "graphics/object_events/090.4bpp"

gUnknown_8384828:: @ 8384828
	.incbin "graphics/object_events/152.4bpp"

gUnknown_8385128:: @ 8385128
	.incbin "graphics/object_events/037.4bpp"

gUnknown_8385628:: @ 8385628
	.incbin "graphics/object_events/036.4bpp"

gUnknown_8385B28:: @ 8385B28
	.incbin "graphics/object_events/038.4bpp"

gUnknown_8386028:: @ 8386028
	.incbin "graphics/object_events/056.4bpp"

gUnknown_8386A28:: @ 8386A28
	.incbin "graphics/object_events/053.4bpp"

gUnknown_8387E28:: @ 8387E28
	.incbin "graphics/object_events/091.4bpp"

gUnknown_8388728:: @ 8388728
	.incbin "graphics/object_events/025.4bpp"

gUnknown_8389128:: @ 8389128
	.incbin "graphics/object_events/026.4bpp"

gUnknown_8389B28:: @ 8389B28
	.incbin "graphics/object_events/071.4bpp"

gUnknown_838A428:: @ 838A428
	.incbin "graphics/object_events/072.4bpp"

gUnknown_838AD28:: @ 838AD28
	.incbin "graphics/object_events/064.4bpp"

gUnknown_838B128:: @ 838B128
	.incbin "graphics/object_events/065.4bpp"

gUnknown_838B428:: @ 838B428
	.incbin "graphics/object_events/066.4bpp"

gUnknown_838B728:: @ 838B728
	.incbin "graphics/object_events/067.4bpp"

gUnknown_838BA28:: @ 838BA28
	.incbin "graphics/object_events/092.4bpp"

gUnknown_838BAA8:: @ 838BAA8
	.incbin "graphics/object_events/078.4bpp"

gUnknown_838C3A8:: @ 838C3A8
	.incbin "graphics/object_events/079.4bpp"

gUnknown_838C6A8:: @ 838C6A8
	.incbin "graphics/object_events/068.4bpp"

gUnknown_838CFA8:: @ 838CFA8
	.incbin "graphics/object_events/069.4bpp"

gUnknown_838D2A8:: @ 838D2A8
	.incbin "graphics/object_events/070.4bpp"

gUnknown_838D5A8:: @ 838D5A8
	.incbin "graphics/object_events/unk_838D5A8.4bpp"

gUnknown_838DEA8:: @ 838DEA8
	.incbin "graphics/object_events/049.4bpp"

gUnknown_838E7A8:: @ 838E7A8
	.incbin "graphics/object_events/089.4bpp"

gUnknown_838F0A8:: @ 838F0A8
	.incbin "graphics/object_events/135.4bpp"

gUnknown_838F228:: @ 838F228
	.incbin "graphics/object_events/136.4bpp"

gUnknown_838F428:: @ 838F428
	.incbin "graphics/object_events/137.4bpp"

gUnknown_838F628:: @ 838F628
	.incbin "graphics/object_events/138.4bpp"

gUnknown_838F828:: @ 838F828
	.incbin "graphics/object_events/139.4bpp"

gUnknown_838F8A8:: @ 838F8A8
	.incbin "graphics/object_events/140.4bpp"

gUnknown_838F928:: @ 838F928
	.incbin "graphics/object_events/141.4bpp"

gUnknown_838F9A8:: @ 838F9A8
	.incbin "graphics/object_events/143.4bpp"

gUnknown_838FA28:: @ 838FA28
	.incbin "graphics/object_events/142.4bpp"

gUnknown_838FAA8:: @ 838FAA8
	.incbin "graphics/object_events/144.4bpp"

gUnknown_838FEA8:: @ 838FEA8
	.incbin "graphics/object_events/145.4bpp"

gUnknown_83902A8:: @ 83902A8
	.incbin "graphics/object_events/146.4bpp"

gUnknown_8390328:: @ 8390328
	.incbin "graphics/object_events/148.4bpp"

gUnknown_8390728:: @ 8390728
	.incbin "graphics/object_events/149.4bpp"

gUnknown_8390B28:: @ 8390B28
	.incbin "graphics/object_events/150.4bpp"

gUnknown_8390F28:: @ 8390F28
	.incbin "graphics/object_events/075.4bpp"

gUnknown_8391228:: @ 8391228
	.incbin "graphics/object_events/081.4bpp"

gUnknown_8391528:: @ 8391528
	.incbin "graphics/object_events/074.4bpp"

gUnknown_8391828:: @ 8391828
	.incbin "graphics/object_events/051.4bpp"

gUnknown_8391B28:: @ 8391B28
	.incbin "graphics/object_events/088.4bpp"

gUnknown_8391E28:: @ 8391E28
	.incbin "graphics/object_events/114.4bpp"

gUnknown_8391FA8:: @ 8391FA8
	.incbin "graphics/object_events/118.4bpp"

gUnknown_8392128:: @ 8392128
	.incbin "graphics/object_events/119.4bpp"

gUnknown_83922A8:: @ 83922A8
	.incbin "graphics/object_events/122.4bpp"

gUnknown_8392428:: @ 8392428
	.incbin "graphics/object_events/123.4bpp"

gUnknown_83925A8:: @ 83925A8
	.incbin "graphics/object_events/124.4bpp"

gUnknown_8392728:: @ 8392728
	.incbin "graphics/object_events/125.4bpp"

gUnknown_83928A8:: @ 83928A8
	.incbin "graphics/object_events/126.4bpp"

gUnknown_8392A28:: @ 8392A28
	.incbin "graphics/object_events/127.4bpp"

gUnknown_8392BA8:: @ 8392BA8
	.incbin "graphics/object_events/128.4bpp"

gUnknown_8392D28:: @ 8392D28
	.incbin "graphics/object_events/129.4bpp"

gUnknown_8392EA8:: @ 8392EA8
	.incbin "graphics/object_events/130.4bpp"

gUnknown_8393028:: @ 8393028
	.incbin "graphics/object_events/131.4bpp"

gUnknown_83931A8:: @ 83931A8
	.incbin "graphics/object_events/132.4bpp"

gUnknown_8393328:: @ 8393328
	.incbin "graphics/object_events/133.4bpp"

gUnknown_83934A8:: @ 83934A8
	.incbin "graphics/object_events/147.4bpp"

gUnknown_8393628:: @ 8393628
	.incbin "graphics/object_events/134.4bpp"

gUnknown_83937A8:: @ 83937A8
	.incbin "graphics/object_events/109.4bpp"

gUnknown_83939A8:: @ 83939A8
	.incbin "graphics/object_events/110.4bpp"

gUnknown_8393B28:: @ 8393B28
	.incbin "graphics/object_events/111.4bpp"

gUnknown_8393CA8:: @ 8393CA8
	.incbin "graphics/object_events/112.4bpp"

gUnknown_8393E28:: @ 8393E28
	.incbin "graphics/object_events/117.4bpp"

gUnknown_8393FA8:: @ 8393FA8
	.incbin "graphics/object_events/120.4bpp"

gUnknown_8394128:: @ 8394128
	.incbin "graphics/object_events/115.4bpp"

gUnknown_83942A8:: @ 83942A8
	.incbin "graphics/object_events/116.4bpp"

gUnknown_8394428:: @ 8394428
	.incbin "graphics/object_events/113.4bpp"

gUnknown_83945A8:: @ 83945A8
	.incbin "graphics/object_events/095.4bpp"

gUnknown_83947A8:: @ 83947A8
	.incbin "graphics/object_events/096.4bpp"

gUnknown_83949A8:: @ 83949A8
	.incbin "graphics/object_events/097.4bpp"

gUnknown_8394A28:: @ 8394A28
	.incbin "graphics/object_events/098.4bpp"

gUnknown_8394AA8:: @ 8394AA8
	.incbin "graphics/object_events/099.4bpp"

gUnknown_8394B28:: @ 8394B28
	.incbin "graphics/object_events/100.4bpp"

gUnknown_8394BA8:: @ 8394BA8
	.incbin "graphics/object_events/101.4bpp"

gUnknown_8394C28:: @ 8394C28
	.incbin "graphics/object_events/102.4bpp"

gUnknown_8394D28:: @ 8394D28
	.incbin "graphics/object_events/103.4bpp"

gUnknown_8394DA8:: @ 8394DA8
	.incbin "graphics/object_events/104.4bpp"

gUnknown_8394E28:: @ 8394E28
	.incbin "graphics/object_events/105.4bpp"

gUnknown_8394EA8:: @ 8394EA8
	.incbin "graphics/object_events/19.gbapal"

gUnknown_8394EC8:: @ 8394EC8
	.incbin "graphics/object_events/106.4bpp"

gUnknown_83950C8:: @ 83950C8
	.incbin "graphics/object_events/107.4bpp"

gUnknown_83952C8:: @ 83952C8
	.incbin "graphics/object_events/20.gbapal"

gUnknown_83952E8:: @ 83952E8
	.incbin "graphics/object_events/108.4bpp"

gUnknown_8395AE8:: @ 8395AE8
	.incbin "graphics/object_events/21.gbapal"

gUnknown_8395B08:: @ 8395B08
	.incbin "graphics/object_events/151.4bpp"

gUnknown_8396B08:: @ 8396B08
	.incbin "graphics/object_events/unk_396B08.4bpp"

gUnknown_8397708:: @ 8397708
	.incbin "graphics/object_events/060.4bpp"

gUnknown_8398008:: @ 8398008
	.incbin "graphics/object_events/11.gbapal"

gUnknown_8398028:: @ 8398028
	.incbin "graphics/object_events/12.gbapal"

gUnknown_8398048:: @ 8398048
	.incbin "graphics/object_events/pics/effects/shadow_small.4bpp"

gUnknown_8398068:: @ 8398068
	.incbin "graphics/object_events/pics/effects/shadow_medium.4bpp"

gUnknown_83980A8:: @ 83980A8
	.incbin "graphics/object_events/pics/effects/shadow_large.4bpp"

gUnknown_8398128:: @ 8398128
	.incbin "graphics/object_events/pics/effects/shadow_extra_large.4bpp"

filler_8398528:: @ 8398528
	.fill 0x48, 0x4, 0x00

gUnknown_8398648::
	.incbin "graphics/object_events/fldeff_cut.4bpp"

gUnknown_8398668::
	.incbin "graphics/object_events/fldeff_cut.4bpp"

gUnknown_8398688::
	.incbin "graphics/object_events/fldeff_cut.gbapal"

gUnknown_83986A8:: @ 83986A8
	.incbin "graphics/object_events/pics/unknown/83986A8.4bpp"

gUnknown_8398928:: @ 8398928
	.incbin "graphics/object_events/pics/unknown/8398928.4bpp"

gUnknown_8398BA8:: @ 8398BA8
	.incbin "graphics/object_events/pics/unknown/8398BA8.4bpp"

gUnknown_8398FA8:: @ 8398FA8
	.incbin "graphics/object_events/palettes/8398FA8.gbapal"

gUnknown_8398FC8:: @ 8398FC8
	.incbin "graphics/object_events/palettes/8398FC8.gbapal"

gUnknown_8399008:: @ 8399008
	.incbin "graphics/object_events/pics/unknown/8399008.4bpp"

gUnknown_83990C8:: @ 83990C8
	.incbin "graphics/object_events/pics/unknown/83990C8.4bpp"

gUnknown_8399188:: @ 8399188
	.incbin "graphics/object_events/pics/unknown/8399188.4bpp"

gUnknown_8399288:: @ 8399288
	.incbin "graphics/object_events/pics/unknown/8399288.4bpp"

gUnknown_8399488:: @ 8399488
	.incbin "graphics/object_events/pics/unknown/8399488.4bpp"

gUnknown_8399788:: @ 8399788
	.incbin "graphics/object_events/pics/unknown/8399788.4bpp"

gUnknown_8399C08:: @ 8399C08
	.incbin "graphics/object_events/pics/unknown/8399C08.4bpp"

gUnknown_8399E08:: @ 8399E08
	.incbin "graphics/object_events/pics/unknown/8399E08.4bpp"

gUnknown_8399E88:: @ 8399E88
	.incbin "graphics/object_events/pics/unknown/8399E88.4bpp"

gUnknown_8399F08:: @ 8399F08
	.incbin "graphics/object_events/pics/unknown/8399F08.4bpp"

gUnknown_8399F88:: @ 8399F88
	.incbin "graphics/object_events/pics/unknown/8399F88.4bpp"

gUnknown_839A008:: @ 839A008
	.incbin "graphics/object_events/pics/unknown/839A008.4bpp"

gUnknown_839A288:: @ 839A288
	.incbin "graphics/object_events/pics/unknown/839A288.4bpp"

gUnknown_839A388:: @ 839A388
	.incbin "graphics/object_events/pics/unknown/839A388.4bpp"

gUnknown_839A408:: @ 839A408
	.incbin "graphics/object_events/pics/unknown/839A408.4bpp"

gUnknown_839A488:: @ 839A488
	.incbin "graphics/object_events/pics/unknown/839A488.4bpp"

gUnknown_839A508:: @ 839A508
	.incbin "graphics/object_events/pics/unknown/839A508.4bpp"

gUnknown_839A588:: @ 839A588
	.incbin "graphics/object_events/pics/unknown/839A588.4bpp"

gUnknown_839A608:: @ 839A608
	.incbin "graphics/object_events/pics/unknown/839A608.4bpp"

gUnknown_839A688:: @ 839A688
	.incbin "graphics/object_events/pics/unknown/839A688.4bpp"

gUnknown_839A708:: @ 839A708
	.incbin "graphics/object_events/pics/unknown/839A708.4bpp"

gUnknown_839A788:: @ 839A788
	.incbin "graphics/object_events/pics/unknown/839A788.4bpp"

gUnknown_839A988:: @ 839A988
	.incbin "graphics/object_events/pics/unknown/839A988.4bpp"

gUnknown_839AA48:: @ 839AA48
	.incbin "graphics/object_events/pics/unknown/839AA48.4bpp"

gUnknown_839AAC8:: @ 839AAC8
	.incbin "graphics/object_events/pics/unknown/839AAC8.4bpp"

gUnknown_839AB48:: @ 839AB48
	.incbin "graphics/object_events/pics/unknown/839AB48.4bpp"

gUnknown_839ABC8:: @ 839ABC8
	.incbin "graphics/object_events/pics/unknown/839ABC8.4bpp"

gUnknown_839AC48:: @ 839AC48
	.incbin "graphics/object_events/pics/unknown/839AC48.4bpp"

gUnknown_839AC88:: @ 839AC88
	.incbin "graphics/object_events/pics/unknown/839AC88.4bpp"

gUnknown_839ACC8:: @ 839ACC8
	.incbin "graphics/object_events/pics/unknown/839ACC8.4bpp"

gUnknown_839AD08:: @ 839AD08
	.incbin "graphics/object_events/pics/unknown/839AD08.4bpp"

gUnknown_839AD48:: @ 839AD48
	.incbin "graphics/object_events/pics/unknown/839AD48.4bpp"

gUnknown_839AD88:: @ 839AD88
	.incbin "graphics/object_events/pics/unknown/839AD88.4bpp"

gUnknown_839B008:: @ 839B008
	.incbin "graphics/object_events/pics/unknown/839B008.4bpp"

gUnknown_839B708:: @ 839B708
	.incbin "graphics/object_events/pics/unknown/839B708.4bpp"

gUnknown_839BE08:: @ 839BE08
	.incbin "graphics/object_events/pics/unknown/839BE08.4bpp"

gUnknown_839C508:: @ 839C508
	.incbin "graphics/object_events/pics/unknown/839C508.4bpp"

gUnknown_839C588:: @ 839C588
	.incbin "graphics/object_events/palettes/839C588.gbapal"

gUnknown_839C5A8:: @ 839C5A8
	.incbin "graphics/object_events/pics/unknown/839C5A8.4bpp"

gUnknown_839C628:: @ 839C628
	.incbin "graphics/object_events/pics/unknown/839C628.4bpp"

gUnknown_839C6A8:: @ 839C6A8
	.incbin "graphics/object_events/pics/unknown/839C6A8.4bpp"

gUnknown_839C728:: @ 839C728
	.incbin "graphics/object_events/pics/unknown/839C728.4bpp"

gUnknown_839C7A8:: @ 839C7A8
	.incbin "graphics/object_events/pics/unknown/839C7A8.4bpp"

gUnknown_839C828:: @ 839C828
	.incbin "graphics/object_events/pics/unknown/839C828.4bpp"

gUnknown_839C8A8:: @ 839C8A8
	.incbin "graphics/object_events/pics/unknown/839C8A8.4bpp"

gUnknown_839C928:: @ 839C928
	.incbin "graphics/object_events/pics/unknown/839C928.4bpp"

gUnknown_839C9A8:: @ 839C9A8
	.incbin "graphics/object_events/pics/unknown/839C9A8.4bpp"

gUnknown_839CA28:: @ 839CA28
	.incbin "graphics/object_events/pics/unknown/839CA28.4bpp"

gUnknown_839CAA8:: @ 839CAA8
	.incbin "graphics/object_events/pics/unknown/839CAA8.4bpp"

gUnknown_839CBA8:: @ 839CBA8
	.incbin "graphics/object_events/pics/unknown/839CBA8.4bpp"

gUnknown_839CCA8:: @ 839CCA8
	.incbin "graphics/object_events/pics/unknown/839CCA8.4bpp"

gUnknown_839CDA8:: @ 839CDA8
	.incbin "graphics/object_events/pics/unknown/839CDA8.4bpp"

gUnknown_839CEA8:: @ 839CEA8
	.incbin "graphics/object_events/pics/unknown/839CEA8.4bpp"

gUnknown_839CFA8:: @ 839CFA8
	.incbin "graphics/object_events/pics/unknown/839CFA8.4bpp"

gUnknown_839D0A8:: @ 839D0A8
	.incbin "graphics/object_events/pics/unknown/839D0A8.4bpp"

gUnknown_839D1A8:: @ 839D1A8
	.incbin "graphics/object_events/pics/unknown/839D1A8.4bpp"

gUnknown_839D2A8:: @ 839D2A8
	.incbin "graphics/object_events/pics/unknown/839D2A8.4bpp"

gUnknown_839D328:: @ 839D328
	.incbin "graphics/object_events/pics/unknown/839D328.4bpp"

gUnknown_839D3A8:: @ 839D3A8
	.incbin "graphics/object_events/palettes/839D3A8.gbapal"

gUnknown_839D3C8:: @ 839D3C8
	.incbin "graphics/object_events/pics/unknown/839D3C8.4bpp"

sMovementTypeCallbacks:: @ 839FBC8
	.4byte MovementType_None
	.4byte MovementType_LookAround
	.4byte MovementType_WanderAround
	.4byte MovementType_WanderUpAndDown
	.4byte MovementType_WanderUpAndDown
	.4byte MovementType_WanderLeftAndRight
	.4byte MovementType_WanderLeftAndRight
	.4byte MovementType_FaceDirection
	.4byte MovementType_FaceDirection
	.4byte MovementType_FaceDirection
	.4byte MovementType_FaceDirection
	.4byte sub_805B3B8
	.4byte NULL
	.4byte MovementType_FaceDownAndUp
	.4byte MovementType_FaceLeftAndRight
	.4byte MovementType_FaceUpAndLeft
	.4byte MovementType_FaceUpAndRight
	.4byte MovementType_FaceDownAndLeft
	.4byte MovementType_FaceDownAndRight
	.4byte MovementType_FaceDownUpAndLeft
	.4byte MovementType_FaceDownUpAndRight
	.4byte MovementType_FaceUpRightAndLeft
	.4byte MovementType_FaceDownRightAndLeft
	.4byte MovementType_RotateCounterclockwise
	.4byte MovementType_RotateClockwise
	.4byte MovementType_WalkBackAndForth
	.4byte MovementType_WalkBackAndForth
	.4byte MovementType_WalkBackAndForth
	.4byte MovementType_WalkBackAndForth
	.4byte MovementType_WalkSequenceUpRightLeftDown
	.4byte MovementType_WalkSequenceRightLeftDownUp
	.4byte MovementType_WalkSequenceDownUpRightLeft
	.4byte MovementType_WalkSequenceLeftDownUpRight
	.4byte MovementType_WalkSequenceUpLeftRightDown
	.4byte MovementType_WalkSequenceLeftRightDownUp
	.4byte MovementType_WalkSequenceDownUpLeftRight
	.4byte MovementType_WalkSequenceRightDownUpLeft
	.4byte MovementType_WalkSequenceLeftUpDownRight
	.4byte MovementType_WalkSequenceUpDownRightLeft
	.4byte MovementType_WalkSequenceRightLeftUpDown
	.4byte MovementType_WalkSequenceDownRightLeftUp
	.4byte MovementType_WalkSequenceRightUpDownLeft
	.4byte MovementType_WalkSequenceUpDownLeftRight
	.4byte MovementType_WalkSequenceLeftRightUpDown
	.4byte MovementType_WalkSequenceDownLeftRightUp
	.4byte MovementType_WalkSequenceUpLeftDownRight
	.4byte MovementType_WalkSequenceDownRightUpLeft
	.4byte MovementType_WalkSequenceLeftDownRightUp
	.4byte MovementType_WalkSequenceRightUpLeftDown
	.4byte MovementType_WalkSequenceUpRightDownLeft
	.4byte MovementType_WalkSequenceDownLeftUpRight
	.4byte MovementType_WalkSequenceLeftUpRightDown
	.4byte MovementType_WalkSequenceRightDownLeftUp
	.4byte MovementType_CopyPlayer
	.4byte MovementType_CopyPlayer
	.4byte MovementType_CopyPlayer
	.4byte MovementType_CopyPlayer
	.4byte MovementType_TreeDisguise
	.4byte MovementType_MountainDisguise
	.4byte MovementType_CopyPlayerInGrass
	.4byte MovementType_CopyPlayerInGrass
	.4byte MovementType_CopyPlayerInGrass
	.4byte MovementType_CopyPlayerInGrass
	.4byte MovementType_Hidden
	.4byte MovementType_WalkInPlace
	.4byte MovementType_WalkInPlace
	.4byte MovementType_WalkInPlace
	.4byte MovementType_WalkInPlace
	.4byte MovementType_WalkSlowlyInPlace
	.4byte MovementType_WalkSlowlyInPlace
	.4byte MovementType_WalkSlowlyInPlace
	.4byte MovementType_WalkSlowlyInPlace
	.4byte MovementType_JogInPlace
	.4byte MovementType_JogInPlace
	.4byte MovementType_JogInPlace
	.4byte MovementType_JogInPlace
	.4byte MovementType_Invisible
	.4byte sub_8063298
	.4byte sub_80632BC
	.4byte sub_80632E0
	.4byte MovementType_WanderAroundDuplicate

gRangedMovementTypes:: @ 839FD0C
	.byte FALSE @ MOVEMENT_TYPE_NONE
	.byte FALSE @ MOVEMENT_TYPE_LOOK_AROUND
	.byte TRUE  @ MOVEMENT_TYPE_WANDER_AROUND
	.byte TRUE  @ MOVEMENT_TYPE_WANDER_UP_AND_DOWN
	.byte TRUE  @ MOVEMENT_TYPE_WANDER_DOWN_AND_UP
	.byte TRUE  @ MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT
	.byte TRUE  @ MOVEMENT_TYPE_WANDER_RIGHT_AND_LEFT
	.byte FALSE @ MOVEMENT_TYPE_FACE_UP
	.byte FALSE @ MOVEMENT_TYPE_FACE_DOWN
	.byte FALSE @ MOVEMENT_TYPE_FACE_LEFT
	.byte FALSE @ MOVEMENT_TYPE_FACE_RIGHT
	.byte FALSE @ MOVEMENT_TYPE_PLAYER
	.byte FALSE @ MOVEMENT_TYPE_BERRY_TREE_GROWTH
	.byte FALSE @ MOVEMENT_TYPE_FACE_DOWN_AND_UP
	.byte FALSE @ MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT
	.byte FALSE @ MOVEMENT_TYPE_FACE_UP_AND_LEFT
	.byte FALSE @ MOVEMENT_TYPE_FACE_UP_AND_RIGHT
	.byte FALSE @ MOVEMENT_TYPE_FACE_DOWN_AND_LEFT
	.byte FALSE @ MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT
	.byte FALSE @ MOVEMENT_TYPE_FACE_DOWN_UP_AND_LEFT
	.byte FALSE @ MOVEMENT_TYPE_FACE_DOWN_UP_AND_RIGHT
	.byte FALSE @ MOVEMENT_TYPE_FACE_UP_LEFT_AND_RIGHT
	.byte FALSE @ MOVEMENT_TYPE_FACE_DOWN_LEFT_AND_RIGHT
	.byte FALSE @ MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE
	.byte FALSE @ MOVEMENT_TYPE_ROTATE_CLOCKWISE
	.byte TRUE  @ MOVEMENT_TYPE_WALK_UP_AND_DOWN
	.byte TRUE  @ MOVEMENT_TYPE_WALK_DOWN_AND_UP
	.byte TRUE  @ MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_LEFT_DOWN
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_DOWN_UP
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_RIGHT_LEFT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_UP_RIGHT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_RIGHT_DOWN
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_DOWN_UP
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_LEFT_RIGHT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_UP_LEFT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_DOWN_RIGHT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_RIGHT_LEFT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_UP_DOWN
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_LEFT_UP
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_DOWN_LEFT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_LEFT_RIGHT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_UP_DOWN
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_RIGHT_UP
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_DOWN_RIGHT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_UP_LEFT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_RIGHT_UP
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_LEFT_DOWN
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_DOWN_LEFT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_RIGHT_DOWN
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_LEFT_UP
	.byte TRUE  @ MOVEMENT_TYPE_COPY_PLAYER
	.byte TRUE  @ MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE
	.byte TRUE  @ MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE
	.byte TRUE  @ MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE
	.byte FALSE @ MOVEMENT_TYPE_TREE_DISGUISE
	.byte FALSE @ MOVEMENT_TYPE_MOUNTAIN_DISGUISE
	.byte TRUE  @ MOVEMENT_TYPE_COPY_PLAYER_IN_GRASS
	.byte TRUE  @ MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE_IN_GRASS
	.byte TRUE  @ MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE_IN_GRASS
	.byte TRUE  @ MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE_IN_GRASS
	.byte FALSE @ MOVEMENT_TYPE_HIDDEN
	.byte FALSE @ MOVEMENT_TYPE_WALK_IN_PLACE_DOWN
	.byte FALSE @ MOVEMENT_TYPE_WALK_IN_PLACE_UP
	.byte FALSE @ MOVEMENT_TYPE_WALK_IN_PLACE_LEFT
	.byte FALSE @ MOVEMENT_TYPE_WALK_IN_PLACE_RIGHT
	.byte FALSE @ MOVEMENT_TYPE_JOG_IN_PLACE_DOWN
	.byte FALSE @ MOVEMENT_TYPE_JOG_IN_PLACE_UP
	.byte FALSE @ MOVEMENT_TYPE_JOG_IN_PLACE_LEFT
	.byte FALSE @ MOVEMENT_TYPE_JOG_IN_PLACE_RIGHT
	.byte FALSE @ MOVEMENT_TYPE_RUN_IN_PLACE_DOWN
	.byte FALSE @ MOVEMENT_TYPE_RUN_IN_PLACE_UP
	.byte FALSE @ MOVEMENT_TYPE_RUN_IN_PLACE_LEFT
	.byte FALSE @ MOVEMENT_TYPE_RUN_IN_PLACE_RIGHT
	.byte FALSE @ MOVEMENT_TYPE_INVISIBLE
	.byte FALSE @ MOVEMENT_TYPE_WALK_SLOWLY_IN_PLACE_DOWN
	.byte FALSE @ MOVEMENT_TYPE_WALK_SLOWLY_IN_PLACE_UP
	.byte FALSE @ MOVEMENT_TYPE_WALK_SLOWLY_IN_PLACE_LEFT
	.byte TRUE  @ MOVEMENT_TYPE_WALK_SLOWLY_IN_PLACE_RIGHT

gInitialMovementTypeFacingDirections:: @ 839FD5D
	.byte 1 @ [MOVEMENT_TYPE_NONE] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_LOOK_AROUND] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_WANDER_AROUND] = DIR_SOUTH,
	.byte 2 @ [MOVEMENT_TYPE_WANDER_UP_AND_DOWN] = DIR_NORTH,
	.byte 1 @ [MOVEMENT_TYPE_WANDER_DOWN_AND_UP] = DIR_SOUTH,
	.byte 3 @ [MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT] = DIR_WEST,
	.byte 4 @ [MOVEMENT_TYPE_WANDER_RIGHT_AND_LEFT] = DIR_EAST,
	.byte 2 @ [MOVEMENT_TYPE_FACE_UP] = DIR_NORTH,
	.byte 1 @ [MOVEMENT_TYPE_FACE_DOWN] = DIR_SOUTH,
	.byte 3 @ [MOVEMENT_TYPE_FACE_LEFT] = DIR_WEST,
	.byte 4 @ [MOVEMENT_TYPE_FACE_RIGHT] = DIR_EAST,
	.byte 1 @ [MOVEMENT_TYPE_PLAYER] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_BERRY_TREE_GROWTH] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_FACE_DOWN_AND_UP] = DIR_SOUTH,
	.byte 3 @ [MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT] = DIR_WEST,
	.byte 2 @ [MOVEMENT_TYPE_FACE_UP_AND_LEFT] = DIR_NORTH,
	.byte 2 @ [MOVEMENT_TYPE_FACE_UP_AND_RIGHT] = DIR_NORTH,
	.byte 1 @ [MOVEMENT_TYPE_FACE_DOWN_AND_LEFT] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_FACE_DOWN_UP_AND_LEFT] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_FACE_DOWN_UP_AND_RIGHT] = DIR_SOUTH,
	.byte 2 @ [MOVEMENT_TYPE_FACE_UP_LEFT_AND_RIGHT] = DIR_NORTH,
	.byte 1 @ [MOVEMENT_TYPE_FACE_DOWN_LEFT_AND_RIGHT] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_ROTATE_CLOCKWISE] = DIR_SOUTH,
	.byte 2 @ [MOVEMENT_TYPE_WALK_UP_AND_DOWN] = DIR_NORTH,
	.byte 1 @ [MOVEMENT_TYPE_WALK_DOWN_AND_UP] = DIR_SOUTH,
	.byte 3 @ [MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT] = DIR_WEST,
	.byte 4 @ [MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT] = DIR_EAST,
	.byte 2 @ [MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_LEFT_DOWN] = DIR_NORTH,
	.byte 4 @ [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_DOWN_UP] = DIR_EAST,
	.byte 1 @ [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_RIGHT_LEFT] = DIR_SOUTH,
	.byte 3 @ [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_UP_RIGHT] = DIR_WEST,
	.byte 2 @ [MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_RIGHT_DOWN] = DIR_NORTH,
	.byte 3 @ [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_DOWN_UP] = DIR_WEST,
	.byte 1 @ [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_UP_LEFT_RIGHT] = DIR_SOUTH,
	.byte 4 @ [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_UP_LEFT] = DIR_EAST,
	.byte 3 @ [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_DOWN_RIGHT] = DIR_WEST,
	.byte 2 @ [MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_RIGHT_LEFT] = DIR_NORTH,
	.byte 4 @ [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_LEFT_UP_DOWN] = DIR_EAST,
	.byte 1 @ [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_LEFT_UP] = DIR_SOUTH,
	.byte 4 @ [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_DOWN_LEFT] = DIR_EAST,
	.byte 2 @ [MOVEMENT_TYPE_WALK_SEQUENCE_UP_DOWN_LEFT_RIGHT] = DIR_NORTH,
	.byte 3 @ [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_RIGHT_UP_DOWN] = DIR_WEST,
	.byte 1 @ [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_RIGHT_UP] = DIR_SOUTH,
	.byte 2 @ [MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_DOWN_RIGHT] = DIR_NORTH,
	.byte 1 @ [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_UP_LEFT] = DIR_SOUTH,
	.byte 3 @ [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_RIGHT_UP] = DIR_WEST,
	.byte 4 @ [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_UP_LEFT_DOWN] = DIR_EAST,
	.byte 2 @ [MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_DOWN_LEFT] = DIR_NORTH,
	.byte 1 @ [MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT] = DIR_SOUTH,
	.byte 3 @ [MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_RIGHT_DOWN] = DIR_WEST,
	.byte 4 @ [MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_LEFT_UP] = DIR_EAST,
	.byte 2 @ [MOVEMENT_TYPE_COPY_PLAYER] = DIR_NORTH,
	.byte 1 @ [MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE] = DIR_SOUTH,
	.byte 3 @ [MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE] = DIR_WEST,
	.byte 4 @ [MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE] = DIR_EAST,
	.byte 1 @ [MOVEMENT_TYPE_TREE_DISGUISE] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_MOUNTAIN_DISGUISE] = DIR_SOUTH,
	.byte 2 @ [MOVEMENT_TYPE_COPY_PLAYER_IN_GRASS] = DIR_NORTH,
	.byte 1 @ [MOVEMENT_TYPE_COPY_PLAYER_OPPOSITE_IN_GRASS] = DIR_SOUTH,
	.byte 3 @ [MOVEMENT_TYPE_COPY_PLAYER_COUNTERCLOCKWISE_IN_GRASS] = DIR_WEST,
	.byte 4 @ [MOVEMENT_TYPE_COPY_PLAYER_CLOCKWISE_IN_GRASS] = DIR_EAST,
	.byte 1 @ [MOVEMENT_TYPE_HIDDEN] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_WALK_IN_PLACE_DOWN] = DIR_SOUTH,
	.byte 2 @ [MOVEMENT_TYPE_WALK_IN_PLACE_UP] = DIR_NORTH,
	.byte 3 @ [MOVEMENT_TYPE_WALK_IN_PLACE_LEFT] = DIR_WEST,
	.byte 4 @ [MOVEMENT_TYPE_WALK_IN_PLACE_RIGHT] = DIR_EAST,
	.byte 1 @ [MOVEMENT_TYPE_JOG_IN_PLACE_DOWN] = DIR_SOUTH,
	.byte 2 @ [MOVEMENT_TYPE_JOG_IN_PLACE_UP] = DIR_NORTH,
	.byte 3 @ [MOVEMENT_TYPE_JOG_IN_PLACE_LEFT] = DIR_WEST,
	.byte 4 @ [MOVEMENT_TYPE_JOG_IN_PLACE_RIGHT] = DIR_EAST,
	.byte 1 @ [MOVEMENT_TYPE_RUN_IN_PLACE_DOWN] = DIR_SOUTH,
	.byte 2 @ [MOVEMENT_TYPE_RUN_IN_PLACE_UP] = DIR_NORTH,
	.byte 3 @ [MOVEMENT_TYPE_RUN_IN_PLACE_LEFT] = DIR_WEST,
	.byte 4 @ [MOVEMENT_TYPE_RUN_IN_PLACE_RIGHT] = DIR_EAST,
	.byte 1 @ [MOVEMENT_TYPE_INVISIBLE] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_WALK_SLOWLY_IN_PLACE_DOWN] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_WALK_SLOWLY_IN_PLACE_UP] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_WALK_SLOWLY_IN_PLACE_LEFT] = DIR_SOUTH,
	.byte 1 @ [MOVEMENT_TYPE_WALK_SLOWLY_IN_PLACE_RIGHT] = DIR_SOUTH,

.align 2, 0
gObjectEventGraphicsInfoPointers:: @ 839FDB0
	.4byte gObjectEventGraphicsInfo_83A3BB0
	.4byte gObjectEventGraphicsInfo_83A3BD4
	.4byte gObjectEventGraphicsInfo_83A3BF8
	.4byte gObjectEventGraphicsInfo_83A3C1C
	.4byte gObjectEventGraphicsInfo_83A4858
	.4byte gObjectEventGraphicsInfo_83A48A0
	.4byte gObjectEventGraphicsInfo_83A48C4
	.4byte gObjectEventGraphicsInfo_83A4564
	.4byte gObjectEventGraphicsInfo_83A4588
	.4byte gObjectEventGraphicsInfo_83A45AC
	.4byte gObjectEventGraphicsInfo_83A45D0
	.4byte gObjectEventGraphicsInfo_83A487C
	.4byte gObjectEventGraphicsInfo_83A48E8
	.4byte gObjectEventGraphicsInfo_83A490C
	.4byte gObjectEventGraphicsInfo_83A3C64
	.4byte gObjectEventGraphicsInfo_83A3C88
	.4byte gObjectEventGraphicsInfo_83A3CAC
	.4byte gObjectEventGraphicsInfo_83A3CD0
	.4byte gObjectEventGraphicsInfo_83A3D3C
	.4byte gObjectEventGraphicsInfo_83A3DA8
	.4byte gObjectEventGraphicsInfo_83A3DF0
	.4byte gObjectEventGraphicsInfo_83A3CF4
	.4byte gObjectEventGraphicsInfo_83A3D18
	.4byte gObjectEventGraphicsInfo_83A3D60
	.4byte gObjectEventGraphicsInfo_83A3DCC
	.4byte gObjectEventGraphicsInfo_83A4390
	.4byte gObjectEventGraphicsInfo_83A43B4
	.4byte gObjectEventGraphicsInfo_83A3E14
	.4byte gObjectEventGraphicsInfo_83A3E5C
	.4byte gObjectEventGraphicsInfo_83A3EEC
	.4byte gObjectEventGraphicsInfo_83A3E38
	.4byte gObjectEventGraphicsInfo_83A3D84
	.4byte gObjectEventGraphicsInfo_83A3E80
	.4byte gObjectEventGraphicsInfo_83A3F34
	.4byte gObjectEventGraphicsInfo_83A4420
	.4byte gObjectEventGraphicsInfo_83A3F58
	.4byte gObjectEventGraphicsInfo_83A424C
	.4byte gObjectEventGraphicsInfo_83A4228
	.4byte gObjectEventGraphicsInfo_83A4270
	.4byte gObjectEventGraphicsInfo_83A3F7C
	.4byte gObjectEventGraphicsInfo_83A3FA0
	.4byte gObjectEventGraphicsInfo_83A3FC4
	.4byte gObjectEventGraphicsInfo_83A3FE8
	.4byte gObjectEventGraphicsInfo_83A4078
	.4byte gObjectEventGraphicsInfo_83A409C
	.4byte gObjectEventGraphicsInfo_83A40C0
	.4byte gObjectEventGraphicsInfo_83A40E4
	.4byte gObjectEventGraphicsInfo_83A3EA4
	.4byte gObjectEventGraphicsInfo_83A3EC8
	.4byte gObjectEventGraphicsInfo_83A4618
	.4byte gObjectEventGraphicsInfo_83A4054
	.4byte gObjectEventGraphicsInfo_83A4978
	.4byte gObjectEventGraphicsInfo_83A400C
	.4byte gObjectEventGraphicsInfo_83A42B8
	.4byte gObjectEventGraphicsInfo_83A4108
	.4byte gObjectEventGraphicsInfo_83A412C
	.4byte gObjectEventGraphicsInfo_83A4294
	.4byte gObjectEventGraphicsInfo_83A41BC
	.4byte gObjectEventGraphicsInfo_83A4030
	.4byte gObjectEventGraphicsInfo_83A3F10
	.4byte gObjectEventGraphicsInfo_83A3C40
	.4byte gObjectEventGraphicsInfo_83A4150
	.4byte gObjectEventGraphicsInfo_83A4174
	.4byte gObjectEventGraphicsInfo_83A4198
	.4byte gObjectEventGraphicsInfo_83A4300
	.4byte gObjectEventGraphicsInfo_83A44D4
	.4byte gObjectEventGraphicsInfo_83A44F8
	.4byte gObjectEventGraphicsInfo_83A4324
	.4byte gObjectEventGraphicsInfo_83A4468
	.4byte gObjectEventGraphicsInfo_83A448C
	.4byte gObjectEventGraphicsInfo_83A44B0
	.4byte gObjectEventGraphicsInfo_83A436C
	.4byte gObjectEventGraphicsInfo_83A4834
	.4byte gObjectEventGraphicsInfo_83A47A4
	.4byte gObjectEventGraphicsInfo_83A4810
	.4byte gObjectEventGraphicsInfo_83A4660
	.4byte gObjectEventGraphicsInfo_83A47C8
	.4byte gObjectEventGraphicsInfo_83A47EC
	.4byte gObjectEventGraphicsInfo_83A43D8
	.4byte gObjectEventGraphicsInfo_83A43FC
	.4byte gObjectEventGraphicsInfo_83A4684
	.4byte gObjectEventGraphicsInfo_83A46A8
	.4byte gObjectEventGraphicsInfo_83A46CC
	.4byte gObjectEventGraphicsInfo_83A46F0
	.4byte gObjectEventGraphicsInfo_83A4714
	.4byte gObjectEventGraphicsInfo_83A4780
	.4byte gObjectEventGraphicsInfo_83A475C
	.4byte gObjectEventGraphicsInfo_83A4738
	.4byte gObjectEventGraphicsInfo_83A50EC
	.4byte gObjectEventGraphicsInfo_83A463C
	.4byte gObjectEventGraphicsInfo_83A41E0
	.4byte gObjectEventGraphicsInfo_83A42DC
	.4byte gObjectEventGraphicsInfo_83A4348
	.4byte gObjectEventGraphicsInfo_83A4930
	.4byte gObjectEventGraphicsInfo_83A4954
	.4byte gObjectEventGraphicsInfo_83A4444
	.4byte gObjectEventGraphicsInfo_83A451C
	.4byte gObjectEventGraphicsInfo_83A4540
	.4byte gObjectEventGraphicsInfo_83A49C0
	.4byte gObjectEventGraphicsInfo_83A49E4
	.4byte gObjectEventGraphicsInfo_83A4A08
	.4byte gObjectEventGraphicsInfo_83A4A2C
	.4byte gObjectEventGraphicsInfo_83A4A50
	.4byte gObjectEventGraphicsInfo_83A4A74
	.4byte gObjectEventGraphicsInfo_83A4A98
	.4byte gObjectEventGraphicsInfo_83A4ABC
	.4byte gObjectEventGraphicsInfo_83A4AE0
	.4byte gObjectEventGraphicsInfo_83A4B04
	.4byte gObjectEventGraphicsInfo_83A5110
	.4byte gObjectEventGraphicsInfo_83A499C
	.4byte gObjectEventGraphicsInfo_83A4B28
	.4byte gObjectEventGraphicsInfo_83A4F84
	.4byte gObjectEventGraphicsInfo_83A4FF0
	.4byte gObjectEventGraphicsInfo_83A50C8
	.4byte gObjectEventGraphicsInfo_83A5014
	.4byte gObjectEventGraphicsInfo_83A5080
	.4byte gObjectEventGraphicsInfo_83A50A4
	.4byte gObjectEventGraphicsInfo_83A5038
	.4byte gObjectEventGraphicsInfo_83A4B4C
	.4byte gObjectEventGraphicsInfo_83A4B70
	.4byte gObjectEventGraphicsInfo_83A505C
	.4byte gObjectEventGraphicsInfo_83A4B94
	.4byte gObjectEventGraphicsInfo_83A4BB8
	.4byte gObjectEventGraphicsInfo_83A4BDC
	.4byte gObjectEventGraphicsInfo_83A4C00
	.4byte gObjectEventGraphicsInfo_83A4C24
	.4byte gObjectEventGraphicsInfo_83A4C48
	.4byte gObjectEventGraphicsInfo_83A4C6C
	.4byte gObjectEventGraphicsInfo_83A4C90
	.4byte gObjectEventGraphicsInfo_83A4CB4
	.4byte gObjectEventGraphicsInfo_83A4CD8
	.4byte gObjectEventGraphicsInfo_83A4CFC
	.4byte gObjectEventGraphicsInfo_83A4D20
	.4byte gObjectEventGraphicsInfo_83A4D44
	.4byte gObjectEventGraphicsInfo_83A4FA8
	.4byte gObjectEventGraphicsInfo_83A4D68
	.4byte gObjectEventGraphicsInfo_83A4D8C
	.4byte gObjectEventGraphicsInfo_83A4DB0
	.4byte gObjectEventGraphicsInfo_83A4DD4
	.4byte gObjectEventGraphicsInfo_83A4E64
	.4byte gObjectEventGraphicsInfo_83A4E88
	.4byte gObjectEventGraphicsInfo_83A4EAC
	.4byte gObjectEventGraphicsInfo_83A4EF4
	.4byte gObjectEventGraphicsInfo_83A4ED0
	.4byte gObjectEventGraphicsInfo_83A4F18
	.4byte gObjectEventGraphicsInfo_83A4F3C
	.4byte gObjectEventGraphicsInfo_83A4F60
	.4byte gObjectEventGraphicsInfo_83A4FCC
	.4byte gObjectEventGraphicsInfo_83A4DF8
	.4byte gObjectEventGraphicsInfo_83A4E1C
	.4byte gObjectEventGraphicsInfo_83A4E40
	.4byte gObjectEventGraphicsInfo_83A5134

gFieldEffectObjectTemplatePointers:: @ 83A0010
	.4byte gUnknown_83A537C
	.4byte gUnknown_83A5394
	.4byte gUnknown_83A53AC
	.4byte gUnknown_83A53C4
	.4byte gUnknown_83A5420
	.4byte gUnknown_83A5488
	.4byte gUnknown_83A54E4
	.4byte gUnknown_83A556C
	.4byte gUnknown_83A5604
	.4byte gUnknown_83A5648
	.4byte gUnknown_83A5698
	.4byte gUnknown_83A56F4
	.4byte gUnknown_83A583C
	.4byte gUnknown_83A589C
	.4byte gUnknown_83A58E0
	.4byte gUnknown_83A593C
	.4byte gUnknown_83A59A4
	.4byte gUnknown_83A5A30
	.4byte gUnknown_83A5A88
	.4byte gUnknown_83A5AD8
	.4byte gUnknown_83A5B74
	.4byte gUnknown_83A5C34
	.4byte NULL
	.4byte gUnknown_83A5750
	.4byte gUnknown_83A5CB4
	.4byte gUnknown_83A5D34
	.4byte gUnknown_83A5E00
	.4byte gUnknown_83A57EC
	.4byte gUnknown_83A5D84
	.4byte gUnknown_83A5B1C
	.4byte gUnknown_83A5E38
	.4byte gUnknown_83A5E64
	.4byte gUnknown_83A5EC0
	.4byte gUnknown_83A5F24
	.4byte gUnknown_83A5FA4
	.4byte gUnknown_83A5FE0

gSpriteImages_83A00A0:: @ 83A00A0
	obj_frame_tiles gUnknown_835BB68, 0x100
	obj_frame_tiles gUnknown_835BB68 + 0x100, 0x100
	obj_frame_tiles gUnknown_835BB68 + 0x200, 0x100
	obj_frame_tiles gUnknown_835BB68 + 0x300, 0x100
	obj_frame_tiles gUnknown_835BB68 + 0x400, 0x100
	obj_frame_tiles gUnknown_835BB68 + 0x500, 0x100
	obj_frame_tiles gUnknown_835BB68 + 0x600, 0x100
	obj_frame_tiles gUnknown_835BB68 + 0x700, 0x100
	obj_frame_tiles gUnknown_835BB68 + 0x800, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x300, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x400, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x500, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x600, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x700, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x800, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x900, 0x100
	obj_frame_tiles gUnknown_835C468 + 0xA00, 0x100
	obj_frame_tiles gUnknown_835C468 + 0xB00, 0x100
	obj_frame_tiles gUnknown_835C468 + 0xC00, 0x100
	obj_frame_tiles gUnknown_835C468 + 0xD00, 0x100

gSpriteImages_83A0140:: @ 83A0140
	obj_frame_tiles gUnknown_8361FA8, 0x200
	obj_frame_tiles gUnknown_8361FA8 + 0x200, 0x200
	obj_frame_tiles gUnknown_8361FA8 + 0x400, 0x200
	obj_frame_tiles gUnknown_8361FA8 + 0x600, 0x200
	obj_frame_tiles gUnknown_8361FA8 + 0x800, 0x200
	obj_frame_tiles gUnknown_8361FA8 + 0xA00, 0x200
	obj_frame_tiles gUnknown_8361FA8 + 0xC00, 0x200
	obj_frame_tiles gUnknown_8361FA8 + 0xE00, 0x200
	obj_frame_tiles gUnknown_8361FA8 + 0x1000, 0x200

gSpriteImages_83A0188:: @ 83A0188
	obj_frame_tiles gUnknown_835D268, 0x100
	obj_frame_tiles gUnknown_835D268 + 0x100, 0x100
	obj_frame_tiles gUnknown_835D268 + 0x200, 0x100
	obj_frame_tiles gUnknown_835D268 + 0x300, 0x100
	obj_frame_tiles gUnknown_835D268 + 0x400, 0x100
	obj_frame_tiles gUnknown_835D268 + 0x500, 0x100
	obj_frame_tiles gUnknown_835D268 + 0x600, 0x100
	obj_frame_tiles gUnknown_835D268 + 0x700, 0x100
	obj_frame_tiles gUnknown_835D268 + 0x800, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x300, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x400, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x500, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x600, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x700, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x800, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x900, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0xA00, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0xB00, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0xC00, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0xD00, 0x100

gSpriteImages_83A0228:: @ 83A0228
	obj_frame_tiles gUnknown_8363DA8, 0x200
	obj_frame_tiles gUnknown_8363DA8 + 0x200, 0x200
	obj_frame_tiles gUnknown_8363DA8 + 0x400, 0x200
	obj_frame_tiles gUnknown_8363DA8 + 0x600, 0x200
	obj_frame_tiles gUnknown_8363DA8 + 0x800, 0x200
	obj_frame_tiles gUnknown_8363DA8 + 0xA00, 0x200
	obj_frame_tiles gUnknown_8363DA8 + 0xC00, 0x200
	obj_frame_tiles gUnknown_8363DA8 + 0xE00, 0x200
	obj_frame_tiles gUnknown_8363DA8 + 0x1000, 0x200

gSpriteImages_83A0270:: @ 83A0270
	obj_frame_tiles gUnknown_835C468, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x100, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x200, 0x100
	obj_frame_tiles gUnknown_835C468, 0x100
	obj_frame_tiles gUnknown_835C468, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x100, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x100, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x200, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x200, 0x100
	obj_frame_tiles gUnknown_835C468, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x100, 0x100
	obj_frame_tiles gUnknown_835C468 + 0x200, 0x100

gSpriteImages_83A02D0:: @ 83A02D0
	obj_frame_tiles gUnknown_835DB68, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x100, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x200, 0x100
	obj_frame_tiles gUnknown_835DB68, 0x100
	obj_frame_tiles gUnknown_835DB68, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x100, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x100, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x200, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x200, 0x100
	obj_frame_tiles gUnknown_835DB68, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x100, 0x100
	obj_frame_tiles gUnknown_835DB68 + 0x200, 0x100

gSpriteImages_83A0330:: @ 83A0330
	obj_frame_tiles gUnknown_835E9A8, 0x100
	obj_frame_tiles gUnknown_835E9A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_835E9A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_835E9A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_835E9A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_835E9A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_835E9A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_835E9A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_835E9A8 + 0x800, 0x100

gSpriteImages_83A0378:: @ 83A0378
	obj_frame_tiles gUnknown_835F2A8, 0x100
	obj_frame_tiles gUnknown_835F2A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_835F2A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_835F2A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_835F2A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_835F2A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_835F2A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_835F2A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_835F2A8 + 0x800, 0x100

gSpriteImages_83A03C0:: @ 83A03C0
	obj_frame_tiles gUnknown_83631A8, 0x200
	obj_frame_tiles gUnknown_83631A8 + 0x200, 0x200
	obj_frame_tiles gUnknown_83631A8 + 0x400, 0x200
	obj_frame_tiles gUnknown_83631A8 + 0x600, 0x200
	obj_frame_tiles gUnknown_83631A8 + 0x800, 0x200
	obj_frame_tiles gUnknown_83631A8 + 0xA00, 0x200

gSpriteImages_83A03F0:: @ 83A03F0
	obj_frame_tiles gUnknown_8364FA8, 0x200
	obj_frame_tiles gUnknown_8364FA8 + 0x200, 0x200
	obj_frame_tiles gUnknown_8364FA8 + 0x400, 0x200
	obj_frame_tiles gUnknown_8364FA8 + 0x600, 0x200
	obj_frame_tiles gUnknown_8364FA8 + 0x800, 0x200
	obj_frame_tiles gUnknown_8364FA8 + 0xA00, 0x200

gSpriteImages_83A0420:: @ 83A0420
	obj_frame_tiles gUnknown_8365BA8, 0x100
	obj_frame_tiles gUnknown_8365BA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_8365BA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_8365BA8 + 0x300, 0x100
	obj_frame_tiles gUnknown_8365BA8 + 0x400, 0x100
	obj_frame_tiles gUnknown_8365BA8 + 0x500, 0x100
	obj_frame_tiles gUnknown_8365BA8 + 0x600, 0x100
	obj_frame_tiles gUnknown_8365BA8 + 0x700, 0x100
	obj_frame_tiles gUnknown_8365BA8 + 0x800, 0x100
	obj_frame_tiles gUnknown_83664A8, 0x100

gSpriteImages_83A0470:: @ 83A0470
	obj_frame_tiles gUnknown_83664A8, 0x100
	obj_frame_tiles gUnknown_83664A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83664A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83664A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_83664A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_83664A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_83664A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_83664A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_83664A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_8366DA8, 0x100

gSpriteImages_83A04C0:: @ 83A04C0
	obj_frame_tiles gUnknown_8397708, 0x100
	obj_frame_tiles gUnknown_8397708 + 0x100, 0x100
	obj_frame_tiles gUnknown_8397708 + 0x200, 0x100
	obj_frame_tiles gUnknown_8397708 + 0x300, 0x100
	obj_frame_tiles gUnknown_8397708 + 0x400, 0x100
	obj_frame_tiles gUnknown_8397708 + 0x500, 0x100
	obj_frame_tiles gUnknown_8397708 + 0x600, 0x100
	obj_frame_tiles gUnknown_8397708 + 0x700, 0x100
	obj_frame_tiles gUnknown_8397708 + 0x800, 0x100

gSpriteImages_83A0508:: @ 83A0508
	obj_frame_tiles gUnknown_836D928, 0x80
	obj_frame_tiles gUnknown_836D928 + 0x80, 0x80
	obj_frame_tiles gUnknown_836D928 + 0x100, 0x80
	obj_frame_tiles gUnknown_836D928 + 0x180, 0x80
	obj_frame_tiles gUnknown_836D928 + 0x200, 0x80
	obj_frame_tiles gUnknown_836D928 + 0x280, 0x80
	obj_frame_tiles gUnknown_836D928 + 0x300, 0x80
	obj_frame_tiles gUnknown_836D928 + 0x380, 0x80
	obj_frame_tiles gUnknown_836D928 + 0x400, 0x80

gSpriteImages_83A0550:: @ 83A0550
	obj_frame_tiles gUnknown_836DDA8, 0x80
	obj_frame_tiles gUnknown_836DDA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_836DDA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_836DDA8 + 0x180, 0x80
	obj_frame_tiles gUnknown_836DDA8 + 0x200, 0x80
	obj_frame_tiles gUnknown_836DDA8 + 0x280, 0x80
	obj_frame_tiles gUnknown_836DDA8 + 0x300, 0x80
	obj_frame_tiles gUnknown_836DDA8 + 0x380, 0x80
	obj_frame_tiles gUnknown_836DDA8 + 0x400, 0x80
	obj_frame_tiles gUnknown_836DDA8 + 0x480, 0x80

gSpriteImages_83A05A0:: @ 83A05A0
	obj_frame_tiles gUnknown_836E2A8, 0x100
	obj_frame_tiles gUnknown_836E2A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_836E2A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_836E2A8, 0x100
	obj_frame_tiles gUnknown_836E2A8, 0x100
	obj_frame_tiles gUnknown_836E2A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_836E2A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_836E2A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_836E2A8 + 0x100, 0x100

gSpriteImages_83A05E8:: @ 83A05E8
	obj_frame_tiles gUnknown_836E5A8, 0x100
	obj_frame_tiles gUnknown_836E5A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_836E5A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_836E5A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_836E5A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_836E5A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_836E5A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_836E5A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_836E5A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_836E5A8 + 0x900, 0x100

gSpriteImages_83A0638:: @ 83A0638
	obj_frame_tiles gUnknown_836EFA8, 0x100
	obj_frame_tiles gUnknown_836EFA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_836EFA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_836EFA8 + 0x300, 0x100
	obj_frame_tiles gUnknown_836EFA8 + 0x400, 0x100
	obj_frame_tiles gUnknown_836EFA8 + 0x500, 0x100
	obj_frame_tiles gUnknown_836EFA8 + 0x600, 0x100
	obj_frame_tiles gUnknown_836EFA8 + 0x700, 0x100
	obj_frame_tiles gUnknown_836EFA8 + 0x800, 0x100
	obj_frame_tiles gUnknown_836EFA8 + 0x900, 0x100

gSpriteImages_83A0688:: @ 83A0688
	obj_frame_tiles gUnknown_83703A8, 0x100
	obj_frame_tiles gUnknown_83703A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83703A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83703A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_83703A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_83703A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_83703A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_83703A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_83703A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_83703A8 + 0x900, 0x100

gSpriteImages_83A06D8:: @ 83A06D8
	obj_frame_tiles gUnknown_8370DA8, 0x100
	obj_frame_tiles gUnknown_8370DA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_8370DA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_8370DA8 + 0x300, 0x100
	obj_frame_tiles gUnknown_8370DA8 + 0x400, 0x100
	obj_frame_tiles gUnknown_8370DA8 + 0x500, 0x100
	obj_frame_tiles gUnknown_8370DA8 + 0x600, 0x100
	obj_frame_tiles gUnknown_8370DA8 + 0x700, 0x100
	obj_frame_tiles gUnknown_8370DA8 + 0x800, 0x100

gSpriteImages_83A0720:: @ 83A0720
	obj_frame_tiles gUnknown_83720A8, 0x100
	obj_frame_tiles gUnknown_83720A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83720A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83720A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_83720A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_83720A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_83720A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_83720A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_83720A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_83720A8 + 0x900, 0x100

gSpriteImages_83A0770:: @ 83A0770
	obj_frame_tiles gUnknown_83716A8, 0x100
	obj_frame_tiles gUnknown_83716A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83716A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83716A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_83716A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_83716A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_83716A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_83716A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_83716A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_83716A8 + 0x900, 0x100

gSpriteImages_83A07C0:: @ 83A07C0
	obj_frame_tiles gUnknown_83733A8, 0x100
	obj_frame_tiles gUnknown_83733A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83733A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83733A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_83733A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_83733A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_83733A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_83733A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_83733A8 + 0x800, 0x100

gSpriteImages_83A0808:: @ 83A0808
	obj_frame_tiles gUnknown_8373CA8, 0x100
	obj_frame_tiles gUnknown_8373CA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_8373CA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_8373CA8 + 0x300, 0x100
	obj_frame_tiles gUnknown_8373CA8 + 0x400, 0x100
	obj_frame_tiles gUnknown_8373CA8 + 0x500, 0x100
	obj_frame_tiles gUnknown_8373CA8 + 0x600, 0x100
	obj_frame_tiles gUnknown_8373CA8 + 0x700, 0x100
	obj_frame_tiles gUnknown_8373CA8 + 0x800, 0x100
	obj_frame_tiles gUnknown_8373CA8 + 0x900, 0x100

gSpriteImages_83A0858:: @ 83A0858
	obj_frame_tiles gUnknown_83746A8, 0x100
	obj_frame_tiles gUnknown_83746A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83746A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83746A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_83746A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_83746A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_83746A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_83746A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_83746A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_83746A8 + 0x900, 0x100

gSpriteImages_83A08A8:: @ 83A08A8
	obj_frame_tiles gUnknown_83750A8, 0x100
	obj_frame_tiles gUnknown_83750A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83750A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83750A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_83750A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_83750A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_83750A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_83750A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_83750A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_83750A8 + 0x900, 0x100

gSpriteImages_83A08F8:: @ 83A08F8
	obj_frame_tiles gUnknown_8375CA8, 0x100
	obj_frame_tiles gUnknown_8375CA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_8375CA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_8375CA8 + 0x300, 0x100
	obj_frame_tiles gUnknown_8375CA8 + 0x400, 0x100
	obj_frame_tiles gUnknown_8375CA8 + 0x500, 0x100
	obj_frame_tiles gUnknown_8375CA8 + 0x600, 0x100
	obj_frame_tiles gUnknown_8375CA8 + 0x700, 0x100
	obj_frame_tiles gUnknown_8375CA8 + 0x800, 0x100

gSpriteImages_83A0940:: @ 83A0940
	obj_frame_tiles gUnknown_83766A8, 0x100
	obj_frame_tiles gUnknown_83766A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83766A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83766A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_83766A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_83766A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_83766A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_83766A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_83766A8 + 0x800, 0x100

gSpriteImages_83A0988:: @ 83A0988
	obj_frame_tiles gUnknown_83770A8, 0x100
	obj_frame_tiles gUnknown_83770A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83770A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83770A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_83770A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_83770A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_83770A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_83770A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_83770A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_83770A8 + 0x900, 0x100

gSpriteImages_83A09D8:: @ 83A09D8
	obj_frame_tiles gUnknown_8377AA8, 0x100
	obj_frame_tiles gUnknown_8377AA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_8377AA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_8377AA8 + 0x300, 0x100
	obj_frame_tiles gUnknown_8377AA8 + 0x400, 0x100
	obj_frame_tiles gUnknown_8377AA8 + 0x500, 0x100
	obj_frame_tiles gUnknown_8377AA8 + 0x600, 0x100
	obj_frame_tiles gUnknown_8377AA8 + 0x700, 0x100
	obj_frame_tiles gUnknown_8377AA8 + 0x800, 0x100

gSpriteImages_83A0A20:: @ 83A0A20
	obj_frame_tiles gUnknown_83783A8, 0x100
	obj_frame_tiles gUnknown_83783A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83783A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83783A8, 0x100
	obj_frame_tiles gUnknown_83783A8, 0x100
	obj_frame_tiles gUnknown_83783A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83783A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83783A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83783A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_8378CA8, 0x100

gSpriteImages_83A0A70:: @ 83A0A70
	obj_frame_tiles gUnknown_8375AA8, 0x200
	obj_frame_tiles gUnknown_8375AA8, 0x200
	obj_frame_tiles gUnknown_8375AA8, 0x200
	obj_frame_tiles gUnknown_8375AA8, 0x200
	obj_frame_tiles gUnknown_8375AA8, 0x200
	obj_frame_tiles gUnknown_8375AA8, 0x200
	obj_frame_tiles gUnknown_8375AA8, 0x200
	obj_frame_tiles gUnknown_8375AA8, 0x200
	obj_frame_tiles gUnknown_8375AA8, 0x200

gSpriteImages_83A0AB8:: @ 83A0AB8
	obj_frame_tiles gUnknown_8378CA8, 0x100
	obj_frame_tiles gUnknown_8378CA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_8378CA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_8378CA8 + 0x300, 0x100
	obj_frame_tiles gUnknown_8378CA8 + 0x400, 0x100
	obj_frame_tiles gUnknown_8378CA8 + 0x500, 0x100
	obj_frame_tiles gUnknown_8378CA8 + 0x600, 0x100
	obj_frame_tiles gUnknown_8378CA8 + 0x700, 0x100
	obj_frame_tiles gUnknown_8378CA8 + 0x800, 0x100

gSpriteImages_83A0B00:: @ 83A0B00
	obj_frame_tiles gUnknown_83795A8, 0x100
	obj_frame_tiles gUnknown_83795A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_83795A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_83795A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_83795A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_83795A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_83795A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_83795A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_83795A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_83795A8 + 0x900, 0x100

gSpriteImages_83A0B50:: @ 83A0B50
	obj_frame_tiles gUnknown_8379FA8, 0x100
	obj_frame_tiles gUnknown_8379FA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_8379FA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_8379FA8 + 0x300, 0x100
	obj_frame_tiles gUnknown_8379FA8 + 0x400, 0x100
	obj_frame_tiles gUnknown_8379FA8 + 0x500, 0x100
	obj_frame_tiles gUnknown_8379FA8 + 0x600, 0x100
	obj_frame_tiles gUnknown_8379FA8 + 0x700, 0x100
	obj_frame_tiles gUnknown_8379FA8 + 0x800, 0x100
	obj_frame_tiles gUnknown_8379FA8 + 0x900, 0x100

gSpriteImages_83A0BA0:: @ 83A0BA0
	obj_frame_tiles gUnknown_837A9A8, 0x100
	obj_frame_tiles gUnknown_837A9A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_837A9A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_837A9A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_837A9A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_837A9A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_837A9A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_837A9A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_837A9A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_837A9A8 + 0x900, 0x100

gSpriteImages_83A0BF0:: @ 83A0BF0
	obj_frame_tiles gUnknown_837B3A8, 0x100
	obj_frame_tiles gUnknown_837B3A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_837B3A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_837B3A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_837B3A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_837B3A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_837B3A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_837B3A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_837B3A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_837B3A8 + 0x900, 0x100

gSpriteImages_83A0C40:: @ 83A0C40
	obj_frame_tiles gUnknown_836F9A8, 0x100
	obj_frame_tiles gUnknown_836F9A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_836F9A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_836F9A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_836F9A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_836F9A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_836F9A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_836F9A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_836F9A8 + 0x800, 0x100
	obj_frame_tiles gUnknown_836F9A8 + 0x900, 0x100

gSpriteImages_83A0C90:: @ 83A0C90
	obj_frame_tiles gUnknown_837BF28, 0x100
	obj_frame_tiles gUnknown_837BF28 + 0x100, 0x100
	obj_frame_tiles gUnknown_837BF28 + 0x200, 0x100
	obj_frame_tiles gUnknown_837BF28 + 0x300, 0x100
	obj_frame_tiles gUnknown_837BF28 + 0x400, 0x100
	obj_frame_tiles gUnknown_837BF28 + 0x500, 0x100
	obj_frame_tiles gUnknown_837BF28 + 0x600, 0x100
	obj_frame_tiles gUnknown_837BF28 + 0x700, 0x100
	obj_frame_tiles gUnknown_837BF28 + 0x800, 0x100
	obj_frame_tiles gUnknown_837BF28 + 0x900, 0x100

gSpriteImages_83A0CE0:: @ 83A0CE0
	obj_frame_tiles gUnknown_837C928, 0x100
	obj_frame_tiles gUnknown_837C928 + 0x100, 0x100
	obj_frame_tiles gUnknown_837C928 + 0x200, 0x100
	obj_frame_tiles gUnknown_837C928 + 0x300, 0x100
	obj_frame_tiles gUnknown_837C928 + 0x400, 0x100
	obj_frame_tiles gUnknown_837C928 + 0x500, 0x100
	obj_frame_tiles gUnknown_837C928 + 0x600, 0x100
	obj_frame_tiles gUnknown_837C928 + 0x700, 0x100
	obj_frame_tiles gUnknown_837C928 + 0x800, 0x100
	obj_frame_tiles gUnknown_837C928 + 0x900, 0x100

gSpriteImages_83A0D30:: @ 83A0D30
	obj_frame_tiles gUnknown_837D328, 0x100
	obj_frame_tiles gUnknown_837D328 + 0x100, 0x100
	obj_frame_tiles gUnknown_837D328 + 0x200, 0x100
	obj_frame_tiles gUnknown_837D328 + 0x300, 0x100
	obj_frame_tiles gUnknown_837D328 + 0x400, 0x100
	obj_frame_tiles gUnknown_837D328 + 0x500, 0x100
	obj_frame_tiles gUnknown_837D328 + 0x600, 0x100
	obj_frame_tiles gUnknown_837D328 + 0x700, 0x100
	obj_frame_tiles gUnknown_837D328 + 0x800, 0x100

gSpriteImages_83A0D78:: @ 83A0D78
	obj_frame_tiles gUnknown_837DC28, 0x100
	obj_frame_tiles gUnknown_837DC28 + 0x100, 0x100
	obj_frame_tiles gUnknown_837DC28 + 0x200, 0x100
	obj_frame_tiles gUnknown_837DC28 + 0x300, 0x100
	obj_frame_tiles gUnknown_837DC28 + 0x400, 0x100
	obj_frame_tiles gUnknown_837DC28 + 0x500, 0x100
	obj_frame_tiles gUnknown_837DC28 + 0x600, 0x100
	obj_frame_tiles gUnknown_837DC28 + 0x700, 0x100
	obj_frame_tiles gUnknown_837DC28 + 0x800, 0x100
	obj_frame_tiles gUnknown_837DC28 + 0x900, 0x100

gSpriteImages_83A0DC8:: @ 83A0DC8
	obj_frame_tiles gUnknown_837E628, 0x100
	obj_frame_tiles gUnknown_837E628 + 0x100, 0x100
	obj_frame_tiles gUnknown_837E628 + 0x200, 0x100
	obj_frame_tiles gUnknown_837E628 + 0x300, 0x100
	obj_frame_tiles gUnknown_837E628 + 0x400, 0x100
	obj_frame_tiles gUnknown_837E628 + 0x500, 0x100
	obj_frame_tiles gUnknown_837E628 + 0x600, 0x100
	obj_frame_tiles gUnknown_837E628 + 0x700, 0x100
	obj_frame_tiles gUnknown_837E628 + 0x800, 0x100
	obj_frame_tiles gUnknown_837E628 + 0x900, 0x100

gSpriteImages_83A0E18:: @ 83A0E18
	obj_frame_tiles gUnknown_837F028, 0x100
	obj_frame_tiles gUnknown_837F028 + 0x100, 0x100
	obj_frame_tiles gUnknown_837F028 + 0x200, 0x100
	obj_frame_tiles gUnknown_837F028 + 0x300, 0x100
	obj_frame_tiles gUnknown_837F028 + 0x400, 0x100
	obj_frame_tiles gUnknown_837F028 + 0x500, 0x100
	obj_frame_tiles gUnknown_837F028 + 0x600, 0x100
	obj_frame_tiles gUnknown_837F028 + 0x700, 0x100
	obj_frame_tiles gUnknown_837F028 + 0x800, 0x100
	obj_frame_tiles gUnknown_837F028 + 0x900, 0x100

gSpriteImages_83A0E68:: @ 83A0E68
	obj_frame_tiles gUnknown_837FA28, 0x100
	obj_frame_tiles gUnknown_837FA28 + 0x100, 0x100
	obj_frame_tiles gUnknown_837FA28 + 0x200, 0x100
	obj_frame_tiles gUnknown_837FA28 + 0x300, 0x100
	obj_frame_tiles gUnknown_837FA28 + 0x400, 0x100
	obj_frame_tiles gUnknown_837FA28 + 0x500, 0x100
	obj_frame_tiles gUnknown_837FA28 + 0x600, 0x100
	obj_frame_tiles gUnknown_837FA28 + 0x700, 0x100
	obj_frame_tiles gUnknown_837FA28 + 0x800, 0x100
	obj_frame_tiles gUnknown_837FA28 + 0x900, 0x100

gSpriteImages_83A0EB8:: @ 83A0EB8
	obj_frame_tiles gUnknown_8380428, 0x100
	obj_frame_tiles gUnknown_8380428 + 0x100, 0x100
	obj_frame_tiles gUnknown_8380428 + 0x200, 0x100
	obj_frame_tiles gUnknown_8380428 + 0x300, 0x100
	obj_frame_tiles gUnknown_8380428 + 0x400, 0x100
	obj_frame_tiles gUnknown_8380428 + 0x500, 0x100
	obj_frame_tiles gUnknown_8380428 + 0x600, 0x100
	obj_frame_tiles gUnknown_8380428 + 0x700, 0x100
	obj_frame_tiles gUnknown_8380428 + 0x800, 0x100
	obj_frame_tiles gUnknown_8380428 + 0x900, 0x100

gSpriteImages_83A0F08:: @ 83A0F08
	obj_frame_tiles gUnknown_8380E28, 0x100
	obj_frame_tiles gUnknown_8380E28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8380E28 + 0x200, 0x100
	obj_frame_tiles gUnknown_8380E28 + 0x300, 0x100
	obj_frame_tiles gUnknown_8380E28 + 0x400, 0x100
	obj_frame_tiles gUnknown_8380E28 + 0x500, 0x100
	obj_frame_tiles gUnknown_8380E28 + 0x600, 0x100
	obj_frame_tiles gUnknown_8380E28 + 0x700, 0x100
	obj_frame_tiles gUnknown_8380E28 + 0x800, 0x100
	obj_frame_tiles gUnknown_8380E28 + 0x900, 0x100

gSpriteImages_83A0F58:: @ 83A0F58
	obj_frame_tiles gUnknown_8381828, 0x100
	obj_frame_tiles gUnknown_8381828 + 0x100, 0x100
	obj_frame_tiles gUnknown_8381828 + 0x200, 0x100
	obj_frame_tiles gUnknown_8381828 + 0x300, 0x100
	obj_frame_tiles gUnknown_8381828 + 0x400, 0x100
	obj_frame_tiles gUnknown_8381828 + 0x500, 0x100
	obj_frame_tiles gUnknown_8381828 + 0x600, 0x100
	obj_frame_tiles gUnknown_8381828 + 0x700, 0x100
	obj_frame_tiles gUnknown_8381828 + 0x800, 0x100
	obj_frame_tiles gUnknown_8381828 + 0x900, 0x100

gSpriteImages_83A0FA8:: @ 83A0FA8
	obj_frame_tiles gUnknown_8382228, 0x100
	obj_frame_tiles gUnknown_8382228 + 0x100, 0x100
	obj_frame_tiles gUnknown_8382228 + 0x200, 0x100
	obj_frame_tiles gUnknown_8382228 + 0x300, 0x100
	obj_frame_tiles gUnknown_8382228 + 0x400, 0x100
	obj_frame_tiles gUnknown_8382228 + 0x500, 0x100
	obj_frame_tiles gUnknown_8382228 + 0x600, 0x100
	obj_frame_tiles gUnknown_8382228 + 0x700, 0x100
	obj_frame_tiles gUnknown_8382228 + 0x800, 0x100
	obj_frame_tiles gUnknown_8382228 + 0x900, 0x100

gSpriteImages_83A0FF8:: @ 83A0FF8
	obj_frame_tiles gUnknown_8382C28, 0x100
	obj_frame_tiles gUnknown_8382C28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8382C28 + 0x200, 0x100
	obj_frame_tiles gUnknown_8382C28 + 0x300, 0x100
	obj_frame_tiles gUnknown_8382C28 + 0x400, 0x100
	obj_frame_tiles gUnknown_8382C28 + 0x500, 0x100
	obj_frame_tiles gUnknown_8382C28 + 0x600, 0x100
	obj_frame_tiles gUnknown_8382C28 + 0x700, 0x100
	obj_frame_tiles gUnknown_8382C28 + 0x800, 0x100

gSpriteImages_83A1040:: @ 83A1040
	obj_frame_tiles gUnknown_8383528, 0x100
	obj_frame_tiles gUnknown_8383528 + 0x100, 0x100
	obj_frame_tiles gUnknown_8383528 + 0x200, 0x100
	obj_frame_tiles gUnknown_8383528 + 0x300, 0x100
	obj_frame_tiles gUnknown_8383528 + 0x400, 0x100
	obj_frame_tiles gUnknown_8383528 + 0x500, 0x100
	obj_frame_tiles gUnknown_8383528 + 0x600, 0x100
	obj_frame_tiles gUnknown_8383528 + 0x700, 0x100
	obj_frame_tiles gUnknown_8383528 + 0x800, 0x100
	obj_frame_tiles gUnknown_8383528 + 0x900, 0x100

gSpriteImages_83A1090:: @ 83A1090
	obj_frame_tiles gUnknown_8383F28, 0x100
	obj_frame_tiles gUnknown_8383F28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8383F28 + 0x200, 0x100
	obj_frame_tiles gUnknown_8383F28 + 0x300, 0x100
	obj_frame_tiles gUnknown_8383F28 + 0x400, 0x100
	obj_frame_tiles gUnknown_8383F28 + 0x500, 0x100
	obj_frame_tiles gUnknown_8383F28 + 0x600, 0x100
	obj_frame_tiles gUnknown_8383F28 + 0x700, 0x100
	obj_frame_tiles gUnknown_8383F28 + 0x800, 0x100

gSpriteImages_83A10D8:: @ 83A10D8
	obj_frame_tiles gUnknown_8384828, 0x100
	obj_frame_tiles gUnknown_8384828 + 0x100, 0x100
	obj_frame_tiles gUnknown_8384828 + 0x200, 0x100
	obj_frame_tiles gUnknown_8384828 + 0x300, 0x100
	obj_frame_tiles gUnknown_8384828 + 0x400, 0x100
	obj_frame_tiles gUnknown_8384828 + 0x500, 0x100
	obj_frame_tiles gUnknown_8384828 + 0x600, 0x100
	obj_frame_tiles gUnknown_8384828 + 0x700, 0x100
	obj_frame_tiles gUnknown_8384828 + 0x800, 0x100

gSpriteImages_83A1120:: @ 83A1120
	obj_frame_tiles gUnknown_8385128, 0x80
	obj_frame_tiles gUnknown_8385128 + 0x80, 0x80
	obj_frame_tiles gUnknown_8385128 + 0x100, 0x80
	obj_frame_tiles gUnknown_8385128 + 0x180, 0x80
	obj_frame_tiles gUnknown_8385128 + 0x200, 0x80
	obj_frame_tiles gUnknown_8385128 + 0x280, 0x80
	obj_frame_tiles gUnknown_8385128 + 0x300, 0x80
	obj_frame_tiles gUnknown_8385128 + 0x380, 0x80
	obj_frame_tiles gUnknown_8385128 + 0x400, 0x80
	obj_frame_tiles gUnknown_8385128 + 0x480, 0x80

gSpriteImages_83A1170:: @ 83A1170
	obj_frame_tiles gUnknown_8385628, 0x80
	obj_frame_tiles gUnknown_8385628 + 0x80, 0x80
	obj_frame_tiles gUnknown_8385628 + 0x100, 0x80
	obj_frame_tiles gUnknown_8385628 + 0x180, 0x80
	obj_frame_tiles gUnknown_8385628 + 0x200, 0x80
	obj_frame_tiles gUnknown_8385628 + 0x280, 0x80
	obj_frame_tiles gUnknown_8385628 + 0x300, 0x80
	obj_frame_tiles gUnknown_8385628 + 0x380, 0x80
	obj_frame_tiles gUnknown_8385628 + 0x400, 0x80
	obj_frame_tiles gUnknown_8385628 + 0x480, 0x80

gSpriteImages_83A11C0:: @ 83A11C0
	obj_frame_tiles gUnknown_8385B28, 0x80
	obj_frame_tiles gUnknown_8385B28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8385B28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8385B28 + 0x180, 0x80
	obj_frame_tiles gUnknown_8385B28 + 0x200, 0x80
	obj_frame_tiles gUnknown_8385B28 + 0x280, 0x80
	obj_frame_tiles gUnknown_8385B28 + 0x300, 0x80
	obj_frame_tiles gUnknown_8385B28 + 0x380, 0x80
	obj_frame_tiles gUnknown_8385B28 + 0x400, 0x80
	obj_frame_tiles gUnknown_8385B28 + 0x480, 0x80

gSpriteImages_83A1210:: @ 83A1210
	obj_frame_tiles gUnknown_8386028, 0x100
	obj_frame_tiles gUnknown_8386028 + 0x100, 0x100
	obj_frame_tiles gUnknown_8386028 + 0x200, 0x100
	obj_frame_tiles gUnknown_8386028 + 0x300, 0x100
	obj_frame_tiles gUnknown_8386028 + 0x400, 0x100
	obj_frame_tiles gUnknown_8386028 + 0x500, 0x100
	obj_frame_tiles gUnknown_8386028 + 0x600, 0x100
	obj_frame_tiles gUnknown_8386028 + 0x700, 0x100
	obj_frame_tiles gUnknown_8386028 + 0x800, 0x100
	obj_frame_tiles gUnknown_8386028 + 0x900, 0x100

gSpriteImages_83A1260:: @ 83A1260
	obj_frame_tiles gUnknown_8386A28, 0x200
	obj_frame_tiles gUnknown_8386A28 + 0x200, 0x200
	obj_frame_tiles gUnknown_8386A28 + 0x400, 0x200
	obj_frame_tiles gUnknown_8386A28 + 0x600, 0x200
	obj_frame_tiles gUnknown_8386A28 + 0x800, 0x200
	obj_frame_tiles gUnknown_8386A28 + 0xA00, 0x200
	obj_frame_tiles gUnknown_8386A28 + 0xC00, 0x200
	obj_frame_tiles gUnknown_8386A28 + 0xE00, 0x200
	obj_frame_tiles gUnknown_8386A28 + 0x1000, 0x200
	obj_frame_tiles gUnknown_8386A28 + 0x1200, 0x200

gSpriteImages_83A12B0:: @ 83A12B0
	obj_frame_tiles gUnknown_8387E28, 0x100
	obj_frame_tiles gUnknown_8387E28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8387E28 + 0x200, 0x100
	obj_frame_tiles gUnknown_8387E28 + 0x300, 0x100
	obj_frame_tiles gUnknown_8387E28 + 0x400, 0x100
	obj_frame_tiles gUnknown_8387E28 + 0x500, 0x100
	obj_frame_tiles gUnknown_8387E28 + 0x600, 0x100
	obj_frame_tiles gUnknown_8387E28 + 0x700, 0x100
	obj_frame_tiles gUnknown_8387E28 + 0x800, 0x100

gSpriteImages_83A12F8:: @ 83A12F8
	obj_frame_tiles gUnknown_838AD28, 0x100
	obj_frame_tiles gUnknown_838AD28 + 0x100, 0x100
	obj_frame_tiles gUnknown_838AD28 + 0x200, 0x100
	obj_frame_tiles gUnknown_838AD28, 0x100
	obj_frame_tiles gUnknown_838AD28, 0x100
	obj_frame_tiles gUnknown_838AD28 + 0x100, 0x100
	obj_frame_tiles gUnknown_838AD28 + 0x100, 0x100
	obj_frame_tiles gUnknown_838AD28 + 0x200, 0x100
	obj_frame_tiles gUnknown_838AD28 + 0x200, 0x100
	obj_frame_tiles gUnknown_838AD28 + 0x300, 0x100

gSpriteImages_83A1348:: @ 83A1348
	obj_frame_tiles gUnknown_838B728, 0x100
	obj_frame_tiles gUnknown_838B728 + 0x100, 0x100
	obj_frame_tiles gUnknown_838B728 + 0x200, 0x100
	obj_frame_tiles gUnknown_838B728, 0x100
	obj_frame_tiles gUnknown_838B728, 0x100
	obj_frame_tiles gUnknown_838B728 + 0x100, 0x100
	obj_frame_tiles gUnknown_838B728 + 0x100, 0x100
	obj_frame_tiles gUnknown_838B728 + 0x200, 0x100
	obj_frame_tiles gUnknown_838B728 + 0x200, 0x100

gSpriteImages_83A1390:: @ 83A1390
	obj_frame_tiles gUnknown_838BA28, 0x80

gSpriteImages_83A1398:: @ 83A1398
	obj_frame_tiles gUnknown_8389B28, 0x100
	obj_frame_tiles gUnknown_8389B28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8389B28 + 0x200, 0x100
	obj_frame_tiles gUnknown_8389B28 + 0x300, 0x100
	obj_frame_tiles gUnknown_8389B28 + 0x400, 0x100
	obj_frame_tiles gUnknown_8389B28 + 0x500, 0x100
	obj_frame_tiles gUnknown_8389B28 + 0x600, 0x100
	obj_frame_tiles gUnknown_8389B28 + 0x700, 0x100
	obj_frame_tiles gUnknown_8389B28 + 0x800, 0x100

gSpriteImages_83A13E0:: @ 83A13E0
	obj_frame_tiles gUnknown_8388728, 0x100
	obj_frame_tiles gUnknown_8388728 + 0x100, 0x100
	obj_frame_tiles gUnknown_8388728 + 0x200, 0x100
	obj_frame_tiles gUnknown_8388728 + 0x300, 0x100
	obj_frame_tiles gUnknown_8388728 + 0x400, 0x100
	obj_frame_tiles gUnknown_8388728 + 0x500, 0x100
	obj_frame_tiles gUnknown_8388728 + 0x600, 0x100
	obj_frame_tiles gUnknown_8388728 + 0x700, 0x100
	obj_frame_tiles gUnknown_8388728 + 0x800, 0x100
	obj_frame_tiles gUnknown_8388728 + 0x900, 0x100

gSpriteImages_83A1430:: @ 83A1430
	obj_frame_tiles gUnknown_8389128, 0x100
	obj_frame_tiles gUnknown_8389128 + 0x100, 0x100
	obj_frame_tiles gUnknown_8389128 + 0x200, 0x100
	obj_frame_tiles gUnknown_8389128 + 0x300, 0x100
	obj_frame_tiles gUnknown_8389128 + 0x400, 0x100
	obj_frame_tiles gUnknown_8389128 + 0x500, 0x100
	obj_frame_tiles gUnknown_8389128 + 0x600, 0x100
	obj_frame_tiles gUnknown_8389128 + 0x700, 0x100
	obj_frame_tiles gUnknown_8389128 + 0x800, 0x100
	obj_frame_tiles gUnknown_8389128 + 0x900, 0x100

gSpriteImages_83A1480:: @ 83A1480
	obj_frame_tiles gUnknown_838BAA8, 0x100
	obj_frame_tiles gUnknown_838BAA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838BAA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_838BAA8 + 0x300, 0x100
	obj_frame_tiles gUnknown_838BAA8 + 0x400, 0x100
	obj_frame_tiles gUnknown_838BAA8 + 0x500, 0x100
	obj_frame_tiles gUnknown_838BAA8 + 0x600, 0x100
	obj_frame_tiles gUnknown_838BAA8 + 0x700, 0x100
	obj_frame_tiles gUnknown_838BAA8 + 0x800, 0x100

gSpriteImages_83A14C8:: @ 83A14C8
	obj_frame_tiles gUnknown_838C3A8, 0x100
	obj_frame_tiles gUnknown_838C3A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838C3A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_838C3A8, 0x100
	obj_frame_tiles gUnknown_838C3A8, 0x100
	obj_frame_tiles gUnknown_838C3A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838C3A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838C3A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_838C3A8 + 0x200, 0x100

gSpriteImages_83A1510:: @ 83A1510
	obj_frame_tiles gUnknown_83945A8, 0x80
	obj_frame_tiles gUnknown_83945A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83945A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83945A8 + 0x180, 0x80

gSpriteImages_83A1530:: @ 83A1530
	obj_frame_tiles gUnknown_838C6A8, 0x100
	obj_frame_tiles gUnknown_838C6A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838C6A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_838C6A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_838C6A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_838C6A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_838C6A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_838C6A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_838C6A8 + 0x800, 0x100

gSpriteImages_83A1578:: @ 83A1578
	obj_frame_tiles gUnknown_838CFA8, 0x100
	obj_frame_tiles gUnknown_838CFA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838CFA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_838CFA8, 0x100
	obj_frame_tiles gUnknown_838CFA8, 0x100
	obj_frame_tiles gUnknown_838CFA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838CFA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838CFA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_838CFA8 + 0x200, 0x100

gSpriteImages_83A15C0:: @ 83A15C0
	obj_frame_tiles gUnknown_838D2A8, 0x100
	obj_frame_tiles gUnknown_838D2A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838D2A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_838D2A8, 0x100
	obj_frame_tiles gUnknown_838D2A8, 0x100
	obj_frame_tiles gUnknown_838D2A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838D2A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838D2A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_838D2A8 + 0x200, 0x100

gSpriteImages_83A1608:: @ 83A1608
	obj_frame_tiles gUnknown_838B128, 0x100
	obj_frame_tiles gUnknown_838B128 + 0x100, 0x100
	obj_frame_tiles gUnknown_838B128 + 0x200, 0x100
	obj_frame_tiles gUnknown_838B128, 0x100
	obj_frame_tiles gUnknown_838B128, 0x100
	obj_frame_tiles gUnknown_838B128 + 0x100, 0x100
	obj_frame_tiles gUnknown_838B128 + 0x100, 0x100
	obj_frame_tiles gUnknown_838B128 + 0x200, 0x100
	obj_frame_tiles gUnknown_838B128 + 0x200, 0x100

gSpriteImages_83A1650:: @ 83A1650
	obj_frame_tiles gUnknown_838B428, 0x100
	obj_frame_tiles gUnknown_838B428 + 0x100, 0x100
	obj_frame_tiles gUnknown_838B428 + 0x200, 0x100
	obj_frame_tiles gUnknown_838B428, 0x100
	obj_frame_tiles gUnknown_838B428, 0x100
	obj_frame_tiles gUnknown_838B428 + 0x100, 0x100
	obj_frame_tiles gUnknown_838B428 + 0x100, 0x100
	obj_frame_tiles gUnknown_838B428 + 0x200, 0x100
	obj_frame_tiles gUnknown_838B428 + 0x200, 0x100

gSpriteImages_83A1698:: @ 83A1698
	obj_frame_tiles gUnknown_83947A8, 0x80
	obj_frame_tiles gUnknown_83947A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83947A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83947A8 + 0x180, 0x80

gSpriteImages_83A16B8:: @ 83A16B8
	obj_frame_tiles gUnknown_83949A8, 0x80

gSpriteImages_83A16C0:: @ 83A16C0
	obj_frame_tiles gUnknown_838DEA8, 0x100
	obj_frame_tiles gUnknown_838DEA8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838DEA8 + 0x200, 0x100
	obj_frame_tiles gUnknown_838DEA8 + 0x300, 0x100
	obj_frame_tiles gUnknown_838DEA8 + 0x400, 0x100
	obj_frame_tiles gUnknown_838DEA8 + 0x500, 0x100
	obj_frame_tiles gUnknown_838DEA8 + 0x600, 0x100
	obj_frame_tiles gUnknown_838DEA8 + 0x700, 0x100
	obj_frame_tiles gUnknown_838DEA8 + 0x800, 0x100

gSpriteImages_83A1708:: @ 83A1708
	obj_frame_tiles gUnknown_838E7A8, 0x100
	obj_frame_tiles gUnknown_838E7A8 + 0x100, 0x100
	obj_frame_tiles gUnknown_838E7A8 + 0x200, 0x100
	obj_frame_tiles gUnknown_838E7A8 + 0x300, 0x100
	obj_frame_tiles gUnknown_838E7A8 + 0x400, 0x100
	obj_frame_tiles gUnknown_838E7A8 + 0x500, 0x100
	obj_frame_tiles gUnknown_838E7A8 + 0x600, 0x100
	obj_frame_tiles gUnknown_838E7A8 + 0x700, 0x100
	obj_frame_tiles gUnknown_838E7A8 + 0x800, 0x100

gSpriteImages_83A1750:: @ 83A1750
	obj_frame_tiles gUnknown_8390F28, 0x100
	obj_frame_tiles gUnknown_8390F28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8390F28 + 0x200, 0x100
	obj_frame_tiles gUnknown_8390F28, 0x100
	obj_frame_tiles gUnknown_8390F28, 0x100
	obj_frame_tiles gUnknown_8390F28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8390F28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8390F28 + 0x200, 0x100
	obj_frame_tiles gUnknown_8390F28 + 0x200, 0x100

gSpriteImages_83A1798:: @ 83A1798
	obj_frame_tiles gUnknown_836C928, 0x100
	obj_frame_tiles gUnknown_836C928 + 0x100, 0x100
	obj_frame_tiles gUnknown_836C928 + 0x200, 0x100
	obj_frame_tiles gUnknown_836C928, 0x100
	obj_frame_tiles gUnknown_836C928, 0x100
	obj_frame_tiles gUnknown_836C928 + 0x100, 0x100
	obj_frame_tiles gUnknown_836C928 + 0x100, 0x100
	obj_frame_tiles gUnknown_836C928 + 0x200, 0x100
	obj_frame_tiles gUnknown_836C928 + 0x200, 0x100

gSpriteImages_83A17E0:: @ 83A17E0
	obj_frame_tiles gUnknown_8391228, 0x100
	obj_frame_tiles gUnknown_8391228 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391228 + 0x200, 0x100
	obj_frame_tiles gUnknown_8391228, 0x100
	obj_frame_tiles gUnknown_8391228, 0x100
	obj_frame_tiles gUnknown_8391228 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391228 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391228 + 0x200, 0x100
	obj_frame_tiles gUnknown_8391228 + 0x200, 0x100

gSpriteImages_83A1828:: @ 83A1828
	obj_frame_tiles gUnknown_836CC28, 0x100
	obj_frame_tiles gUnknown_836CC28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836CC28 + 0x200, 0x100
	obj_frame_tiles gUnknown_836CC28, 0x100
	obj_frame_tiles gUnknown_836CC28, 0x100
	obj_frame_tiles gUnknown_836CC28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836CC28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836CC28 + 0x200, 0x100
	obj_frame_tiles gUnknown_836CC28 + 0x200, 0x100

gSpriteImages_83A1870:: @ 83A1870
	obj_frame_tiles gUnknown_836C328, 0x100
	obj_frame_tiles gUnknown_836C328 + 0x100, 0x100
	obj_frame_tiles gUnknown_836C328 + 0x200, 0x100
	obj_frame_tiles gUnknown_836C328, 0x100
	obj_frame_tiles gUnknown_836C328, 0x100
	obj_frame_tiles gUnknown_836C328 + 0x100, 0x100
	obj_frame_tiles gUnknown_836C328 + 0x100, 0x100
	obj_frame_tiles gUnknown_836C328 + 0x200, 0x100
	obj_frame_tiles gUnknown_836C328 + 0x200, 0x100

gSpriteImages_83A18B8:: @ 83A18B8
	obj_frame_tiles gUnknown_836C628, 0x100
	obj_frame_tiles gUnknown_836C628 + 0x100, 0x100
	obj_frame_tiles gUnknown_836C628 + 0x200, 0x100
	obj_frame_tiles gUnknown_836C628, 0x100
	obj_frame_tiles gUnknown_836C628, 0x100
	obj_frame_tiles gUnknown_836C628 + 0x100, 0x100
	obj_frame_tiles gUnknown_836C628 + 0x100, 0x100
	obj_frame_tiles gUnknown_836C628 + 0x200, 0x100
	obj_frame_tiles gUnknown_836C628 + 0x200, 0x100

gSpriteImages_83A1900:: @ 83A1900
	obj_frame_tiles gUnknown_836A228, 0x100
	obj_frame_tiles gUnknown_836A228 + 0x100, 0x100
	obj_frame_tiles gUnknown_836A228 + 0x200, 0x100
	obj_frame_tiles gUnknown_836A228 + 0x300, 0x100
	obj_frame_tiles gUnknown_836A228 + 0x400, 0x100
	obj_frame_tiles gUnknown_836A228 + 0x500, 0x100
	obj_frame_tiles gUnknown_836A228 + 0x600, 0x100
	obj_frame_tiles gUnknown_836A228 + 0x700, 0x100
	obj_frame_tiles gUnknown_836A228 + 0x800, 0x100

gSpriteImages_83A1948:: @ 83A1948
	obj_frame_tiles gUnknown_836AB28, 0x100
	obj_frame_tiles gUnknown_836AB28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836AB28 + 0x200, 0x100
	obj_frame_tiles gUnknown_836AB28, 0x100
	obj_frame_tiles gUnknown_836AB28, 0x100
	obj_frame_tiles gUnknown_836AB28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836AB28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836AB28 + 0x200, 0x100
	obj_frame_tiles gUnknown_836AB28 + 0x200, 0x100

gSpriteImages_83A1990:: @ 83A1990
	obj_frame_tiles gUnknown_836AE28, 0x100
	obj_frame_tiles gUnknown_836AE28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836AE28 + 0x200, 0x100
	obj_frame_tiles gUnknown_836AE28, 0x100
	obj_frame_tiles gUnknown_836AE28, 0x100
	obj_frame_tiles gUnknown_836AE28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836AE28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836AE28 + 0x200, 0x100
	obj_frame_tiles gUnknown_836AE28 + 0x200, 0x100

gSpriteImages_83A19D8:: @ 83A19D8
	obj_frame_tiles gUnknown_836CF28, 0x100
	obj_frame_tiles gUnknown_836CF28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836CF28 + 0x200, 0x100
	obj_frame_tiles gUnknown_836CF28 + 0x300, 0x100
	obj_frame_tiles gUnknown_836CF28 + 0x400, 0x100
	obj_frame_tiles gUnknown_836CF28 + 0x500, 0x100
	obj_frame_tiles gUnknown_836CF28 + 0x600, 0x100
	obj_frame_tiles gUnknown_836CF28 + 0x700, 0x100
	obj_frame_tiles gUnknown_836CF28 + 0x800, 0x100

gSpriteImages_83A1A20:: @ 83A1A20
	obj_frame_tiles gUnknown_836B128, 0x100
	obj_frame_tiles gUnknown_836B128 + 0x100, 0x100
	obj_frame_tiles gUnknown_836B128 + 0x200, 0x100
	obj_frame_tiles gUnknown_836B128 + 0x300, 0x100
	obj_frame_tiles gUnknown_836B128 + 0x400, 0x100
	obj_frame_tiles gUnknown_836B128 + 0x500, 0x100
	obj_frame_tiles gUnknown_836B128 + 0x600, 0x100
	obj_frame_tiles gUnknown_836B128 + 0x700, 0x100
	obj_frame_tiles gUnknown_836B128 + 0x800, 0x100

gSpriteImages_83A1A68:: @ 83A1A68
	obj_frame_tiles gUnknown_836BA28, 0x100
	obj_frame_tiles gUnknown_836BA28 + 0x100, 0x100
	obj_frame_tiles gUnknown_836BA28 + 0x200, 0x100
	obj_frame_tiles gUnknown_836BA28 + 0x300, 0x100
	obj_frame_tiles gUnknown_836BA28 + 0x400, 0x100
	obj_frame_tiles gUnknown_836BA28 + 0x500, 0x100
	obj_frame_tiles gUnknown_836BA28 + 0x600, 0x100
	obj_frame_tiles gUnknown_836BA28 + 0x700, 0x100
	obj_frame_tiles gUnknown_836BA28 + 0x800, 0x100

gSpriteImages_83A1AB0:: @ 83A1AB0
	obj_frame_tiles gUnknown_8391528, 0x100
	obj_frame_tiles gUnknown_8391528 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391528 + 0x200, 0x100
	obj_frame_tiles gUnknown_8391528, 0x100
	obj_frame_tiles gUnknown_8391528, 0x100
	obj_frame_tiles gUnknown_8391528 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391528 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391528 + 0x200, 0x100
	obj_frame_tiles gUnknown_8391528 + 0x200, 0x100

gSpriteImages_83A1AF8:: @ 83A1AF8
	obj_frame_tiles gUnknown_838A428, 0x100
	obj_frame_tiles gUnknown_838A428 + 0x100, 0x100
	obj_frame_tiles gUnknown_838A428 + 0x200, 0x100
	obj_frame_tiles gUnknown_838A428 + 0x300, 0x100
	obj_frame_tiles gUnknown_838A428 + 0x400, 0x100
	obj_frame_tiles gUnknown_838A428 + 0x500, 0x100
	obj_frame_tiles gUnknown_838A428 + 0x600, 0x100
	obj_frame_tiles gUnknown_838A428 + 0x700, 0x100
	obj_frame_tiles gUnknown_838A428 + 0x800, 0x100

gSpriteImages_83A1B40:: @ 83A1B40
	obj_frame_tiles gUnknown_8366DA8, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0x200, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0x400, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0x600, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0x800, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0xA00, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0xC00, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0xE00, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0x1000, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0x1200, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0x1400, 0x200
	obj_frame_tiles gUnknown_8366DA8 + 0x1600, 0x200

gSpriteImages_83A1BA0:: @ 83A1BA0
	obj_frame_tiles gUnknown_83685A8, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0x200, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0x400, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0x600, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0x800, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0xA00, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0xC00, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0xE00, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0x1000, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0x1200, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0x1400, 0x200
	obj_frame_tiles gUnknown_83685A8 + 0x1600, 0x200

gSpriteImages_83A1C00:: @ 83A1C00
	obj_frame_tiles gUnknown_8369E28, 0x100

gSpriteImages_83A1C08:: @ 83A1C08
	obj_frame_tiles gUnknown_8369DA8, 0x80

gSpriteImages_83A1C10:: @ 83A1C10
	obj_frame_tiles gUnknown_8391828, 0x100
	obj_frame_tiles gUnknown_8391828 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391828 + 0x200, 0x100
	obj_frame_tiles gUnknown_8391828, 0x100
	obj_frame_tiles gUnknown_8391828, 0x100
	obj_frame_tiles gUnknown_8391828 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391828 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391828 + 0x200, 0x100
	obj_frame_tiles gUnknown_8391828 + 0x200, 0x100

gSpriteImages_83A1C58:: @ 83A1C58
	obj_frame_tiles gUnknown_8394A28, 0x80

gSpriteImages_83A1C60:: @ 83A1C60
	obj_frame_tiles gUnknown_8394AA8, 0x80

gSpriteImages_83A1C68:: @ 83A1C68
	obj_frame_tiles gUnknown_8394B28, 0x80

gSpriteImages_83A1C70:: @ 83A1C70
	obj_frame_tiles gUnknown_8394BA8, 0x80

gSpriteImages_83A1C78:: @ 83A1C78
	obj_frame_tiles gUnknown_8394C28, 0x100

gSpriteImages_83A1C80:: @ 83A1C80
	obj_frame_tiles gUnknown_8394D28, 0x80

gSpriteImages_83A1C88:: @ 83A1C88
	obj_frame_tiles gUnknown_8394DA8, 0x80

gSpriteImages_83A1C90:: @ 83A1C90
	obj_frame_tiles gUnknown_8394E28, 0x80

gSpriteImages_83A1C98:: @ 83A1C98
	obj_frame_tiles gUnknown_8394EC8, 0x200

gSpriteImages_83A1CA0:: @ 83A1CA0
	obj_frame_tiles gUnknown_83950C8, 0x200

gSpriteImages_83A1CA8:: @ 83A1CA8
	obj_frame_tiles gUnknown_83952E8, 0x800
	obj_frame_tiles gUnknown_83952E8, 0x800
	obj_frame_tiles gUnknown_83952E8, 0x800
	obj_frame_tiles gUnknown_83952E8, 0x800
	obj_frame_tiles gUnknown_83952E8, 0x800
	obj_frame_tiles gUnknown_83952E8, 0x800
	obj_frame_tiles gUnknown_83952E8, 0x800
	obj_frame_tiles gUnknown_83952E8, 0x800
	obj_frame_tiles gUnknown_83952E8, 0x800

gSpriteImages_83A1CF0:: @ 83A1CF0
	obj_frame_tiles gUnknown_8395B08, 0x1000
	obj_frame_tiles gUnknown_8395B08, 0x1000
	obj_frame_tiles gUnknown_8395B08, 0x1000
	obj_frame_tiles gUnknown_8395B08, 0x1000
	obj_frame_tiles gUnknown_8395B08, 0x1000
	obj_frame_tiles gUnknown_8395B08, 0x1000
	obj_frame_tiles gUnknown_8395B08, 0x1000
	obj_frame_tiles gUnknown_8395B08, 0x1000
	obj_frame_tiles gUnknown_8395B08, 0x1000

gSpriteImages_83A1D38:: @ 83A1D38
	obj_frame_tiles gUnknown_83937A8, 0x200
	obj_frame_tiles gUnknown_83937A8, 0x200
	obj_frame_tiles gUnknown_83937A8, 0x200
	obj_frame_tiles gUnknown_83937A8, 0x200
	obj_frame_tiles gUnknown_83937A8, 0x200
	obj_frame_tiles gUnknown_83937A8, 0x200
	obj_frame_tiles gUnknown_83937A8, 0x200
	obj_frame_tiles gUnknown_83937A8, 0x200
	obj_frame_tiles gUnknown_83937A8, 0x200

gSpriteImages_83A1D80:: @ 83A1D80
	obj_frame_tiles gUnknown_83939A8, 0x80
	obj_frame_tiles gUnknown_83939A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83939A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83939A8, 0x80
	obj_frame_tiles gUnknown_83939A8, 0x80
	obj_frame_tiles gUnknown_83939A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83939A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83939A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83939A8 + 0x100, 0x80

gSpriteImages_83A1DC8:: @ 83A1DC8
	obj_frame_tiles gUnknown_8391E28, 0x80
	obj_frame_tiles gUnknown_8391E28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8391E28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8391E28, 0x80
	obj_frame_tiles gUnknown_8391E28, 0x80
	obj_frame_tiles gUnknown_8391E28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8391E28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8391E28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8391E28 + 0x100, 0x80

gSpriteImages_83A1E10:: @ 83A1E10
	obj_frame_tiles gUnknown_8391FA8, 0x80
	obj_frame_tiles gUnknown_8391FA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8391FA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_8391FA8, 0x80
	obj_frame_tiles gUnknown_8391FA8, 0x80
	obj_frame_tiles gUnknown_8391FA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8391FA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8391FA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_8391FA8 + 0x100, 0x80

gSpriteImages_83A1E58:: @ 83A1E58
	obj_frame_tiles gUnknown_8392128, 0x80
	obj_frame_tiles gUnknown_8392128 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392128 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392128, 0x80
	obj_frame_tiles gUnknown_8392128, 0x80
	obj_frame_tiles gUnknown_8392128 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392128 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392128 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392128 + 0x100, 0x80

gSpriteImages_83A1EA0:: @ 83A1EA0
	obj_frame_tiles gUnknown_837BDA8, 0x80
	obj_frame_tiles gUnknown_837BDA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_837BDA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_837BDA8, 0x80
	obj_frame_tiles gUnknown_837BDA8, 0x80
	obj_frame_tiles gUnknown_837BDA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_837BDA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_837BDA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_837BDA8 + 0x100, 0x80

gSpriteImages_83A1EE8:: @ 83A1EE8
	obj_frame_tiles gUnknown_83922A8, 0x80
	obj_frame_tiles gUnknown_83922A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83922A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83922A8, 0x80
	obj_frame_tiles gUnknown_83922A8, 0x80
	obj_frame_tiles gUnknown_83922A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83922A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83922A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83922A8 + 0x100, 0x80

gSpriteImages_83A1F30:: @ 83A1F30
	obj_frame_tiles gUnknown_8392428, 0x80
	obj_frame_tiles gUnknown_8392428 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392428 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392428, 0x80
	obj_frame_tiles gUnknown_8392428, 0x80
	obj_frame_tiles gUnknown_8392428 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392428 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392428 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392428 + 0x100, 0x80

gSpriteImages_83A1F78:: @ 83A1F78
	obj_frame_tiles gUnknown_83925A8, 0x80
	obj_frame_tiles gUnknown_83925A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83925A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83925A8, 0x80
	obj_frame_tiles gUnknown_83925A8, 0x80
	obj_frame_tiles gUnknown_83925A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83925A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83925A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83925A8 + 0x100, 0x80

gSpriteImages_83A1FC0:: @ 83A1FC0
	obj_frame_tiles gUnknown_8392728, 0x80
	obj_frame_tiles gUnknown_8392728 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392728 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392728, 0x80
	obj_frame_tiles gUnknown_8392728, 0x80
	obj_frame_tiles gUnknown_8392728 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392728 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392728 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392728 + 0x100, 0x80

gSpriteImages_83A2008:: @ 83A2008
	obj_frame_tiles gUnknown_83928A8, 0x80
	obj_frame_tiles gUnknown_83928A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83928A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83928A8, 0x80
	obj_frame_tiles gUnknown_83928A8, 0x80
	obj_frame_tiles gUnknown_83928A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83928A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83928A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83928A8 + 0x100, 0x80

gSpriteImages_83A2050:: @ 83A2050
	obj_frame_tiles gUnknown_8392A28, 0x80
	obj_frame_tiles gUnknown_8392A28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392A28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392A28, 0x80
	obj_frame_tiles gUnknown_8392A28, 0x80
	obj_frame_tiles gUnknown_8392A28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392A28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392A28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392A28 + 0x100, 0x80

gSpriteImages_83A2098:: @ 83A2098
	obj_frame_tiles gUnknown_8392BA8, 0x80
	obj_frame_tiles gUnknown_8392BA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392BA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392BA8, 0x80
	obj_frame_tiles gUnknown_8392BA8, 0x80
	obj_frame_tiles gUnknown_8392BA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392BA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392BA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392BA8 + 0x100, 0x80

gSpriteImages_83A20E0:: @ 83A20E0
	obj_frame_tiles gUnknown_8392D28, 0x80
	obj_frame_tiles gUnknown_8392D28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392D28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392D28, 0x80
	obj_frame_tiles gUnknown_8392D28, 0x80
	obj_frame_tiles gUnknown_8392D28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392D28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392D28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392D28 + 0x100, 0x80

gSpriteImages_83A2128:: @ 83A2128
	obj_frame_tiles gUnknown_8392EA8, 0x80
	obj_frame_tiles gUnknown_8392EA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392EA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392EA8, 0x80
	obj_frame_tiles gUnknown_8392EA8, 0x80
	obj_frame_tiles gUnknown_8392EA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392EA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8392EA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_8392EA8 + 0x100, 0x80

gSpriteImages_83A2170:: @ 83A2170
	obj_frame_tiles gUnknown_8393028, 0x80
	obj_frame_tiles gUnknown_8393028 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393028 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393028, 0x80
	obj_frame_tiles gUnknown_8393028, 0x80
	obj_frame_tiles gUnknown_8393028 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393028 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393028 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393028 + 0x100, 0x80

gSpriteImages_83A21B8:: @ 83A21B8
	obj_frame_tiles gUnknown_83931A8, 0x80
	obj_frame_tiles gUnknown_83931A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83931A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83931A8, 0x80
	obj_frame_tiles gUnknown_83931A8, 0x80
	obj_frame_tiles gUnknown_83931A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83931A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83931A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83931A8 + 0x100, 0x80

gSpriteImages_83A2200:: @ 83A2200
	obj_frame_tiles gUnknown_8393328, 0x80
	obj_frame_tiles gUnknown_8393328 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393328 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393328, 0x80
	obj_frame_tiles gUnknown_8393328, 0x80
	obj_frame_tiles gUnknown_8393328 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393328 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393328 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393328 + 0x100, 0x80

gSpriteImages_83A2248:: @ 83A2248
	obj_frame_tiles gUnknown_838F0A8, 0x80
	obj_frame_tiles gUnknown_838F0A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_838F0A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_838F0A8, 0x80
	obj_frame_tiles gUnknown_838F0A8, 0x80
	obj_frame_tiles gUnknown_838F0A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_838F0A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_838F0A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_838F0A8 + 0x100, 0x80

gSpriteImages_83A2290:: @ 83A2290
	obj_frame_tiles gUnknown_838F228, 0x200
	obj_frame_tiles gUnknown_838F228, 0x200
	obj_frame_tiles gUnknown_838F228, 0x200
	obj_frame_tiles gUnknown_838F228, 0x200
	obj_frame_tiles gUnknown_838F228, 0x200
	obj_frame_tiles gUnknown_838F228, 0x200
	obj_frame_tiles gUnknown_838F228, 0x200
	obj_frame_tiles gUnknown_838F228, 0x200
	obj_frame_tiles gUnknown_838F228, 0x200

gSpriteImages_83A22D8:: @ 83A22D8
	obj_frame_tiles gUnknown_838F428, 0x200
	obj_frame_tiles gUnknown_838F428, 0x200
	obj_frame_tiles gUnknown_838F428, 0x200
	obj_frame_tiles gUnknown_838F428, 0x200
	obj_frame_tiles gUnknown_838F428, 0x200
	obj_frame_tiles gUnknown_838F428, 0x200
	obj_frame_tiles gUnknown_838F428, 0x200
	obj_frame_tiles gUnknown_838F428, 0x200
	obj_frame_tiles gUnknown_838F428, 0x200

gSpriteImages_83A2320:: @ 83A2320
	obj_frame_tiles gUnknown_838F628, 0x200
	obj_frame_tiles gUnknown_838F628, 0x200
	obj_frame_tiles gUnknown_838F628, 0x200
	obj_frame_tiles gUnknown_838F628, 0x200
	obj_frame_tiles gUnknown_838F628, 0x200
	obj_frame_tiles gUnknown_838F628, 0x200
	obj_frame_tiles gUnknown_838F628, 0x200
	obj_frame_tiles gUnknown_838F628, 0x200
	obj_frame_tiles gUnknown_838F628, 0x200

gSpriteImages_83A2368:: @ 83A2368
	obj_frame_tiles gUnknown_8390328, 0x200
	obj_frame_tiles gUnknown_8390328, 0x200
	obj_frame_tiles gUnknown_8390328, 0x200
	obj_frame_tiles gUnknown_8390328, 0x200
	obj_frame_tiles gUnknown_8390328 + 0x200, 0x200
	obj_frame_tiles gUnknown_8390328, 0x200
	obj_frame_tiles gUnknown_8390328 + 0x200, 0x200
	obj_frame_tiles gUnknown_8390328, 0x200
	obj_frame_tiles gUnknown_8390328 + 0x200, 0x200

gSpriteImages_83A23B0:: @ 83A23B0
	obj_frame_tiles gUnknown_8390728, 0x200
	obj_frame_tiles gUnknown_8390728, 0x200
	obj_frame_tiles gUnknown_8390728, 0x200
	obj_frame_tiles gUnknown_8390728, 0x200
	obj_frame_tiles gUnknown_8390728 + 0x200, 0x200
	obj_frame_tiles gUnknown_8390728, 0x200
	obj_frame_tiles gUnknown_8390728 + 0x200, 0x200
	obj_frame_tiles gUnknown_8390728, 0x200
	obj_frame_tiles gUnknown_8390728 + 0x200, 0x200

gSpriteImages_83A23F8:: @ 83A23F8
	obj_frame_tiles gUnknown_8390B28, 0x200
	obj_frame_tiles gUnknown_8390B28, 0x200
	obj_frame_tiles gUnknown_8390B28, 0x200
	obj_frame_tiles gUnknown_8390B28, 0x200
	obj_frame_tiles gUnknown_8390B28 + 0x200, 0x200
	obj_frame_tiles gUnknown_8390B28, 0x200
	obj_frame_tiles gUnknown_8390B28 + 0x200, 0x200
	obj_frame_tiles gUnknown_8390B28, 0x200
	obj_frame_tiles gUnknown_8390B28 + 0x200, 0x200

gSpriteImages_83A2440:: @ 83A2440
	obj_frame_tiles gUnknown_838F828, 0x80
	obj_frame_tiles gUnknown_838F828, 0x80
	obj_frame_tiles gUnknown_838F828, 0x80
	obj_frame_tiles gUnknown_838F828, 0x80
	obj_frame_tiles gUnknown_838F828, 0x80
	obj_frame_tiles gUnknown_838F828, 0x80
	obj_frame_tiles gUnknown_838F828, 0x80
	obj_frame_tiles gUnknown_838F828, 0x80
	obj_frame_tiles gUnknown_838F828, 0x80

gSpriteImages_83A2488:: @ 83A2488
	obj_frame_tiles gUnknown_838F8A8, 0x80
	obj_frame_tiles gUnknown_838F8A8, 0x80
	obj_frame_tiles gUnknown_838F8A8, 0x80
	obj_frame_tiles gUnknown_838F8A8, 0x80
	obj_frame_tiles gUnknown_838F8A8, 0x80
	obj_frame_tiles gUnknown_838F8A8, 0x80
	obj_frame_tiles gUnknown_838F8A8, 0x80
	obj_frame_tiles gUnknown_838F8A8, 0x80
	obj_frame_tiles gUnknown_838F8A8, 0x80

gSpriteImages_83A24D0:: @ 83A24D0
	obj_frame_tiles gUnknown_838F928, 0x80
	obj_frame_tiles gUnknown_838F928, 0x80
	obj_frame_tiles gUnknown_838F928, 0x80
	obj_frame_tiles gUnknown_838F928, 0x80
	obj_frame_tiles gUnknown_838F928, 0x80
	obj_frame_tiles gUnknown_838F928, 0x80
	obj_frame_tiles gUnknown_838F928, 0x80
	obj_frame_tiles gUnknown_838F928, 0x80
	obj_frame_tiles gUnknown_838F928, 0x80

gSpriteImages_83A2518:: @ 83A2518
	obj_frame_tiles gUnknown_838F9A8, 0x80
	obj_frame_tiles gUnknown_838F9A8, 0x80
	obj_frame_tiles gUnknown_838F9A8, 0x80
	obj_frame_tiles gUnknown_838F9A8, 0x80
	obj_frame_tiles gUnknown_838F9A8, 0x80
	obj_frame_tiles gUnknown_838F9A8, 0x80
	obj_frame_tiles gUnknown_838F9A8, 0x80
	obj_frame_tiles gUnknown_838F9A8, 0x80
	obj_frame_tiles gUnknown_838F9A8, 0x80

gSpriteImages_83A2560:: @ 83A2560
	obj_frame_tiles gUnknown_838FA28, 0x80
	obj_frame_tiles gUnknown_838FA28, 0x80
	obj_frame_tiles gUnknown_838FA28, 0x80
	obj_frame_tiles gUnknown_838FA28, 0x80
	obj_frame_tiles gUnknown_838FA28, 0x80
	obj_frame_tiles gUnknown_838FA28, 0x80
	obj_frame_tiles gUnknown_838FA28, 0x80
	obj_frame_tiles gUnknown_838FA28, 0x80
	obj_frame_tiles gUnknown_838FA28, 0x80

gSpriteImages_83A25A8:: @ 83A25A8
	obj_frame_tiles gUnknown_838FAA8, 0x200
	obj_frame_tiles gUnknown_838FAA8, 0x200
	obj_frame_tiles gUnknown_838FAA8, 0x200
	obj_frame_tiles gUnknown_838FAA8, 0x200
	obj_frame_tiles gUnknown_838FAA8 + 0x200, 0x200
	obj_frame_tiles gUnknown_838FAA8, 0x200
	obj_frame_tiles gUnknown_838FAA8 + 0x200, 0x200
	obj_frame_tiles gUnknown_838FAA8, 0x200
	obj_frame_tiles gUnknown_838FAA8 + 0x200, 0x200

gSpriteImages_83A25F0:: @ 83A25F0
	obj_frame_tiles gUnknown_838FEA8, 0x200
	obj_frame_tiles gUnknown_838FEA8, 0x200
	obj_frame_tiles gUnknown_838FEA8, 0x200
	obj_frame_tiles gUnknown_838FEA8, 0x200
	obj_frame_tiles gUnknown_838FEA8 + 0x200, 0x200
	obj_frame_tiles gUnknown_838FEA8, 0x200
	obj_frame_tiles gUnknown_838FEA8 + 0x200, 0x200
	obj_frame_tiles gUnknown_838FEA8, 0x200
	obj_frame_tiles gUnknown_838FEA8 + 0x200, 0x200

gSpriteImages_83A2638:: @ 83A2638
	obj_frame_tiles gUnknown_83902A8, 0x80
	obj_frame_tiles gUnknown_83902A8, 0x80
	obj_frame_tiles gUnknown_83902A8, 0x80
	obj_frame_tiles gUnknown_83902A8, 0x80
	obj_frame_tiles gUnknown_83902A8, 0x80
	obj_frame_tiles gUnknown_83902A8, 0x80
	obj_frame_tiles gUnknown_83902A8, 0x80
	obj_frame_tiles gUnknown_83902A8, 0x80
	obj_frame_tiles gUnknown_83902A8, 0x80

gSpriteImages_83A2680:: @ 83A2680
	obj_frame_tiles gUnknown_8393B28, 0x80
	obj_frame_tiles gUnknown_8393B28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393B28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393B28, 0x80
	obj_frame_tiles gUnknown_8393B28, 0x80
	obj_frame_tiles gUnknown_8393B28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393B28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393B28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393B28 + 0x100, 0x80

gSpriteImages_83A26C8:: @ 83A26C8
	obj_frame_tiles gUnknown_8393CA8, 0x80
	obj_frame_tiles gUnknown_8393CA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393CA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393CA8, 0x80
	obj_frame_tiles gUnknown_8393CA8, 0x80
	obj_frame_tiles gUnknown_8393CA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393CA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393CA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393CA8 + 0x100, 0x80

gSpriteImages_83A2710:: @ 83A2710
	obj_frame_tiles gUnknown_8393E28, 0x80
	obj_frame_tiles gUnknown_8393E28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393E28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393E28, 0x80
	obj_frame_tiles gUnknown_8393E28, 0x80
	obj_frame_tiles gUnknown_8393E28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393E28 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393E28 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393E28 + 0x100, 0x80

gSpriteImages_83A2758:: @ 83A2758
	obj_frame_tiles gUnknown_8393FA8, 0x80
	obj_frame_tiles gUnknown_8393FA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393FA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393FA8, 0x80
	obj_frame_tiles gUnknown_8393FA8, 0x80
	obj_frame_tiles gUnknown_8393FA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393FA8 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393FA8 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393FA8 + 0x100, 0x80

gSpriteImages_83A27A0:: @ 83A27A0
	obj_frame_tiles gUnknown_8394128, 0x80
	obj_frame_tiles gUnknown_8394128 + 0x80, 0x80
	obj_frame_tiles gUnknown_8394128 + 0x100, 0x80
	obj_frame_tiles gUnknown_8394128, 0x80
	obj_frame_tiles gUnknown_8394128, 0x80
	obj_frame_tiles gUnknown_8394128 + 0x80, 0x80
	obj_frame_tiles gUnknown_8394128 + 0x80, 0x80
	obj_frame_tiles gUnknown_8394128 + 0x100, 0x80
	obj_frame_tiles gUnknown_8394128 + 0x100, 0x80

gSpriteImages_83A27E8:: @ 83A27E8
	obj_frame_tiles gUnknown_83942A8, 0x80
	obj_frame_tiles gUnknown_83942A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83942A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83942A8, 0x80
	obj_frame_tiles gUnknown_83942A8, 0x80
	obj_frame_tiles gUnknown_83942A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83942A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83942A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83942A8 + 0x100, 0x80

gSpriteImages_83A2830:: @ 83A2830
	obj_frame_tiles gUnknown_8394428, 0x80
	obj_frame_tiles gUnknown_8394428 + 0x80, 0x80
	obj_frame_tiles gUnknown_8394428 + 0x100, 0x80
	obj_frame_tiles gUnknown_8394428, 0x80
	obj_frame_tiles gUnknown_8394428, 0x80
	obj_frame_tiles gUnknown_8394428 + 0x80, 0x80
	obj_frame_tiles gUnknown_8394428 + 0x80, 0x80
	obj_frame_tiles gUnknown_8394428 + 0x100, 0x80
	obj_frame_tiles gUnknown_8394428 + 0x100, 0x80

gSpriteImages_83A2878:: @ 83A2878
	obj_frame_tiles gUnknown_8393628, 0x80
	obj_frame_tiles gUnknown_8393628 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393628 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393628, 0x80
	obj_frame_tiles gUnknown_8393628, 0x80
	obj_frame_tiles gUnknown_8393628 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393628 + 0x80, 0x80
	obj_frame_tiles gUnknown_8393628 + 0x100, 0x80
	obj_frame_tiles gUnknown_8393628 + 0x100, 0x80

gSpriteImages_83A28C0:: @ 83A28C0
	obj_frame_tiles gUnknown_83934A8, 0x80
	obj_frame_tiles gUnknown_83934A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83934A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83934A8, 0x80
	obj_frame_tiles gUnknown_83934A8, 0x80
	obj_frame_tiles gUnknown_83934A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83934A8 + 0x80, 0x80
	obj_frame_tiles gUnknown_83934A8 + 0x100, 0x80
	obj_frame_tiles gUnknown_83934A8 + 0x100, 0x80

gSpriteImages_83A2908:: @ 83A2908
	obj_frame_tiles gUnknown_8391B28, 0x100
	obj_frame_tiles gUnknown_8391B28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391B28 + 0x200, 0x100
	obj_frame_tiles gUnknown_8391B28, 0x100
	obj_frame_tiles gUnknown_8391B28, 0x100
	obj_frame_tiles gUnknown_8391B28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391B28 + 0x100, 0x100
	obj_frame_tiles gUnknown_8391B28 + 0x200, 0x100
	obj_frame_tiles gUnknown_8391B28 + 0x200, 0x100

gAnimCmd_83A2950:: @ 83A2950
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_jump 0

gAnimCmd_83A2964:: @ 83A2964
	obj_image_anim_frame 0, 16
	obj_image_anim_jump 0

gAnimCmd_83A296C:: @ 83A296C
	obj_image_anim_frame 1, 16
	obj_image_anim_jump 0

gAnimCmd_83A2974:: @ 83A2974
	obj_image_anim_frame 2, 16
	obj_image_anim_jump 0

gAnimCmd_83A297C:: @ 83A297C
	obj_image_anim_frame 2, 16, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2984:: @ 83A2984
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 3, 8, 0x40
	obj_image_anim_frame 0, 8
	obj_image_anim_jump 0

gAnimCmd_83A2998:: @ 83A2998
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 4, 8, 0x40
	obj_image_anim_frame 1, 8
	obj_image_anim_jump 0

gAnimCmd_83A29AC:: @ 83A29AC
	obj_image_anim_frame 5, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 6, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_jump 0

gAnimCmd_83A29C0:: @ 83A29C0
	obj_image_anim_frame 5, 8, 0x40
	obj_image_anim_frame 2, 8, 0x40
	obj_image_anim_frame 6, 8, 0x40
	obj_image_anim_frame 2, 8, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A29D4:: @ 83A29D4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 3, 4, 0x40
	obj_image_anim_frame 0, 4
	obj_image_anim_jump 0

gAnimCmd_83A29E8:: @ 83A29E8
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 4, 4, 0x40
	obj_image_anim_frame 1, 4
	obj_image_anim_jump 0

gAnimCmd_83A29FC:: @ 83A29FC
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_jump 0

gAnimCmd_83A2A10:: @ 83A2A10
	obj_image_anim_frame 5, 4, 0x40
	obj_image_anim_frame 2, 4, 0x40
	obj_image_anim_frame 6, 4, 0x40
	obj_image_anim_frame 2, 4, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2A24:: @ 83A2A24
	obj_image_anim_frame 3, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 3, 2, 0x40
	obj_image_anim_frame 0, 2
	obj_image_anim_jump 0

gAnimCmd_83A2A38:: @ 83A2A38
	obj_image_anim_frame 4, 2
	obj_image_anim_frame 1, 2
	obj_image_anim_frame 4, 2, 0x40
	obj_image_anim_frame 1, 2
	obj_image_anim_jump 0

gAnimCmd_83A2A4C:: @ 83A2A4C
	obj_image_anim_frame 5, 2
	obj_image_anim_frame 2, 2
	obj_image_anim_frame 6, 2
	obj_image_anim_frame 2, 2
	obj_image_anim_jump 0

gAnimCmd_83A2A60:: @ 83A2A60
	obj_image_anim_frame 5, 2, 0x40
	obj_image_anim_frame 2, 2, 0x40
	obj_image_anim_frame 6, 2, 0x40
	obj_image_anim_frame 2, 2, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2A74:: @ 83A2A74
	obj_image_anim_frame 3, 1
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 3, 1, 0x40
	obj_image_anim_frame 0, 1
	obj_image_anim_jump 0

gAnimCmd_83A2A88:: @ 83A2A88
	obj_image_anim_frame 4, 1
	obj_image_anim_frame 1, 1
	obj_image_anim_frame 4, 1, 0x40
	obj_image_anim_frame 1, 1
	obj_image_anim_jump 0

gAnimCmd_83A2A9C:: @ 83A2A9C
	obj_image_anim_frame 5, 1
	obj_image_anim_frame 2, 1
	obj_image_anim_frame 6, 1
	obj_image_anim_frame 2, 1
	obj_image_anim_jump 0

gAnimCmd_83A2AB0:: @ 83A2AB0
	obj_image_anim_frame 5, 1, 0x40
	obj_image_anim_frame 2, 1, 0x40
	obj_image_anim_frame 6, 1, 0x40
	obj_image_anim_frame 2, 1, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2AC4:: @ 83A2AC4
	obj_image_anim_frame 0, 16
	obj_image_anim_jump 0

gAnimCmd_83A2ACC:: @ 83A2ACC
	obj_image_anim_frame 1, 16
	obj_image_anim_jump 0

gAnimCmd_83A2AD4:: @ 83A2AD4
	obj_image_anim_frame 2, 16
	obj_image_anim_jump 0

gAnimCmd_83A2ADC:: @ 83A2ADC
	obj_image_anim_frame 2, 16, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2AE4:: @ 83A2AE4
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 0, 8
	obj_image_anim_jump 0

gAnimCmd_83A2AF8:: @ 83A2AF8
	obj_image_anim_frame 5, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 6, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_jump 0

gAnimCmd_83A2B0C:: @ 83A2B0C
	obj_image_anim_frame 7, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 8, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_jump 0

gAnimCmd_83A2B20:: @ 83A2B20
	obj_image_anim_frame 7, 8, 0x40
	obj_image_anim_frame 2, 8, 0x40
	obj_image_anim_frame 8, 8, 0x40
	obj_image_anim_frame 2, 8, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2B34:: @ 83A2B34
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_jump 0

gAnimCmd_83A2B48:: @ 83A2B48
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_jump 0

gAnimCmd_83A2B5C:: @ 83A2B5C
	obj_image_anim_frame 7, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_jump 0

gAnimCmd_83A2B70:: @ 83A2B70
	obj_image_anim_frame 7, 4, 0x40
	obj_image_anim_frame 2, 4, 0x40
	obj_image_anim_frame 8, 4, 0x40
	obj_image_anim_frame 2, 4, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2B84:: @ 83A2B84
	obj_image_anim_frame 3, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 4, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_jump 0

gAnimCmd_83A2B98:: @ 83A2B98
	obj_image_anim_frame 5, 2
	obj_image_anim_frame 1, 2
	obj_image_anim_frame 6, 2
	obj_image_anim_frame 1, 2
	obj_image_anim_jump 0

gAnimCmd_83A2BAC:: @ 83A2BAC
	obj_image_anim_frame 7, 2
	obj_image_anim_frame 2, 2
	obj_image_anim_frame 8, 2
	obj_image_anim_frame 2, 2
	obj_image_anim_jump 0

gAnimCmd_83A2BC0:: @ 83A2BC0
	obj_image_anim_frame 7, 2, 0x40
	obj_image_anim_frame 2, 2, 0x40
	obj_image_anim_frame 8, 2, 0x40
	obj_image_anim_frame 2, 2, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2BD4:: @ 83A2BD4
	obj_image_anim_frame 3, 1
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 4, 1
	obj_image_anim_frame 0, 1
	obj_image_anim_jump 0

gAnimCmd_83A2BE8:: @ 83A2BE8
	obj_image_anim_frame 5, 1
	obj_image_anim_frame 1, 1
	obj_image_anim_frame 6, 1
	obj_image_anim_frame 1, 1
	obj_image_anim_jump 0

gAnimCmd_83A2BFC:: @ 83A2BFC
	obj_image_anim_frame 7, 1
	obj_image_anim_frame 2, 1
	obj_image_anim_frame 8, 1
	obj_image_anim_frame 2, 1
	obj_image_anim_jump 0

gAnimCmd_83A2C10:: @ 83A2C10
	obj_image_anim_frame 7, 1, 0x40
	obj_image_anim_frame 2, 1, 0x40
	obj_image_anim_frame 8, 1, 0x40
	obj_image_anim_frame 2, 1, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2C24:: @ 83A2C24
	obj_image_anim_frame 9, 0
	obj_image_anim_end

gAnimCmd_83A2C2C:: @ 83A2C2C
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_jump 0

gAnimCmd_83A2C40:: @ 83A2C40
	obj_image_anim_frame 3, 16
	obj_image_anim_jump 0

gAnimCmd_83A2C48:: @ 83A2C48
	obj_image_anim_frame 0, 60
	obj_image_anim_jump 0

gAnimCmd_83A2C50:: @ 83A2C50
	obj_image_anim_frame 1, 60
	obj_image_anim_jump 0

gAnimCmd_83A2C58:: @ 83A2C58
	obj_image_anim_frame 2, 60
	obj_image_anim_jump 0

gAnimCmd_83A2C60:: @ 83A2C60
	obj_image_anim_frame 2, 60, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2C68:: @ 83A2C68
	obj_image_anim_frame 0, 16
	obj_image_anim_jump 0

gAnimCmd_83A2C70:: @ 83A2C70
	obj_image_anim_frame 1, 16
	obj_image_anim_jump 0

gAnimCmd_83A2C78:: @ 83A2C78
	obj_image_anim_frame 2, 16
	obj_image_anim_jump 0

gAnimCmd_83A2C80:: @ 83A2C80
	obj_image_anim_frame 2, 16, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2C88:: @ 83A2C88
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_jump 0

gAnimCmd_83A2CAC:: @ 83A2CAC
	obj_image_anim_frame 7, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 7, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 9, 4
	obj_image_anim_frame 10, 4
	obj_image_anim_frame 9, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_jump 0

gAnimCmd_83A2CD0:: @ 83A2CD0
	obj_image_anim_frame 11, 4
	obj_image_anim_frame 12, 4
	obj_image_anim_frame 11, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 13, 4
	obj_image_anim_frame 14, 4
	obj_image_anim_frame 13, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_jump 0

gAnimCmd_83A2CF4:: @ 83A2CF4
	obj_image_anim_frame 11, 4, 0x40
	obj_image_anim_frame 12, 4, 0x40
	obj_image_anim_frame 11, 4, 0x40
	obj_image_anim_frame 2, 4, 0x40
	obj_image_anim_frame 13, 4, 0x40
	obj_image_anim_frame 14, 4, 0x40
	obj_image_anim_frame 13, 4, 0x40
	obj_image_anim_frame 2, 4, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2D18:: @ 83A2D18
	obj_image_anim_frame 3, 2
	obj_image_anim_frame 4, 2
	obj_image_anim_frame 3, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 5, 2
	obj_image_anim_frame 6, 2
	obj_image_anim_frame 5, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_jump 0

gAnimCmd_83A2D3C:: @ 83A2D3C
	obj_image_anim_frame 7, 2
	obj_image_anim_frame 8, 2
	obj_image_anim_frame 7, 2
	obj_image_anim_frame 1, 2
	obj_image_anim_frame 9, 2
	obj_image_anim_frame 10, 2
	obj_image_anim_frame 9, 2
	obj_image_anim_frame 1, 2
	obj_image_anim_jump 0

gAnimCmd_83A2D60:: @ 83A2D60
	obj_image_anim_frame 11, 2
	obj_image_anim_frame 12, 2
	obj_image_anim_frame 11, 2
	obj_image_anim_frame 2, 2
	obj_image_anim_frame 13, 2
	obj_image_anim_frame 14, 2
	obj_image_anim_frame 13, 2
	obj_image_anim_frame 2, 2
	obj_image_anim_jump 0

gAnimCmd_83A2D84:: @ 83A2D84
	obj_image_anim_frame 11, 2, 0x40
	obj_image_anim_frame 12, 2, 0x40
	obj_image_anim_frame 11, 2, 0x40
	obj_image_anim_frame 2, 2, 0x40
	obj_image_anim_frame 13, 2, 0x40
	obj_image_anim_frame 14, 2, 0x40
	obj_image_anim_frame 13, 2, 0x40
	obj_image_anim_frame 2, 2, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2DA8:: @ 83A2DA8
	obj_image_anim_frame 3, 1
	obj_image_anim_frame 4, 1
	obj_image_anim_frame 3, 1
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 5, 1
	obj_image_anim_frame 6, 1
	obj_image_anim_frame 5, 1
	obj_image_anim_frame 0, 1
	obj_image_anim_jump 0

gAnimCmd_83A2DCC:: @ 83A2DCC
	obj_image_anim_frame 7, 1
	obj_image_anim_frame 8, 1
	obj_image_anim_frame 7, 1
	obj_image_anim_frame 1, 1
	obj_image_anim_frame 9, 1
	obj_image_anim_frame 10, 1
	obj_image_anim_frame 9, 1
	obj_image_anim_frame 1, 1
	obj_image_anim_jump 0

gAnimCmd_83A2DF0:: @ 83A2DF0
	obj_image_anim_frame 11, 1
	obj_image_anim_frame 12, 1
	obj_image_anim_frame 11, 1
	obj_image_anim_frame 2, 1
	obj_image_anim_frame 13, 1
	obj_image_anim_frame 14, 1
	obj_image_anim_frame 13, 1
	obj_image_anim_frame 2, 1
	obj_image_anim_jump 0

gAnimCmd_83A2E14:: @ 83A2E14
	obj_image_anim_frame 11, 1, 0x40
	obj_image_anim_frame 12, 1, 0x40
	obj_image_anim_frame 11, 1, 0x40
	obj_image_anim_frame 2, 1, 0x40
	obj_image_anim_frame 13, 1, 0x40
	obj_image_anim_frame 14, 1, 0x40
	obj_image_anim_frame 13, 1, 0x40
	obj_image_anim_frame 2, 1, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2E38:: @ 83A2E38
	obj_image_anim_frame 3, 0
	obj_image_anim_frame 4, 0
	obj_image_anim_frame 3, 0
	obj_image_anim_frame 0, 0
	obj_image_anim_frame 5, 0
	obj_image_anim_frame 6, 0
	obj_image_anim_frame 5, 0
	obj_image_anim_frame 0, 0
	obj_image_anim_jump 0

gAnimCmd_83A2E5C:: @ 83A2E5C
	obj_image_anim_frame 7, 0
	obj_image_anim_frame 8, 0
	obj_image_anim_frame 7, 0
	obj_image_anim_frame 1, 0
	obj_image_anim_frame 9, 0
	obj_image_anim_frame 10, 0
	obj_image_anim_frame 9, 0
	obj_image_anim_frame 1, 0
	obj_image_anim_jump 0

gAnimCmd_83A2E80:: @ 83A2E80
	obj_image_anim_frame 11, 0
	obj_image_anim_frame 12, 0
	obj_image_anim_frame 11, 0
	obj_image_anim_frame 2, 0
	obj_image_anim_frame 13, 0
	obj_image_anim_frame 14, 0
	obj_image_anim_frame 13, 0
	obj_image_anim_frame 2, 0
	obj_image_anim_jump 0

gAnimCmd_83A2EA4:: @ 83A2EA4
	obj_image_anim_frame 11, 0, 0x40
	obj_image_anim_frame 12, 0, 0x40
	obj_image_anim_frame 11, 0, 0x40
	obj_image_anim_frame 2, 0, 0x40
	obj_image_anim_frame 13, 0, 0x40
	obj_image_anim_frame 14, 0, 0x40
	obj_image_anim_frame 13, 0, 0x40
	obj_image_anim_frame 2, 0, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2EC8:: @ 83A2EC8
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 2, 2, 0x40
	obj_image_anim_frame 1, 2
	obj_image_anim_frame 2, 2
	obj_image_anim_loop 1
	obj_image_anim_end

gAnimCmd_83A2EE0:: @ 83A2EE0
	obj_image_anim_frame 1, 2
	obj_image_anim_frame 2, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 2, 2, 0x40
	obj_image_anim_loop 1
	obj_image_anim_end

gAnimCmd_83A2EF8:: @ 83A2EF8
	obj_image_anim_frame 2, 2, 0x40
	obj_image_anim_frame 1, 2
	obj_image_anim_frame 2, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_loop 1
	obj_image_anim_end

gAnimCmd_83A2F10:: @ 83A2F10
	obj_image_anim_frame 2, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 2, 2, 0x40
	obj_image_anim_frame 1, 2
	obj_image_anim_loop 1
	obj_image_anim_end

gAnimCmd_83A2F28:: @ 83A2F28
	obj_image_anim_frame 18, 16
	obj_image_anim_frame 0, 16
	obj_image_anim_frame 19, 16
	obj_image_anim_frame 0, 32
	obj_image_anim_loop 1
	obj_image_anim_end

gAnimCmd_83A2F40:: @ 83A2F40
	obj_image_anim_frame 9, 5
	obj_image_anim_frame 10, 3
	obj_image_anim_frame 9, 5
	obj_image_anim_frame 11, 3
	obj_image_anim_jump 0

gAnimCmd_83A2F54:: @ 83A2F54
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 13, 3
	obj_image_anim_frame 12, 5
	obj_image_anim_frame 14, 3
	obj_image_anim_jump 0

gAnimCmd_83A2F68:: @ 83A2F68
	obj_image_anim_frame 15, 5
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 15, 5
	obj_image_anim_frame 17, 3
	obj_image_anim_jump 0

gAnimCmd_83A2F7C:: @ 83A2F7C
	obj_image_anim_frame 15, 5, 0x40
	obj_image_anim_frame 16, 3, 0x40
	obj_image_anim_frame 15, 5, 0x40
	obj_image_anim_frame 17, 3, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A2F90:: @ 83A2F90
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 8
	obj_image_anim_end

gAnimCmd_83A2FA8:: @ 83A2FA8
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_loop 0
	obj_image_anim_frame 7, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_loop 6
	obj_image_anim_frame 6, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

gAnimCmd_83A2FD8:: @ 83A2FD8
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_loop 0
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_loop 6
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

gAnimCmd_83A300C:: @ 83A300C
	obj_image_anim_frame 9, 32
	obj_image_anim_jump 0

gAnimCmd_83A3014:: @ 83A3014
	obj_image_anim_frame 10, 32
	obj_image_anim_jump 0

gAnimCmd_83A301C:: @ 83A301C
	obj_image_anim_frame 11, 32
	obj_image_anim_jump 0

gAnimCmd_83A3024:: @ 83A3024
	obj_image_anim_frame 11, 32, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A302C:: @ 83A302C
	obj_image_anim_frame 15, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_end

gAnimCmd_83A3038:: @ 83A3038
	obj_image_anim_frame 19, 4
	obj_image_anim_frame 20, 4
	obj_image_anim_end

gAnimCmd_83A3044:: @ 83A3044
	obj_image_anim_frame 23, 4
	obj_image_anim_frame 24, 4
	obj_image_anim_end

gAnimCmd_83A3050:: @ 83A3050
	obj_image_anim_frame 23, 4, 0x40
	obj_image_anim_frame 24, 4, 0x40
	obj_image_anim_end

gAnimCmd_83A305C:: @ 83A305C
	obj_image_anim_frame 17, 4
	obj_image_anim_frame 18, 4
	obj_image_anim_end

gAnimCmd_83A3068:: @ 83A3068
	obj_image_anim_frame 21, 4
	obj_image_anim_frame 22, 4
	obj_image_anim_end

gAnimCmd_83A3074:: @ 83A3074
	obj_image_anim_frame 25, 4
	obj_image_anim_frame 26, 4
	obj_image_anim_end

gAnimCmd_83A3080:: @ 83A3080
	obj_image_anim_frame 25, 4, 0x40
	obj_image_anim_frame 26, 4, 0x40
	obj_image_anim_end

gAnimCmd_83A308C:: @ 83A308C
	obj_image_anim_frame 15, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

gAnimCmd_83A3098:: @ 83A3098
	obj_image_anim_frame 19, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_end

gAnimCmd_83A30A4:: @ 83A30A4
	obj_image_anim_frame 23, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_end

gAnimCmd_83A30B0:: @ 83A30B0
	obj_image_anim_frame 23, 4, 0x40
	obj_image_anim_frame 2, 4, 0x40
	obj_image_anim_end

gAnimCmd_83A30BC:: @ 83A30BC
	obj_image_anim_frame 17, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

gAnimCmd_83A30C8:: @ 83A30C8
	obj_image_anim_frame 21, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_end

gAnimCmd_83A30D4:: @ 83A30D4
	obj_image_anim_frame 25, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_end

gAnimCmd_83A30E0:: @ 83A30E0
	obj_image_anim_frame 25, 4, 0x40
	obj_image_anim_frame 2, 4, 0x40
	obj_image_anim_end

gAnimCmd_83A30EC:: @ 83A30EC
	obj_image_anim_frame 27, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_frame 28, 4
	obj_image_anim_frame 16, 4
	obj_image_anim_jump 0

gAnimCmd_83A3100:: @ 83A3100
	obj_image_anim_frame 29, 4
	obj_image_anim_frame 20, 4
	obj_image_anim_frame 30, 4
	obj_image_anim_frame 20, 4
	obj_image_anim_jump 0

gAnimCmd_83A3114:: @ 83A3114
	obj_image_anim_frame 31, 4
	obj_image_anim_frame 24, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_frame 24, 4
	obj_image_anim_jump 0

gAnimCmd_83A3128:: @ 83A3128
	obj_image_anim_frame 31, 4, 0x40
	obj_image_anim_frame 24, 4, 0x40
	obj_image_anim_frame 32, 4, 0x40
	obj_image_anim_frame 24, 4, 0x40
	obj_image_anim_jump 0

gAnimCmd_83A313C:: @ 83A313C
	obj_image_anim_frame 0, 32
	obj_image_anim_end

gAnimCmd_83A3144:: @ 83A3144
	obj_image_anim_frame 1, 32
	obj_image_anim_frame 2, 32
	obj_image_anim_end

gAnimCmd_83A3150:: @ 83A3150
	obj_image_anim_frame 3, 48
	obj_image_anim_frame 4, 48
	obj_image_anim_end

gAnimCmd_83A315C:: @ 83A315C
	obj_image_anim_frame 5, 32
	obj_image_anim_frame 5, 32
	obj_image_anim_frame 6, 32
	obj_image_anim_frame 6, 32
	obj_image_anim_end

gAnimCmd_83A3170:: @ 83A3170
	obj_image_anim_frame 7, 48
	obj_image_anim_frame 7, 48
	obj_image_anim_frame 8, 48
	obj_image_anim_frame 8, 48
	obj_image_anim_end

gAnimCmd_83A3184:: @ 83A3184
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 9, 32
	obj_image_anim_frame 0, 8
	obj_image_anim_end

gAnimCmd_83A3194:: @ 83A3194
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_end

gAnimCmd_83A31A8:: @ 83A31A8
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 2, 6
	obj_image_anim_frame 3, 6
	obj_image_anim_end

gAnimCmd_83A31BC:: @ 83A31BC
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 9, 4
	obj_image_anim_frame 10, 4
	obj_image_anim_frame 11, 4
	obj_image_anim_end

gAnimCmd_83A31D0:: @ 83A31D0
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_frame 7, 4
	obj_image_anim_end

gAnimCmd_83A31E4:: @ 83A31E4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_end

gAnimCmd_83A31F8:: @ 83A31F8
	obj_image_anim_frame 0, 4, 0x40
	obj_image_anim_frame 1, 4, 0x40
	obj_image_anim_frame 2, 4, 0x40
	obj_image_anim_frame 3, 4, 0x40
	obj_image_anim_end

gAnimCmd_83A320C:: @ 83A320C
	obj_image_anim_frame 11, 4
	obj_image_anim_frame 10, 6
	obj_image_anim_frame 9, 6
	obj_image_anim_frame 8, 6
	obj_image_anim_end

gAnimCmd_83A3220:: @ 83A3220
	obj_image_anim_frame 7, 4
	obj_image_anim_frame 6, 6
	obj_image_anim_frame 5, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_end

gAnimCmd_83A3234:: @ 83A3234
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

gAnimCmd_83A3248:: @ 83A3248
	obj_image_anim_frame 3, 4, 0x40
	obj_image_anim_frame 2, 4, 0x40
	obj_image_anim_frame 1, 4, 0x40
	obj_image_anim_frame 0, 4, 0x40
	obj_image_anim_end

gAnimCmd_83A325C:: @ 83A325C
	obj_image_anim_frame 10, 6
	obj_image_anim_frame 11, 6
	obj_image_anim_loop 1
	obj_image_anim_frame 11, 30
	obj_image_anim_jump 0

gAnimCmd_83A3270:: @ 83A3270
	obj_image_anim_frame 6, 6
	obj_image_anim_frame 7, 6
	obj_image_anim_loop 1
	obj_image_anim_frame 7, 30
	obj_image_anim_jump 0

gAnimCmd_83A3284:: @ 83A3284
	obj_image_anim_frame 2, 6
	obj_image_anim_frame 3, 6
	obj_image_anim_loop 1
	obj_image_anim_frame 3, 30
	obj_image_anim_jump 0

gAnimCmd_83A3298:: @ 83A3298
	obj_image_anim_frame 2, 6, 0x40
	obj_image_anim_frame 3, 6, 0x40
	obj_image_anim_loop 1
	obj_image_anim_frame 3, 30, 0x40
	obj_image_anim_jump 0

gUnknown_83A32AC:: @ 83A32AC
	obj_rot_scal_anim_frame 0, 0, 1, 1
	obj_rot_scal_anim_frame 0, 0, 0, 1
	obj_rot_scal_anim_frame 0, 0, 0, 1
	obj_rot_scal_anim_frame 0, 0, 0, 1
	obj_rot_scal_anim_loop 7
	obj_rot_scal_anim_jump 0

gUnknown_83A32DC:: @ 83A32DC
	obj_rot_scal_anim_frame 0, 0, -1, 1
	obj_rot_scal_anim_frame 0, 0, 0, 1
	obj_rot_scal_anim_loop 15
	obj_rot_scal_anim_frame 0, 0, 1, 1
	obj_rot_scal_anim_frame 0, 0, 0, 1
	obj_rot_scal_anim_loop 15
	obj_rot_scal_anim_jump 0

gAnimTable_83A3314:: @ 83A3314
	.4byte gAnimCmd_83A2950
gAnimTable_83A3318:: @ 83A3318
	.4byte gAnimCmd_83A2964
	.4byte gAnimCmd_83A296C
	.4byte gAnimCmd_83A2974
	.4byte gAnimCmd_83A297C
	.4byte gAnimCmd_83A2984
	.4byte gAnimCmd_83A2998
	.4byte gAnimCmd_83A29AC
	.4byte gAnimCmd_83A29C0
	.4byte gAnimCmd_83A29D4
	.4byte gAnimCmd_83A29E8
	.4byte gAnimCmd_83A29FC
	.4byte gAnimCmd_83A2A10
	.4byte gAnimCmd_83A2A24
	.4byte gAnimCmd_83A2A38
	.4byte gAnimCmd_83A2A4C
	.4byte gAnimCmd_83A2A60
	.4byte gAnimCmd_83A2A74
	.4byte gAnimCmd_83A2A88
	.4byte gAnimCmd_83A2A9C
	.4byte gAnimCmd_83A2AB0

gAnimTable_83A3368:: @ 83A3368
	.4byte gAnimCmd_83A2AC4
	.4byte gAnimCmd_83A2ACC
	.4byte gAnimCmd_83A2AD4
	.4byte gAnimCmd_83A2ADC
	.4byte gAnimCmd_83A2AE4
	.4byte gAnimCmd_83A2AF8
	.4byte gAnimCmd_83A2B0C
	.4byte gAnimCmd_83A2B20
	.4byte gAnimCmd_83A2B34
	.4byte gAnimCmd_83A2B48
	.4byte gAnimCmd_83A2B5C
	.4byte gAnimCmd_83A2B70
	.4byte gAnimCmd_83A2B84
	.4byte gAnimCmd_83A2B98
	.4byte gAnimCmd_83A2BAC
	.4byte gAnimCmd_83A2BC0
	.4byte gAnimCmd_83A2BD4
	.4byte gAnimCmd_83A2BE8
	.4byte gAnimCmd_83A2BFC
	.4byte gAnimCmd_83A2C10
	.4byte gAnimCmd_83A2C24

gAnimTable_83A33BC:: @ 83A33BC
	.4byte gAnimCmd_83A2AC4
	.4byte gAnimCmd_83A2ACC
	.4byte gAnimCmd_83A2AD4
	.4byte gAnimCmd_83A2ADC
	.4byte gAnimCmd_83A2C2C
	.4byte gAnimCmd_83A2C40
	.4byte gAnimCmd_83A2B0C
	.4byte gAnimCmd_83A2B20
	.4byte gAnimCmd_83A2B34
	.4byte gAnimCmd_83A2B48
	.4byte gAnimCmd_83A2B5C
	.4byte gAnimCmd_83A2B70
	.4byte gAnimCmd_83A2B84
	.4byte gAnimCmd_83A2B98
	.4byte gAnimCmd_83A2BAC
	.4byte gAnimCmd_83A2BC0
	.4byte gAnimCmd_83A2BD4
	.4byte gAnimCmd_83A2BE8
	.4byte gAnimCmd_83A2BFC
	.4byte gAnimCmd_83A2C10
	.4byte gAnimCmd_83A2C24

gAnimTable_83A3410::
	.4byte gAnimCmd_83A2C68
	.4byte gAnimCmd_83A2C70
	.4byte gAnimCmd_83A2C78
	.4byte gAnimCmd_83A2C80
	.4byte gAnimCmd_83A2C88
	.4byte gAnimCmd_83A2CAC
	.4byte gAnimCmd_83A2CD0
	.4byte gAnimCmd_83A2CF4
	.4byte gAnimCmd_83A2D18
	.4byte gAnimCmd_83A2D3C
	.4byte gAnimCmd_83A2D60
	.4byte gAnimCmd_83A2D84
	.4byte gAnimCmd_83A2DA8
	.4byte gAnimCmd_83A2DCC
	.4byte gAnimCmd_83A2DF0
	.4byte gAnimCmd_83A2E14
	.4byte gAnimCmd_83A2E38
	.4byte gAnimCmd_83A2E5C
	.4byte gAnimCmd_83A2E80
	.4byte gAnimCmd_83A2EA4
	.4byte gAnimCmd_83A2F40
	.4byte gAnimCmd_83A2F54
	.4byte gAnimCmd_83A2F68
	.4byte gAnimCmd_83A2F7C

gAnimTable_83A3470:: @ 83A3470
	.4byte gAnimCmd_83A2AC4
	.4byte gAnimCmd_83A2ACC
	.4byte gAnimCmd_83A2AD4
	.4byte gAnimCmd_83A2ADC
	.4byte gAnimCmd_83A2AE4
	.4byte gAnimCmd_83A2AF8
	.4byte gAnimCmd_83A2B0C
	.4byte gAnimCmd_83A2B20
	.4byte gAnimCmd_83A2B34
	.4byte gAnimCmd_83A2B48
	.4byte gAnimCmd_83A2B5C
	.4byte gAnimCmd_83A2B70
	.4byte gAnimCmd_83A2B84
	.4byte gAnimCmd_83A2B98
	.4byte gAnimCmd_83A2BAC
	.4byte gAnimCmd_83A2BC0
	.4byte gAnimCmd_83A2BD4
	.4byte gAnimCmd_83A2BE8
	.4byte gAnimCmd_83A2BFC
	.4byte gAnimCmd_83A2C10
	.4byte gAnimCmd_83A2F40
	.4byte gAnimCmd_83A2F54
	.4byte gAnimCmd_83A2F68
	.4byte gAnimCmd_83A2F7C
	.4byte gAnimCmd_83A2EC8
	.4byte gAnimCmd_83A2EE0
	.4byte gAnimCmd_83A2EF8
	.4byte gAnimCmd_83A2F10
	.4byte gAnimCmd_83A2F28

gAnimTable_83A34E4::
	.4byte gAnimCmd_83A2AC4
	.4byte gAnimCmd_83A2ACC
	.4byte gAnimCmd_83A2AD4
	.4byte gAnimCmd_83A2ADC
	.4byte gAnimCmd_83A2AE4
	.4byte gAnimCmd_83A2AF8
	.4byte gAnimCmd_83A2B0C
	.4byte gAnimCmd_83A2B20
	.4byte gAnimCmd_83A2B34
	.4byte gAnimCmd_83A2B48
	.4byte gAnimCmd_83A2B5C
	.4byte gAnimCmd_83A2B70
	.4byte gAnimCmd_83A2B84
	.4byte gAnimCmd_83A2B98
	.4byte gAnimCmd_83A2BAC
	.4byte gAnimCmd_83A2BC0
	.4byte gAnimCmd_83A2BD4
	.4byte gAnimCmd_83A2BE8
	.4byte gAnimCmd_83A2BFC
	.4byte gAnimCmd_83A2C10
	.4byte gAnimCmd_83A302C
	.4byte gAnimCmd_83A3038
	.4byte gAnimCmd_83A3044
	.4byte gAnimCmd_83A3050
	.4byte gAnimCmd_83A305C
	.4byte gAnimCmd_83A3068
	.4byte gAnimCmd_83A3074
	.4byte gAnimCmd_83A3080
	.4byte gAnimCmd_83A308C
	.4byte gAnimCmd_83A3098
	.4byte gAnimCmd_83A30A4
	.4byte gAnimCmd_83A30B0
	.4byte gAnimCmd_83A30BC
	.4byte gAnimCmd_83A30C8
	.4byte gAnimCmd_83A30D4
	.4byte gAnimCmd_83A30E0
	.4byte gAnimCmd_83A30EC
	.4byte gAnimCmd_83A3100
	.4byte gAnimCmd_83A3114
	.4byte gAnimCmd_83A3128

gAnimTable_83A3584:: @ 83A3584
	.4byte gAnimCmd_83A2C48
	.4byte gAnimCmd_83A2C50
	.4byte gAnimCmd_83A2C58
	.4byte gAnimCmd_83A2C60
	.4byte gAnimCmd_83A2C48
	.4byte gAnimCmd_83A2C50
	.4byte gAnimCmd_83A2C58
	.4byte gAnimCmd_83A2C60
	.4byte gAnimCmd_83A2C48
	.4byte gAnimCmd_83A2C50
	.4byte gAnimCmd_83A2C58
	.4byte gAnimCmd_83A2C60
	.4byte gAnimCmd_83A2C48
	.4byte gAnimCmd_83A2C50
	.4byte gAnimCmd_83A2C58
	.4byte gAnimCmd_83A2C60
	.4byte gAnimCmd_83A2C48
	.4byte gAnimCmd_83A2C50
	.4byte gAnimCmd_83A2C58
	.4byte gAnimCmd_83A2C60
	.4byte gAnimCmd_83A300C
	.4byte gAnimCmd_83A3014
	.4byte gAnimCmd_83A301C
	.4byte gAnimCmd_83A3024

gAnimTable_83A35E4:: @ 83A35E4
	.4byte gAnimCmd_83A2AC4
	.4byte gAnimCmd_83A2ACC
	.4byte gAnimCmd_83A2AD4
	.4byte gAnimCmd_83A2ADC
	.4byte gAnimCmd_83A2AE4
	.4byte gAnimCmd_83A2AF8
	.4byte gAnimCmd_83A2B0C
	.4byte gAnimCmd_83A2B20
	.4byte gAnimCmd_83A2B34
	.4byte gAnimCmd_83A2B48
	.4byte gAnimCmd_83A2B5C
	.4byte gAnimCmd_83A2B70
	.4byte gAnimCmd_83A2B84
	.4byte gAnimCmd_83A2B98
	.4byte gAnimCmd_83A2BAC
	.4byte gAnimCmd_83A2BC0
	.4byte gAnimCmd_83A2BD4
	.4byte gAnimCmd_83A2BE8
	.4byte gAnimCmd_83A2BFC
	.4byte gAnimCmd_83A2C10
	.4byte gAnimCmd_83A3184

gAnimTable_83A3638:: @ 83A3638
	.4byte gAnimCmd_83A2F90

gAnimTable_83A363C:: @ 83A363C
	.4byte gAnimCmd_83A2FA8

gAnimTable_83A3640:: @ 83A3640
	.4byte gAnimCmd_83A2FD8
	.4byte gAnimCmd_83A313C
	.4byte gAnimCmd_83A3144
	.4byte gAnimCmd_83A3150
	.4byte gAnimCmd_83A315C
	.4byte gAnimCmd_83A3170

gAnimTable_83A3658:: @ 83A3658
	.4byte gAnimCmd_83A2950
	.4byte gAnimCmd_83A3194

gAnimTable_83A3660:: @ 83A3660
	.4byte gAnimCmd_83A2950
	.4byte gAnimCmd_83A31A8

gAnimTable_83A3668:: @ 83A3668
	.4byte gAnimCmd_83A31BC
	.4byte gAnimCmd_83A31D0
	.4byte gAnimCmd_83A31E4
	.4byte gAnimCmd_83A31F8
	.4byte gAnimCmd_83A320C
	.4byte gAnimCmd_83A3220
	.4byte gAnimCmd_83A3234
	.4byte gAnimCmd_83A3248
	.4byte gAnimCmd_83A325C
	.4byte gAnimCmd_83A3270
	.4byte gAnimCmd_83A3284
	.4byte gAnimCmd_83A3298

gUnknown_83A3698:: @ 83A3698
	.4byte gAnimTable_83A3318
	.byte 1, 3, 0, 2
	.4byte gAnimTable_83A3368
	.byte 1, 3, 0, 2
	.4byte gAnimTable_83A3470
	.byte 1, 3, 0, 2
	.4byte gAnimTable_83A34E4
	.byte 1, 3, 0, 2
	.4byte gAnimTable_83A3584
	.byte 1, 3, 0, 2
	.4byte gAnimTable_83A35E4
	.byte 1, 3, 0, 2
	.4byte gAnimTable_83A3668
	.byte 1, 3, 0, 2
	.4byte gAnimTable_83A3410
	.byte 3, 7, 0, 4
	.4byte 0x00000000, 0x00000000

@9186
