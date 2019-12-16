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

@ 35FBA8
	.incbin "graphics/object_events/male_surf.4bpp"

@ 360DA8
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

@ 8372AA8
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
	.incbin "graphics/object_events/fldeff_cut.4bpp"

gUnknown_8398688::
	.incbin "graphics/object_events/fldeff_cut.gbapal"

gUnknown_83986A8:: @ 83986A8
	.incbin "graphics/object_events/pics/unknown/83986A8.4bpp"

gUnknown_8398728:: @ 8398728
	.incbin "graphics/object_events/pics/unknown/8398728.4bpp"

gUnknown_83987A8:: @ 83987A8
	.incbin "graphics/object_events/pics/unknown/83987A8.4bpp"

gUnknown_8398828:: @ 8398828
	.incbin "graphics/object_events/pics/unknown/8398828.4bpp"

gUnknown_83988A8:: @ 83988A8
	.incbin "graphics/object_events/pics/unknown/83988A8.4bpp"

gUnknown_8398928:: @ 8398928
	.incbin "graphics/object_events/pics/unknown/8398928.4bpp"

gUnknown_83989A8:: @ 83989A8
	.incbin "graphics/object_events/pics/unknown/83989A8.4bpp"

gUnknown_8398A28:: @ 8398A28
	.incbin "graphics/object_events/pics/unknown/8398A28.4bpp"

gUnknown_8398AA8:: @ 8398AA8
	.incbin "graphics/object_events/pics/unknown/8398AA8.4bpp"

gUnknown_8398B28:: @ 8398B28
	.incbin "graphics/object_events/pics/unknown/8398B28.4bpp"

gUnknown_8398BA8:: @ 8398BA8
	.incbin "graphics/object_events/pics/unknown/8398BA8.4bpp"

gUnknown_8398C28:: @ 8398C28
	.incbin "graphics/object_events/pics/unknown/8398C28.4bpp"

gUnknown_8398CA8:: @ 8398CA8
	.incbin "graphics/object_events/pics/unknown/8398CA8.4bpp"

gUnknown_8398D28:: @ 8398D28
	.incbin "graphics/object_events/pics/unknown/8398D28.4bpp"

gUnknown_8398DA8:: @ 8398DA8
	.incbin "graphics/object_events/pics/unknown/8398DA8.4bpp"

gUnknown_8398E28:: @ 8398E28
	.incbin "graphics/object_events/pics/unknown/8398E28.4bpp"

gUnknown_8398EA8:: @ 8398EA8
	.incbin "graphics/object_events/pics/unknown/8398EA8.4bpp"

gUnknown_8398F28:: @ 8398F28
	.incbin "graphics/object_events/pics/unknown/8398F28.4bpp"

gUnknown_8398FA8:: @ 8398FA8
	.incbin "graphics/object_events/palettes/8398FA8.gbapal"

gUnknown_8398FC8:: @ 8398FC8
	.incbin "graphics/object_events/palettes/8398FC8.gbapal"

gUnknown_8399008:: @ 8399008
	.incbin "graphics/object_events/pics/unknown/8399008.4bpp"

gUnknown_8399048:: @ 8399048
	.incbin "graphics/object_events/pics/unknown/8399048.4bpp"

gUnknown_8399088:: @ 8399088
	.incbin "graphics/object_events/pics/unknown/8399088.4bpp"

gUnknown_83990C8:: @ 83990C8
	.incbin "graphics/object_events/pics/unknown/83990C8.4bpp"

gUnknown_8399188:: @ 8399188
	.incbin "graphics/object_events/pics/unknown/8399188.4bpp"

gUnknown_83991C8:: @ 83991C8
	.incbin "graphics/object_events/pics/unknown/83991C8.4bpp"

gUnknown_8399208:: @ 8399208
	.incbin "graphics/object_events/pics/unknown/8399208.4bpp"

gUnknown_8399248:: @ 8399248
	.incbin "graphics/object_events/pics/unknown/8399248.4bpp"

gUnknown_8399388:: @ 8399388
	.incbin "graphics/object_events/pics/unknown/8399388.4bpp"

gUnknown_8399488:: @ 8399488
	.incbin "graphics/object_events/pics/unknown/8399488.4bpp"

gUnknown_8399508:: @ 8399508
	.incbin "graphics/object_events/pics/unknown/8399508.4bpp"

gUnknown_8399588:: @ 8399588
	.incbin "graphics/object_events/pics/unknown/8399588.4bpp"

gUnknown_8399608:: @ 8399608
	.incbin "graphics/object_events/pics/unknown/8399608.4bpp"

gUnknown_8399688:: @ 8399688
	.incbin "graphics/object_events/pics/unknown/8399688.4bpp"

gUnknown_8399788:: @ 8399788
	.incbin "graphics/object_events/pics/unknown/8399788.4bpp"

gUnknown_8399808:: @ 8399808
	.incbin "graphics/object_events/pics/unknown/8399808.4bpp"

gUnknown_8399888:: @ 8399888
	.incbin "graphics/object_events/pics/unknown/8399888.4bpp"

gUnknown_8399908:: @ 8399908
	.incbin "graphics/object_events/pics/unknown/8399908.4bpp"

gUnknown_8399988:: @ 8399988
	.incbin "graphics/object_events/pics/unknown/8399988.4bpp"

gUnknown_8399A08:: @ 8399A08
	.incbin "graphics/object_events/pics/unknown/8399A08.4bpp"

gUnknown_8399A88:: @ 8399A88
	.incbin "graphics/object_events/pics/unknown/8399A88.4bpp"

gUnknown_8399B08:: @ 8399B08
	.incbin "graphics/object_events/pics/unknown/8399B08.4bpp"

gUnknown_8399B88:: @ 8399B88
	.incbin "graphics/object_events/pics/unknown/8399B88.4bpp"

gUnknown_8399C08:: @ 8399C08
	.incbin "graphics/object_events/pics/unknown/8399C08.4bpp"

gUnknown_8399C88:: @ 8399C88
	.byte 0xF0
	.byte 0x44
	.byte 0xF4
	.byte 0xF0
	.byte 0x44
	.byte 0x23
	.byte 0x42
	.byte 0x43

gUnknown_8399C90:: @ 8399C90
	.byte 0x33
	.byte 0x34
	.byte 0x23
	.byte 0x24
	.byte 0x21
	.byte 0x43
	.byte 0x43
	.byte 0x42
	.byte 0x13
	.byte 0x32
	.byte 0x44
	.byte 0x32
	.byte 0x40
	.byte 0x33
	.byte 0x43
	.byte 0x34
	.byte 0x4F
	.byte 0x34
	.byte 0x44
	.byte 0x44
	.byte 0x34
	.byte 0x44
	.byte 0x43
	.byte 0x34
	.byte 0x43
	.byte 0x44
	.byte 0x0F
	.byte 0x0F
	.byte 0x12
	.byte 0x21
	.byte 0xF2
	.byte 0xF0
	.byte 0x42
	.byte 0x33
	.byte 0x43
	.byte 0x0F
	.byte 0x33
	.byte 0x43
	.byte 0xF4
	.byte 0xF0
	.byte 0x43
	.byte 0x44
	.byte 0x44
	.byte 0x0F
	.byte 0x44
	.byte 0x34
	.byte 0x33
	.byte 0xF4
	.byte 0x44
	.byte 0x44
	.byte 0x33
	.byte 0x04
	.byte 0x33
	.byte 0x43
	.byte 0x44
	.byte 0xF0
	.byte 0x24
	.byte 0x32
	.byte 0x23
	.byte 0x42
	.byte 0x1F
	.byte 0x24
	.byte 0x32
	.byte 0x11
	.byte 0x40
	.byte 0x12
	.byte 0x32
	.byte 0x43
	.byte 0x0F
	.byte 0x11
	.byte 0x33
	.byte 0x43
	.byte 0x40
	.byte 0x31
	.byte 0x44
	.byte 0x33
	.byte 0x3F
	.byte 0x44
	.byte 0x44
	.byte 0x34
	.byte 0x40
	.byte 0x44
	.byte 0x34
	.byte 0x34
	.byte 0x3F
	.byte 0x44
	.byte 0x03
	.byte 0x43
	.byte 0x34
	.byte 0x23
	.byte 0x43
	.byte 0x43
	.byte 0x34
	.byte 0x22
	.byte 0x32
	.byte 0x04
	.byte 0x44
	.byte 0x13
	.byte 0x31
	.byte 0xF4
	.byte 0x44
	.byte 0x34
	.byte 0x41
	.byte 0x43
	.byte 0x44
	.byte 0x44
	.byte 0x34
	.byte 0x43
	.byte 0x44
	.byte 0x44
	.byte 0x44
	.byte 0x04
	.byte 0x44
	.byte 0x34
	.byte 0x44
	.byte 0xF4
	.byte 0x34
	.byte 0x34
	.byte 0x30
	.byte 0x0F

