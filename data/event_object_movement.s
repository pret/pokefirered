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

@9186
