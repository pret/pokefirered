	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2
gUnknown_835B934:: @ 835B934
	.byte 0x01, 0x01, 0x06, 0x07, 0x08, 0x09, 0x06, 0x07, 0x08, 0x09, 0x0b, 0x0b, 0x00, 0x00, 0x00, 0x00

gUnknown_835B944:: @ 835B944
	spr_template 0, 65535, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, ObjectCB_CameraObject

gUnknown_835B95C:: @ 835B95C
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

gMovementTypeCallbacks:: @ 839FBC8
	.4byte sub_805FFB4
	.4byte sub_806058C
	.4byte sub_805FFDC
	.4byte sub_80606CC
	.4byte sub_80606CC
	.4byte sub_8060850
	.4byte sub_8060850
	.4byte sub_80609D4
	.4byte sub_80609D4
	.4byte sub_80609D4
	.4byte sub_80609D4
	.4byte sub_805B3B8
	.4byte NULL
	.4byte sub_8060A74
	.4byte sub_8060BB4
	.4byte sub_8060CF4
	.4byte sub_8060E34
	.4byte sub_8060F74
	.4byte sub_80610B4
	.4byte sub_80611F4
	.4byte sub_8061334
	.4byte sub_8061474
	.4byte sub_80615B4
	.4byte sub_80616F4
	.4byte sub_80617F8
	.4byte sub_80618FC
	.4byte sub_80618FC
	.4byte sub_80618FC
	.4byte sub_80618FC
	.4byte sub_8061B5C
	.4byte sub_8061BE8
	.4byte sub_8061C74
	.4byte sub_8061D00
	.4byte sub_8061D8C
	.4byte sub_8061E18
	.4byte sub_8061EA4
	.4byte sub_8061F30
	.4byte sub_8061FBC
	.4byte sub_8062048
	.4byte sub_80620D4
	.4byte sub_8062160
	.4byte sub_80621EC
	.4byte sub_8062278
	.4byte sub_8062304
	.4byte sub_8062390
	.4byte sub_806241C
	.4byte sub_80624A8
	.4byte sub_8062534
	.4byte sub_80625C0
	.4byte sub_806264C
	.4byte sub_80626D8
	.4byte sub_8062764
	.4byte sub_80627F0
	.4byte sub_806287C
	.4byte sub_806287C
	.4byte sub_806287C
	.4byte sub_806287C
	.4byte ObjectEventCB_TreeDisguise
	.4byte ObjectEventCB_MountainDisguise
	.4byte sub_8062E60
	.4byte sub_8062E60
	.4byte sub_8062E60
	.4byte sub_8062E60
	.4byte ObjectEventCB_Hidden1
	.4byte sub_80630A0
	.4byte sub_80630A0
	.4byte sub_80630A0
	.4byte sub_80630A0
	.4byte sub_8063110
	.4byte sub_8063110
	.4byte sub_8063110
	.4byte sub_8063110
	.4byte sub_8063180
	.4byte sub_8063180
	.4byte sub_8063180
	.4byte sub_8063180
	.4byte sub_80631F0
	.4byte sub_8063298
	.4byte sub_80632BC
	.4byte sub_80632E0
	.4byte sub_8060020

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

gObjectEventBaseOam_128x64::
	.4byte 0x00000000, 0x00000800

gObjectEventBaseOam_Unknown1::
	.4byte 0x00004000, 0x00000800

gObjectEventBaseOam_16x16::
	.4byte 0x40000000, 0x00000800

gObjectEventBaseOam_32x16::
	.4byte 0x80004000, 0x00000800

gObjectEventBaseOam_Unknown2::
	.4byte 0x40004000, 0x00000800

gObjectEventBaseOam_Unknown3::
	.4byte 0xc0004000, 0x00000800

gObjectEventBaseOam_16x32::
	.4byte 0x80008000, 0x00000800

gObjectEventBaseOam_32x32:: @ 83A3718
	.4byte 0x80000000, 0x00000800

gObjectEventBaseOam_64x64:: @ 83A3720
	.4byte 0xc0000000, 0x00000800

gSubsprites_83A3728:: @ 83A3728
	subsprite 248, 248, 2, 0x0000, 16x16

gSubsprites_83A372C:: @ 83A372C
	subsprite 248, 248, 1, 0x0000, 16x16

gSubsprites_83A3730:: @ 83A3730
	subsprite 248, 248, 2, 0x0000, 16x8
	subsprite 248, 0, 3, 0x0002, 16x8

gSubsprites_83A3738:: @ 83A3738
	subsprite 248, 248, 2, 0x0000, 16x16
	subsprite 248, 248, 3, 0x0000, 16x16

gSubsprites_83A3740:: @ 83A3740
	subsprite 248, 248, 1, 0x0000, 16x16
	subsprite 248, 248, 3, 0x0000, 16x16

gSubspriteTables_83A3748:: @ 83A3748
	.byte 0
	.align 2
	.4byte NULL
	.byte 1
	.align 2
	.4byte gSubsprites_83A3728
	.byte 1
	.align 2
	.4byte gSubsprites_83A372C
	.byte 2
	.align 2
	.4byte gSubsprites_83A3730
	.byte 2
	.align 2
	.4byte gSubsprites_83A3738
	.byte 2
	.align 2
	.4byte gSubsprites_83A3740

gSubsprites_83A3778:: @ 83A3778
	subsprite 248, 240, 2, 0x0000, 16x32

gSubsprites_83A377C:: @ 83A377C
	subsprite 248, 240, 1, 0x0000, 16x32

gSubsprites_83A3780:: @ 83A3780
	subsprite 248, 240, 2, 0x0000, 16x16
	subsprite 248, 0, 2, 0x0004, 16x8
	subsprite 248, 8, 3, 0x0006, 16x8

gSubsprites_83A378C:: @ 83A378C
	subsprite 248, 240, 2, 0x0000, 16x16
	subsprite 248, 0, 3, 0x0004, 16x16

gSubsprites_83A3794:: @ 83A3794
	subsprite 248, 240, 1, 0x0000, 16x16
	subsprite 248, 0, 3, 0x0004, 16x16

gSubspriteTables_83A379C:: @ 83A379C
	.byte 0
	.align 2
	.4byte NULL
	.byte 1
	.align 2
	.4byte gSubsprites_83A3778
	.byte 1
	.align 2
	.4byte gSubsprites_83A377C
	.byte 3
	.align 2
	.4byte gSubsprites_83A3780
	.byte 2
	.align 2
	.4byte gSubsprites_83A378C
	.byte 2
	.align 2
	.4byte gSubsprites_83A3794

gSubsprites_83A37CC:: @ 83A37CC
	subsprite 240, 240, 2, 0x0000, 32x32

gSubsprites_83A37D0:: @ 83A37D0
	subsprite 240, 240, 1, 0x0000, 32x32

gSubsprites_83A37D4:: @ 83A37D4
	subsprite 240, 240, 2, 0x0000, 32x16
	subsprite 240, 0, 2, 0x0008, 32x8
	subsprite 240, 8, 3, 0x000c, 32x8

gSubsprites_83A37E0:: @ 83A37E0
	subsprite 240, 240, 2, 0x0000, 32x16
	subsprite 240, 0, 3, 0x0008, 32x16

gSubsprites_83A37E8:: @ 83A37E8
	subsprite 240, 240, 1, 0x0000, 32x16
	subsprite 240, 0, 3, 0x0008, 32x16

gSubspriteTables_83A37F0:: @ 83A37F0
	.byte 0
	.align 2
	.4byte NULL
	.byte 1
	.align 2
	.4byte gSubsprites_83A37CC
	.byte 1
	.align 2
	.4byte gSubsprites_83A37D0
	.byte 3
	.align 2
	.4byte gSubsprites_83A37D4
	.byte 2
	.align 2
	.4byte gSubsprites_83A37E0
	.byte 2
	.align 2
	.4byte gSubsprites_83A37E8

gUnknown_83A3820:: @ 83A3820
	subsprite 232, 232, 2, 0, 32x8
	subsprite 8, 232, 2, 4, 16x8
	subsprite 232, 240, 2, 6, 32x8
	subsprite 8, 240, 2, 10, 16x8
	subsprite 232, 248, 2, 12, 32x8
	subsprite 8, 248, 2, 16, 16x8
	subsprite 232, 0, 2, 18, 32x8
	subsprite 8, 0, 2, 22, 16x8
	subsprite 232, 8, 2, 24, 32x8
	subsprite 8, 8, 2, 28, 16x8
	subsprite 232, 16, 2, 30, 32x8
	subsprite 8, 16, 2, 34, 16x8

gUnknown_83A3850:: @ 83A3850
	.byte 0xC
	.align 2
	.4byte gUnknown_83A3820
	.byte 0xC
	.align 2
	.4byte gUnknown_83A3820
	.byte 0xC
	.align 2
	.4byte gUnknown_83A3820
	.byte 0xC
	.align 2
	.4byte gUnknown_83A3820
	.byte 0xC
	.align 2
	.4byte gUnknown_83A3820
	.byte 0xC
	.align 2
	.4byte gUnknown_83A3820

gUnknown_83A3880:: @ 83A3880
	subsprite 224, 240, 2, 0, 64x32

gUnknown_83A3884:: @ 83A3884
	subsprite 224, 240, 1, 0, 64x32

gUnknown_83A3888:: @ 83A3888
	subsprite 224, 240, 2, 0, 64x32

gUnknown_83A388C:: @ 83A388C
	subsprite 224, 240, 2, 0, 64x32

gUnknown_83A3890:: @ 83A3890
	.byte 0x0
	.align 2
	.4byte NULL
	.byte 1
	.align 2
	.4byte gUnknown_83A3880
	.byte 1
	.align 2
	.4byte gUnknown_83A3884
	.byte 1
	.align 2
	.4byte gUnknown_83A3888
	.byte 1
	.align 2
	.4byte gUnknown_83A388C
	.byte 1
	.align 2
	.4byte gUnknown_83A388C

gSubsprites_83A38C0:: @ 83A38C0
	subsprite 224, 224, 2, 0x0000, 64x64

gSubsprites_83A38C4:: @ 83A38C4
	subsprite 224, 224, 1, 0x0000, 64x64

gSubsprites_83A38C8:: @ 83A38C8
	subsprite 224, 224, 2, 0x0000, 64x64

gSubsprites_83A38CC:: @ 83A38CC
	subsprite 224, 224, 2, 0x0000, 64x64

gSubspriteTables_83A38D0:: @ 83A38D0
	.byte 0
	.align 2
	.4byte NULL
	.byte 1
	.align 2
	.4byte gSubsprites_83A38C0
	.byte 1
	.align 2
	.4byte gSubsprites_83A38C4
	.byte 1
	.align 2
	.4byte gSubsprites_83A38C8
	.byte 1
	.align 2
	.4byte gSubsprites_83A38CC
	.byte 1
	.align 2
	.4byte gSubsprites_83A38CC

gUnknown_83A3900:: @ 83A3900
	subsprite 208, 236, 2, 0, 32x8
	subsprite 240, 236, 2, 4, 32x8
	subsprite 16, 236, 2, 8, 32x8
	subsprite 208, 244, 2, 12, 32x8
	subsprite 240, 244, 2, 16, 32x8
	subsprite 16, 244, 2, 20, 32x8
	subsprite 208, 252, 2, 24, 32x8
	subsprite 240, 252, 2, 28, 32x8
	subsprite 16, 252, 2, 32, 32x8
	subsprite 208, 4, 2, 36, 32x8
	subsprite 240, 4, 2, 40, 32x8
	subsprite 16, 4, 2, 44, 32x8
	subsprite 208, 12, 2, 48, 32x8
	subsprite 240, 12, 2, 52, 32x8
	subsprite 16, 12, 2, 56, 32x8

gUnknown_83A393C:: @ 83A393C
	subsprite 208, 236, 1, 0, 32x8
	subsprite 240, 236, 1, 4, 32x8
	subsprite 16, 236, 1, 8, 32x8
	subsprite 208, 244, 1, 12, 32x8
	subsprite 240, 244, 1, 16, 32x8
	subsprite 16, 244, 1, 20, 32x8
	subsprite 208, 252, 1, 24, 32x8
	subsprite 240, 252, 1, 28, 32x8
	subsprite 16, 252, 1, 32, 32x8
	subsprite 208, 4, 1, 36, 32x8
	subsprite 240, 4, 1, 40, 32x8
	subsprite 16, 4, 1, 44, 32x8
	subsprite 208, 12, 1, 48, 32x8
	subsprite 240, 12, 1, 52, 32x8
	subsprite 16, 12, 1, 56, 32x8

gUnknown_83A3978:: @ 83A3978
	subsprite 208, 236, 2, 0, 32x8
	subsprite 240, 236, 2, 4, 32x8
	subsprite 16, 236, 2, 8, 32x8
	subsprite 208, 244, 2, 12, 32x8
	subsprite 240, 244, 2, 16, 32x8
	subsprite 16, 244, 2, 20, 32x8
	subsprite 208, 252, 2, 24, 32x8
	subsprite 240, 252, 2, 28, 32x8
	subsprite 16, 252, 2, 32, 32x8
	subsprite 208, 4, 2, 36, 32x8
	subsprite 240, 4, 2, 40, 32x8
	subsprite 16, 4, 2, 44, 32x8
	subsprite 208, 12, 2, 48, 32x8
	subsprite 240, 12, 2, 52, 32x8
	subsprite 16, 12, 2, 56, 32x8

gUnknown_83A39B4:: @ 83A39B4
	subsprite 208, 236, 1, 0, 32x8
	subsprite 240, 236, 1, 4, 32x8
	subsprite 16, 236, 1, 8, 32x8
	subsprite 208, 244, 1, 12, 32x8
	subsprite 240, 244, 1, 16, 32x8
	subsprite 16, 244, 1, 20, 32x8
	subsprite 208, 252, 2, 24, 32x8
	subsprite 240, 252, 2, 28, 32x8
	subsprite 16, 252, 2, 32, 32x8
	subsprite 208, 4, 2, 36, 32x8
	subsprite 240, 4, 2, 40, 32x8
	subsprite 16, 4, 2, 44, 32x8
	subsprite 208, 12, 2, 48, 32x8
	subsprite 240, 12, 2, 52, 32x8
	subsprite 16, 12, 2, 56, 32x8

gUnknown_83A39F0:: @ 83A39F0
	.byte 0xF
	.align 2
	.4byte gUnknown_83A3900
	.byte 0xF
	.align 2
	.4byte gUnknown_83A3900
	.byte 0xF
	.align 2
	.4byte gUnknown_83A393C
	.byte 0xF
	.align 2
	.4byte gUnknown_83A3978
	.byte 0xF
	.align 2
	.4byte gUnknown_83A39B4
	.byte 0xF
	.align 2
	.4byte gUnknown_83A39B4

gSubsprites_83A3A20:: @ 83A3A20
	subsprite 224, 240, 2, 0x0000, 64x32
	subsprite 32, 240, 2, 0x0020, 64x32
	subsprite 224, 16, 2, 0x0040, 64x32
	subsprite 32, 16, 2, 0x0060, 64x32

gSubsprites_83A3A30:: @ 83A3A30
	subsprite 224, 240, 1, 0x0000, 64x32
	subsprite 32, 240, 1, 0x0020, 64x32
	subsprite 224, 16, 1, 0x0040, 64x32
	subsprite 32, 16, 1, 0x0060, 64x32

gSubsprites_83A3A40:: @ 83A3A40
	subsprite 224, 240, 1, 0x0000, 64x32
	subsprite 32, 240, 1, 0x0020, 64x32
	subsprite 224, 16, 2, 0x0040, 64x32
	subsprite 32, 16, 2, 0x0060, 64x32

gSubspriteTables_83A3A50:: @ 83A3A50
	.byte 4
	.align 2
	.4byte gSubsprites_83A3A20
	.byte 4
	.align 2
	.4byte gSubsprites_83A3A20
	.byte 4
	.align 2
	.4byte gSubsprites_83A3A30
	.byte 4
	.align 2
	.4byte gSubsprites_83A3A40
	.byte 4
	.align 2
	.4byte gSubsprites_83A3A40
	.byte 4
	.align 2
	.4byte gSubsprites_83A3A40

gUnknown_83A3A80:: @ 83A3A80
	subsprite 208, 236, 2, 0, 32x8
	subsprite 240, 236, 2, 4, 32x8
	subsprite 16, 236, 2, 8, 16x8
	subsprite 32, 236, 2, 10, 8x8
	subsprite 208, 244, 2, 11, 32x8
	subsprite 240, 244, 2, 15, 32x8
	subsprite 16, 244, 2, 19, 16x8
	subsprite 32, 244, 2, 21, 8x8
	subsprite 208, 252, 2, 22, 32x8
	subsprite 240, 252, 2, 26, 32x8
	subsprite 16, 252, 2, 30, 16x8
	subsprite 32, 252, 2, 32, 8x8
	subsprite 208, 4, 2, 33, 32x8
	subsprite 240, 4, 2, 37, 32x8
	subsprite 16, 4, 2, 41, 16x8
	subsprite 32, 4, 2, 43, 8x8