gUnknown_8399D08:: @ 8399D08
	.incbin "graphics/object_events/pics/unknown/8399D08.4bpp"

gUnknown_8399D88:: @ 8399D88
	.incbin "graphics/object_events/pics/unknown/8399D88.4bpp"

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

gUnknown_839A088:: @ 839A088
	.incbin "graphics/object_events/pics/unknown/839A088.4bpp"

gUnknown_839A108:: @ 839A108
	.incbin "graphics/object_events/pics/unknown/839A108.4bpp"

gUnknown_839A188:: @ 839A188
	.incbin "graphics/object_events/pics/unknown/839A188.4bpp"

gUnknown_839A208:: @ 839A208
	.incbin "graphics/object_events/pics/unknown/839A208.4bpp"

gUnknown_839A288:: @ 839A288
	.incbin "graphics/object_events/pics/unknown/839A288.4bpp"

gUnknown_839A308:: @ 839A308
	.incbin "graphics/object_events/pics/unknown/839A308.4bpp"

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

gUnknown_839A808:: @ 839A808
	.incbin "graphics/object_events/pics/unknown/839A808.4bpp"

gUnknown_839A888:: @ 839A888
	.incbin "graphics/object_events/pics/unknown/839A888.4bpp"

gUnknown_839A908:: @ 839A908
	.incbin "graphics/object_events/pics/unknown/839A908.4bpp"

gUnknown_839A988:: @ 839A988
	.incbin "baserom.gba", 0x39A988, 0x40

gUnknown_839A9C8:: @ 839A9C8
	.incbin "baserom.gba", 0x39A9C8, 0x40

gUnknown_839AA08:: @ 839AA08
	.incbin "baserom.gba", 0x39AA08, 0x40

gUnknown_839AA48:: @ 839AA48
	.incbin "baserom.gba", 0x39AA48, 0x80

gUnknown_839AAC8:: @ 839AAC8
	.incbin "baserom.gba", 0x39AAC8, 0x80

gUnknown_839AB48:: @ 839AB48
	.incbin "baserom.gba", 0x39AB48, 0x80

gUnknown_839ABC8:: @ 839ABC8
	.incbin "baserom.gba", 0x39ABC8, 0x80

gUnknown_839AC48:: @ 839AC48
	.incbin "baserom.gba", 0x39AC48, 0x40

gUnknown_839AC88:: @ 839AC88
	.incbin "baserom.gba", 0x39AC88, 0x40

gUnknown_839ACC8:: @ 839ACC8
	.incbin "baserom.gba", 0x39ACC8, 0x40

gUnknown_839AD08:: @ 839AD08
	.incbin "baserom.gba", 0x39AD08, 0x40

gUnknown_839AD48:: @ 839AD48
	.incbin "baserom.gba", 0x39AD48, 0x40

gUnknown_839AD88:: @ 839AD88
	.incbin "baserom.gba", 0x39AD88, 0x80

gUnknown_839AE08:: @ 839AE08
	.incbin "baserom.gba", 0x39AE08, 0x80

gUnknown_839AE88:: @ 839AE88
	.incbin "baserom.gba", 0x39AE88, 0x80

gUnknown_839AF08:: @ 839AF08
	.incbin "baserom.gba", 0x39AF08, 0x100

gUnknown_839B008:: @ 839B008
	.incbin "baserom.gba", 0x39B008, 0x100

gUnknown_839B108:: @ 839B108
	.incbin "baserom.gba", 0x39B108, 0x100

gUnknown_839B208:: @ 839B208
	.incbin "baserom.gba", 0x39B208, 0x100

gUnknown_839B308:: @ 839B308
	.incbin "baserom.gba", 0x39B308, 0x100

gUnknown_839B408:: @ 839B408
	.incbin "baserom.gba", 0x39B408, 0x100

gUnknown_839B508:: @ 839B508
	.incbin "baserom.gba", 0x39B508, 0x100

gUnknown_839B608:: @ 839B608
	.incbin "baserom.gba", 0x39B608, 0x100

gUnknown_839B708:: @ 839B708
	.incbin "baserom.gba", 0x39B708, 0x100

gUnknown_839B808:: @ 839B808
	.incbin "baserom.gba", 0x39B808, 0x100

gUnknown_839B908:: @ 839B908
	.incbin "baserom.gba", 0x39B908, 0x100

gUnknown_839BA08:: @ 839BA08
	.incbin "baserom.gba", 0x39BA08, 0x100

gUnknown_839BB08:: @ 839BB08
	.incbin "baserom.gba", 0x39BB08, 0x100

gUnknown_839BC08:: @ 839BC08
	.incbin "baserom.gba", 0x39BC08, 0x100

gUnknown_839BD08:: @ 839BD08
	.incbin "baserom.gba", 0x39BD08, 0x100

gUnknown_839BE08:: @ 839BE08
	.incbin "baserom.gba", 0x39BE08, 0x100

gUnknown_839BF08:: @ 839BF08
	.incbin "baserom.gba", 0x39BF08, 0x100

gUnknown_839C008:: @ 839C008
	.incbin "baserom.gba", 0x39C008, 0x100

gUnknown_839C108:: @ 839C108
	.incbin "baserom.gba", 0x39C108, 0x100

gUnknown_839C208:: @ 839C208
	.incbin "baserom.gba", 0x39C208, 0x100

gUnknown_839C308:: @ 839C308
	.incbin "baserom.gba", 0x39C308, 0x100

gUnknown_839C408:: @ 839C408
	.incbin "baserom.gba", 0x39C408, 0x100

gUnknown_839C508:: @ 839C508
	.incbin "baserom.gba", 0x39C508, 0x80

gUnknown_839C588:: @ 839C588
	.incbin "baserom.gba", 0x39C588, 0x20

gUnknown_839C5A8:: @ 839C5A8
	.incbin "baserom.gba", 0x39C5A8, 0x80

gUnknown_839C628:: @ 839C628
	.incbin "baserom.gba", 0x39C628, 0x80

gUnknown_839C6A8:: @ 839C6A8
	.incbin "baserom.gba", 0x39C6A8, 0x80

gUnknown_839C728:: @ 839C728
	.incbin "baserom.gba", 0x39C728, 0x80

gUnknown_839C7A8:: @ 839C7A8
	.incbin "baserom.gba", 0x39C7A8, 0x80

gUnknown_839C828:: @ 839C828
	.incbin "baserom.gba", 0x39C828, 0x80

gUnknown_839C8A8:: @ 839C8A8
	.incbin "baserom.gba", 0x39C8A8, 0x80

gUnknown_839C928:: @ 839C928
	.incbin "baserom.gba", 0x39C928, 0x80

gUnknown_839C9A8:: @ 839C9A8
	.incbin "baserom.gba", 0x39C9A8, 0x80

gUnknown_839CA28:: @ 839CA28
	.incbin "baserom.gba", 0x39CA28, 0x80

gUnknown_839CAA8:: @ 839CAA8
	.incbin "baserom.gba", 0x39CAA8, 0x100

gUnknown_839CBA8:: @ 839CBA8
	.incbin "baserom.gba", 0x39CBA8, 0x100

gUnknown_839CCA8:: @ 839CCA8
	.incbin "baserom.gba", 0x39CCA8, 0x100

gUnknown_839CDA8:: @ 839CDA8
	.incbin "baserom.gba", 0x39CDA8, 0x100

gUnknown_839CEA8:: @ 839CEA8
	.incbin "baserom.gba", 0x39CEA8, 0x100

gUnknown_839CFA8:: @ 839CFA8
	.incbin "baserom.gba", 0x39CFA8, 0x100

gUnknown_839D0A8:: @ 839D0A8
	.incbin "baserom.gba", 0x39D0A8, 0x100

gUnknown_839D1A8:: @ 839D1A8
	.incbin "baserom.gba", 0x39D1A8, 0x100

gUnknown_839D2A8:: @ 839D2A8
	.incbin "baserom.gba", 0x39D2A8, 0x80

gUnknown_839D328:: @ 839D328
	.incbin "baserom.gba", 0x39D328, 0x80

gUnknown_839D3A8:: @ 839D3A8
	.incbin "baserom.gba", 0x39D3A8, 0x20

gUnknown_839D3C8:: @ 839D3C8
	.incbin "baserom.gba", 0x39D3C8, 0x800

gUnknown_839DBC8:: @ 839DBC8
	.incbin "baserom.gba", 0x39DBC8, 0x800

gUnknown_839E3C8:: @ 839E3C8
	.incbin "baserom.gba", 0x39E3C8, 0x800

gUnknown_839EBC8:: @ 839EBC8
	.incbin "baserom.gba", 0x39EBC8, 0x800

gUnknown_839F3C8:: @ 839F3C8
	.incbin "baserom.gba", 0x39F3C8, 0x800

gUnknown_839FBC8:: @ 839FBC8
	.incbin "baserom.gba", 0x39FBC8, 0x144

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

gUnknown_83A0010:: @ 83A0010
	.incbin "baserom.gba", 0x3A0010, 0x90

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

	.incbin "baserom.gba", 0x3A32AC, 0x68

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

gEventObjectBaseOam_128x64::
	.4byte 0x00000000, 0x00000800
	.4byte 0x00004000, 0x00000800

gEventObjectBaseOam_16x16::
	.4byte 0x40000000, 0x00000800

gEventObjectBaseOam_32x16::
	.4byte 0x80004000, 0x00000800
	.4byte 0x40004000, 0x00000800
	.4byte 0xc0004000, 0x00000800

gEventObjectBaseOam_16x32::
	.4byte 0x80008000, 0x00000800

gEventObjectBaseOam_32x32:: @ 83A3718
	.4byte 0x80000000, 0x00000800

gEventObjectBaseOam_64x64:: @ 83A3720
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
	.incbin "baserom.gba", 0x3A3820, 0x60

gUnknown_83A3880:: @ 83A3880
	.incbin "baserom.gba", 0x3A3880, 0x4

gUnknown_83A3884:: @ 83A3884
	.incbin "baserom.gba", 0x3A3884, 0x4

gUnknown_83A3888:: @ 83A3888
	.incbin "baserom.gba", 0x3A3888, 0x4

gUnknown_83A388C:: @ 83A388C
	.incbin "baserom.gba", 0x3A388C, 0x34

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
	.incbin "baserom.gba", 0x3A3900, 0x3C

gUnknown_83A393C:: @ 83A393C
	.incbin "baserom.gba", 0x3A393C, 0x3C

gUnknown_83A3978:: @ 83A3978
	.incbin "baserom.gba", 0x3A3978, 0x3C

gUnknown_83A39B4:: @ 83A39B4
	.incbin "baserom.gba", 0x3A39B4, 0x6C

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
	.incbin "baserom.gba", 0x3A3A80, 0x40

gUnknown_83A3AC0:: @ 83A3AC0
	.incbin "baserom.gba", 0x3A3AC0, 0x40

gUnknown_83A3B00:: @ 83A3B00
	.incbin "baserom.gba", 0x3A3B00, 0x40

gUnknown_83A3B40:: @ 83A3B40
	.incbin "baserom.gba", 0x3A3B40, 0x70