gUnknown_83A3AC0:: @ 83A3AC0
	subsprite 208, 236, 1, 0, 32x8
	subsprite 240, 236, 1, 4, 32x8
	subsprite 16, 236, 1, 8, 16x8
	subsprite 32, 236, 1, 10, 8x8
	subsprite 208, 244, 1, 11, 32x8
	subsprite 240, 244, 1, 15, 32x8
	subsprite 16, 244, 1, 19, 16x8
	subsprite 32, 244, 1, 21, 8x8
	subsprite 208, 252, 1, 22, 32x8
	subsprite 240, 252, 1, 26, 32x8
	subsprite 16, 252, 1, 30, 16x8
	subsprite 32, 252, 1, 32, 8x8
	subsprite 208, 4, 1, 33, 32x8
	subsprite 240, 4, 1, 37, 32x8
	subsprite 16, 4, 1, 41, 16x8
	subsprite 32, 4, 1, 43, 8x8

gUnknown_83A3B00:: @ 83A3B00
	subsprite 208, 236, 2, 0, 32x8
	subsprite 240, 236, 2, 4, 32x8
	subsprite 16, 236, 2, 8, 16x8
	subsprite 32, 236, 2, 10, 8x8
	subsprite 208, 244, 2, 11, 32x8
	subsprite 240, 244, 2, 15, 32x8
	subsprite 16, 244, 2, 19, 16x8
	subsprite 32, 244, 2, 21, 8x8
	subsprite 208, 252, 2, 22, 32x8
	subsprite 240, 252, 2, 26, 32x8
	subsprite 16, 252, 2, 30, 16x8
	subsprite 32, 252, 2, 32, 8x8
	subsprite 208, 4, 2, 33, 32x8
	subsprite 240, 4, 2, 37, 32x8
	subsprite 16, 4, 2, 41, 16x8
	subsprite 32, 4, 2, 43, 8x8

gUnknown_83A3B40:: @ 83A3B40
	subsprite 208, 236, 1, 0, 32x8
	subsprite 240, 236, 1, 4, 32x8
	subsprite 16, 236, 1, 8, 16x8
	subsprite 32, 236, 1, 10, 8x8
	subsprite 208, 244, 1, 11, 32x8
	subsprite 240, 244, 1, 15, 32x8
	subsprite 16, 244, 1, 19, 16x8
	subsprite 32, 244, 1, 21, 8x8
	subsprite 208, 252, 2, 22, 32x8
	subsprite 240, 252, 2, 26, 32x8
	subsprite 16, 252, 2, 30, 16x8
	subsprite 32, 252, 2, 32, 8x8
	subsprite 208, 4, 2, 33, 32x8
	subsprite 240, 4, 2, 37, 32x8
	subsprite 16, 4, 2, 41, 16x8
	subsprite 32, 4, 2, 43, 8x8

gUnknown_83A3B80:: @ 83A3B80
	.byte 0x10
	.align 2
	.4byte gUnknown_83A3A80
	.byte 0x10
	.align 2
	.4byte gUnknown_83A3A80
	.byte 0x10
	.align 2
	.4byte gUnknown_83A3AC0
	.byte 0x10
	.align 2
	.4byte gUnknown_83A3B00
	.byte 0x10
	.align 2
	.4byte gUnknown_83A3B40
	.byte 0x10
	.align 2
	.4byte gUnknown_83A3B40