gObjectEventGraphicsInfo_83A3BB0:: @ 83A3BB0
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3470
	.4byte gSpriteImages_83A00A0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3BD4:: @ 83A3BD4
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0140
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3BF8:: @ 83A3BF8
	.2byte 0xFFFF, 0x1100, 0x11FF, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (1 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3584
	.4byte gSpriteImages_83A0270
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3C1C:: @ 83A3C1C
	.2byte 0xFFFF, 0x1100, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3638
	.4byte gSpriteImages_83A0330
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3C40:: @ 83A3C40
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A04C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3C64:: @ 83A3C64
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0420
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3C88:: @ 83A3C88
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0470
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3CAC:: @ 83A3CAC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0508
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3CD0:: @ 83A3CD0
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0550
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3CF4:: @ 83A3CF4
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A05A0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3D18:: @ 83A3D18
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A05E8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3D3C:: @ 83A3D3C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0638
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3D60:: @ 83A3D60
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0688
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3D84:: @ 83A3D84
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A06D8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3DA8:: @ 83A3DA8
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0C40
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3DCC:: @ 83A3DCC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0720
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3DF0:: @ 83A3DF0
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0770
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3E14:: @ 83A3E14
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A07C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3E38:: @ 83A3E38
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0808
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3E5C:: @ 83A3E5C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0858
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3E80:: @ 83A3E80
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A08A8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3EA4:: @ 83A3EA4
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A08F8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3EC8:: @ 83A3EC8
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0940
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3EEC:: @ 83A3EEC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0988
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3F10:: @ 83A3F10
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A09D8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3F34:: @ 83A3F34
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0A20
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3F58:: @ 83A3F58
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0AB8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3F7C:: @ 83A3F7C
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0B00
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3FA0:: @ 83A3FA0
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0B50
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3FC4:: @ 83A3FC4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0BA0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A3FE8:: @ 83A3FE8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0BF0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A400C:: @ 83A400C
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0C90
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4030:: @ 83A4030
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0CE0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4054:: @ 83A4054
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0D30
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4078:: @ 83A4078
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0D78
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A409C:: @ 83A409C
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0DC8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A40C0:: @ 83A40C0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0E18
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A40E4:: @ 83A40E4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0E68
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4108:: @ 83A4108
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0EB8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A412C:: @ 83A412C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0F08
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4150:: @ 83A4150
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0F58
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4174:: @ 83A4174
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0FA8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4198:: @ 83A4198
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0FF8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A41BC:: @ 83A41BC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1040
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A41E0:: @ 83A41E0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1090
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4204:: @ 83A4204
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A10D8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4228:: @ 83A4228
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1120
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A424C:: @ 83A424C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1170
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4270:: @ 83A4270
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A11C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4294:: @ 83A4294
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1210
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A42B8:: @ 83A42B8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1260
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A42DC:: @ 83A42DC
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A12B0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4300:: @ 83A4300
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A35E4
	.4byte gSpriteImages_83A12F8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4324:: @ 83A4324
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1348
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4348:: @ 83A4348
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1390
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A436C:: @ 83A436C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1398
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4390:: @ 83A4390
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A13E0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A43B4:: @ 83A43B4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1430
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A43D8:: @ 83A43D8
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1480
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A43FC:: @ 83A43FC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A14C8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4420:: @ 83A4420
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0A70
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4444:: @ 83A4444
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3660
	.4byte gSpriteImages_83A1510
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4468:: @ 83A4468
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1530
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A448C:: @ 83A448C
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1578
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A44B0:: @ 83A44B0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A15C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A44D4:: @ 83A44D4
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1608
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A44F8:: @ 83A44F8
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1650
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A451C:: @ 83A451C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3658
	.4byte gSpriteImages_83A1698
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4540:: @ 83A4540
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A16B8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4564:: @ 83A4564
	.2byte 0xFFFF, 0x1110, 0x1102, 0x200, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3470
	.4byte gSpriteImages_83A0188
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4588:: @ 83A4588
	.2byte 0xFFFF, 0x1110, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0228
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A45AC:: @ 83A45AC
	.2byte 0xFFFF, 0x1110, 0x11FF, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (1 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3584
	.4byte gSpriteImages_83A02D0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A45D0:: @ 83A45D0
	.2byte 0xFFFF, 0x1110, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3638
	.4byte gSpriteImages_83A0378
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A45F4:: @ 83A45F4
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 10 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0140
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4618:: @ 83A4618
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A16C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A463C:: @ 83A463C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1708
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4660:: @ 83A4660
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1750
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4684:: @ 83A4684
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1798
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A46A8:: @ 83A46A8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A17E0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A46CC:: @ 83A46CC
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1828
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A46F0:: @ 83A46F0
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1870
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4714:: @ 83A4714
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A18B8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4738:: @ 83A4738
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1900
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A475C:: @ 83A475C
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1948
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4780:: @ 83A4780
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1990
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A47A4:: @ 83A47A4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A19D8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A47C8:: @ 83A47C8
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1A20
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A47EC:: @ 83A47EC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1A68
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4810:: @ 83A4810
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1AB0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4834:: @ 83A4834
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1AF8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4858:: @ 83A4858
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3668
	.4byte gSpriteImages_83A1B40
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A487C:: @ 83A487C
	.2byte 0xFFFF, 0x1110, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3668
	.4byte gSpriteImages_83A1BA0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A48A0:: @ 83A48A0
	.2byte 0xFFFF, 0x1100, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A363C
	.4byte gSpriteImages_83A0330
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A48C4:: @ 83A48C4
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3640
	.4byte gSpriteImages_83A03C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A48E8:: @ 83A48E8
	.2byte 0xFFFF, 0x1100, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A363C
	.4byte gSpriteImages_83A0378
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A490C:: @ 83A490C
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3640
	.4byte gSpriteImages_83A03F0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4930:: @ 83A4930
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 32, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_32x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C00
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4954:: @ 83A4954
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C08
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4978:: @ 83A4978
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1C10
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A499C:: @ 83A499C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1D38
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A49C0:: @ 83A49C0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C58
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A49E4:: @ 83A49E4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C60
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4A08:: @ 83A4A08
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C68
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4A2C:: @ 83A4A2C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C70
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4A50:: @ 83A4A50
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C78
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4A74:: @ 83A4A74
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C80
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4A98:: @ 83A4A98
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C88
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4ABC:: @ 83A4ABC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C90
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4AE0:: @ 83A4AE0
	.2byte 0xFFFF, 0x1113, 0x11FF, 0x200, 32, 32
	.byte 10 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C98
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4B04:: @ 83A4B04
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1CA0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4B28:: @ 83A4B28
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1D80
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4B4C:: @ 83A4B4C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1E10
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4B70:: @ 83A4B70
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1E58
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4B94:: @ 83A4B94
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1EA0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4BB8:: @ 83A4BB8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1EE8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4BDC:: @ 83A4BDC
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1F30
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4C00:: @ 83A4C00
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1F78
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4C24:: @ 83A4C24
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1FC0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4C48:: @ 83A4C48
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2008
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4C6C:: @ 83A4C6C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2050
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4C90:: @ 83A4C90
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2098
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4CB4:: @ 83A4CB4
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A20E0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4CD8:: @ 83A4CD8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2128
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4CFC:: @ 83A4CFC
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2170
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4D20:: @ 83A4D20
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A21B8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4D44:: @ 83A4D44
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2200
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4D68:: @ 83A4D68
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2248
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4D8C:: @ 83A4D8C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2290
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4DB0:: @ 83A4DB0
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A22D8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4DD4:: @ 83A4DD4
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2320
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4DF8:: @ 83A4DF8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2368
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4E1C:: @ 83A4E1C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A23B0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4E40:: @ 83A4E40
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A23F8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4E64:: @ 83A4E64
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2440
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4E88:: @ 83A4E88
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2488
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4EAC:: @ 83A4EAC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A24D0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4ED0:: @ 83A4ED0
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2518
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4EF4:: @ 83A4EF4
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2560
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4F18:: @ 83A4F18
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A25A8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4F3C:: @ 83A4F3C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A33BC
	.4byte gSpriteImages_83A25F0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4F60:: @ 83A4F60
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2638
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4F84:: @ 83A4F84
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2680
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4FA8:: @ 83A4FA8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2878
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4FCC:: @ 83A4FCC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A28C0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A4FF0:: @ 83A4FF0
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A26C8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A5014:: @ 83A5014
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1DC8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A5038:: @ 83A5038
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2710
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A505C:: @ 83A505C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2758
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A5080:: @ 83A5080
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A27A0
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A50A4:: @ 83A50A4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A27E8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A50C8:: @ 83A50C8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2830
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A50EC:: @ 83A50EC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2908
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A5110:: @ 83A5110
	.2byte 0xFFFF, 0x1114, 0x11FF, 0x800, 64, 64
	.byte 10 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_64x64
	.4byte gSubspriteTables_83A38D0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1CA8
	.4byte gDummySpriteAffineAnimTable

gObjectEventGraphicsInfo_83A5134:: @ 83A5134
	.2byte 0xFFFF, 0x1115, 0x11FF, 0x1000, 128, 64
	.byte 10 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_128x64
	.4byte gSubspriteTables_83A3A50
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1CF0
	.4byte gDummySpriteAffineAnimTable

gObjectEventSpritePalettes:: @ 83A5158
	.4byte gUnknown_836D828
	.2byte 0x1103
	.2byte 0x0000
	.4byte gUnknown_836D848
	.2byte 0x1104
	.2byte 0x0000
	.4byte gUnknown_836D868
	.2byte 0x1105
	.2byte 0x0000
	.4byte gUnknown_836D888
	.2byte 0x1106
	.2byte 0x0000
	.4byte gUnknown_836D8A8
	.2byte 0x1107
	.2byte 0x0000
	.4byte gUnknown_836D8C8
	.2byte 0x1108
	.2byte 0x0000
	.4byte gUnknown_836D8E8
	.2byte 0x1109
	.2byte 0x0000
	.4byte gUnknown_836D908
	.2byte 0x110a
	.2byte 0x0000
	.4byte gUnknown_835B968
	.2byte 0x1100
	.2byte 0x0000
	.4byte gUnknown_835E968
	.2byte 0x1101
	.2byte 0x0000
	.4byte gUnknown_835E988
	.2byte 0x1102
	.2byte 0x0000
	.4byte gUnknown_8398008
	.2byte 0x110b
	.2byte 0x0000
	.4byte gUnknown_8398028
	.2byte 0x110c
	.2byte 0x0000
	.4byte gUnknown_835B968
	.2byte 0x1110
	.2byte 0x0000
	.4byte gUnknown_835E968
	.2byte 0x1111
	.2byte 0x0000
	.4byte gUnknown_8394EA8
	.2byte 0x1113
	.2byte 0x0000
	.4byte gUnknown_8395AE8
	.2byte 0x1115
	.2byte 0x0000
	.4byte gUnknown_83952C8
	.2byte 0x1114
	.2byte 0x0000
	.4byte NULL
	.2byte 0x0000
	.2byte 0x0000

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
	.4byte gUnknown_8398FA8
	.2byte 0x1004
	.2byte 0x0

gUnknown_83A5348:: @ 83A5348
	.incbin "baserom.gba", 0x3A5348, 0x8

gUnknown_83A5350:: @ 83A5350
	.incbin "baserom.gba", 0x3A5350, 0x8

gUnknown_83A5358:: @ 83A5358
	.incbin "baserom.gba", 0x3A5358, 0x4

gUnknown_83A535C:: @ 83A535C
	.incbin "baserom.gba", 0x3A535C, 0x8

gUnknown_83A5364:: @ 83A5364
	.incbin "baserom.gba", 0x3A5364, 0x8

gUnknown_83A536C:: @ 83A536C
	.incbin "baserom.gba", 0x3A536C, 0x8

gUnknown_83A5374:: @ 83A5374
	.incbin "baserom.gba", 0x3A5374, 0x8

gUnknown_83A537C:: @ 83A537C
	.incbin "baserom.gba", 0x3A537C, 0x18

gUnknown_83A5394:: @ 83A5394
	.incbin "baserom.gba", 0x3A5394, 0x18

gUnknown_83A53AC:: @ 83A53AC
	.incbin "baserom.gba", 0x3A53AC, 0x18

gUnknown_83A53C4:: @ 83A53C4
	.incbin "baserom.gba", 0x3A53C4, 0x18

gUnknown_83A53DC:: @ 83A53DC
	.incbin "baserom.gba", 0x3A53DC, 0x28

gUnknown_83A5404:: @ 83A5404
	.incbin "baserom.gba", 0x3A5404, 0x18

gUnknown_83A541C:: @ 83A541C
	.incbin "baserom.gba", 0x3A541C, 0x4

gUnknown_83A5420:: @ 83A5420
	.incbin "baserom.gba", 0x3A5420, 0x18

gUnknown_83A5438:: @ 83A5438
	.incbin "baserom.gba", 0x3A5438, 0x28

gUnknown_83A5460:: @ 83A5460
	.incbin "baserom.gba", 0x3A5460, 0x24

gUnknown_83A5484:: @ 83A5484
	.incbin "baserom.gba", 0x3A5484, 0x4

gUnknown_83A5488:: @ 83A5488
	.incbin "baserom.gba", 0x3A5488, 0x18

gUnknown_83A54A0:: @ 83A54A0
	.incbin "baserom.gba", 0x3A54A0, 0x28

gUnknown_83A54C8:: @ 83A54C8
	.incbin "baserom.gba", 0x3A54C8, 0x18

gUnknown_83A54E0:: @ 83A54E0
	.incbin "baserom.gba", 0x3A54E0, 0x4

gUnknown_83A54E4:: @ 83A54E4
	.incbin "baserom.gba", 0x3A54E4, 0x18

gUnknown_83A54FC:: @ 83A54FC
	.incbin "baserom.gba", 0x3A54FC, 0x30

gUnknown_83A552C:: @ 83A552C
	.incbin "baserom.gba", 0x3A552C, 0xC

gUnknown_83A5538:: @ 83A5538
	.incbin "baserom.gba", 0x3A5538, 0xC

gUnknown_83A5544:: @ 83A5544
	.incbin "baserom.gba", 0x3A5544, 0xC

gUnknown_83A5550:: @ 83A5550
	.incbin "baserom.gba", 0x3A5550, 0xC

gUnknown_83A555C:: @ 83A555C
	.incbin "baserom.gba", 0x3A555C, 0x10

gUnknown_83A556C:: @ 83A556C
	.incbin "baserom.gba", 0x3A556C, 0x18

gUnknown_83A5584:: @ 83A5584
	.incbin "baserom.gba", 0x3A5584, 0x40

gUnknown_83A55C4:: @ 83A55C4
	.incbin "baserom.gba", 0x3A55C4, 0xC

gUnknown_83A55D0:: @ 83A55D0
	.incbin "baserom.gba", 0x3A55D0, 0xC

gUnknown_83A55DC:: @ 83A55DC
	.incbin "baserom.gba", 0x3A55DC, 0xC

gUnknown_83A55E8:: @ 83A55E8
	.incbin "baserom.gba", 0x3A55E8, 0xC

gUnknown_83A55F4:: @ 83A55F4
	.incbin "baserom.gba", 0x3A55F4, 0x10

gUnknown_83A5604:: @ 83A5604
	.incbin "baserom.gba", 0x3A5604, 0x18

gUnknown_83A561C:: @ 83A561C
	.incbin "baserom.gba", 0x3A561C, 0x18

gUnknown_83A5634:: @ 83A5634
	.incbin "baserom.gba", 0x3A5634, 0x10

gUnknown_83A5644:: @ 83A5644
	.incbin "baserom.gba", 0x3A5644, 0x4

gUnknown_83A5648:: @ 83A5648
	.incbin "baserom.gba", 0x3A5648, 0x18

gUnknown_83A5660:: @ 83A5660
	.incbin "baserom.gba", 0x3A5660, 0x20

gUnknown_83A5680:: @ 83A5680
	.incbin "baserom.gba", 0x3A5680, 0x14

gUnknown_83A5694:: @ 83A5694
	.incbin "baserom.gba", 0x3A5694, 0x4

gUnknown_83A5698:: @ 83A5698
	.incbin "baserom.gba", 0x3A5698, 0x18

gUnknown_83A56B0:: @ 83A56B0
	.incbin "baserom.gba", 0x3A56B0, 0x10

gUnknown_83A56C0:: @ 83A56C0
	.incbin "baserom.gba", 0x3A56C0, 0x8

gUnknown_83A56C8:: @ 83A56C8
	.incbin "baserom.gba", 0x3A56C8, 0x8

gUnknown_83A56D0:: @ 83A56D0
	.incbin "baserom.gba", 0x3A56D0, 0x8

gUnknown_83A56D8:: @ 83A56D8
	.incbin "baserom.gba", 0x3A56D8, 0x8

gUnknown_83A56E0:: @ 83A56E0
	.incbin "baserom.gba", 0x3A56E0, 0x14

gUnknown_83A56F4:: @ 83A56F4
	.incbin "baserom.gba", 0x3A56F4, 0x18

gUnknown_83A570C:: @ 83A570C
	.incbin "baserom.gba", 0x3A570C, 0x10

gUnknown_83A571C:: @ 83A571C
	.incbin "baserom.gba", 0x3A571C, 0x8

gUnknown_83A5724:: @ 83A5724
	.incbin "baserom.gba", 0x3A5724, 0x8

gUnknown_83A572C:: @ 83A572C
	.incbin "baserom.gba", 0x3A572C, 0x8

gUnknown_83A5734:: @ 83A5734
	.incbin "baserom.gba", 0x3A5734, 0x8

gUnknown_83A573C:: @ 83A573C
	.incbin "baserom.gba", 0x3A573C, 0x14

gUnknown_83A5750:: @ 83A5750
	.incbin "baserom.gba", 0x3A5750, 0x18

gUnknown_83A5768:: @ 83A5768
	.incbin "baserom.gba", 0x3A5768, 0x20

gUnknown_83A5788:: @ 83A5788
	.incbin "baserom.gba", 0x3A5788, 0x8

gUnknown_83A5790:: @ 83A5790
	.incbin "baserom.gba", 0x3A5790, 0x8

gUnknown_83A5798:: @ 83A5798
	.incbin "baserom.gba", 0x3A5798, 0x8

gUnknown_83A57A0:: @ 83A57A0
	.incbin "baserom.gba", 0x3A57A0, 0x8

gUnknown_83A57A8:: @ 83A57A8
	.incbin "baserom.gba", 0x3A57A8, 0x8

gUnknown_83A57B0:: @ 83A57B0
	.incbin "baserom.gba", 0x3A57B0, 0x8

gUnknown_83A57B8:: @ 83A57B8
	.incbin "baserom.gba", 0x3A57B8, 0x8

gUnknown_83A57C0:: @ 83A57C0
	.incbin "baserom.gba", 0x3A57C0, 0x8

gUnknown_83A57C8:: @ 83A57C8
	.incbin "baserom.gba", 0x3A57C8, 0x24

gUnknown_83A57EC:: @ 83A57EC
	.incbin "baserom.gba", 0x3A57EC, 0x18

gUnknown_83A5804:: @ 83A5804
	.incbin "baserom.gba", 0x3A5804, 0x20

gUnknown_83A5824:: @ 83A5824
	.incbin "baserom.gba", 0x3A5824, 0x14

gUnknown_83A5838:: @ 83A5838
	.incbin "baserom.gba", 0x3A5838, 0x4

gUnknown_83A583C:: @ 83A583C
	.incbin "baserom.gba", 0x3A583C, 0x18

gUnknown_83A5854:: @ 83A5854
	.incbin "baserom.gba", 0x3A5854, 0x10

gUnknown_83A5864:: @ 83A5864
	.incbin "baserom.gba", 0x3A5864, 0xC

gUnknown_83A5870:: @ 83A5870
	.incbin "baserom.gba", 0x3A5870, 0x24

gUnknown_83A5894:: @ 83A5894
	.incbin "baserom.gba", 0x3A5894, 0x8

gUnknown_83A589C:: @ 83A589C
	.incbin "baserom.gba", 0x3A589C, 0x18

gUnknown_83A58B4:: @ 83A58B4
	.incbin "baserom.gba", 0x3A58B4, 0x18

gUnknown_83A58CC:: @ 83A58CC
	.incbin "baserom.gba", 0x3A58CC, 0x10

gUnknown_83A58DC:: @ 83A58DC
	.incbin "baserom.gba", 0x3A58DC, 0x4

gUnknown_83A58E0:: @ 83A58E0
	.incbin "baserom.gba", 0x3A58E0, 0x18

gUnknown_83A58F8:: @ 83A58F8
	.incbin "baserom.gba", 0x3A58F8, 0x20

gUnknown_83A5918:: @ 83A5918
	.incbin "baserom.gba", 0x3A5918, 0x20

gUnknown_83A5938:: @ 83A5938
	.incbin "baserom.gba", 0x3A5938, 0x4

gUnknown_83A593C:: @ 83A593C
	.incbin "baserom.gba", 0x3A593C, 0x18

gUnknown_83A5954:: @ 83A5954
	.incbin "baserom.gba", 0x3A5954, 0x30

gUnknown_83A5984:: @ 83A5984
	.incbin "baserom.gba", 0x3A5984, 0x1C

gUnknown_83A59A0:: @ 83A59A0
	.incbin "baserom.gba", 0x3A59A0, 0x4

gUnknown_83A59A4:: @ 83A59A4
	.incbin "baserom.gba", 0x3A59A4, 0x18

gUnknown_83A59BC:: @ 83A59BC
	.incbin "baserom.gba", 0x3A59BC, 0x48

gUnknown_83A5A04:: @ 83A5A04
	.incbin "baserom.gba", 0x3A5A04, 0x28

gUnknown_83A5A2C:: @ 83A5A2C
	.incbin "baserom.gba", 0x3A5A2C, 0x4

gUnknown_83A5A30:: @ 83A5A30
	.incbin "baserom.gba", 0x3A5A30, 0x18

gUnknown_83A5A48:: @ 83A5A48
	.incbin "baserom.gba", 0x3A5A48, 0x20

gUnknown_83A5A68:: @ 83A5A68
	.incbin "baserom.gba", 0x3A5A68, 0x1C

gUnknown_83A5A84:: @ 83A5A84
	.incbin "baserom.gba", 0x3A5A84, 0x4

gUnknown_83A5A88:: @ 83A5A88
	.incbin "baserom.gba", 0x3A5A88, 0x18

gUnknown_83A5AA0:: @ 83A5AA0
	.incbin "baserom.gba", 0x3A5AA0, 0x20

gUnknown_83A5AC0:: @ 83A5AC0
	.incbin "baserom.gba", 0x3A5AC0, 0x14

gUnknown_83A5AD4:: @ 83A5AD4
	.incbin "baserom.gba", 0x3A5AD4, 0x4

gUnknown_83A5AD8:: @ 83A5AD8
	.incbin "baserom.gba", 0x3A5AD8, 0x18

gUnknown_83A5AF0:: @ 83A5AF0
	.incbin "baserom.gba", 0x3A5AF0, 0x18

gUnknown_83A5B08:: @ 83A5B08
	.incbin "baserom.gba", 0x3A5B08, 0x10

gUnknown_83A5B18:: @ 83A5B18
	.incbin "baserom.gba", 0x3A5B18, 0x4

gUnknown_83A5B1C:: @ 83A5B1C
	.incbin "baserom.gba", 0x3A5B1C, 0x18

gUnknown_83A5B34:: @ 83A5B34
	.incbin "baserom.gba", 0x3A5B34, 0x20

gUnknown_83A5B54:: @ 83A5B54
	.incbin "baserom.gba", 0x3A5B54, 0x1C

gUnknown_83A5B70:: @ 83A5B70
	.incbin "baserom.gba", 0x3A5B70, 0x4

gUnknown_83A5B74:: @ 83A5B74
	.incbin "baserom.gba", 0x3A5B74, 0x18

gUnknown_83A5B8C:: @ 83A5B8C
	.incbin "baserom.gba", 0x3A5B8C, 0x50

gUnknown_83A5BDC:: @ 83A5BDC
	.incbin "baserom.gba", 0x3A5BDC, 0x50

gUnknown_83A5C2C:: @ 83A5C2C
	.incbin "baserom.gba", 0x3A5C2C, 0x8

gUnknown_83A5C34:: @ 83A5C34
	.incbin "baserom.gba", 0x3A5C34, 0x18

gUnknown_83A5C4C:: @ 83A5C4C
	.incbin "baserom.gba", 0x3A5C4C, 0x38

gUnknown_83A5C84:: @ 83A5C84
	.incbin "baserom.gba", 0x3A5C84, 0x8

gUnknown_83A5C8C:: @ 83A5C8C
	.incbin "baserom.gba", 0x3A5C8C, 0x20

gUnknown_83A5CAC:: @ 83A5CAC
	.incbin "baserom.gba", 0x3A5CAC, 0x8

gUnknown_83A5CB4:: @ 83A5CB4
	.incbin "baserom.gba", 0x3A5CB4, 0x18

gUnknown_83A5CCC:: @ 83A5CCC
	.incbin "baserom.gba", 0x3A5CCC, 0x38

gUnknown_83A5D04:: @ 83A5D04
	.incbin "baserom.gba", 0x3A5D04, 0x8

gUnknown_83A5D0C:: @ 83A5D0C
	.incbin "baserom.gba", 0x3A5D0C, 0x20

gUnknown_83A5D2C:: @ 83A5D2C
	.incbin "baserom.gba", 0x3A5D2C, 0x8

gUnknown_83A5D34:: @ 83A5D34
	.incbin "baserom.gba", 0x3A5D34, 0x18

gUnknown_83A5D4C:: @ 83A5D4C
	.incbin "baserom.gba", 0x3A5D4C, 0x38

gUnknown_83A5D84:: @ 83A5D84
	.incbin "baserom.gba", 0x3A5D84, 0x18

gUnknown_83A5D9C:: @ 83A5D9C
	.incbin "baserom.gba", 0x3A5D9C, 0x28

gUnknown_83A5DC4:: @ 83A5DC4
	.incbin "baserom.gba", 0x3A5DC4, 0x8

gUnknown_83A5DCC:: @ 83A5DCC
	.incbin "baserom.gba", 0x3A5DCC, 0x8

gUnknown_83A5DD4:: @ 83A5DD4
	.incbin "baserom.gba", 0x3A5DD4, 0x8

gUnknown_83A5DDC:: @ 83A5DDC
	.incbin "baserom.gba", 0x3A5DDC, 0x8

gUnknown_83A5DE4:: @ 83A5DE4
	.incbin "baserom.gba", 0x3A5DE4, 0x8

gUnknown_83A5DEC:: @ 83A5DEC
	.incbin "baserom.gba", 0x3A5DEC, 0x14

gUnknown_83A5E00:: @ 83A5E00
	.incbin "baserom.gba", 0x3A5E00, 0x18

gUnknown_83A5E18:: @ 83A5E18
	.incbin "baserom.gba", 0x3A5E18, 0x10

gUnknown_83A5E28:: @ 83A5E28
	.incbin "baserom.gba", 0x3A5E28, 0xC

gUnknown_83A5E34:: @ 83A5E34
	.incbin "baserom.gba", 0x3A5E34, 0x4

gUnknown_83A5E38:: @ 83A5E38
	.incbin "baserom.gba", 0x3A5E38, 0x18

gUnknown_83A5E50:: @ 83A5E50
	.incbin "baserom.gba", 0x3A5E50, 0x8

gUnknown_83A5E58:: @ 83A5E58
	.incbin "baserom.gba", 0x3A5E58, 0x8

gUnknown_83A5E60:: @ 83A5E60
	.incbin "baserom.gba", 0x3A5E60, 0x4

gUnknown_83A5E64:: @ 83A5E64
	.incbin "baserom.gba", 0x3A5E64, 0x18

gUnknown_83A5E7C:: @ 83A5E7C
	.incbin "baserom.gba", 0x3A5E7C, 0x28

gUnknown_83A5EA4:: @ 83A5EA4
	.incbin "baserom.gba", 0x3A5EA4, 0x18

gUnknown_83A5EBC:: @ 83A5EBC
	.incbin "baserom.gba", 0x3A5EBC, 0x4

gUnknown_83A5EC0:: @ 83A5EC0
	.incbin "baserom.gba", 0x3A5EC0, 0x18

gUnknown_83A5ED8:: @ 83A5ED8
	.incbin "baserom.gba", 0x3A5ED8, 0x8

gUnknown_83A5EE0:: @ 83A5EE0
	.incbin "baserom.gba", 0x3A5EE0, 0x28

gUnknown_83A5F08:: @ 83A5F08
	.incbin "baserom.gba", 0x3A5F08, 0x18

gUnknown_83A5F20:: @ 83A5F20
	.incbin "baserom.gba", 0x3A5F20, 0x4

gUnknown_83A5F24:: @ 83A5F24
	.incbin "baserom.gba", 0x3A5F24, 0x18

gUnknown_83A5F3C:: @ 83A5F3C
	.incbin "baserom.gba", 0x3A5F3C, 0x40

gUnknown_83A5F7C:: @ 83A5F7C
	.incbin "baserom.gba", 0x3A5F7C, 0x24

gUnknown_83A5FA0:: @ 83A5FA0
	.incbin "baserom.gba", 0x3A5FA0, 0x4

gUnknown_83A5FA4:: @ 83A5FA4
	.incbin "baserom.gba", 0x3A5FA4, 0x18

gUnknown_83A5FBC:: @ 83A5FBC
	.incbin "baserom.gba", 0x3A5FBC, 0x10

gUnknown_83A5FCC:: @ 83A5FCC
	.incbin "baserom.gba", 0x3A5FCC, 0x10

gUnknown_83A5FDC:: @ 83A5FDC
	.incbin "baserom.gba", 0x3A5FDC, 0x4

gUnknown_83A5FE0:: @ 83A5FE0
	.incbin "baserom.gba", 0x3A5FE0, 0x18

gUnknown_83A5FF8::
	.incbin "baserom.gba", 0x3A5FF8, 0x8

gUnknown_83A6000:: @ 83A6000
	.incbin "baserom.gba", 0x3A6000, 0x10

gUnknown_83A6010:: @ 83A6010
	.incbin "baserom.gba", 0x3A6010, 0x8

gUnknown_83A6018:: @ 83A6018
	.incbin "baserom.gba", 0x3A6018, 0x1C

gUnknown_83A6034:: @ 83A6034
	.incbin "baserom.gba", 0x3A6034, 0x1C

gUnknown_83A6050:: @ 83A6050
	.incbin "baserom.gba", 0x3A6050, 0x4

gUnknown_83A6054:: @ 83A6054
	.incbin "baserom.gba", 0x3A6054, 0x2C

gUnknown_83A6080:: @ 83A6080
	.incbin "baserom.gba", 0x3A6080, 0x14

gUnknown_83A6094:: @ 83A6094
	.incbin "baserom.gba", 0x3A6094, 0x1C

gUnknown_83A60B0:: @ 83A60B0
	.incbin "baserom.gba", 0x3A60B0, 0x4

gUnknown_83A60B4:: @ 83A60B4
	.incbin "baserom.gba", 0x3A60B4, 0x1C

gUnknown_83A60D0:: @ 83A60D0
	.incbin "baserom.gba", 0x3A60D0, 0x4

gUnknown_83A60D4:: @ 83A60D4
	.incbin "baserom.gba", 0x3A60D4, 0xC

gUnknown_83A60E0:: @ 83A60E0
	.incbin "baserom.gba", 0x3A60E0, 0x14

gUnknown_83A60F4:: @ 83A60F4
	.incbin "baserom.gba", 0x3A60F4, 0x14

gUnknown_83A6108:: @ 83A6108
	.incbin "baserom.gba", 0x3A6108, 0x14

gUnknown_83A611C:: @ 83A611C
	.incbin "baserom.gba", 0x3A611C, 0x4

gUnknown_83A6120:: @ 83A6120
	.incbin "baserom.gba", 0x3A6120, 0x14

gUnknown_83A6134:: @ 83A6134
	.incbin "baserom.gba", 0x3A6134, 0x4

gUnknown_83A6138:: @ 83A6138
	.incbin "baserom.gba", 0x3A6138, 0x14

gUnknown_83A614C:: @ 83A614C
	.incbin "baserom.gba", 0x3A614C, 0x4

gUnknown_83A6150:: @ 83A6150
	.incbin "baserom.gba", 0x3A6150, 0x14

gUnknown_83A6164:: @ 83A6164
	.incbin "baserom.gba", 0x3A6164, 0x4

gUnknown_83A6168:: @ 83A6168
	.incbin "baserom.gba", 0x3A6168, 0x14

gUnknown_83A617C:: @ 83A617C
	.incbin "baserom.gba", 0x3A617C, 0x4

gUnknown_83A6180:: @ 83A6180
	.incbin "baserom.gba", 0x3A6180, 0x14

gUnknown_83A6194:: @ 83A6194
	.incbin "baserom.gba", 0x3A6194, 0x4

gUnknown_83A6198:: @ 83A6198
	.incbin "baserom.gba", 0x3A6198, 0x14

gUnknown_83A61AC:: @ 83A61AC
	.incbin "baserom.gba", 0x3A61AC, 0x4

gUnknown_83A61B0:: @ 83A61B0
	.incbin "baserom.gba", 0x3A61B0, 0x14

gUnknown_83A61C4:: @ 83A61C4
	.incbin "baserom.gba", 0x3A61C4, 0x4

gUnknown_83A61C8:: @ 83A61C8
	.incbin "baserom.gba", 0x3A61C8, 0x10

gUnknown_83A61D8:: @ 83A61D8
	.incbin "baserom.gba", 0x3A61D8, 0x8

gUnknown_83A61E0:: @ 83A61E0
	.incbin "baserom.gba", 0x3A61E0, 0x10

gUnknown_83A61F0:: @ 83A61F0
	.incbin "baserom.gba", 0x3A61F0, 0x8

gUnknown_83A61F8:: @ 83A61F8
	.incbin "baserom.gba", 0x3A61F8, 0x10

gUnknown_83A6208:: @ 83A6208
	.incbin "baserom.gba", 0x3A6208, 0xC

gUnknown_83A6214:: @ 83A6214
	.incbin "baserom.gba", 0x3A6214, 0x4

gUnknown_83A6218:: @ 83A6218
	.incbin "baserom.gba", 0x3A6218, 0xC

gUnknown_83A6224:: @ 83A6224
	.incbin "baserom.gba", 0x3A6224, 0x4

gUnknown_83A6228:: @ 83A6228
	.incbin "baserom.gba", 0x3A6228, 0xC

gUnknown_83A6234:: @ 83A6234
	.incbin "baserom.gba", 0x3A6234, 0x4

gUnknown_83A6238:: @ 83A6238
	.incbin "baserom.gba", 0x3A6238, 0xC

gUnknown_83A6244:: @ 83A6244
	.incbin "baserom.gba", 0x3A6244, 0x4

gUnknown_83A6248:: @ 83A6248
	.incbin "baserom.gba", 0x3A6248, 0xC

gUnknown_83A6254:: @ 83A6254
	.incbin "baserom.gba", 0x3A6254, 0x4

gUnknown_83A6258:: @ 83A6258
	.incbin "baserom.gba", 0x3A6258, 0xC

gUnknown_83A6264:: @ 83A6264
	.incbin "baserom.gba", 0x3A6264, 0x4

gUnknown_83A6268:: @ 83A6268
	.incbin "baserom.gba", 0x3A6268, 0xC

gUnknown_83A6274:: @ 83A6274
	.incbin "baserom.gba", 0x3A6274, 0xC

gUnknown_83A6280:: @ 83A6280
	.incbin "baserom.gba", 0x3A6280, 0x4

gUnknown_83A6284:: @ 83A6284
	.incbin "baserom.gba", 0x3A6284, 0xC

gUnknown_83A6290:: @ 83A6290
	.incbin "baserom.gba", 0x3A6290, 0x4

gUnknown_83A6294:: @ 83A6294
	.incbin "baserom.gba", 0x3A6294, 0xC

gUnknown_83A62A0:: @ 83A62A0
	.incbin "baserom.gba", 0x3A62A0, 0x4

gUnknown_83A62A4:: @ 83A62A4
	.incbin "baserom.gba", 0x3A62A4, 0xC

gUnknown_83A62B0:: @ 83A62B0
	.incbin "baserom.gba", 0x3A62B0, 0x4

gUnknown_83A62B4:: @ 83A62B4
	.incbin "baserom.gba", 0x3A62B4, 0xC

gUnknown_83A62C0:: @ 83A62C0
	.incbin "baserom.gba", 0x3A62C0, 0x4

gUnknown_83A62C4:: @ 83A62C4
	.incbin "baserom.gba", 0x3A62C4, 0xC

gUnknown_83A62D0:: @ 83A62D0
	.incbin "baserom.gba", 0x3A62D0, 0x4

gUnknown_83A62D4:: @ 83A62D4
	.incbin "baserom.gba", 0x3A62D4, 0xC

gUnknown_83A62E0:: @ 83A62E0
	.incbin "baserom.gba", 0x3A62E0, 0x4

gUnknown_83A62E4:: @ 83A62E4
	.incbin "baserom.gba", 0x3A62E4, 0xC

gUnknown_83A62F0:: @ 83A62F0
	.incbin "baserom.gba", 0x3A62F0, 0x4

gUnknown_83A62F4:: @ 83A62F4
	.incbin "baserom.gba", 0x3A62F4, 0xC

gUnknown_83A6300:: @ 83A6300
	.incbin "baserom.gba", 0x3A6300, 0x4

gUnknown_83A6304:: @ 83A6304
	.incbin "baserom.gba", 0x3A6304, 0xC

gUnknown_83A6310:: @ 83A6310
	.incbin "baserom.gba", 0x3A6310, 0x4

gUnknown_83A6314:: @ 83A6314
	.incbin "baserom.gba", 0x3A6314, 0xC

gUnknown_83A6320:: @ 83A6320
	.incbin "baserom.gba", 0x3A6320, 0x4

gUnknown_83A6324:: @ 83A6324
	.incbin "baserom.gba", 0x3A6324, 0xC

gUnknown_83A6330:: @ 83A6330
	.incbin "baserom.gba", 0x3A6330, 0x4

gUnknown_83A6334:: @ 83A6334
	.incbin "baserom.gba", 0x3A6334, 0xC

gUnknown_83A6340:: @ 83A6340
	.incbin "baserom.gba", 0x3A6340, 0x4

gUnknown_83A6344:: @ 83A6344
	.incbin "baserom.gba", 0x3A6344, 0xC

gUnknown_83A6350:: @ 83A6350
	.incbin "baserom.gba", 0x3A6350, 0x4

gUnknown_83A6354:: @ 83A6354
	.incbin "baserom.gba", 0x3A6354, 0xC

gUnknown_83A6360:: @ 83A6360
	.incbin "baserom.gba", 0x3A6360, 0x4

gUnknown_83A6364:: @ 83A6364
	.incbin "baserom.gba", 0x3A6364, 0xC

gUnknown_83A6370:: @ 83A6370
	.incbin "baserom.gba", 0x3A6370, 0x4

gUnknown_83A6374:: @ 83A6374
	.incbin "baserom.gba", 0x3A6374, 0xC

gUnknown_83A6380:: @ 83A6380
	.incbin "baserom.gba", 0x3A6380, 0x4

gUnknown_83A6384:: @ 83A6384
	.incbin "baserom.gba", 0x3A6384, 0xC

gUnknown_83A6390:: @ 83A6390
	.incbin "baserom.gba", 0x3A6390, 0x2C

gUnknown_83A63BC:: @ 83A63BC
	.incbin "baserom.gba", 0x3A63BC, 0xC

gUnknown_83A63C8:: @ 83A63C8
	.incbin "baserom.gba", 0x3A63C8, 0x4

gUnknown_83A63CC:: @ 83A63CC
	.incbin "baserom.gba", 0x3A63CC, 0x8

gUnknown_83A63D4:: @ 83A63D4
	.incbin "baserom.gba", 0x3A63D4, 0x8

gUnknown_83A63DC:: @ 83A63DC
	.incbin "baserom.gba", 0x3A63DC, 0x8

gUnknown_83A63E4:: @ 83A63E4
	.incbin "baserom.gba", 0x3A63E4, 0xC

gUnknown_83A63F0:: @ 83A63F0
	.incbin "baserom.gba", 0x3A63F0, 0xC

gUnknown_83A63FC:: @ 83A63FC
	.incbin "baserom.gba", 0x3A63FC, 0x8

gUnknown_83A6404:: @ 83A6404
	.incbin "baserom.gba", 0x3A6404, 0x8

gUnknown_83A640C:: @ 83A640C
	.incbin "baserom.gba", 0x3A640C, 0x9

gUnknown_83A6415:: @ 83A6415
	.incbin "baserom.gba", 0x3A6415, 0x9

gUnknown_83A641E:: @ 83A641E
	.incbin "baserom.gba", 0x3A641E, 0x9

gUnknown_83A6427:: @ 83A6427
	.incbin "baserom.gba", 0x3A6427, 0x9

gUnknown_83A6430:: @ 83A6430
	.incbin "baserom.gba", 0x3A6430, 0x9

gUnknown_83A6439:: @ 83A6439
	.incbin "baserom.gba", 0x3A6439, 0x9

gUnknown_83A6442:: @ 83A6442
	.incbin "baserom.gba", 0x3A6442, 0x9

gUnknown_83A644B:: @ 83A644B
	.incbin "baserom.gba", 0x3A644B, 0x9

gUnknown_83A6454:: @ 83A6454
	.incbin "baserom.gba", 0x3A6454, 0x9

gUnknown_83A645D:: @ 83A645D
	.incbin "baserom.gba", 0x3A645D, 0x9

gUnknown_83A6466:: @ 83A6466
	.incbin "baserom.gba", 0x3A6466, 0x9

gUnknown_83A646F:: @ 83A646F
	.incbin "baserom.gba", 0x3A646F, 0x9

gUnknown_83A6478:: @ 83A6478
	.incbin "baserom.gba", 0x3A6478, 0x9

gUnknown_83A6481:: @ 83A6481
	.incbin "baserom.gba", 0x3A6481, 0x9

gUnknown_83A648A:: @ 83A648A
	.incbin "baserom.gba", 0x3A648A, 0x9

gUnknown_83A6493:: @ 83A6493
	.incbin "baserom.gba", 0x3A6493, 0x9

gUnknown_83A649C:: @ 83A649C
	.incbin "baserom.gba", 0x3A649C, 0xC

gUnknown_83A64A8:: @ 83A64A8
	.incbin "baserom.gba", 0x3A64A8, 0x10

gUnknown_83A64B8:: @ 83A64B8
	.incbin "baserom.gba", 0x3A64B8, 0x10

gUnknown_83A64C8:: @ 83A64C8
	.incbin "baserom.gba", 0x3A64C8, 0x24

gUnknown_83A64EC:: @ 83A64EC
	.incbin "baserom.gba", 0x3A64EC, 0x5

gUnknown_83A64F1:: @ 83A64F1
	.incbin "baserom.gba", 0x3A64F1, 0x5

gUnknown_83A64F6:: @ 83A64F6
	.incbin "baserom.gba", 0x3A64F6, 0x5

gUnknown_83A64FB:: @ 83A64FB
	.incbin "baserom.gba", 0x3A64FB, 0x5

gUnknown_83A6500:: @ 83A6500
	.incbin "baserom.gba", 0x3A6500, 0x5

gUnknown_83A6505:: @ 83A6505
	.incbin "baserom.gba", 0x3A6505, 0x5

gUnknown_83A650A:: @ 83A650A
	.incbin "baserom.gba", 0x3A650A, 0x5

gUnknown_83A650F:: @ 83A650F
	.incbin "baserom.gba", 0x3A650F, 0x5

gUnknown_83A6514:: @ 83A6514
	.incbin "baserom.gba", 0x3A6514, 0x5

gUnknown_83A6519:: @ 83A6519
	.incbin "baserom.gba", 0x3A6519, 0x5

gUnknown_83A651E:: @ 83A651E
	.incbin "baserom.gba", 0x3A651E, 0x5

gUnknown_83A6523:: @ 83A6523
	.incbin "baserom.gba", 0x3A6523, 0x5

gUnknown_83A6528:: @ 83A6528
	.incbin "baserom.gba", 0x3A6528, 0x5

gUnknown_83A652D:: @ 83A652D
	.incbin "baserom.gba", 0x3A652D, 0x5

gUnknown_83A6532:: @ 83A6532
	.incbin "baserom.gba", 0x3A6532, 0x5

gUnknown_83A6537:: @ 83A6537
	.incbin "baserom.gba", 0x3A6537, 0x5

gUnknown_83A653C:: @ 83A653C
	.incbin "baserom.gba", 0x3A653C, 0x5

gUnknown_83A6541:: @ 83A6541
	.incbin "baserom.gba", 0x3A6541, 0x5

gUnknown_83A6546:: @ 83A6546
	.incbin "baserom.gba", 0x3A6546, 0x5

gUnknown_83A654B:: @ 83A654B
	.incbin "baserom.gba", 0x3A654B, 0x5

gUnknown_83A6550:: @ 83A6550
	.incbin "baserom.gba", 0x3A6550, 0x5

gUnknown_83A6555:: @ 83A6555
	.incbin "baserom.gba", 0x3A6555, 0x5

gUnknown_83A655A:: @ 83A655A
	.incbin "baserom.gba", 0x3A655A, 0x5

gUnknown_83A655F:: @ 83A655F
	.incbin "baserom.gba", 0x3A655F, 0x5

gUnknown_83A6564:: @ 83A6564
	.incbin "baserom.gba", 0x3A6564, 0x5

gUnknown_83A6569:: @ 83A6569
	.incbin "baserom.gba", 0x3A6569, 0x5

gUnknown_83A656E:: @ 83A656E
	.incbin "baserom.gba", 0x3A656E, 0x5

gUnknown_83A6573:: @ 83A6573
	.incbin "baserom.gba", 0x3A6573, 0x5

gUnknown_83A6578:: @ 83A6578
	.incbin "baserom.gba", 0x3A6578, 0x5

gUnknown_83A657D:: @ 83A657D
	.incbin "baserom.gba", 0x3A657D, 0x5

gUnknown_83A6582:: @ 83A6582
	.incbin "baserom.gba", 0x3A6582, 0x5

gUnknown_83A6587:: @ 83A6587
	.incbin "baserom.gba", 0x3A6587, 0x5

gUnknown_83A658C:: @ 83A658C
	.incbin "baserom.gba", 0x3A658C, 0x5

gUnknown_83A6591:: @ 83A6591
	.incbin "baserom.gba", 0x3A6591, 0x8

gUnknown_83A6599:: @ 83A6599
	.incbin "baserom.gba", 0x3A6599, 0x10

gUnknown_83A65A9:: @ 83A65A9
	.incbin "baserom.gba", 0x3A65A9, 0x13

gUnknown_83A65BC:: @ 83A65BC
	.incbin "baserom.gba", 0x3A65BC, 0x2A8

gUnknown_83A6864:: @ 83A6864
	.incbin "baserom.gba", 0x3A6864, 0x8

gUnknown_83A686C:: @ 83A686C
	.incbin "baserom.gba", 0x3A686C, 0x8

gUnknown_83A6874:: @ 83A6874
	.incbin "baserom.gba", 0x3A6874, 0x8

gUnknown_83A687C:: @ 83A687C
	.incbin "baserom.gba", 0x3A687C, 0x8

gUnknown_83A6884:: @ 83A6884
	.incbin "baserom.gba", 0x3A6884, 0x14

gUnknown_83A6898:: @ 83A6898
	.incbin "baserom.gba", 0x3A6898, 0xC

gUnknown_83A68A4:: @ 83A68A4
	.incbin "baserom.gba", 0x3A68A4, 0xC

gUnknown_83A68B0:: @ 83A68B0
	.incbin "baserom.gba", 0x3A68B0, 0xC

gUnknown_83A68BC:: @ 83A68BC
	.incbin "baserom.gba", 0x3A68BC, 0xC

gUnknown_83A68C8:: @ 83A68C8
	.incbin "baserom.gba", 0x3A68C8, 0xC

gUnknown_83A68D4:: @ 83A68D4
	.incbin "baserom.gba", 0x3A68D4, 0xC

gUnknown_83A68E0:: @ 83A68E0
	.incbin "baserom.gba", 0x3A68E0, 0xC

gUnknown_83A68EC:: @ 83A68EC
	.incbin "baserom.gba", 0x3A68EC, 0xC

gUnknown_83A68F8:: @ 83A68F8
	.incbin "baserom.gba", 0x3A68F8, 0xC

gUnknown_83A6904:: @ 83A6904
	.incbin "baserom.gba", 0x3A6904, 0xC

gUnknown_83A6910:: @ 83A6910
	.incbin "baserom.gba", 0x3A6910, 0xC

gUnknown_83A691C:: @ 83A691C
	.incbin "baserom.gba", 0x3A691C, 0xC

gUnknown_83A6928:: @ 83A6928
	.incbin "baserom.gba", 0x3A6928, 0xC

gUnknown_83A6934:: @ 83A6934
	.incbin "baserom.gba", 0x3A6934, 0xC

gUnknown_83A6940:: @ 83A6940
	.incbin "baserom.gba", 0x3A6940, 0xC

gUnknown_83A694C:: @ 83A694C
	.incbin "baserom.gba", 0x3A694C, 0xC

gUnknown_83A6958:: @ 83A6958
	.incbin "baserom.gba", 0x3A6958, 0x6

gUnknown_83A695E:: @ 83A695E
	.incbin "baserom.gba", 0x3A695E, 0x6C6