gObjectEventGraphicsInfo_83A3BB0:: @ 83A3BB0
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3470
	.4byte gSpriteImages_83A00A0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3BD4:: @ 83A3BD4
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0140
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3BF8:: @ 83A3BF8
	.2byte 0xFFFF, 0x1100, 0x11FF, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (1 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3584
	.4byte gSpriteImages_83A0270
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3C1C:: @ 83A3C1C
	.2byte 0xFFFF, 0x1100, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3638
	.4byte gSpriteImages_83A0330
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3C40:: @ 83A3C40
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A04C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3C64:: @ 83A3C64
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0420
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3C88:: @ 83A3C88
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0470
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3CAC:: @ 83A3CAC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0508
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3CD0:: @ 83A3CD0
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0550
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3CF4:: @ 83A3CF4
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A05A0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3D18:: @ 83A3D18
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A05E8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3D3C:: @ 83A3D3C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0638
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3D60:: @ 83A3D60
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0688
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3D84:: @ 83A3D84
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A06D8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3DA8:: @ 83A3DA8
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0C40
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3DCC:: @ 83A3DCC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0720
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3DF0:: @ 83A3DF0
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0770
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3E14:: @ 83A3E14
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A07C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3E38:: @ 83A3E38
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0808
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3E5C:: @ 83A3E5C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0858
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3E80:: @ 83A3E80
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A08A8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3EA4:: @ 83A3EA4
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A08F8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3EC8:: @ 83A3EC8
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0940
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3EEC:: @ 83A3EEC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0988
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3F10:: @ 83A3F10
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A09D8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3F34:: @ 83A3F34
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0A20
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3F58:: @ 83A3F58
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0AB8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3F7C:: @ 83A3F7C
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0B00
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3FA0:: @ 83A3FA0
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0B50
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3FC4:: @ 83A3FC4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0BA0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3FE8:: @ 83A3FE8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0BF0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A400C:: @ 83A400C
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0C90
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4030:: @ 83A4030
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0CE0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4054:: @ 83A4054
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0D30
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4078:: @ 83A4078
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0D78
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A409C:: @ 83A409C
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0DC8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A40C0:: @ 83A40C0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0E18
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A40E4:: @ 83A40E4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0E68
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4108:: @ 83A4108
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0EB8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A412C:: @ 83A412C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0F08
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4150:: @ 83A4150
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0F58
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4174:: @ 83A4174
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0FA8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4198:: @ 83A4198
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0FF8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A41BC:: @ 83A41BC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1040
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A41E0:: @ 83A41E0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1090
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4204:: @ 83A4204
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A10D8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4228:: @ 83A4228
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1120
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A424C:: @ 83A424C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1170
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4270:: @ 83A4270
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A11C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4294:: @ 83A4294
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1210
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A42B8:: @ 83A42B8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1260
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A42DC:: @ 83A42DC
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A12B0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4300:: @ 83A4300
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A35E4
	.4byte gSpriteImages_83A12F8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4324:: @ 83A4324
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1348
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4348:: @ 83A4348
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1390
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A436C:: @ 83A436C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1398
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4390:: @ 83A4390
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A13E0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A43B4:: @ 83A43B4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1430
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A43D8:: @ 83A43D8
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1480
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A43FC:: @ 83A43FC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A14C8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4420:: @ 83A4420
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0A70
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4444:: @ 83A4444
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3660
	.4byte gSpriteImages_83A1510
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4468:: @ 83A4468
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1530
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A448C:: @ 83A448C
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1578
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A44B0:: @ 83A44B0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A15C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A44D4:: @ 83A44D4
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1608
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A44F8:: @ 83A44F8
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1650
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A451C:: @ 83A451C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3658
	.4byte gSpriteImages_83A1698
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4540:: @ 83A4540
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A16B8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4564:: @ 83A4564
	.2byte 0xFFFF, 0x1110, 0x1102, 0x200, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3470
	.4byte gSpriteImages_83A0188
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4588:: @ 83A4588
	.2byte 0xFFFF, 0x1110, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0228
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A45AC:: @ 83A45AC
	.2byte 0xFFFF, 0x1110, 0x11FF, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (1 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3584
	.4byte gSpriteImages_83A02D0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A45D0:: @ 83A45D0
	.2byte 0xFFFF, 0x1110, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3638
	.4byte gSpriteImages_83A0378
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A45F4:: @ 83A45F4
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 10 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0140
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4618:: @ 83A4618
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A16C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A463C:: @ 83A463C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1708
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4660:: @ 83A4660
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1750
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4684:: @ 83A4684
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1798
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A46A8:: @ 83A46A8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A17E0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A46CC:: @ 83A46CC
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1828
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A46F0:: @ 83A46F0
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1870
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4714:: @ 83A4714
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A18B8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4738:: @ 83A4738
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1900
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A475C:: @ 83A475C
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1948
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4780:: @ 83A4780
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1990
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A47A4:: @ 83A47A4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A19D8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A47C8:: @ 83A47C8
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1A20
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A47EC:: @ 83A47EC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1A68
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4810:: @ 83A4810
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1AB0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4834:: @ 83A4834
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1AF8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4858:: @ 83A4858
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3668
	.4byte gSpriteImages_83A1B40
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A487C:: @ 83A487C
	.2byte 0xFFFF, 0x1110, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3668
	.4byte gSpriteImages_83A1BA0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A48A0:: @ 83A48A0
	.2byte 0xFFFF, 0x1100, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A363C
	.4byte gSpriteImages_83A0330
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A48C4:: @ 83A48C4
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3640
	.4byte gSpriteImages_83A03C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A48E8:: @ 83A48E8
	.2byte 0xFFFF, 0x1100, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A363C
	.4byte gSpriteImages_83A0378
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A490C:: @ 83A490C
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3640
	.4byte gSpriteImages_83A03F0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4930:: @ 83A4930
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 32, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_32x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C00
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4954:: @ 83A4954
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C08
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4978:: @ 83A4978
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1C10
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A499C:: @ 83A499C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1D38
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A49C0:: @ 83A49C0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C58
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A49E4:: @ 83A49E4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C60
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4A08:: @ 83A4A08
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C68
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4A2C:: @ 83A4A2C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C70
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4A50:: @ 83A4A50
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C78
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4A74:: @ 83A4A74
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C80
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4A98:: @ 83A4A98
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C88
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4ABC:: @ 83A4ABC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C90
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4AE0:: @ 83A4AE0
	.2byte 0xFFFF, 0x1113, 0x11FF, 0x200, 32, 32
	.byte 10 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C98
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4B04:: @ 83A4B04
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1CA0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4B28:: @ 83A4B28
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1D80
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4B4C:: @ 83A4B4C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1E10
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4B70:: @ 83A4B70
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1E58
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4B94:: @ 83A4B94
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1EA0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4BB8:: @ 83A4BB8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1EE8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4BDC:: @ 83A4BDC
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1F30
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4C00:: @ 83A4C00
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1F78
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4C24:: @ 83A4C24
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1FC0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4C48:: @ 83A4C48
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2008
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4C6C:: @ 83A4C6C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2050
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4C90:: @ 83A4C90
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2098
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4CB4:: @ 83A4CB4
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A20E0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4CD8:: @ 83A4CD8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2128
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4CFC:: @ 83A4CFC
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2170
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4D20:: @ 83A4D20
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A21B8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4D44:: @ 83A4D44
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2200
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4D68:: @ 83A4D68
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2248
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4D8C:: @ 83A4D8C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2290
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4DB0:: @ 83A4DB0
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A22D8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4DD4:: @ 83A4DD4
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2320
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4DF8:: @ 83A4DF8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2368
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4E1C:: @ 83A4E1C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A23B0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4E40:: @ 83A4E40
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A23F8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4E64:: @ 83A4E64
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2440
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4E88:: @ 83A4E88
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2488
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4EAC:: @ 83A4EAC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A24D0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4ED0:: @ 83A4ED0
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2518
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4EF4:: @ 83A4EF4
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2560
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4F18:: @ 83A4F18
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A25A8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4F3C:: @ 83A4F3C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A33BC
	.4byte gSpriteImages_83A25F0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4F60:: @ 83A4F60
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2638
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4F84:: @ 83A4F84
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2680
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4FA8:: @ 83A4FA8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2878
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4FCC:: @ 83A4FCC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A28C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4FF0:: @ 83A4FF0
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A26C8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A5014:: @ 83A5014
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1DC8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A5038:: @ 83A5038
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2710
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A505C:: @ 83A505C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2758
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A5080:: @ 83A5080
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A27A0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A50A4:: @ 83A50A4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A27E8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A50C8:: @ 83A50C8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2830
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A50EC:: @ 83A50EC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gObjectEventBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2908
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A5110:: @ 83A5110
	.2byte 0xFFFF, 0x1114, 0x11FF, 0x800, 64, 64
	.byte 10 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_64x64
	.4byte gSubspriteTables_83A38D0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1CA8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A5134:: @ 83A5134
	.2byte 0xFFFF, 0x1115, 0x11FF, 0x1000, 128, 64
	.byte 10 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gObjectEventBaseOam_128x64
	.4byte gSubspriteTables_83A3A50
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1CF0
	.4byte gDummySpriteAffineAnimTable

gObjectEventSpritePalettes:: @ 83A5158
	obj_pal gUnknown_836D828, 0x1103
	obj_pal gUnknown_836D848, 0x1104
	obj_pal gUnknown_836D868, 0x1105
	obj_pal gUnknown_836D888, 0x1106
	obj_pal gUnknown_836D8A8, 0x1107
	obj_pal gUnknown_836D8C8, 0x1108
	obj_pal gUnknown_836D8E8, 0x1109
	obj_pal gUnknown_836D908, 0x110a
	obj_pal gUnknown_835B968, 0x1100
	obj_pal gUnknown_835E968, 0x1101
	obj_pal gUnknown_835E988, 0x1102
	obj_pal gUnknown_8398008, 0x110b
	obj_pal gUnknown_8398028, 0x110c
	obj_pal gUnknown_835B968, 0x1110
	obj_pal gUnknown_835E968, 0x1111
	obj_pal gUnknown_8394EA8, 0x1113
	obj_pal gUnknown_8395AE8, 0x1115
	obj_pal gUnknown_83952C8, 0x1114
	null_obj_pal

gPlayerReflectionPaletteTags:: @ 83A51F0
	.2byte 0x1101
	.2byte 0x1101
	.2byte 0x1101
	.2byte 0x1101
	.2byte 0x1111
	.2byte 0x1111
	.2byte 0x1111
	.2byte 0x1111

gUnknownPaletteTags_83A5200:: @ 83A5200
	.2byte 0x1116
	.2byte 0x1116
	.2byte 0x1116
	.2byte 0x1116

gUnknown_83A5208:: @ 83A5208
	.2byte 0x1100
	.2byte 0x0
	.4byte gPlayerReflectionPaletteTags
	.2byte 0x1110
	.2byte 0x0
	.4byte gPlayerReflectionPaletteTags
	.2byte 0x1116
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5200
	.2byte 0x11FF
	.2byte 0x0
	.4byte NULL

gUnknownPaletteTags_83A5228:: @ 83A5228
	.2byte 0x110c
	.2byte 0x110c
	.2byte 0x110c
	.2byte 0x110c

gUnknownPaletteTags_83A5230:: @ 83A5230
	.2byte 0x110d
	.2byte 0x110d
	.2byte 0x110d
	.2byte 0x110d

gUnknownPaletteTags_83A5238::
	.2byte 0x110e
	.2byte 0x110e
	.2byte 0x110e
	.2byte 0x110e

gUnknownPaletteTags_83A5240::
	.2byte 0x1112
	.2byte 0x1112
	.2byte 0x1112
	.2byte 0x1112

gUnknownPaletteTags_83A5248::
	.2byte 0x1113
	.2byte 0x1113
	.2byte 0x1113
	.2byte 0x1113

gUnknownPaletteTags_83A5250::
	.2byte 0x1114
	.2byte 0x1114
	.2byte 0x1114
	.2byte 0x1114

gUnknownPaletteTags_83A5258::
	.2byte 0x111b
	.2byte 0x111b
	.2byte 0x111b
	.2byte 0x111b

gUnknownPaletteTags_83A5260::
	.2byte 0x1118
	.2byte 0x1118
	.2byte 0x1118
	.2byte 0x1118

gUnknownPaletteTags_83A5268::
	.2byte 0x111a
	.2byte 0x111a
	.2byte 0x111a
	.2byte 0x111a

gUnknownPaletteTags_83A5270::
	.2byte 0x1109
	.2byte 0x1109
	.2byte 0x1109
	.2byte 0x1109

gUnknown_83A5278:: @ 83A5278
	.2byte 0x1100
	.2byte 0x0
	.4byte gPlayerReflectionPaletteTags
	.2byte 0x1110
	.2byte 0x0
	.4byte gPlayerReflectionPaletteTags
	.2byte 0x110b
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5228
	.2byte 0x110d
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5230
	.2byte 0x110e
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5238
	.2byte 0x1112
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5240
	.2byte 0x1113
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5248
	.2byte 0x1114
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5250
	.2byte 0x1117
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5260
	.2byte 0x1119
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5268
	.2byte 0x1105
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5270
	.2byte 0x111b
	.2byte 0x0
	.4byte gUnknownPaletteTags_83A5258
	.2byte 0x11ff
	.2byte 0x0
	.4byte NULL

gUnknownPaletteTags_83A52E0::
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110a

gUnknownPaletteTags_83A52F4::
	.2byte 0x1100
	.2byte 0x1110
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110a

gUnknownPaletteTags_83A5308::
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110a

gUnknownPaletteTags_83A531C::
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110a

gUnknown_83A5330:: @ 83A5330
	.4byte gUnknownPaletteTags_83A52E0
	.4byte gUnknownPaletteTags_83A52F4
	.4byte gUnknownPaletteTags_83A5308
	.4byte gUnknownPaletteTags_83A531C

gUnknown_83A5340::
	obj_pal gUnknown_8398FA8, 0x1004

gUnknown_83A5348:: @ 83A5348
	obj_pal gUnknown_8398FC8, 0x1005

gUnknown_83A5350:: @ 83A5350
	obj_image_anim_frame 0, 1, 0
	obj_image_anim_end

gUnknown_83A5358:: @ 83A5358
	.4byte gUnknown_83A5350

gUnknown_83A535C:: @ 83A535C
	obj_frame_tiles gUnknown_8398048, 0x20

gUnknown_83A5364:: @ 83A5364
	obj_frame_tiles gUnknown_8398068, 0x40

gUnknown_83A536C:: @ 83A536C
	obj_frame_tiles gUnknown_83980A8, 0x80

gUnknown_83A5374:: @ 83A5374
	obj_frame_tiles gUnknown_8398128, 0x400

gUnknown_83A537C:: @ 83A537C
	spr_template 65535, 65535, gObjectEventBaseOam_128x64, gUnknown_83A5358, gUnknown_83A535C, gDummySpriteAffineAnimTable, oamc_shadow

gUnknown_83A5394:: @ 83A5394
	spr_template 65535, 65535, gObjectEventBaseOam_Unknown1, gUnknown_83A5358, gUnknown_83A5364, gDummySpriteAffineAnimTable, oamc_shadow

gUnknown_83A53AC:: @ 83A53AC
	spr_template 65535, 65535, gObjectEventBaseOam_Unknown2, gUnknown_83A5358, gUnknown_83A536C, gDummySpriteAffineAnimTable, oamc_shadow

gUnknown_83A53C4:: @ 83A53C4
	spr_template 65535, 65535, gObjectEventBaseOam_Unknown3, gUnknown_83A5358, gUnknown_83A5374, gDummySpriteAffineAnimTable, oamc_shadow

gUnknown_83A53DC:: @ 83A53DC
	overworld_frame gUnknown_839A008, 2, 2, 0
	overworld_frame gUnknown_839A008, 2, 2, 1
	overworld_frame gUnknown_839A008, 2, 2, 2
	overworld_frame gUnknown_839A008, 2, 2, 3
	overworld_frame gUnknown_839A008, 2, 2, 4

gUnknown_83A5404:: @ 83A5404
	obj_image_anim_frame 1, 10
	obj_image_anim_frame 2, 10
	obj_image_anim_frame 3, 10
	obj_image_anim_frame 4, 10
	obj_image_anim_frame 0, 10
	obj_image_anim_end

gUnknown_83A541C:: @ 83A541C
	.4byte gUnknown_83A5404

gUnknown_83A5420:: @ 83A5420
	spr_template 0xFFFF, 0x1005, gObjectEventBaseOam_16x16, gUnknown_83A541C, gUnknown_83A53DC, gDummySpriteAffineAnimTable, unc_grass_normal

gUnknown_83A5438:: @ 83A5438
	overworld_frame gUnknown_83986A8, 2, 2, 0
	overworld_frame gUnknown_83986A8, 2, 2, 1
	overworld_frame gUnknown_83986A8, 2, 2, 2
	overworld_frame gUnknown_83986A8, 2, 2, 3
	overworld_frame gUnknown_83986A8, 2, 2, 4

gUnknown_83A5460:: @ 83A5460
	obj_image_anim_frame 0, 12
	obj_image_anim_frame 1, 9
	obj_image_anim_frame 2, 9
	obj_image_anim_frame 3, 9
	obj_image_anim_frame 0, 9
	obj_image_anim_frame 1, 9
	obj_image_anim_frame 2, 11
	obj_image_anim_frame 4, 11
	obj_image_anim_end

gUnknown_83A5484:: @ 83A5484
	.4byte gUnknown_83A5460

gUnknown_83A5488:: @ 83A5488
	spr_template 0xFFFF, 0x1005, gObjectEventBaseOam_16x16, gUnknown_83A5484, gUnknown_83A5438, gDummySpriteAffineAnimTable, sub_80DCD1C

gUnknown_83A54A0:: @ 83A54A0
	overworld_frame gUnknown_8398928, 2, 2, 0
	overworld_frame gUnknown_8398928, 2, 2, 1
	overworld_frame gUnknown_8398928, 2, 2, 2
	overworld_frame gUnknown_8398928, 2, 2, 3
	overworld_frame gUnknown_8398928, 2, 2, 4

gUnknown_83A54C8:: @ 83A54C8
	obj_image_anim_frame 0, 12
	obj_image_anim_frame 1, 12
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 12
	obj_image_anim_frame 4, 12
	obj_image_anim_end

gUnknown_83A54E0:: @ 83A54E0
	.4byte gUnknown_83A54C8

gUnknown_83A54E4:: @ 83A54E4
	spr_template 0xFFFF, 0x1005, gObjectEventBaseOam_16x16, gUnknown_83A54E0, gUnknown_83A54A0, gDummySpriteAffineAnimTable, sub_80DC2FC

gUnknown_83A54FC:: @ 83A54FC
	overworld_frame gUnknown_8396B08, 2, 8, 0
	overworld_frame gUnknown_8396B08, 2, 8, 1
	overworld_frame gUnknown_8396B08, 2, 8, 2
	overworld_frame gUnknown_8396B08, 2, 8, 3
	overworld_frame gUnknown_8396B08, 2, 8, 4
	overworld_frame gUnknown_8396B08, 2, 8, 5

gUnknown_83A552C:: @ 83A552C
	obj_image_anim_frame 0, 48
	obj_image_anim_frame 1, 48
	obj_image_anim_jump 0

gUnknown_83A5538:: @ 83A5538
	obj_image_anim_frame 2, 48
	obj_image_anim_frame 3, 48
	obj_image_anim_jump 0

gUnknown_83A5544:: @ 83A5544
	obj_image_anim_frame 4, 48
	obj_image_anim_frame 5, 48
	obj_image_anim_jump 0

gUnknown_83A5550:: @ 83A5550
	obj_image_anim_frame 4, 112
	obj_image_anim_frame 5, 112
	obj_image_anim_jump 0

gUnknown_83A555C:: @ 83A555C
	.4byte gUnknown_83A552C
	.4byte gUnknown_83A5538
	.4byte gUnknown_83A5544
	.4byte gUnknown_83A5550

gUnknown_83A556C:: @ 83A556C
	spr_template 0xFFFF, 0xFFFF, gObjectEventBaseOam_32x32, gUnknown_83A555C, gUnknown_83A54FC, gDummySpriteAffineAnimTable, sub_80DC4F8

gUnknown_83A5584:: @ 83A5584
	overworld_frame gUnknown_8398BA8, 2, 2, 0
	overworld_frame gUnknown_8398BA8, 2, 2, 1
	overworld_frame gUnknown_8398BA8, 2, 2, 2
	overworld_frame gUnknown_8398BA8, 2, 2, 3
	overworld_frame gUnknown_8398BA8, 2, 2, 4
	overworld_frame gUnknown_8398BA8, 2, 2, 5
	overworld_frame gUnknown_8398BA8, 2, 2, 6
	overworld_frame gUnknown_8398BA8, 2, 2, 7

gUnknown_83A55C4:: @ 83A55C4
	obj_image_anim_frame 2, 32
	obj_image_anim_frame 3, 32
	obj_image_anim_jump 0

gUnknown_83A55D0:: @ 83A55D0
	obj_image_anim_frame 0, 32
	obj_image_anim_frame 1, 32
	obj_image_anim_jump 0

gUnknown_83A55DC:: @ 83A55DC
	obj_image_anim_frame 4, 32
	obj_image_anim_frame 5, 32
	obj_image_anim_jump 0

gUnknown_83A55E8:: @ 83A55E8
	obj_image_anim_frame 6, 32
	obj_image_anim_frame 7, 32
	obj_image_anim_jump 0

gUnknown_83A55F4:: @ 83A55F4
	.4byte gUnknown_83A55C4
	.4byte gUnknown_83A55D0
	.4byte gUnknown_83A55DC
	.4byte gUnknown_83A55E8

gUnknown_83A5604:: @ 83A5604
	spr_template 0xFFFF, 0xFFFF, gObjectEventBaseOam_16x16, gUnknown_83A55F4, gUnknown_83A5584, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83A561C:: @ 83A561C
	overworld_frame gUnknown_8399008, 2, 1, 0
	overworld_frame gUnknown_8399008, 2, 1, 1
	overworld_frame gUnknown_8399008, 2, 1, 2

gUnknown_83A5634:: @ 83A5634
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_end

gUnknown_83A5644:: @ 83A5644
	.4byte gUnknown_83A5634

gUnknown_83A5648:: @ 83A5648
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_Unknown1, gUnknown_83A5644, gUnknown_83A561C, gDummySpriteAffineAnimTable, sub_80DCCE0

gUnknown_83A5660:: @ 83A5660
	overworld_frame gUnknown_8399188, 2, 1, 0
	overworld_frame gUnknown_8399188, 2, 1, 1
	overworld_frame gUnknown_8399188, 2, 1, 2
	overworld_frame gUnknown_8399188, 2, 1, 3

gUnknown_83A5680:: @ 83A5680
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_end

gUnknown_83A5694:: @ 83A5694
	.4byte gUnknown_83A5680

gUnknown_83A5698:: @ 83A5698
	spr_template 0xFFFF, 0x1005, gObjectEventBaseOam_Unknown1, gUnknown_83A5694, gUnknown_83A5660, gDummySpriteAffineAnimTable, sub_80DCCE0

gUnknown_83A56B0:: @ 83A56B0
	overworld_frame gUnknown_839A388, 2, 2, 0
	overworld_frame gUnknown_839A388, 2, 2, 1

gUnknown_83A56C0:: @ 83A56C0
	obj_image_anim_frame 0, 129
	obj_image_anim_end

gUnknown_83A56C8:: @ 83A56C8
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gUnknown_83A56D0:: @ 83A56D0
	obj_image_anim_frame 1, 1
	obj_image_anim_end

gUnknown_83A56D8:: @ 83A56D8
	obj_image_anim_frame 1, 65
	obj_image_anim_end

gUnknown_83A56E0:: @ 83A56E0
	.4byte gUnknown_83A56C0
	.4byte gUnknown_83A56C0
	.4byte gUnknown_83A56C8
	.4byte gUnknown_83A56D0
	.4byte gUnknown_83A56D8

gUnknown_83A56F4:: @ 83A56F4
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_16x16, gUnknown_83A56E0, gUnknown_83A56B0, gDummySpriteAffineAnimTable, sub_80DBAFC

gUnknown_83A570C:: @ 83A570C
	overworld_frame gUnknown_839A488, 2, 2, 0
	overworld_frame gUnknown_839A488, 2, 2, 1

gUnknown_83A571C:: @ 83A571C
	obj_image_anim_frame 0, 129
	obj_image_anim_end

gUnknown_83A5724:: @ 83A5724
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gUnknown_83A572C:: @ 83A572C
	obj_image_anim_frame 1, 1
	obj_image_anim_end

gUnknown_83A5734:: @ 83A5734
	obj_image_anim_frame 1, 65
	obj_image_anim_end

gUnknown_83A573C:: @ 83A573C
	.4byte gUnknown_83A571C
	.4byte gUnknown_83A571C
	.4byte gUnknown_83A5724
	.4byte gUnknown_83A572C
	.4byte gUnknown_83A5734

gUnknown_83A5750:: @ 83A5750
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_16x16, gUnknown_83A573C, gUnknown_83A570C, gDummySpriteAffineAnimTable, sub_80DBAFC

gUnknown_83A5768:: @ 83A5768
	overworld_frame gUnknown_839A588, 2, 2, 0
	overworld_frame gUnknown_839A588, 2, 2, 1
	overworld_frame gUnknown_839A588, 2, 2, 2
	overworld_frame gUnknown_839A588, 2, 2, 3

gUnknown_83A5788:: @ 83A5788
	obj_image_anim_frame 2, 1
	obj_image_anim_end

gUnknown_83A5790:: @ 83A5790
	obj_image_anim_frame 2, 1
	obj_image_anim_end

gUnknown_83A5798:: @ 83A5798
	obj_image_anim_frame 1, 1
	obj_image_anim_end

gUnknown_83A57A0:: @ 83A57A0
	obj_image_anim_frame 1, 1
	obj_image_anim_end

gUnknown_83A57A8:: @ 83A57A8
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gUnknown_83A57B0:: @ 83A57B0
	obj_image_anim_frame 0, 65
	obj_image_anim_end

gUnknown_83A57B8:: @ 83A57B8
	obj_image_anim_frame 3, 65
	obj_image_anim_end

gUnknown_83A57C0:: @ 83A57C0
	obj_image_anim_frame 3, 1
	obj_image_anim_end

gUnknown_83A57C8:: @ 83A57C8
	.4byte gUnknown_83A5788
	.4byte gUnknown_83A5788
	.4byte gUnknown_83A5790
	.4byte gUnknown_83A5798
	.4byte gUnknown_83A57A0
	.4byte gUnknown_83A57A8
	.4byte gUnknown_83A57B0
	.4byte gUnknown_83A57B8
	.4byte gUnknown_83A57C0

gUnknown_83A57EC:: @ 83A57EC
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_16x16, gUnknown_83A57C8, gUnknown_83A5768, gDummySpriteAffineAnimTable, sub_80DBAFC

gUnknown_83A5804:: @ 83A5804
	overworld_frame gUnknown_839AA48, 2, 2, 0
	overworld_frame gUnknown_839AA48, 2, 2, 1
	overworld_frame gUnknown_839AA48, 2, 2, 2
	overworld_frame gUnknown_839AA48, 2, 2, 3

gUnknown_83A5824:: @ 83A5824
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_end

gUnknown_83A5838:: @ 83A5838
	.4byte gUnknown_83A5824

gUnknown_83A583C:: @ 83A583C
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_16x16, gUnknown_83A5838, gUnknown_83A5804, gDummySpriteAffineAnimTable, sub_80DCCE0

gUnknown_83A5854:: @ 83A5854
	overworld_frame gUnknown_839AC48, 2, 1, 0
	overworld_frame gUnknown_839AC48, 2, 1, 1

gUnknown_83A5864:: @ 83A5864
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_end

gUnknown_83A5870:: @ 83A5870
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_jump 0

gUnknown_83A5894:: @ 83A5894
	.4byte gUnknown_83A5864
	.4byte gUnknown_83A5870

gUnknown_83A589C:: @ 83A589C
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_Unknown1, gUnknown_83A5894, gUnknown_83A5854, gDummySpriteAffineAnimTable, sub_80DBC2C

gUnknown_83A58B4:: @ 83A58B4
	overworld_frame gUnknown_839ACC8, 2, 1, 0
	overworld_frame gUnknown_839ACC8, 2, 1, 1
	overworld_frame gUnknown_839ACC8, 2, 1, 2

gUnknown_83A58CC:: @ 83A58CC
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_end

gUnknown_83A58DC:: @ 83A58DC
	.4byte gUnknown_83A58CC

gUnknown_83A58E0:: @ 83A58E0
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_Unknown1, gUnknown_83A58DC, gUnknown_83A58B4, gDummySpriteAffineAnimTable, sub_80DCCE0

gUnknown_83A58F8:: @ 83A58F8
	overworld_frame gUnknown_8399E08, 2, 2, 0
	overworld_frame gUnknown_8399E08, 2, 2, 1
	overworld_frame gUnknown_8399E08, 2, 2, 2
	overworld_frame gUnknown_8399E08, 2, 2, 3

gUnknown_83A5918:: @ 83A5918
	obj_image_anim_frame 1, 3
	obj_image_anim_frame 2, 3
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

gUnknown_83A5938:: @ 83A5938
	.4byte gUnknown_83A5918

gUnknown_83A593C:: @ 83A593C
	spr_template 0xFFFF, 0x1005, gObjectEventBaseOam_16x16, gUnknown_83A5938, gUnknown_83A58F8, gDummySpriteAffineAnimTable, unc_grass_tall

gUnknown_83A5954:: @ 83A5954
	overworld_frame gUnknown_8399488, 2, 2, 0
	overworld_frame gUnknown_8399488, 2, 2, 1
	overworld_frame gUnknown_8399488, 2, 2, 2
	overworld_frame gUnknown_8399488, 2, 2, 3
	overworld_frame gUnknown_8399488, 2, 2, 4
	overworld_frame gUnknown_8399488, 2, 2, 6

gUnknown_83A5984:: @ 83A5984
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 3, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 5, 8
	obj_image_anim_end

gUnknown_83A59A0:: @ 83A59A0
	.4byte gUnknown_83A5984

gUnknown_83A59A4:: @ 83A59A4
	spr_template 0xFFFF, 0x1005, gObjectEventBaseOam_16x16, gUnknown_83A59A0, gUnknown_83A5954, gDummySpriteAffineAnimTable, sub_80DCCE0

gUnknown_83A59BC:: @ 83A59BC
	overworld_frame gUnknown_8399788, 2, 2, 0
	overworld_frame gUnknown_8399788, 2, 2, 1
	overworld_frame gUnknown_8399788, 2, 2, 2
	overworld_frame gUnknown_8399788, 2, 2, 3
	overworld_frame gUnknown_8399788, 2, 2, 4
	overworld_frame gUnknown_8399788, 2, 2, 5
	overworld_frame gUnknown_8399788, 2, 2, 6
	overworld_frame gUnknown_8399788, 2, 2, 7
	overworld_frame gUnknown_8399788, 2, 2, 8

gUnknown_83A5A04:: @ 83A5A04
	obj_image_anim_frame 0, 10
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_frame 7, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_jump 7

gUnknown_83A5A2C:: @ 83A5A2C
	.4byte gUnknown_83A5A04

gUnknown_83A5A30:: @ 83A5A30
	spr_template 0xFFFF, 0x1005, gObjectEventBaseOam_16x16, gUnknown_83A5A2C, gUnknown_83A59BC, gDummySpriteAffineAnimTable, sub_80DCD1C

gUnknown_83A5A48:: @ 83A5A48
	overworld_frame gUnknown_8399C08, 2, 2, 0
	overworld_frame gUnknown_8399C08, 2, 2, 1
	overworld_frame gUnknown_8399C08, 2, 2, 2
	overworld_frame gUnknown_8399C08, 2, 2, 3

gUnknown_83A5A68:: @ 83A5A68
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_jump 0

gUnknown_83A5A84:: @ 83A5A84
	.4byte gUnknown_83A5A68

gUnknown_83A5A88:: @ 83A5A88
	spr_template 0xFFFF, 0x1005, gObjectEventBaseOam_16x16, gUnknown_83A5A84, gUnknown_83A5A48, gDummySpriteAffineAnimTable, sub_80DCD1C

gUnknown_83A5AA0:: @ 83A5AA0
	overworld_frame gUnknown_839A788, 2, 2, 0
	overworld_frame gUnknown_839A788, 2, 2, 1
	overworld_frame gUnknown_839A788, 2, 2, 2
	overworld_frame gUnknown_839A788, 2, 2, 3

gUnknown_83A5AC0:: @ 83A5AC0
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_jump 0

gUnknown_83A5AD4:: @ 83A5AD4
	.4byte gUnknown_83A5AC0

gUnknown_83A5AD8:: @ 83A5AD8
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_16x16, gUnknown_83A5AD4, gUnknown_83A5AA0, gDummySpriteAffineAnimTable, sub_80DCD1C

gUnknown_83A5AF0:: @ 83A5AF0
	overworld_frame gUnknown_839A988, 2, 1, 0
	overworld_frame gUnknown_839A988, 2, 1, 1
	overworld_frame gUnknown_839A988, 2, 1, 2

gUnknown_83A5B08:: @ 83A5B08
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_end

gUnknown_83A5B18:: @ 83A5B18
	.4byte gUnknown_83A5B08

gUnknown_83A5B1C:: @ 83A5B1C
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_Unknown1, gUnknown_83A5B18, gUnknown_83A5AF0, gDummySpriteAffineAnimTable, sub_80DC86C

gUnknown_83A5B34:: @ 83A5B34
	overworld_frame gUnknown_839AD88, 2, 2, 0
	overworld_frame gUnknown_839AD88, 2, 2, 1
	overworld_frame gUnknown_839AD88, 2, 2, 2
	overworld_frame gUnknown_839AD88, 2, 2, 3

gUnknown_83A5B54:: @ 83A5B54
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_jump 0

gUnknown_83A5B70:: @ 83A5B70
	.4byte gUnknown_83A5B54

gUnknown_83A5B74:: @ 83A5B74
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_16x16, gUnknown_83A5B70, gUnknown_83A5B34, gDummySpriteAffineAnimTable, sub_80DCD1C

gUnknown_83A5B8C:: @ 83A5B8C
	obj_rot_scal_anim_frame -256, 256, 128, 0
	obj_rot_scal_anim_frame 1, 0, 0, 4
	obj_rot_scal_anim_frame 0, 0, 0, 8
	obj_rot_scal_anim_frame -1, 0, 0, 4
	obj_rot_scal_anim_frame 0, 0, 0, 8
	obj_rot_scal_anim_frame -1, 0, 0, 4
	obj_rot_scal_anim_frame 0, 0, 0, 8
	obj_rot_scal_anim_frame 1, 0, 0, 4
	obj_rot_scal_anim_frame 0, 0, 0, 8
	obj_rot_scal_anim_jump 1

gUnknown_83A5BDC:: @ 83A5BDC
	obj_rot_scal_anim_frame 256, 256, 128, 0
	obj_rot_scal_anim_frame -1, 0, 0, 4
	obj_rot_scal_anim_frame 0, 0, 0, 8
	obj_rot_scal_anim_frame 1, 0, 0, 4
	obj_rot_scal_anim_frame 0, 0, 0, 8
	obj_rot_scal_anim_frame 1, 0, 0, 4
	obj_rot_scal_anim_frame 0, 0, 0, 8
	obj_rot_scal_anim_frame -1, 0, 0, 4
	obj_rot_scal_anim_frame 0, 0, 0, 8
	obj_rot_scal_anim_jump 1

gUnknown_83A5C2C:: @ 83A5C2C
	.4byte gUnknown_83A5B8C
	.4byte gUnknown_83A5BDC

gUnknown_83A5C34:: @ 83A5C34
	spr_template 0x0, 0xFFFF, gDummyOamData, gDummySpriteAnimTable, NULL, gUnknown_83A5C2C, SpriteCallbackDummy

gUnknown_83A5C4C:: @ 83A5C4C
	overworld_frame gUnknown_839B008, 2, 4, 0
	overworld_frame gUnknown_839B008, 2, 4, 1
	overworld_frame gUnknown_839B008, 2, 4, 2
	overworld_frame gUnknown_839B008, 2, 4, 3
	overworld_frame gUnknown_839B008, 2, 4, 4
	overworld_frame gUnknown_839B008, 2, 4, 5
	overworld_frame gUnknown_839B008, 2, 4, 6

gUnknown_83A5C84:: @ 83A5C84
	obj_image_anim_frame 0, 16
	obj_image_anim_end

gUnknown_83A5C8C:: @ 83A5C8C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_end

gUnknown_83A5CAC:: @ 83A5CAC
	.4byte gUnknown_83A5C84
	.4byte gUnknown_83A5C8C

gUnknown_83A5CB4:: @ 83A5CB4
	spr_template 0xFFFF, 0xFFFF, gObjectEventBaseOam_16x32, gUnknown_83A5CAC, gUnknown_83A5C4C, gDummySpriteAffineAnimTable, sub_80DCAC8

gUnknown_83A5CCC:: @ 83A5CCC
	overworld_frame gUnknown_839B708, 2, 4, 0
	overworld_frame gUnknown_839B708, 2, 4, 1
	overworld_frame gUnknown_839B708, 2, 4, 2
	overworld_frame gUnknown_839B708, 2, 4, 3
	overworld_frame gUnknown_839B708, 2, 4, 4
	overworld_frame gUnknown_839B708, 2, 4, 5
	overworld_frame gUnknown_839B708, 2, 4, 6

gUnknown_83A5D04:: @ 83A5D04
	obj_image_anim_frame 0, 16
	obj_image_anim_end

gUnknown_83A5D0C:: @ 83A5D0C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_end

gUnknown_83A5D2C:: @ 83A5D2C
	.4byte gUnknown_83A5D04
	.4byte gUnknown_83A5D0C

gUnknown_83A5D34:: @ 83A5D34
	spr_template 0xFFFF, 0xFFFF, gObjectEventBaseOam_16x32, gUnknown_83A5D2C, gUnknown_83A5CCC, gDummySpriteAffineAnimTable, sub_80DCAC8

gUnknown_83A5D4C:: @ 83A5D4C
	overworld_frame gUnknown_839BE08, 2, 4, 0
	overworld_frame gUnknown_839BE08, 2, 4, 1
	overworld_frame gUnknown_839BE08, 2, 4, 2
	overworld_frame gUnknown_839BE08, 2, 4, 3
	overworld_frame gUnknown_839BE08, 2, 4, 4
	overworld_frame gUnknown_839BE08, 2, 4, 5
	overworld_frame gUnknown_839BE08, 2, 4, 6

gUnknown_83A5D84:: @ 83A5D84
	spr_template 0xFFFF, 0xFFFF, gObjectEventBaseOam_16x32, gUnknown_83A5CAC, gUnknown_83A5D4C, gDummySpriteAffineAnimTable, sub_80DCAC8

gUnknown_83A5D9C:: @ 83A5D9C
	overworld_frame gUnknown_839D3C8, 8, 8, 0
	overworld_frame gUnknown_839D3C8, 8, 8, 1
	overworld_frame gUnknown_839D3C8, 8, 8, 2
	overworld_frame gUnknown_839D3C8, 8, 8, 3
	overworld_frame gUnknown_839D3C8, 8, 8, 4

gUnknown_83A5DC4:: @ 83A5DC4
	obj_image_anim_frame 0, 1
	obj_image_anim_end

gUnknown_83A5DCC:: @ 83A5DCC
	obj_image_anim_frame 1, 1
	obj_image_anim_end

gUnknown_83A5DD4:: @ 83A5DD4
	obj_image_anim_frame 2, 1
	obj_image_anim_end

gUnknown_83A5DDC:: @ 83A5DDC
	obj_image_anim_frame 3, 1
	obj_image_anim_end

gUnknown_83A5DE4:: @ 83A5DE4
	obj_image_anim_frame 4, 1
	obj_image_anim_end

gUnknown_83A5DEC:: @ 83A5DEC
	.4byte gUnknown_83A5DC4
	.4byte gUnknown_83A5DCC
	.4byte gUnknown_83A5DD4
	.4byte gUnknown_83A5DDC
	.4byte gUnknown_83A5DE4

gUnknown_83A5E00:: @ 83A5E00
	spr_template 0xFFFF, 0xFFFF, gObjectEventBaseOam_64x64, gUnknown_83A5DEC, gUnknown_83A5D9C, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83A5E18:: @ 83A5E18
	overworld_frame gUnknown_839A288, 2, 2, 0
	overworld_frame gUnknown_839A288, 2, 2, 1

gUnknown_83A5E28:: @ 83A5E28
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_end

gUnknown_83A5E34:: @ 83A5E34
	.4byte gUnknown_83A5E28

gUnknown_83A5E38:: @ 83A5E38
	spr_template 0xFFFF, 0x1005, gObjectEventBaseOam_16x16, gUnknown_83A5E34, gUnknown_83A5E18, gDummySpriteAffineAnimTable, sub_80DB8AC

gUnknown_83A5E50:: @ 83A5E50
	overworld_frame gUnknown_839C508, 2, 2, 0

gUnknown_83A5E58:: @ 83A5E58
	obj_image_anim_frame 0, 4
	obj_image_anim_end

gUnknown_83A5E60:: @ 83A5E60
	.4byte gUnknown_83A5E58

gUnknown_83A5E64:: @ 83A5E64
	spr_template 0xFFFF, 0x1005, gObjectEventBaseOam_16x16, gUnknown_83A5E60, gUnknown_83A5E50, gDummySpriteAffineAnimTable, sub_80DBFF4

gUnknown_83A5E7C:: @ 83A5E7C
	overworld_frame gUnknown_839C5A8, 2, 2, 0
	overworld_frame gUnknown_839C5A8, 2, 2, 1
	overworld_frame gUnknown_839C5A8, 2, 2, 2
	overworld_frame gUnknown_839C5A8, 2, 2, 3
	overworld_frame gUnknown_839C5A8, 2, 2, 4

gUnknown_83A5EA4:: @ 83A5EA4
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 2, 6
	obj_image_anim_frame 3, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_end

gUnknown_83A5EBC:: @ 83A5EBC
	.4byte gUnknown_83A5EA4

gUnknown_83A5EC0:: @ 83A5EC0
	spr_template 0xFFFF, 0x100D, gObjectEventBaseOam_16x16, gUnknown_83A5EBC, gUnknown_83A5E7C, gDummySpriteAffineAnimTable, sub_8085604

gUnknown_83A5ED8:: @ 83A5ED8
	obj_pal gUnknown_839C588, 0x100D

gUnknown_83A5EE0:: @ 83A5EE0
	overworld_frame gUnknown_839C828, 2, 2, 0
	overworld_frame gUnknown_839C828, 2, 2, 1
	overworld_frame gUnknown_839C828, 2, 2, 2
	overworld_frame gUnknown_839C828, 2, 2, 3
	overworld_frame gUnknown_839C828, 2, 2, 4

gUnknown_83A5F08:: @ 83A5F08
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 2, 6
	obj_image_anim_frame 3, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_end

gUnknown_83A5F20:: @ 83A5F20
	.4byte gUnknown_83A5F08

gUnknown_83A5F24:: @ 83A5F24
	spr_template 0xFFFF, 0x100D, gObjectEventBaseOam_16x16, gUnknown_83A5F20, gUnknown_83A5EE0, gDummySpriteAffineAnimTable, sub_80853B0

gUnknown_83A5F3C:: @ 83A5F3C
	overworld_frame gUnknown_839CAA8, 2, 4, 0
	overworld_frame gUnknown_839CAA8, 2, 4, 1
	overworld_frame gUnknown_839CAA8, 2, 4, 2
	overworld_frame gUnknown_839CAA8, 2, 4, 3
	overworld_frame gUnknown_839CAA8, 2, 4, 4
	overworld_frame gUnknown_839CAA8, 2, 4, 5
	overworld_frame gUnknown_839CAA8, 2, 4, 6
	overworld_frame gUnknown_839CAA8, 2, 4, 7

gUnknown_83A5F7C:: @ 83A5F7C
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_frame 5, 4
	obj_image_anim_frame 6, 4
	obj_image_anim_frame 7, 4
	obj_image_anim_end

gUnknown_83A5FA0:: @ 83A5FA0
	.4byte gUnknown_83A5F7C

gUnknown_83A5FA4:: @ 83A5FA4
	spr_template 0xFFFF, 0x1004, gObjectEventBaseOam_16x32, gUnknown_83A5FA0, gUnknown_83A5F3C, gDummySpriteAffineAnimTable, sub_80DC99C

gUnknown_83A5FBC:: @ 83A5FBC
	overworld_frame gUnknown_839D2A8, 2, 2, 0
	overworld_frame gUnknown_839D2A8, 2, 2, 1

gUnknown_83A5FCC:: @ 83A5FCC
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_end

gUnknown_83A5FDC:: @ 83A5FDC
	.4byte gUnknown_83A5FCC

gUnknown_83A5FE0:: @ 83A5FE0
	spr_template 0xFFFF, 0x100F, gObjectEventBaseOam_16x16, gUnknown_83A5FDC, gUnknown_83A5FBC, gDummySpriteAffineAnimTable, sub_80DCC90

gUnknown_83A5FF8::
	obj_pal gUnknown_839D3A8, 0x100F

gUnknown_83A6000:: @ 83A6000
	.2byte 0x0020
	.2byte 0x0040
	.2byte 0x0060
	.2byte 0x0080

gUnknown_83A6008:: @ 83A6008
	.2byte 0x0020
	.2byte 0x0040
	.2byte 0x0080
	.2byte 0x00C0

gUnknown_83A6010:: @ 83A6010
	.2byte 0x0020
	.2byte 0x0030
	.2byte 0x0040
	.2byte 0x0050

gUnknown_83A6018:: @ 83A6018
	.4byte sub_8060064
	.4byte sub_8060078
	.4byte sub_80600A4
	.4byte sub_80600E0
	.4byte sub_8060100
	.4byte sub_806014C
	.4byte sub_80601AC

gUnknown_83A6034:: @ 83A6034
	.4byte sub_8060064
	.4byte sub_8060078
	.4byte sub_80600A4
	.4byte sub_80600E0
	.4byte sub_8060100
	.4byte sub_806017C
	.4byte sub_80601AC

gUnknown_83A6050:: @ 83A6050
	.byte 1 @ DIR_SOUTH
	.byte 2 @ DIR_NORTH
	.byte 3 @ DIR_WEST
	.byte 4 @ DIR_EAST

gUnknown_83A6054:: @ 83A6054
	.4byte GetRegularRunningPastFacingDirection
	.4byte GetNorthSouthRunningPastFacingDirection
	.4byte GetEastWestRunningPastFacingDirection
	.4byte GetNorthEastRunningPastFacingDirection
	.4byte GetNorthWestRunningPastFacingDirection
	.4byte GetSouthEastRunningPastFacingDirection
	.4byte GetSouthWestRunningPastFacingDirection
	.4byte GetNonEastRunningPastFacingDirection
	.4byte GetNonWestRunningPastFacingDirection
	.4byte GetNonSouthRunningPastFacingDirection
	.4byte GetNonNorthRunningPastFacingDirection

gUnknown_83A6080:: @ 83A6080
	.4byte sub_80605D0
	.4byte sub_80605E4
	.4byte sub_8060610
	.4byte sub_8060654
	.4byte sub_8060684

gUnknown_83A6094:: @ 83A6094
	.4byte sub_8060710
	.4byte sub_8060724
	.4byte sub_8060750
	.4byte sub_806078C
	.4byte sub_80607AC
	.4byte sub_80607F8
	.4byte sub_8060828

gUnknown_83A60B0:: @ 83A60B0
	.byte 1 @ DIR_SOUTH
	.byte 2 @ DIR_NORTH
	.byte 0 @ DIR_NONE
	.byte 0 @ DIR_NONE

gUnknown_83A60B4:: @ 83A60B4
	.4byte sub_8060894
	.4byte sub_80608A8
	.4byte sub_80608D4
	.4byte sub_8060910
	.4byte sub_8060930
	.4byte sub_806097C
	.4byte sub_80609AC

gUnknown_83A60D0:: @ 83A60D0
	.byte 3 @ DIR_WEST
	.byte 4 @ DIR_EAST
	.byte 0 @ DIR_NONE
	.byte 0 @ DIR_NONE

gUnknown_83A60D4:: @ 83A60D4
	.4byte sub_8060A18
	.4byte sub_8060A44
	.4byte sub_8060A64

gUnknown_83A60E0:: @ 83A60E0
	.4byte sub_8060AB8
	.4byte sub_8060ACC
	.4byte sub_8060AF8
	.4byte sub_8060B3C
	.4byte sub_8060B6C

gUnknown_83A60F4:: @ 83A60F4
	.4byte sub_8060BF8
	.4byte sub_8060C0C
	.4byte sub_8060C38
	.4byte sub_8060C7C
	.4byte sub_8060CAC

gUnknown_83A6108:: @ 83A6108
	.4byte sub_8060D38
	.4byte sub_8060D4C
	.4byte sub_8060D78
	.4byte sub_8060DBC
	.4byte sub_8060DEC

gUnknown_83A611C:: @ 83A611C
	.byte 2 @ DIR_NORTH
	.byte 3 @ DIR_WEST
	.byte 0 @ DIR_NONE
	.byte 0 @ DIR_NONE

gUnknown_83A6120:: @ 83A6120
	.4byte sub_8060E78
	.4byte sub_8060E8C
	.4byte sub_8060EB8
	.4byte sub_8060EFC
	.4byte sub_8060F2C

gUnknown_83A6134:: @ 83A6134
	.byte 2 @ DIR_NORTH
	.byte 4 @ DIR_EAST
	.byte 0 @ DIR_NONE
	.byte 0 @ DIR_NONE

gUnknown_83A6138:: @ 83A6138
	.4byte sub_8060FB8
	.4byte sub_8060FCC
	.4byte sub_8060FF8
	.4byte sub_806103C
	.4byte sub_806106C

gUnknown_83A614C:: @ 83A614C
	.byte 1 @ DIR_SOUTH
	.byte 3 @ DIR_WEST
	.byte 0 @ DIR_NONE
	.byte 0 @ DIR_NONE

gUnknown_83A6150:: @ 83A6150
	.4byte sub_80610F8
	.4byte sub_806110C
	.4byte sub_8061138
	.4byte sub_806117C
	.4byte sub_80611AC

gUnknown_83A6164:: @ 83A6164
	.byte 1 @ DIR_SOUTH
	.byte 4 @ DIR_EAST
	.byte 0 @ DIR_NONE
	.byte 0 @ DIR_NONE

gUnknown_83A6168:: @ 83A6168
	.4byte sub_8061238
	.4byte sub_806124C
	.4byte sub_8061278
	.4byte sub_80612BC
	.4byte sub_80612EC

gUnknown_83A617C:: @ 83A617C
	.byte 2 @ DIR_NORTH
	.byte 1 @ DIR_SOUTH
	.byte 3 @ DIR_WEST
	.byte 1 @ DIR_SOUTH

gUnknown_83A6180:: @ 83A6180
	.4byte sub_8061378
	.4byte sub_806138C
	.4byte sub_80613B8
	.4byte sub_80613FC
	.4byte sub_806142C

gUnknown_83A6194:: @ 83A6194
	.byte 1 @ DIR_SOUTH
	.byte 2 @ DIR_NORTH
	.byte 4 @ DIR_EAST
	.byte 1 @ DIR_SOUTH

gUnknown_83A6198:: @ 83A6198
	.4byte sub_80614B8
	.4byte sub_80614CC
	.4byte sub_80614F8
	.4byte sub_806153C
	.4byte sub_806156C

gUnknown_83A61AC:: @ 83A61AC
	.byte 2 @ DIR_NORTH
	.byte 3 @ DIR_WEST
	.byte 4 @ DIR_EAST
	.byte 2 @ DIR_NORTH

gUnknown_83A61B0:: @ 83A61B0
	.4byte sub_80615F8
	.4byte sub_806160C
	.4byte sub_8061638
	.4byte sub_806167C
	.4byte sub_80616AC

gUnknown_83A61C4:: @ 83A61C4
	.byte 3 @ DIR_WEST
	.byte 4 @ DIR_EAST
	.byte 1 @ DIR_SOUTH
	.byte 1 @ DIR_SOUTH

gUnknown_83A61C8:: @ 83A61C8
	.4byte sub_8061738
	.4byte sub_8061764
	.4byte sub_8061788
	.4byte sub_80617B4

gUnknown_83A61D8:: @ 83A61D8
	.byte 0x01
	.byte 0x04
	.byte 0x03
	.byte 0x01
	.byte 0x02
	.byte 0x00
	.byte 0x00
	.byte 0x00

gUnknown_83A61E0:: @ 83A61E0
	.4byte sub_806183C
	.4byte sub_8061868
	.4byte sub_806188C
	.4byte sub_80618B8

gUnknown_83A61F0:: @ 83A61F0
	.byte 0x01
	.byte 0x03
	.byte 0x04
	.byte 0x02
	.byte 0x01
	.byte 0x00
	.byte 0x00
	.byte 0x00

gUnknown_83A61F8:: @ 83A61F8
	.4byte sub_8061940
	.4byte sub_8061954
	.4byte sub_806198C
	.4byte sub_8061A44

gUnknown_83A6208:: @ 83A6208
	.4byte sub_8061A6C
	.4byte sub_8061BA0
	.4byte sub_8061B34

gUnknown_83A6214:: @ 83A6214
	.byte 2
	.byte 4
	.byte 3
	.byte 1

gUnknown_83A6218:: @ 83A6218
	.4byte sub_8061A6C
	.4byte sub_8061C2C
	.4byte sub_8061B34

gUnknown_83A6224:: @ 83A6224
	.byte 4
	.byte 3
	.byte 1
	.byte 2

gUnknown_83A6228:: @ 83A6228
	.4byte sub_8061A6C
	.4byte sub_8061CB8
	.4byte sub_8061B34

gUnknown_83A6234:: @ 83A6234
	.byte 1
	.byte 2
	.byte 4
	.byte 3

gUnknown_83A6238:: @ 83A6238
	.4byte sub_8061A6C
	.4byte sub_8061D44
	.4byte sub_8061B34

gUnknown_83A6244:: @ 83A6244
	.byte 3
	.byte 1
	.byte 2
	.byte 4

gUnknown_83A6248:: @ 83A6248
	.4byte sub_8061A6C
	.4byte sub_8061DD0
	.4byte sub_8061B34

gUnknown_83A6254:: @ 83A6254
	.byte 2
	.byte 3
	.byte 4
	.byte 1

gUnknown_83A6258:: @ 83A6258
	.4byte sub_8061A6C
	.4byte sub_8061E5C
	.4byte sub_8061B34

gUnknown_83A6264:: @ 83A6264
	.byte 3
	.byte 4
	.byte 1
	.byte 2

gUnknown_83A6268:: @ 83A6268
	.4byte sub_8061A6C
	.4byte sub_8061EE8
	.4byte sub_8061B34

gUnknown_83A6274:: @ 83A6274
	.4byte sub_8061A6C
	.4byte sub_8061F74
	.4byte sub_8061B34

gUnknown_83A6280:: @ 83A6280
	.byte 4
	.byte 1
	.byte 2
	.byte 3

gUnknown_83A6284:: @ 83A6284
	.4byte sub_8061A6C
	.4byte sub_8062000
	.4byte sub_8061B34

gUnknown_83A6290:: @ 83A6290
	.byte 3
	.byte 2
	.byte 1
	.byte 4

gUnknown_83A6294:: @ 83A6294
	.4byte sub_8061A6C
	.4byte sub_806208C
	.4byte sub_8061B34

gUnknown_83A62A0:: @ 83A62A0
	.byte 2
	.byte 1
	.byte 4
	.byte 3

gUnknown_83A62A4:: @ 83A62A4
	.4byte sub_8061A6C
	.4byte sub_8062118
	.4byte sub_8061B34

gUnknown_83A62B0:: @ 83A62B0
	.byte 4
	.byte 3
	.byte 2
	.byte 1

gUnknown_83A62B4:: @ 83A62B4
	.4byte sub_8061A6C
	.4byte sub_80621A4
	.4byte sub_8061B34

gUnknown_83A62C0:: @ 83A62C0
	.byte 1
	.byte 4
	.byte 3
	.byte 2

gUnknown_83A62C4:: @ 83A62C4
	.4byte sub_8061A6C
	.4byte sub_8062230
	.4byte sub_8061B34

gUnknown_83A62D0:: @ 83A62D0
	.byte 4
	.byte 2
	.byte 1
	.byte 3

gUnknown_83A62D4:: @ 83A62D4
	.4byte sub_8061A6C
	.4byte sub_80622BC
	.4byte sub_8061B34

gUnknown_83A62E0:: @ 83A62E0
	.byte 2
	.byte 1
	.byte 3
	.byte 4

gUnknown_83A62E4:: @ 83A62E4
	.4byte sub_8061A6C
	.4byte sub_8062348
	.4byte sub_8061B34

gUnknown_83A62F0:: @ 83A62F0
	.byte 3
	.byte 4
	.byte 2
	.byte 1

gUnknown_83A62F4:: @ 83A62F4
	.4byte sub_8061A6C
	.4byte sub_80623D4
	.4byte sub_8061B34

gUnknown_83A6300:: @ 83A6300
	.byte 1
	.byte 3
	.byte 4
	.byte 2

gUnknown_83A6304:: @ 83A6304
	.4byte sub_8061A6C
	.4byte sub_8062460
	.4byte sub_8061B34

gUnknown_83A6310:: @ 83A6310
	.byte 2
	.byte 3
	.byte 1
	.byte 4

gUnknown_83A6314:: @ 83A6314
	.4byte sub_8061A6C
	.4byte sub_80624EC
	.4byte sub_8061B34

gUnknown_83A6320:: @ 83A6320
	.byte 1
	.byte 4
	.byte 2
	.byte 3

gUnknown_83A6324:: @ 83A6324
	.4byte sub_8061A6C
	.4byte sub_8062578
	.4byte sub_8061B34

gUnknown_83A6330:: @ 83A6330
	.byte 3
	.byte 1
	.byte 4
	.byte 2

gUnknown_83A6334:: @ 83A6334
	.4byte sub_8061A6C
	.4byte sub_8062604
	.4byte sub_8061B34

gUnknown_83A6340:: @ 83A6340
	.byte 4
	.byte 2
	.byte 3
	.byte 1

gUnknown_83A6344:: @ 83A6344
	.4byte sub_8061A6C
	.4byte sub_8062690
	.4byte sub_8061B34

gUnknown_83A6350:: @ 83A6350
	.byte 2
	.byte 4
	.byte 1
	.byte 3

gUnknown_83A6354:: @ 83A6354
	.4byte sub_8061A6C
	.4byte sub_806271C
	.4byte sub_8061B34

gUnknown_83A6360:: @ 83A6360
	.byte 1
	.byte 3
	.byte 2
	.byte 4

gUnknown_83A6364:: @ 83A6364
	.4byte sub_8061A6C
	.4byte sub_80627A8
	.4byte sub_8061B34

gUnknown_83A6370:: @ 83A6370
	.byte 3
	.byte 2
	.byte 4
	.byte 1

gUnknown_83A6374:: @ 83A6374
	.4byte sub_8061A6C
	.4byte sub_8062834
	.4byte sub_8061B34

gUnknown_83A6380:: @ 83A6380
	.byte 4
	.byte 1
	.byte 3
	.byte 2

gUnknown_83A6384:: @ 83A6384
	.4byte mss_npc_reset_oampriv3_1_unk2_unk3
	.4byte sub_80628E4
	.4byte sub_8062944

gUnknown_83A6390:: @ 83A6390
	.4byte sub_806296C
	.4byte sub_8062970
	.4byte sub_80629B8
	.4byte sub_8062A70
	.4byte sub_8062B28
	.4byte sub_8062BE0
	.4byte cph_IM_DIFFERENT
	.4byte sub_8062CE0
	.4byte oac_hopping
	.4byte sub_806296C
	.4byte sub_806296C

gUnknown_83A63BC:: @ 83A63BC
	.4byte mss_npc_reset_oampriv3_1_unk2_unk3
	.4byte mss_08062EA4
	.4byte sub_8062944

gUnknown_83A63C8:: @ 83A63C8
	.4byte sub_8063078

gUnknown_83A63CC:: @ 83A63CC
	.4byte sub_80630E4
	.4byte sub_8063084

gUnknown_83A63D4:: @ 83A63D4
	.4byte sub_8063154
	.4byte sub_8063084

gUnknown_83A63DC:: @ 83A63DC
	.4byte sub_80631C4
	.4byte sub_8063084

gUnknown_83A63E4:: @ 83A63E4
	.4byte sub_8063234
	.4byte sub_8063268
	.4byte sub_8063288

gUnknown_83A63F0:: @ 83A63F0
	.4byte sub_8063364
	.4byte sub_8063384
	.4byte sub_80633A4

gUnknown_83A63FC:: @ 83A63FC
	.4byte sub_80633B4
	.4byte sub_80633F4

gUnknown_83A6404:: @ 83A6404
	.4byte sub_80633D4
	.4byte sub_80633F4

@ gFaceDirectionAnimNums ?
gUnknown_83A640C:: @ 83A640C
	.byte 0x00
	.byte 0x00
	.byte 0x01
	.byte 0x02
	.byte 0x03
	.byte 0x00
	.byte 0x00
	.byte 0x01
	.byte 0x01

gUnknown_83A6415:: @ 83A6415
	.byte 0x4 @ DIR_NONE
	.byte 0x4 @ DIR_SOUTH
	.byte 0x5 @ DIR_NORTH
	.byte 0x6 @ DIR_WEST
	.byte 0x7 @ DIR_EAST
	.byte 0x4 @ DIR_SOUTHWEST
	.byte 0x4 @ DIR_SOUTHEAST
	.byte 0x5 @ DIR_NORTHWEST
	.byte 0x5 @ DIR_NORTHEAST

gUnknown_83A641E:: @ 83A641E
	.byte 0x8 @ DIR_NONE
	.byte 0x8 @ DIR_SOUTH
	.byte 0x9 @ DIR_NORTH
	.byte 0xA @ DIR_WEST
	.byte 0xB @ DIR_EAST
	.byte 0x8 @ DIR_SOUTHWEST
	.byte 0x8 @ DIR_SOUTHEAST
	.byte 0x9 @ DIR_NORTHWEST
	.byte 0x9 @ DIR_NORTHEAST

gUnknown_83A6427:: @ 83A6427
	.byte 0xC @ DIR_NONE
	.byte 0xC @ DIR_SOUTH
	.byte 0xD @ DIR_NORTH
	.byte 0xE @ DIR_WEST
	.byte 0xF @ DIR_EAST
	.byte 0xC @ DIR_SOUTHWEST
	.byte 0xC @ DIR_SOUTHEAST
	.byte 0xD @ DIR_NORTHWEST
	.byte 0xD @ DIR_NORTHEAST

gUnknown_83A6430:: @ 83A6430
	.byte 0x10 @ DIR_NONE
	.byte 0x10 @ DIR_SOUTH
	.byte 0x11 @ DIR_NORTH
	.byte 0x12 @ DIR_WEST
	.byte 0x13 @ DIR_EAST
	.byte 0x10 @ DIR_SOUTHWEST
	.byte 0x10 @ DIR_SOUTHEAST
	.byte 0x11 @ DIR_NORTHWEST
	.byte 0x11 @ DIR_NORTHEAST

gUnknown_83A6439:: @ 83A6439
	.byte 0x14 @ DIR_NONE
	.byte 0x14 @ DIR_SOUTH
	.byte 0x15 @ DIR_NORTH
	.byte 0x16 @ DIR_WEST
	.byte 0x17 @ DIR_EAST
	.byte 0x14 @ DIR_SOUTHWEST
	.byte 0x14 @ DIR_SOUTHEAST
	.byte 0x15 @ DIR_NORTHWEST
	.byte 0x15 @ DIR_NORTHEAST

gUnknown_83A6442:: @ 83A6442
	.byte 0x14 @ DIR_NONE
	.byte 0x14 @ DIR_SOUTH
	.byte 0x15 @ DIR_NORTH
	.byte 0x16 @ DIR_WEST
	.byte 0x17 @ DIR_EAST
	.byte 0x14 @ DIR_SOUTHWEST
	.byte 0x14 @ DIR_SOUTHEAST
	.byte 0x15 @ DIR_NORTHWEST
	.byte 0x15 @ DIR_NORTHEAST

gUnknown_83A644B:: @ 83A644B
	.byte 0x18 @ DIR_NONE
	.byte 0x18 @ DIR_SOUTH
	.byte 0x19 @ DIR_NORTH
	.byte 0x1A @ DIR_WEST
	.byte 0x1B @ DIR_EAST
	.byte 0x18 @ DIR_SOUTHWEST
	.byte 0x18 @ DIR_SOUTHEAST
	.byte 0x19 @ DIR_NORTHWEST
	.byte 0x19 @ DIR_NORTHEAST

gUnknown_83A6454:: @ 83A6454
	.byte 0x1C @ DIR_NONE
	.byte 0x1C @ DIR_SOUTH
	.byte 0x1D @ DIR_NORTH
	.byte 0x1E @ DIR_WEST
	.byte 0x1F @ DIR_EAST
	.byte 0x1C @ DIR_SOUTHWEST
	.byte 0x1C @ DIR_SOUTHEAST
	.byte 0x1D @ DIR_NORTHWEST
	.byte 0x1D @ DIR_NORTHEAST

gUnknown_83A645D:: @ 83A645D
	.byte 0x18 @ DIR_NONE
	.byte 0x18 @ DIR_SOUTH
	.byte 0x19 @ DIR_NORTH
	.byte 0x1A @ DIR_WEST
	.byte 0x1B @ DIR_EAST
	.byte 0x18 @ DIR_SOUTHWEST
	.byte 0x19 @ DIR_SOUTHEAST
	.byte 0x1A @ DIR_NORTHWEST
	.byte 0x1B @ DIR_NORTHEAST

gUnknown_83A6466:: @ 83A6466
	.byte 0x20 @ DIR_NONE
	.byte 0x20 @ DIR_SOUTH
	.byte 0x21 @ DIR_NORTH
	.byte 0x22 @ DIR_WEST
	.byte 0x23 @ DIR_EAST
	.byte 0x20 @ DIR_SOUTHWEST
	.byte 0x20 @ DIR_SOUTHEAST
	.byte 0x21 @ DIR_NORTHWEST
	.byte 0x21 @ DIR_NORTHEAST

gUnknown_83A646F:: @ 83A646F
	.byte 0x24 @ DIR_NONE
	.byte 0x24 @ DIR_SOUTH
	.byte 0x25 @ DIR_NORTH
	.byte 0x26 @ DIR_WEST
	.byte 0x27 @ DIR_EAST
	.byte 0x24 @ DIR_SOUTHWEST
	.byte 0x24 @ DIR_SOUTHEAST
	.byte 0x25 @ DIR_NORTHWEST
	.byte 0x25 @ DIR_NORTHEAST

gUnknown_83A6478:: @ 83A6478
	.byte 0x0 @ DIR_NONE
	.byte 0x0 @ DIR_SOUTH
	.byte 0x1 @ DIR_NORTH
	.byte 0x2 @ DIR_WEST
	.byte 0x3 @ DIR_EAST
	.byte 0x0 @ DIR_SOUTHWEST
	.byte 0x0 @ DIR_SOUTHEAST
	.byte 0x1 @ DIR_NORTHWEST
	.byte 0x1 @ DIR_NORTHEAST

gUnknown_83A6481:: @ 83A6481
	.byte 0x4 @ DIR_NONE
	.byte 0x4 @ DIR_SOUTH
	.byte 0x5 @ DIR_NORTH
	.byte 0x6 @ DIR_WEST
	.byte 0x7 @ DIR_EAST
	.byte 0x4 @ DIR_SOUTHWEST
	.byte 0x4 @ DIR_SOUTHEAST
	.byte 0x5 @ DIR_NORTHWEST
	.byte 0x5 @ DIR_NORTHEAST

gUnknown_83A648A:: @ 83A648A
	.byte 0x8 @ DIR_NONE
	.byte 0x8 @ DIR_SOUTH
	.byte 0x9 @ DIR_NORTH
	.byte 0xA @ DIR_WEST
	.byte 0xB @ DIR_EAST
	.byte 0x8 @ DIR_SOUTHWEST
	.byte 0x8 @ DIR_SOUTHEAST
	.byte 0x9 @ DIR_NORTHWEST
	.byte 0x9 @ DIR_NORTHEAST

gUnknown_83A6493:: @ 83A6493
	.byte 0x14 @ DIR_NONE
	.byte 0x14 @ DIR_SOUTH
	.byte 0x15 @ DIR_NORTH
	.byte 0x16 @ DIR_WEST
	.byte 0x17 @ DIR_EAST
	.byte 0x14 @ DIR_SOUTHWEST
	.byte 0x14 @ DIR_SOUTHEAST
	.byte 0x15 @ DIR_NORTHWEST
	.byte 0x15 @ DIR_NORTHEAST

gUnknown_83A649C:: @ 83A649C
	.byte 0x08
	.byte 0x08
	.byte 0x07
	.byte 0x09
	.byte 0x0A
	.byte 0x08
	.byte 0x08
	.byte 0x07
	.byte 0x07
	.byte 0x00
	.byte 0x00
	.byte 0x00

gUnknown_83A64A8:: @ 83A64A8
	.4byte MetatileBehavior_IsSouthBlocked
	.4byte MetatileBehavior_IsNorthBlocked
	.4byte MetatileBehavior_IsWestBlocked
	.4byte MetatileBehavior_IsEastBlocked

gUnknown_83A64B8:: @ 83A64B8
	.4byte MetatileBehavior_IsNorthBlocked
	.4byte MetatileBehavior_IsSouthBlocked
	.4byte MetatileBehavior_IsEastBlocked
	.4byte MetatileBehavior_IsWestBlocked

@ sDirectionToVectors
gUnknown_83A64C8:: @ 83A64C8
	.2byte  0,  0 @ DIR_NONE
	.2byte  0,  1 @ DIR_SOUTH
	.2byte  0, -1 @ DIR_NORTH
	.2byte -1,  0 @ DIR_WEST
	.2byte  1,  0 @ DIR_EAST
	.2byte -1,  1 @ DIR_SOUTHWEST
	.2byte  1,  1 @ DIR_SOUTHEAST
	.2byte -1, -1 @ DIR_NORTHWEST
	.2byte  1, -1 @ DIR_NORTHEAST

@ gFaceDirectionMovementActions
gUnknown_83A64EC:: @ 83A64EC
	.byte 0x0 @ DIR_NONE
	.byte 0x0 @ DIR_SOUTH
	.byte 0x1 @ DIR_NORTH
	.byte 0x2 @ DIR_WEST
	.byte 0x3 @ DIR_EAST

gUnknown_83A64F1:: @ 83A64F1
	.byte 0x4 @ DIR_NONE
	.byte 0x4 @ DIR_SOUTH
	.byte 0x5 @ DIR_NORTH
	.byte 0x6 @ DIR_WEST
	.byte 0x7 @ DIR_EAST

gUnknown_83A64F6:: @ 83A64F6
	.byte 0x9B @ DIR_NONE
	.byte 0x9B @ DIR_SOUTH
	.byte 0x9C @ DIR_NORTH
	.byte 0x9D @ DIR_WEST
	.byte 0x9E @ DIR_EAST

gUnknown_83A64FB:: @ 83A64FB
	.byte 0x8 @ DIR_NONE
	.byte 0x8 @ DIR_SOUTH
	.byte 0x9 @ DIR_NORTH
	.byte 0xA @ DIR_WEST
	.byte 0xB @ DIR_EAST

gUnknown_83A6500:: @ 83A6500
	.byte 0xC @ DIR_NONE
	.byte 0xC @ DIR_SOUTH
	.byte 0xD @ DIR_NORTH
	.byte 0xE @ DIR_WEST
	.byte 0xF @ DIR_EAST

gUnknown_83A6505:: @ 83A6505
	.byte 0x10 @ DIR_NONE
	.byte 0x10 @ DIR_SOUTH
	.byte 0x11 @ DIR_NORTH
	.byte 0x12 @ DIR_WEST
	.byte 0x13 @ DIR_EAST

gUnknown_83A650A:: @ 83A650A
	.byte 0x1D @ DIR_NONE
	.byte 0x1D @ DIR_SOUTH
	.byte 0x1E @ DIR_NORTH
	.byte 0x1F @ DIR_WEST
	.byte 0x20 @ DIR_EAST

gUnknown_83A650F:: @ 83A650F
	.byte 0xA0 @ DIR_NONE
	.byte 0xA0 @ DIR_SOUTH
	.byte 0xA1 @ DIR_NORTH
	.byte 0xA2 @ DIR_WEST
	.byte 0xA3 @ DIR_EAST

gUnknown_83A6514:: @ 83A6514
	.byte 0x31 @ DIR_NONE
	.byte 0x31 @ DIR_SOUTH
	.byte 0x32 @ DIR_NORTH
	.byte 0x33 @ DIR_WEST
	.byte 0x34 @ DIR_EAST

gUnknown_83A6519:: @ 83A6519
	.byte 0x35 @ DIR_NONE
	.byte 0x35 @ DIR_SOUTH
	.byte 0x36 @ DIR_NORTH
	.byte 0x37 @ DIR_WEST
	.byte 0x38 @ DIR_EAST

gUnknown_83A651E:: @ 83A651E
	.byte 0x39 @ DIR_NONE
	.byte 0x39 @ DIR_SOUTH
	.byte 0x3A @ DIR_NORTH
	.byte 0x3B @ DIR_WEST
	.byte 0x3C @ DIR_EAST

gUnknown_83A6523:: @ 83A6523
	.byte 0x3D @ DIR_NONE
	.byte 0x3D @ DIR_SOUTH
	.byte 0x3E @ DIR_NORTH
	.byte 0x3F @ DIR_WEST
	.byte 0x40 @ DIR_EAST

gUnknown_83A6528:: @ 83A6528
	.byte 0x41 @ DIR_NONE
	.byte 0x41 @ DIR_SOUTH
	.byte 0x42 @ DIR_NORTH
	.byte 0x43 @ DIR_WEST
	.byte 0x44 @ DIR_EAST

gUnknown_83A652D:: @ 83A652D
	.byte 0x94 @ DIR_NONE
	.byte 0x94 @ DIR_SOUTH
	.byte 0x95 @ DIR_NORTH
	.byte 0x96 @ DIR_WEST
	.byte 0x97 @ DIR_EAST

gUnknown_83A6532:: @ 83A6532
	.byte 0x14 @ DIR_NONE
	.byte 0x14 @ DIR_SOUTH
	.byte 0x15 @ DIR_NORTH
	.byte 0x16 @ DIR_WEST
	.byte 0x17 @ DIR_EAST

gUnknown_83A6537:: @ 83A6537
	.byte 0x52 @ DIR_NONE
	.byte 0x52 @ DIR_SOUTH
	.byte 0x53 @ DIR_NORTH
	.byte 0x54 @ DIR_WEST
	.byte 0x55 @ DIR_EAST

gUnknown_83A653C:: @ 83A653C
	.byte 0x57 @ DIR_NONE
	.byte 0x57 @ DIR_SOUTH
	.byte 0x56 @ DIR_NORTH
	.byte 0x59 @ DIR_WEST
	.byte 0x58 @ DIR_EAST

gUnknown_83A6541:: @ 83A6541
	.byte 0x4E @ DIR_NONE
	.byte 0x4E @ DIR_SOUTH
	.byte 0x4F @ DIR_NORTH
	.byte 0x50 @ DIR_WEST
	.byte 0x51 @ DIR_EAST

gUnknown_83A6546:: @ 83A6546
	.byte 0x46 @ DIR_NONE
	.byte 0x46 @ DIR_SOUTH
	.byte 0x47 @ DIR_NORTH
	.byte 0x48 @ DIR_WEST
	.byte 0x49 @ DIR_EAST

gUnknown_83A654B:: @ 83A654B
	.byte 0xA6 @ DIR_NONE
	.byte 0xA6 @ DIR_SOUTH
	.byte 0xA7 @ DIR_NORTH
	.byte 0xA8 @ DIR_WEST
	.byte 0xA9 @ DIR_EAST

gUnknown_83A6550:: @ 83A6550
	.byte 0x21 @ DIR_NONE
	.byte 0x21 @ DIR_SOUTH
	.byte 0x22 @ DIR_NORTH
	.byte 0x23 @ DIR_WEST
	.byte 0x24 @ DIR_EAST

gUnknown_83A6555:: @ 83A6555
	.byte 0x25 @ DIR_NONE
	.byte 0x25 @ DIR_SOUTH
	.byte 0x26 @ DIR_NORTH
	.byte 0x27 @ DIR_WEST
	.byte 0x28 @ DIR_EAST

gUnknown_83A655A:: @ 83A655A
	.byte 0x29 @ DIR_NONE
	.byte 0x29 @ DIR_SOUTH
	.byte 0x2A @ DIR_NORTH
	.byte 0x2B @ DIR_WEST
	.byte 0x2C @ DIR_EAST

gUnknown_83A655F:: @ 83A655F
	.byte 0x2D @ DIR_NONE
	.byte 0x2D @ DIR_SOUTH
	.byte 0x2E @ DIR_NORTH
	.byte 0x2F @ DIR_WEST
	.byte 0x30 @ DIR_EAST

gUnknown_83A6564:: @ 83A6564
	.byte 0x70 @ DIR_NONE
	.byte 0x70 @ DIR_SOUTH
	.byte 0x71 @ DIR_NORTH
	.byte 0x72 @ DIR_WEST
	.byte 0x73 @ DIR_EAST

gUnknown_83A6569:: @ 83A6569
	.byte 0x74 @ DIR_NONE
	.byte 0x74 @ DIR_SOUTH
	.byte 0x75 @ DIR_NORTH
	.byte 0x76 @ DIR_WEST
	.byte 0x77 @ DIR_EAST

gUnknown_83A656E:: @ 83A656E
	.byte 0x78 @ DIR_NONE
	.byte 0x78 @ DIR_SOUTH
	.byte 0x79 @ DIR_NORTH
	.byte 0x7A @ DIR_WEST
	.byte 0x7B @ DIR_EAST

gUnknown_83A6573:: @ 83A6573
	.byte 0x7C @ DIR_NONE
	.byte 0x7C @ DIR_SOUTH
	.byte 0x7D @ DIR_NORTH
	.byte 0x7E @ DIR_WEST
	.byte 0x7F @ DIR_EAST

gUnknown_83A6578:: @ 83A6578
	.byte 0x80 @ DIR_NONE
	.byte 0x80 @ DIR_SOUTH
	.byte 0x81 @ DIR_NORTH
	.byte 0x82 @ DIR_WEST
	.byte 0x83 @ DIR_EAST

gUnknown_83A657D:: @ 83A657D
	.byte 0x84 @ DIR_NONE
	.byte 0x84 @ DIR_SOUTH
	.byte 0x85 @ DIR_NORTH
	.byte 0x86 @ DIR_WEST
	.byte 0x87 @ DIR_EAST

gUnknown_83A6582:: @ 83A6582
	.byte 0x88 @ DIR_NONE
	.byte 0x88 @ DIR_SOUTH
	.byte 0x89 @ DIR_NORTH
	.byte 0x8A @ DIR_WEST
	.byte 0x8B @ DIR_EAST

gUnknown_83A6587:: @ 83A6587
	.byte 0x8C @ DIR_NONE
	.byte 0x8C @ DIR_SOUTH
	.byte 0x8D @ DIR_NORTH
	.byte 0x8E @ DIR_WEST
	.byte 0x8F @ DIR_EAST

gUnknown_83A658C:: @ 83A658C
	.byte 0x90 @ DIR_NONE
	.byte 0x90 @ DIR_SOUTH
	.byte 0x91 @ DIR_NORTH
	.byte 0x92 @ DIR_WEST
	.byte 0x93 @ DIR_EAST

@ gOppositeDirections ?
gUnknown_83A6591:: @ 83A6591
	.byte 0x02
	.byte 0x01
	.byte 0x04
	.byte 0x03
	.byte 0x08
	.byte 0x07
	.byte 0x06
	.byte 0x05

gUnknown_83A6599:: @ 83A6599
	.byte 0x02
	.byte 0x01
	.byte 0x04
	.byte 0x03
	.byte 0x01
	.byte 0x02
	.byte 0x03
	.byte 0x04
	.byte 0x03
	.byte 0x04
	.byte 0x02
	.byte 0x01
	.byte 0x04
	.byte 0x03
	.byte 0x01
	.byte 0x02

gUnknown_83A65A9:: @ 83A65A9
	.byte 0x02
	.byte 0x01
	.byte 0x04
	.byte 0x03
	.byte 0x01
	.byte 0x02
	.byte 0x03
	.byte 0x04
	.byte 0x04
	.byte 0x03
	.byte 0x01
	.byte 0x02
	.byte 0x03
	.byte 0x04
	.byte 0x02
	.byte 0x01
	.byte 0x00
	.byte 0x00
	.byte 0x00

@ gMovementActionFuncs
gUnknown_83A65BC:: @ 83A65BC
	.4byte gUnknown_83A6864
	.4byte gUnknown_83A686C
	.4byte gUnknown_83A6874
	.4byte gUnknown_83A687C
	.4byte gUnknown_83A6A30
	.4byte gUnknown_83A6A38
	.4byte gUnknown_83A6A40
	.4byte gUnknown_83A6A48
	.4byte gUnknown_83A68C8
	.4byte gUnknown_83A68D4
	.4byte gUnknown_83A68E0
	.4byte gUnknown_83A68EC
	.4byte gUnknown_83A6904
	.4byte gUnknown_83A68F8
	.4byte gUnknown_83A6910
	.4byte gUnknown_83A691C
	.4byte gUnknown_83A6928
	.4byte gUnknown_83A6934
	.4byte gUnknown_83A6940
	.4byte gUnknown_83A694C
	.4byte gUnknown_83A6964
	.4byte gUnknown_83A6970
	.4byte gUnknown_83A697C
	.4byte gUnknown_83A6988
	.4byte gUnknown_83A6994
	.4byte gUnknown_83A69A0
	.4byte gUnknown_83A69AC
	.4byte gUnknown_83A69B8
	.4byte gUnknown_83A69C4
	.4byte gUnknown_83A69D0
	.4byte gUnknown_83A69DC
	.4byte gUnknown_83A69E8
	.4byte gUnknown_83A69F4
	.4byte gUnknown_83A6A50
	.4byte gUnknown_83A6A5C
	.4byte gUnknown_83A6A68
	.4byte gUnknown_83A6A74
	.4byte gUnknown_83A6A80
	.4byte gUnknown_83A6A8C
	.4byte gUnknown_83A6A98
	.4byte gUnknown_83A6AA4
	.4byte gUnknown_83A6AB0
	.4byte gUnknown_83A6ABC
	.4byte gUnknown_83A6AC8
	.4byte gUnknown_83A6AD4
	.4byte gUnknown_83A6AE0
	.4byte gUnknown_83A6AEC
	.4byte gUnknown_83A6AF8
	.4byte gUnknown_83A6B04
	.4byte gUnknown_83A6B10
	.4byte gUnknown_83A6B1C
	.4byte gUnknown_83A6B28
	.4byte gUnknown_83A6B34
	.4byte gUnknown_83A6B40
	.4byte gUnknown_83A6B4C
	.4byte gUnknown_83A6B58
	.4byte gUnknown_83A6B64
	.4byte gUnknown_83A6B70
	.4byte gUnknown_83A6B7C
	.4byte gUnknown_83A6B88
	.4byte gUnknown_83A6B94
	.4byte gUnknown_83A6BA0
	.4byte gUnknown_83A6BAC
	.4byte gUnknown_83A6BB8
	.4byte gUnknown_83A6BC4
	.4byte gUnknown_83A6BD0
	.4byte gUnknown_83A6BDC
	.4byte gUnknown_83A6BE8
	.4byte gUnknown_83A6BF4
	.4byte gUnknown_83A6C00
	.4byte gUnknown_83A6C0C
	.4byte gUnknown_83A6C18
	.4byte gUnknown_83A6C24
	.4byte gUnknown_83A6C30
	.4byte gUnknown_83A6C6C
	.4byte gUnknown_83A6C74
	.4byte gUnknown_83A6C7C
	.4byte gUnknown_83A6C84
	.4byte gUnknown_83A6C8C
	.4byte gUnknown_83A6C98
	.4byte gUnknown_83A6CA4
	.4byte gUnknown_83A6CB0
	.4byte gUnknown_83A6CBC
	.4byte gUnknown_83A6CC8
	.4byte gUnknown_83A6CD4
	.4byte gUnknown_83A6CE0
	.4byte gUnknown_83A6CEC
	.4byte gUnknown_83A6CF8
	.4byte gUnknown_83A6D04
	.4byte gUnknown_83A6D10
	.4byte gUnknown_83A6D1C
	.4byte gUnknown_83A6D24
	.4byte gUnknown_83A6D30
	.4byte gUnknown_83A6D38
	.4byte gUnknown_83A6D40
	.4byte gUnknown_83A6D48
	.4byte gUnknown_83A6D50
	.4byte gUnknown_83A6D58
	.4byte gUnknown_83A6D60
	.4byte gUnknown_83A6D68
	.4byte gUnknown_83A6D70
	.4byte gUnknown_83A6D78
	.4byte gUnknown_83A6D80
	.4byte gUnknown_83A6D88
	.4byte gUnknown_83A6D94
	.4byte gUnknown_83A6DA4
	.4byte gUnknown_83A6DB4
	.4byte gUnknown_83A6DBC
	.4byte gUnknown_83A6DC4
	.4byte gUnknown_83A6DCC
	.4byte gUnknown_83A6DD4
	.4byte gUnknown_83A6DE0
	.4byte gUnknown_83A6DEC
	.4byte gUnknown_83A6DF4
	.4byte gUnknown_83A6DFC
	.4byte gUnknown_83A6E04
	.4byte gUnknown_83A6E0C
	.4byte gUnknown_83A6E18
	.4byte gUnknown_83A6E24
	.4byte gUnknown_83A6E30
	.4byte gUnknown_83A6E3C
	.4byte gUnknown_83A6E48
	.4byte gUnknown_83A6E54
	.4byte gUnknown_83A6E60
	.4byte gUnknown_83A6E9C
	.4byte gUnknown_83A6EA8
	.4byte gUnknown_83A6EB4
	.4byte gUnknown_83A6EC0
	.4byte gUnknown_83A6ECC
	.4byte gUnknown_83A6ED8
	.4byte gUnknown_83A6EE4
	.4byte gUnknown_83A6EF0
	.4byte gUnknown_83A6EFC
	.4byte gUnknown_83A6F08
	.4byte gUnknown_83A6F14
	.4byte gUnknown_83A6F20
	.4byte gUnknown_83A6F2C
	.4byte gUnknown_83A6F38
	.4byte gUnknown_83A6F44
	.4byte gUnknown_83A6F50
	.4byte gUnknown_83A6F5C
	.4byte gUnknown_83A6F68
	.4byte gUnknown_83A6F74
	.4byte gUnknown_83A6F80
	.4byte gUnknown_83A6F8C
	.4byte gUnknown_83A6F98
	.4byte gUnknown_83A6FA4
	.4byte gUnknown_83A6FB0
	.4byte gUnknown_83A6FBC
	.4byte gUnknown_83A6FC8
	.4byte gUnknown_83A6FD4
	.4byte gUnknown_83A6FE0
	.4byte gUnknown_83A6FEC
	.4byte gUnknown_83A6FF4
	.4byte gUnknown_83A6FFC
	.4byte gUnknown_83A6898
	.4byte gUnknown_83A68A4
	.4byte gUnknown_83A68B0
	.4byte gUnknown_83A68BC
	.4byte gUnknown_83A7004
	.4byte gUnknown_83A6A00
	.4byte gUnknown_83A6A0C
	.4byte gUnknown_83A6A18
	.4byte gUnknown_83A6A24
	.4byte gUnknown_83A700C
	.4byte gUnknown_83A7018
	.4byte gUnknown_83A6C3C
	.4byte gUnknown_83A6C48
	.4byte gUnknown_83A6C54
	.4byte gUnknown_83A6C60

gUnknown_83A6864:: @ 83A6864
	.4byte sub_8064638
	.4byte sub_8067934

gUnknown_83A686C:: @ 83A686C
	.4byte sub_8064648
	.4byte sub_8067934

gUnknown_83A6874:: @ 83A6874
	.4byte sub_8064658
	.4byte sub_8067934

gUnknown_83A687C:: @ 83A687C
	.4byte sub_8064668
	.4byte sub_8067934

gUnknown_83A6884:: @ 83A6884
	.4byte get_go_image_anim_num
	.4byte get_go_fast_image_anim_num
	.4byte get_go_fast_image_anim_num
	.4byte get_go_faster_image_anim_num
	.4byte sub_8063470

gUnknown_83A6898:: @ 83A6898
	.4byte sub_8064968
	.4byte sub_8064988
	.4byte sub_8067934

gUnknown_83A68A4:: @ 83A68A4
	.4byte sub_80649A8
	.4byte sub_80649C8
	.4byte sub_8067934

gUnknown_83A68B0:: @ 83A68B0
	.4byte sub_80649E8
	.4byte sub_8064A08
	.4byte sub_8067934

gUnknown_83A68BC:: @ 83A68BC
	.4byte sub_8064A28
	.4byte sub_8064A48
	.4byte sub_8067934

gUnknown_83A68C8:: @ 83A68C8
	.4byte sub_8064A68
	.4byte sub_8064A88
	.4byte sub_8067934

gUnknown_83A68D4:: @ 83A68D4
	.4byte sub_8064AA8
	.4byte sub_8064AC8
	.4byte sub_8067934

gUnknown_83A68E0:: @ 83A68E0
	.4byte sub_8064AE8
	.4byte sub_8064B08
	.4byte sub_8067934

gUnknown_83A68EC:: @ 83A68EC
	.4byte sub_8064B28
	.4byte sub_8064B48
	.4byte sub_8067934

gUnknown_83A68F8:: @ 83A68F8
	.4byte sub_8064C3C
	.4byte sub_8064C5C
	.4byte sub_8067934

gUnknown_83A6904:: @ 83A6904
	.4byte sub_8064C7C
	.4byte sub_8064C9C
	.4byte sub_8067934

gUnknown_83A6910:: @ 83A6910
	.4byte sub_8064CBC
	.4byte sub_8064CDC
	.4byte sub_8067934

gUnknown_83A691C:: @ 83A691C
	.4byte sub_8064CFC
	.4byte sub_8064D1C
	.4byte sub_8067934

gUnknown_83A6928:: @ 83A6928
	.4byte sub_8064D3C
	.4byte sub_8064D5C
	.4byte sub_8067934

gUnknown_83A6934:: @ 83A6934
	.4byte sub_8064D7C
	.4byte sub_8064D9C
	.4byte sub_8067934

gUnknown_83A6940:: @ 83A6940
	.4byte sub_8064DBC
	.4byte sub_8064DDC
	.4byte sub_8067934

gUnknown_83A694C:: @ 83A694C
	.4byte sub_8064DFC
	.4byte sub_8064E1C
	.4byte sub_8067934

gUnknown_83A6958:: @ 83A6958
	.2byte 0x0000
	.2byte 0x0001
	.2byte 0x0001

gUnknown_83A695E:: @ 83A695E
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0001

gUnknown_83A6964:: @ 83A6964
	.4byte sub_80650A8
	.4byte sub_80650D4
	.4byte sub_8067934

gUnknown_83A6970:: @ 83A6970
	.4byte sub_8065100
	.4byte sub_806512C
	.4byte sub_8067934

gUnknown_83A697C:: @ 83A697C
	.4byte sub_8065158
	.4byte sub_8065184
	.4byte sub_8067934

gUnknown_83A6988:: @ 83A6988
	.4byte sub_80651B0
	.4byte sub_80651DC
	.4byte sub_8067934

gUnknown_83A6994:: @ 83A6994
	.4byte sub_806522C
	.4byte sub_8065210
	.4byte sub_8067930

gUnknown_83A69A0:: @ 83A69A0
	.4byte sub_806524C
	.4byte sub_8065210
	.4byte sub_8067930

gUnknown_83A69AC:: @ 83A69AC
	.4byte sub_806526C
	.4byte sub_8065210
	.4byte sub_8067930

gUnknown_83A69B8:: @ 83A69B8
	.4byte sub_806528C
	.4byte sub_8065210
	.4byte sub_8067930

gUnknown_83A69C4:: @ 83A69C4
	.4byte sub_80652AC
	.4byte sub_8065210
	.4byte sub_8067930

gUnknown_83A69D0:: @ 83A69D0
	.4byte sub_80652CC
	.4byte sub_80652EC
	.4byte sub_8067934

gUnknown_83A69DC:: @ 83A69DC
	.4byte sub_806530C
	.4byte sub_806532C
	.4byte sub_8067934

gUnknown_83A69E8:: @ 83A69E8
	.4byte sub_806534C
	.4byte sub_806536C
	.4byte sub_8067934

gUnknown_83A69F4:: @ 83A69F4
	.4byte sub_806538C
	.4byte sub_80653AC
	.4byte sub_8067934

gUnknown_83A6A00:: @ 83A6A00
	.4byte sub_80653F8
	.4byte sub_8065438
	.4byte sub_8067930

gUnknown_83A6A0C:: @ 83A6A0C
	.4byte sub_8065464
	.4byte sub_80654A4
	.4byte sub_8067930

gUnknown_83A6A18:: @ 83A6A18
	.4byte sub_80654D0
	.4byte sub_8065510
	.4byte sub_8067930

gUnknown_83A6A24:: @ 83A6A24
	.4byte sub_806553C
	.4byte sub_806557C
	.4byte sub_8067930

gUnknown_83A6A30:: @ 83A6A30
	.4byte sub_80655D4
	.4byte sub_8067930

gUnknown_83A6A38:: @ 83A6A38
	.4byte sub_8065610
	.4byte sub_8067930

gUnknown_83A6A40:: @ 83A6A40
	.4byte sub_806564C
	.4byte sub_8067930

gUnknown_83A6A48:: @ 83A6A48
	.4byte sub_8065688
	.4byte sub_8067930

gUnknown_83A6A50:: @ 83A6A50
	.4byte sub_8065770
	.4byte sub_8065734
	.4byte sub_8067934

gUnknown_83A6A5C:: @ 83A6A5C
	.4byte sub_80657A8
	.4byte sub_8065734
	.4byte sub_8067934

gUnknown_83A6A68:: @ 83A6A68
	.4byte sub_80657E0
	.4byte sub_8065734
	.4byte sub_8067934

gUnknown_83A6A74:: @ 83A6A74
	.4byte sub_8065818
	.4byte sub_8065734
	.4byte sub_8067934

gUnknown_83A6A80:: @ 83A6A80
	.4byte sub_8065850
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6A8C:: @ 83A6A8C
	.4byte sub_8065888
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6A98:: @ 83A6A98
	.4byte sub_80658C0
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6AA4:: @ 83A6AA4
	.4byte sub_80658F8
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6AB0:: @ 83A6AB0
	.4byte sub_8065930
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6ABC:: @ 83A6ABC
	.4byte sub_8065968
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6AC8:: @ 83A6AC8
	.4byte sub_80659A0
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6AD4:: @ 83A6AD4
	.4byte sub_80659D8
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6AE0:: @ 83A6AE0
	.4byte sub_8065A10
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6AEC:: @ 83A6AEC
	.4byte sub_8065A48
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6AF8:: @ 83A6AF8
	.4byte sub_8065A80
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6B04:: @ 83A6B04
	.4byte sub_8065AB8
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6B10:: @ 83A6B10
	.4byte sub_8065AF0
	.4byte sub_8065B10
	.4byte sub_8067934

gUnknown_83A6B1C:: @ 83A6B1C
	.4byte sub_8065B30
	.4byte sub_8065B50
	.4byte sub_8067934

gUnknown_83A6B28:: @ 83A6B28
	.4byte sub_8065B70
	.4byte sub_8065B90
	.4byte sub_8067934

gUnknown_83A6B34:: @ 83A6B34
	.4byte sub_8065BB0
	.4byte sub_8065BD0
	.4byte sub_8067934

gUnknown_83A6B40:: @ 83A6B40
	.4byte sub_8065BF0
	.4byte sub_8065C10
	.4byte sub_8067934

gUnknown_83A6B4C:: @ 83A6B4C
	.4byte sub_8065C30
	.4byte sub_8065C50
	.4byte sub_8067934

gUnknown_83A6B58:: @ 83A6B58
	.4byte sub_8065C70
	.4byte sub_8065C90
	.4byte sub_8067934

gUnknown_83A6B64:: @ 83A6B64
	.4byte sub_8065CB0
	.4byte sub_8065CD0
	.4byte sub_8067934

gUnknown_83A6B70:: @ 83A6B70
	.4byte sub_8065CF0
	.4byte sub_8065D10
	.4byte sub_8067934

gUnknown_83A6B7C:: @ 83A6B7C
	.4byte sub_8065D30
	.4byte sub_8065D50
	.4byte sub_8067934

gUnknown_83A6B88:: @ 83A6B88
	.4byte sub_8065D70
	.4byte sub_8065D90
	.4byte sub_8067934

gUnknown_83A6B94:: @ 83A6B94
	.4byte sub_8065DB0
	.4byte sub_8065DD0
	.4byte sub_8067934

gUnknown_83A6BA0:: @ 83A6BA0
	.4byte do_run_south_anim
	.4byte sub_8065E10
	.4byte sub_8067934

gUnknown_83A6BAC:: @ 83A6BAC
	.4byte do_run_north_anim
	.4byte sub_8065E50
	.4byte sub_8067934

gUnknown_83A6BB8:: @ 83A6BB8
	.4byte do_run_west_anim
	.4byte sub_8065E90
	.4byte sub_8067934

gUnknown_83A6BC4:: @ 83A6BC4
	.4byte do_run_east_anim
	.4byte sub_8065ED0
	.4byte sub_8067934

gUnknown_83A6BD0:: @ 83A6BD0
	.4byte sub_8065FC4
	.4byte sub_8065FE4
	.4byte sub_8067934

gUnknown_83A6BDC:: @ 83A6BDC
	.4byte sub_8066004
	.4byte sub_8066024
	.4byte sub_8067934

gUnknown_83A6BE8:: @ 83A6BE8
	.4byte sub_8066044
	.4byte sub_8066064
	.4byte sub_8067934

gUnknown_83A6BF4:: @ 83A6BF4
	.4byte sub_8066084
	.4byte sub_80660A4
	.4byte sub_8067934

gUnknown_83A6C00:: @ 83A6C00
	.4byte sub_80660F0
	.4byte sub_8066108
	.4byte sub_8067934

gUnknown_83A6C0C:: @ 83A6C0C
	.4byte sub_806615C
	.4byte sub_806617C
	.4byte sub_8067934

gUnknown_83A6C18:: @ 83A6C18
	.4byte sub_80661A4
	.4byte sub_80661C4
	.4byte sub_8067934

gUnknown_83A6C24:: @ 83A6C24
	.4byte sub_80661EC
	.4byte sub_806620C
	.4byte sub_8067934

gUnknown_83A6C30:: @ 83A6C30
	.4byte sub_8066234
	.4byte sub_8066254
	.4byte sub_8067934

gUnknown_83A6C3C:: @ 83A6C3C
	.4byte sub_806627C
	.4byte sub_806629C
	.4byte sub_8067934

gUnknown_83A6C48:: @ 83A6C48
	.4byte sub_80662BC
	.4byte sub_80662DC
	.4byte sub_8067934

gUnknown_83A6C54:: @ 83A6C54
	.4byte sub_80662FC
	.4byte sub_806631C
	.4byte sub_8067934

gUnknown_83A6C60:: @ 83A6C60
	.4byte sub_806633C
	.4byte sub_806635C
	.4byte sub_8067934

gUnknown_83A6C6C:: @ 83A6C6C
	.4byte sub_806637C
	.4byte sub_8067934

gUnknown_83A6C74:: @ 83A6C74
	.4byte sub_80663D8
	.4byte sub_8067934

gUnknown_83A6C7C:: @ 83A6C7C
	.4byte sub_806643C
	.4byte sub_8067934

gUnknown_83A6C84:: @ 83A6C84
	.4byte sub_806644C
	.4byte sub_8067934

gUnknown_83A6C8C:: @ 83A6C8C
	.4byte sub_806645C
	.4byte sub_8066488
	.4byte sub_8067934

gUnknown_83A6C98:: @ 83A6C98
	.4byte sub_80664B4
	.4byte sub_80664E0
	.4byte sub_8067934

gUnknown_83A6CA4:: @ 83A6CA4
	.4byte sub_806650C
	.4byte sub_8066538
	.4byte sub_8067934

gUnknown_83A6CB0:: @ 83A6CB0
	.4byte sub_8066564
	.4byte sub_8066590
	.4byte sub_8067934

gUnknown_83A6CBC:: @ 83A6CBC
	.4byte sub_80665BC
	.4byte sub_80665E8
	.4byte sub_8067934

gUnknown_83A6CC8:: @ 83A6CC8
	.4byte sub_8066614
	.4byte sub_8066640
	.4byte sub_8067934

gUnknown_83A6CD4:: @ 83A6CD4
	.4byte sub_806666C
	.4byte sub_8066698
	.4byte sub_8067934

gUnknown_83A6CE0:: @ 83A6CE0
	.4byte sub_80666C4
	.4byte sub_80666F0
	.4byte sub_8067934

gUnknown_83A6CEC:: @ 83A6CEC
	.4byte sub_806671C
	.4byte sub_8066748
	.4byte sub_8067934

gUnknown_83A6CF8:: @ 83A6CF8
	.4byte sub_8066774
	.4byte sub_80667A0
	.4byte sub_8067934

gUnknown_83A6D04:: @ 83A6D04
	.4byte sub_80667CC
	.4byte sub_80667F8
	.4byte sub_8067934

gUnknown_83A6D10:: @ 83A6D10
	.4byte sub_8066824
	.4byte sub_8066850
	.4byte sub_8067934

gUnknown_83A6D1C:: @ 83A6D1C
	.4byte sub_806687C
	.4byte sub_8067934

gUnknown_83A6D24:: @ 83A6D24
	.4byte sub_8066894
	.4byte sub_8066108
	.4byte sub_8067934

gUnknown_83A6D30:: @ 83A6D30
	.4byte sub_80668A4
	.4byte sub_8067930

gUnknown_83A6D38:: @ 83A6D38
	.4byte sub_80668B4
	.4byte sub_8067930

gUnknown_83A6D40:: @ 83A6D40
	.4byte sub_80668C4
	.4byte sub_8067930

gUnknown_83A6D48:: @ 83A6D48
	.4byte sub_80668D4
	.4byte sub_8067930

gUnknown_83A6D50:: @ 83A6D50
	.4byte sub_8066900
	.4byte sub_8067930

gUnknown_83A6D58:: @ 83A6D58
	.4byte sub_8066910
	.4byte sub_8067930

gUnknown_83A6D60:: @ 83A6D60
	.4byte do_exclamation_mark_bubble_1
	.4byte sub_8067930

gUnknown_83A6D68:: @ 83A6D68
	.4byte do_exclamation_mark_bubble_2
	.4byte sub_8067930

gUnknown_83A6D70:: @ 83A6D70
	.4byte do_heart_bubble
	.4byte sub_8067930

gUnknown_83A6D78:: @ 83A6D78
	.4byte sub_806698C
	.4byte sub_8067930

gUnknown_83A6D80:: @ 83A6D80
	.4byte sub_80669B0
	.4byte sub_8067930

gUnknown_83A6D88:: @ 83A6D88
	.4byte sub_80669D4
	.4byte sub_8066A18
	.4byte sub_8067930

gUnknown_83A6D94:: @ 83A6D94
	.4byte sub_8066A38
	.4byte sub_8066A54
	.4byte sub_8066A78
	.4byte sub_8067930

gUnknown_83A6DA4:: @ 83A6DA4
	.4byte sub_8066AB4
	.4byte sub_8066AD0
	.4byte sub_8066AF4
	.4byte sub_8067930

gUnknown_83A6DB4:: @ 83A6DB4
	.4byte sub_8066B30
	.4byte sub_8067930

gUnknown_83A6DBC:: @ 83A6DBC
	.4byte sub_8066B40
	.4byte sub_8067930

gUnknown_83A6DC4:: @ 83A6DC4
	.4byte sub_8066B50
	.4byte sub_8067930

gUnknown_83A6DCC:: @ 83A6DCC
	.4byte sub_8066B80
	.4byte sub_8067930

gUnknown_83A6DD4:: @ 83A6DD4
	.4byte sub_8066BB0
	.4byte sub_8066BE4
	.4byte sub_8067934

gUnknown_83A6DE0:: @ 83A6DE0
	.4byte sub_8066C10
	.4byte sub_8066C44
	.4byte sub_8067934

gUnknown_83A6DEC:: @ 83A6DEC
	.4byte sub_8066CB0
	.4byte sub_8067934

gUnknown_83A6DF4:: @ 83A6DF4
	.4byte sub_8066CC0
	.4byte sub_8067934

gUnknown_83A6DFC:: @ 83A6DFC
	.4byte sub_8066CD0
	.4byte sub_8067934

gUnknown_83A6E04:: @ 83A6E04
	.4byte sub_8066CE0
	.4byte sub_8067934

gUnknown_83A6E0C:: @ 83A6E0C
	.4byte sub_8066CF0
	.4byte sub_8066108
	.4byte sub_8067934

gUnknown_83A6E18:: @ 83A6E18
	.4byte sub_8066D14
	.4byte sub_8066108
	.4byte sub_8067934

gUnknown_83A6E24:: @ 83A6E24
	.4byte sub_8066D38
	.4byte sub_8066108
	.4byte sub_8067934

gUnknown_83A6E30:: @ 83A6E30
	.4byte sub_8066D5C
	.4byte sub_8066108
	.4byte sub_8067934

gUnknown_83A6E3C:: @ 83A6E3C
	.4byte sub_8066D80
	.4byte sub_8066108
	.4byte sub_8067934

gUnknown_83A6E48:: @ 83A6E48
	.4byte sub_8066DA4
	.4byte sub_8066108
	.4byte sub_8067934

gUnknown_83A6E54:: @ 83A6E54
	.4byte sub_8066DC8
	.4byte sub_8066108
	.4byte sub_8067934

gUnknown_83A6E60:: @ 83A6E60
	.4byte sub_8066DEC
	.4byte sub_8066108
	.4byte sub_8067934
	.4byte sub_8066E10
	.4byte sub_8066108
	.4byte sub_8067934
	.4byte sub_8066E34
	.4byte sub_8066108
	.4byte sub_8067934
	.4byte sub_8066E58
	.4byte sub_8066108
	.4byte sub_8067934
	.4byte sub_8066E7C
	.4byte sub_8066108
	.4byte sub_8067934

gUnknown_83A6E9C:: @ 83A6E9C
	.4byte sub_8066EE4
	.4byte sub_8066F10
	.4byte sub_8067934

gUnknown_83A6EA8:: @ 83A6EA8
	.4byte sub_8066F3C
	.4byte sub_8066F68
	.4byte sub_8067934

gUnknown_83A6EB4:: @ 83A6EB4
	.4byte sub_8066F94
	.4byte sub_8066FC0
	.4byte sub_8067934

gUnknown_83A6EC0:: @ 83A6EC0
	.4byte sub_8066FEC
	.4byte sub_8067018
	.4byte sub_8067934

gUnknown_83A6ECC:: @ 83A6ECC
	.4byte sub_8067044
	.4byte sub_8067070
	.4byte sub_8067934

gUnknown_83A6ED8:: @ 83A6ED8
	.4byte sub_806709C
	.4byte sub_80670C8
	.4byte sub_8067934

gUnknown_83A6EE4:: @ 83A6EE4
	.4byte sub_80670F4
	.4byte sub_8067120
	.4byte sub_8067934

gUnknown_83A6EF0:: @ 83A6EF0
	.4byte sub_806714C
	.4byte sub_8067178
	.4byte sub_8067934

gUnknown_83A6EFC:: @ 83A6EFC
	.4byte sub_80671A4
	.4byte sub_80671D0
	.4byte sub_8067934

gUnknown_83A6F08:: @ 83A6F08
	.4byte sub_80671FC
	.4byte sub_8067228
	.4byte sub_8067934

gUnknown_83A6F14:: @ 83A6F14
	.4byte sub_8067254
	.4byte sub_8067280
	.4byte sub_8067934

gUnknown_83A6F20:: @ 83A6F20
	.4byte sub_80672AC
	.4byte sub_80672D8
	.4byte sub_8067934

gUnknown_83A6F2C:: @ 83A6F2C
	.4byte sub_8067304
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6F38:: @ 83A6F38
	.4byte sub_806733C
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6F44:: @ 83A6F44
	.4byte sub_8067374
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6F50:: @ 83A6F50
	.4byte sub_80673AC
	.4byte sub_806570C
	.4byte sub_8067934

gUnknown_83A6F5C:: @ 83A6F5C
	.4byte sub_806741C
	.4byte sub_806743C
	.4byte sub_8067934

gUnknown_83A6F68:: @ 83A6F68
	.4byte sub_806745C
	.4byte sub_806747C
	.4byte sub_8067934

gUnknown_83A6F74:: @ 83A6F74
	.4byte sub_806749C
	.4byte sub_80674BC
	.4byte sub_8067934

gUnknown_83A6F80:: @ 83A6F80
	.4byte sub_80674DC
	.4byte sub_80674FC
	.4byte sub_8067934

gUnknown_83A6F8C:: @ 83A6F8C
	.4byte sub_806754C
	.4byte sub_806756C
	.4byte sub_8067934

gUnknown_83A6F98:: @ 83A6F98
	.4byte sub_806758C
	.4byte sub_80675AC
	.4byte sub_8067934

gUnknown_83A6FA4:: @ 83A6FA4
	.4byte sub_80675CC
	.4byte sub_80675EC
	.4byte sub_8067934

gUnknown_83A6FB0:: @ 83A6FB0
	.4byte sub_806760C
	.4byte sub_806762C
	.4byte sub_8067934

gUnknown_83A6FBC:: @ 83A6FBC
	.4byte sub_8067684
	.4byte sub_80676A4
	.4byte sub_8067934

gUnknown_83A6FC8:: @ 83A6FC8
	.4byte sub_80676C4
	.4byte sub_80676E4
	.4byte sub_8067934

gUnknown_83A6FD4:: @ 83A6FD4
	.4byte sub_8067704
	.4byte sub_8067724
	.4byte sub_8067934

gUnknown_83A6FE0:: @ 83A6FE0
	.4byte sub_8067744
	.4byte sub_8067764
	.4byte sub_8067934

gUnknown_83A6FEC:: @ 83A6FEC
	.4byte sub_8067784
	.4byte sub_80677C0

gUnknown_83A6FF4:: @ 83A6FF4
	.4byte sub_8067784
	.4byte sub_80677CC

gUnknown_83A6FFC:: @ 83A6FFC
	.4byte sub_8067784
	.4byte sub_80678C0

gUnknown_83A7004:: @ 83A7004
	.4byte sub_80678F0
	.4byte sub_8067924

gUnknown_83A700C:: @ 83A700C
	.4byte sub_8067944
	.4byte sub_8067954
	.4byte sub_80679A8

gUnknown_83A7018:: @ 83A7018
	.4byte sub_8067978
	.4byte sub_806798C
	.4byte sub_80679A8
