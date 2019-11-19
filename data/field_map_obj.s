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
	.incbin "graphics/map_objects/0.gbapal"

gUnknown_835B988::
	.incbin "graphics/map_objects/unk_835B988.gbapal"

gUnknown_835B9A0::
	.space 0x1C0

gUnknown_835BB68:: @ 835BB68
	.incbin "graphics/map_objects/000.4bpp"

gUnknown_835C468:: @ 835C468
	.incbin "graphics/map_objects/002.4bpp"

gUnknown_835D268:: @ 835D268
	.incbin "graphics/map_objects/007.4bpp"

gUnknown_835DB68:: @ 835DB68
	.incbin "graphics/map_objects/009.4bpp"

gUnknown_835E968:: @ 835E968
	.incbin "graphics/map_objects/1.gbapal"

gUnknown_835E988:: @ 835E988
	.incbin "graphics/map_objects/2.gbapal"

gUnknown_835E9A8:: @ 835E9A8
	.incbin "graphics/map_objects/005.4bpp"

gUnknown_835F2A8:: @ 835F2A8
	.incbin "graphics/map_objects/012.4bpp"

@ 35FBA8
	.incbin "graphics/map_objects/male_surf.4bpp"

@ 360DA8
	.incbin "graphics/map_objects/female_surf.4bpp"

gUnknown_8361FA8:: @ 8361FA8
	.incbin "graphics/map_objects/001.4bpp"

gUnknown_83631A8:: @ 83631A8
	.incbin "graphics/map_objects/006.4bpp"

gUnknown_8363DA8:: @ 8363DA8
	.incbin "graphics/map_objects/008.4bpp"

gUnknown_8364FA8:: @ 8364FA8
	.incbin "graphics/map_objects/013.4bpp"

gUnknown_8365BA8:: @ 8365BA8
	.incbin "graphics/map_objects/014.4bpp"

gUnknown_83664A8:: @ 83664A8
	.incbin "graphics/map_objects/015.4bpp"

gUnknown_8366DA8:: @ 8366DA8
	.incbin "graphics/map_objects/004.4bpp"

gUnknown_83685A8:: @ 83685A8
	.incbin "graphics/map_objects/011.4bpp"

gUnknown_8369DA8:: @ 8369DA8
	.incbin "graphics/map_objects/094.4bpp"

gUnknown_8369E28:: @ 8369E28
	.incbin "graphics/map_objects/093.4bpp"

@ 8369F28
	.incbin "graphics/map_objects/unk_8369F28.4bpp"

gUnknown_836A228:: @ 836A228
	.incbin "graphics/map_objects/087.4bpp"

gUnknown_836AB28:: @ 836AB28
	.incbin "graphics/map_objects/086.4bpp"

gUnknown_836AE28:: @ 836AE28
	.incbin "graphics/map_objects/085.4bpp"

gUnknown_836B128:: @ 836B128
	.incbin "graphics/map_objects/076.4bpp"

gUnknown_836BA28:: @ 836BA28
	.incbin "graphics/map_objects/077.4bpp"

gUnknown_836C328:: @ 836C328
	.incbin "graphics/map_objects/083.4bpp"

gUnknown_836C628:: @ 836C628
	.incbin "graphics/map_objects/084.4bpp"

gUnknown_836C928:: @ 836C928
	.incbin "graphics/map_objects/080.4bpp"

gUnknown_836CC28:: @ 836CC28
	.incbin "graphics/map_objects/082.4bpp"

gUnknown_836CF28:: @ 836CF28
	.incbin "graphics/map_objects/073.4bpp"

gUnknown_836D828:: @ 836D828
	.incbin "graphics/map_objects/3.gbapal"

gUnknown_836D848:: @ 836D848
	.incbin "graphics/map_objects/4.gbapal"

gUnknown_836D868:: @ 836D868
	.incbin "graphics/map_objects/5.gbapal"

gUnknown_836D888:: @ 836D888
	.incbin "graphics/map_objects/6.gbapal"

gUnknown_836D8A8:: @ 836D8A8
	.incbin "graphics/map_objects/7.gbapal"

gUnknown_836D8C8:: @ 836D8C8
	.incbin "graphics/map_objects/8.gbapal"

gUnknown_836D8E8:: @ 836D8E8
	.incbin "graphics/map_objects/9.gbapal"

gUnknown_836D908:: @ 836D908
	.incbin "graphics/map_objects/10.gbapal"

gUnknown_836D928:: @ 836D928
	.incbin "graphics/map_objects/016.4bpp"

gUnknown_836DDA8:: @ 836DDA8
	.incbin "graphics/map_objects/017.4bpp"

gUnknown_836E2A8:: @ 836E2A8
	.incbin "graphics/map_objects/021.4bpp"

gUnknown_836E5A8:: @ 836E5A8
	.incbin "graphics/map_objects/022.4bpp"

gUnknown_836EFA8:: @ 836EFA8
	.incbin "graphics/map_objects/018.4bpp"

gUnknown_836F9A8:: @ 836F9A8
	.incbin "graphics/map_objects/019.4bpp"

gUnknown_83703A8:: @ 83703A8
	.incbin "graphics/map_objects/023.4bpp"

gUnknown_8370DA8:: @ 8370DA8
	.incbin "graphics/map_objects/031.4bpp"

gUnknown_83716A8:: @ 83716A8
	.incbin "graphics/map_objects/020.4bpp"

gUnknown_83720A8:: @ 83720A8
	.incbin "graphics/map_objects/024.4bpp"

@ 8372AA8
	.incbin "graphics/map_objects/unk_8372AA8.4bpp"

gUnknown_83733A8:: @ 83733A8
	.incbin "graphics/map_objects/027.4bpp"

gUnknown_8373CA8:: @ 8373CA8
	.incbin "graphics/map_objects/030.4bpp"

gUnknown_83746A8:: @ 83746A8
	.incbin "graphics/map_objects/028.4bpp"

gUnknown_83750A8:: @ 83750A8
	.incbin "graphics/map_objects/032.4bpp"

gUnknown_8375AA8:: @ 8375AA8
	.incbin "graphics/map_objects/034.4bpp"

gUnknown_8375CA8:: @ 8375CA8
	.incbin "graphics/map_objects/047.4bpp"

gUnknown_83766A8:: @ 83766A8
	.incbin "graphics/map_objects/048.4bpp"

gUnknown_83770A8:: @ 83770A8
	.incbin "graphics/map_objects/029.4bpp"

gUnknown_8377AA8:: @ 8377AA8
	.incbin "graphics/map_objects/059.4bpp"

gUnknown_83783A8:: @ 83783A8
	.incbin "graphics/map_objects/033.4bpp"

gUnknown_8378CA8:: @ 8378CA8
	.incbin "graphics/map_objects/035.4bpp"

gUnknown_83795A8:: @ 83795A8
	.incbin "graphics/map_objects/039.4bpp"

gUnknown_8379FA8:: @ 8379FA8
	.incbin "graphics/map_objects/040.4bpp"

gUnknown_837A9A8:: @ 837A9A8
	.incbin "graphics/map_objects/041.4bpp"

gUnknown_837B3A8:: @ 837B3A8
	.incbin "graphics/map_objects/042.4bpp"

gUnknown_837BDA8:: @ 837BDA8
	.incbin "graphics/map_objects/121.4bpp"

gUnknown_837BF28:: @ 837BF28
	.incbin "graphics/map_objects/052.4bpp"

gUnknown_837C928:: @ 837C928
	.incbin "graphics/map_objects/058.4bpp"

gUnknown_837D328:: @ 837D328
	.incbin "graphics/map_objects/050.4bpp"

gUnknown_837DC28:: @ 837DC28
	.incbin "graphics/map_objects/043.4bpp"

gUnknown_837E628:: @ 837E628
	.incbin "graphics/map_objects/044.4bpp"

gUnknown_837F028:: @ 837F028
	.incbin "graphics/map_objects/045.4bpp"

gUnknown_837FA28:: @ 837FA28
	.incbin "graphics/map_objects/046.4bpp"

gUnknown_8380428:: @ 8380428
	.incbin "graphics/map_objects/054.4bpp"

gUnknown_8380E28:: @ 8380E28
	.incbin "graphics/map_objects/055.4bpp"

gUnknown_8381828:: @ 8381828
	.incbin "graphics/map_objects/061.4bpp"

gUnknown_8382228:: @ 8382228
	.incbin "graphics/map_objects/062.4bpp"

gUnknown_8382C28:: @ 8382C28
	.incbin "graphics/map_objects/063.4bpp"

gUnknown_8383528:: @ 8383528
	.incbin "graphics/map_objects/057.4bpp"

gUnknown_8383F28:: @ 8383F28
	.incbin "graphics/map_objects/090.4bpp"

gUnknown_8384828:: @ 8384828
	.incbin "graphics/map_objects/152.4bpp"

gUnknown_8385128:: @ 8385128
	.incbin "graphics/map_objects/037.4bpp"

gUnknown_8385628:: @ 8385628
	.incbin "graphics/map_objects/036.4bpp"

gUnknown_8385B28:: @ 8385B28
	.incbin "graphics/map_objects/038.4bpp"

gUnknown_8386028:: @ 8386028
	.incbin "graphics/map_objects/056.4bpp"

gUnknown_8386A28:: @ 8386A28
	.incbin "graphics/map_objects/053.4bpp"

gUnknown_8387E28:: @ 8387E28
	.incbin "graphics/map_objects/091.4bpp"

gUnknown_8388728:: @ 8388728
	.incbin "graphics/map_objects/025.4bpp"

gUnknown_8389128:: @ 8389128
	.incbin "graphics/map_objects/026.4bpp"

gUnknown_8389B28:: @ 8389B28
	.incbin "graphics/map_objects/071.4bpp"

gUnknown_838A428:: @ 838A428
	.incbin "graphics/map_objects/072.4bpp"

gUnknown_838AD28:: @ 838AD28
	.incbin "graphics/map_objects/064.4bpp"

gUnknown_838B128:: @ 838B128
	.incbin "graphics/map_objects/065.4bpp"

gUnknown_838B428:: @ 838B428
	.incbin "graphics/map_objects/066.4bpp"

gUnknown_838B728:: @ 838B728
	.incbin "graphics/map_objects/067.4bpp"

gUnknown_838BA28:: @ 838BA28
	.incbin "graphics/map_objects/092.4bpp"

gUnknown_838BAA8:: @ 838BAA8
	.incbin "graphics/map_objects/078.4bpp"

gUnknown_838C3A8:: @ 838C3A8
	.incbin "graphics/map_objects/079.4bpp"

gUnknown_838C6A8:: @ 838C6A8
	.incbin "graphics/map_objects/068.4bpp"

gUnknown_838CFA8:: @ 838CFA8
	.incbin "graphics/map_objects/069.4bpp"

gUnknown_838D2A8:: @ 838D2A8
	.incbin "graphics/map_objects/070.4bpp"

gUnknown_838D5A8:: @ 838D5A8
	.incbin "graphics/map_objects/unk_838D5A8.4bpp"

gUnknown_838DEA8:: @ 838DEA8
	.incbin "graphics/map_objects/049.4bpp"

gUnknown_838E7A8:: @ 838E7A8
	.incbin "graphics/map_objects/089.4bpp"

gUnknown_838F0A8:: @ 838F0A8
	.incbin "graphics/map_objects/135.4bpp"

gUnknown_838F228:: @ 838F228
	.incbin "graphics/map_objects/136.4bpp"

gUnknown_838F428:: @ 838F428
	.incbin "graphics/map_objects/137.4bpp"

gUnknown_838F628:: @ 838F628
	.incbin "graphics/map_objects/138.4bpp"

gUnknown_838F828:: @ 838F828
	.incbin "graphics/map_objects/139.4bpp"

gUnknown_838F8A8:: @ 838F8A8
	.incbin "graphics/map_objects/140.4bpp"

gUnknown_838F928:: @ 838F928
	.incbin "graphics/map_objects/141.4bpp"

gUnknown_838F9A8:: @ 838F9A8
	.incbin "graphics/map_objects/143.4bpp"

gUnknown_838FA28:: @ 838FA28
	.incbin "graphics/map_objects/142.4bpp"

gUnknown_838FAA8:: @ 838FAA8
	.incbin "graphics/map_objects/144.4bpp"

gUnknown_838FEA8:: @ 838FEA8
	.incbin "graphics/map_objects/145.4bpp"

gUnknown_83902A8:: @ 83902A8
	.incbin "graphics/map_objects/146.4bpp"

gUnknown_8390328:: @ 8390328
	.incbin "graphics/map_objects/148.4bpp"

gUnknown_8390728:: @ 8390728
	.incbin "graphics/map_objects/149.4bpp"

gUnknown_8390B28:: @ 8390B28
	.incbin "graphics/map_objects/150.4bpp"

gUnknown_8390F28:: @ 8390F28
	.incbin "graphics/map_objects/075.4bpp"

gUnknown_8391228:: @ 8391228
	.incbin "graphics/map_objects/081.4bpp"

gUnknown_8391528:: @ 8391528
	.incbin "graphics/map_objects/074.4bpp"

gUnknown_8391828:: @ 8391828
	.incbin "graphics/map_objects/051.4bpp"

gUnknown_8391B28:: @ 8391B28
	.incbin "graphics/map_objects/088.4bpp"

gUnknown_8391E28:: @ 8391E28
	.incbin "graphics/map_objects/114.4bpp"

gUnknown_8391FA8:: @ 8391FA8
	.incbin "graphics/map_objects/118.4bpp"

gUnknown_8392128:: @ 8392128
	.incbin "graphics/map_objects/119.4bpp"

gUnknown_83922A8:: @ 83922A8
	.incbin "graphics/map_objects/122.4bpp"

gUnknown_8392428:: @ 8392428
	.incbin "graphics/map_objects/123.4bpp"

gUnknown_83925A8:: @ 83925A8
	.incbin "graphics/map_objects/124.4bpp"

gUnknown_8392728:: @ 8392728
	.incbin "graphics/map_objects/125.4bpp"

gUnknown_83928A8:: @ 83928A8
	.incbin "graphics/map_objects/126.4bpp"

gUnknown_8392A28:: @ 8392A28
	.incbin "graphics/map_objects/127.4bpp"

gUnknown_8392BA8:: @ 8392BA8
	.incbin "graphics/map_objects/128.4bpp"

gUnknown_8392D28:: @ 8392D28
	.incbin "graphics/map_objects/129.4bpp"

gUnknown_8392EA8:: @ 8392EA8
	.incbin "graphics/map_objects/130.4bpp"

gUnknown_8393028:: @ 8393028
	.incbin "graphics/map_objects/131.4bpp"

gUnknown_83931A8:: @ 83931A8
	.incbin "graphics/map_objects/132.4bpp"

gUnknown_8393328:: @ 8393328
	.incbin "graphics/map_objects/133.4bpp"

gUnknown_83934A8:: @ 83934A8
	.incbin "graphics/map_objects/147.4bpp"

gUnknown_8393628:: @ 8393628
	.incbin "graphics/map_objects/134.4bpp"

gUnknown_83937A8:: @ 83937A8
	.incbin "graphics/map_objects/109.4bpp"

gUnknown_83939A8:: @ 83939A8
	.incbin "graphics/map_objects/110.4bpp"

gUnknown_8393B28:: @ 8393B28
	.incbin "graphics/map_objects/111.4bpp"

gUnknown_8393CA8:: @ 8393CA8
	.incbin "graphics/map_objects/112.4bpp"

gUnknown_8393E28:: @ 8393E28
	.incbin "graphics/map_objects/117.4bpp"

gUnknown_8393FA8:: @ 8393FA8
	.incbin "graphics/map_objects/120.4bpp"

gUnknown_8394128:: @ 8394128
	.incbin "graphics/map_objects/115.4bpp"

gUnknown_83942A8:: @ 83942A8
	.incbin "graphics/map_objects/116.4bpp"

gUnknown_8394428:: @ 8394428
	.incbin "graphics/map_objects/113.4bpp"

gUnknown_83945A8:: @ 83945A8
	.incbin "graphics/map_objects/095.4bpp"

gUnknown_83947A8:: @ 83947A8
	.incbin "graphics/map_objects/096.4bpp"

gUnknown_83949A8:: @ 83949A8
	.incbin "graphics/map_objects/097.4bpp"

gUnknown_8394A28:: @ 8394A28
	.incbin "graphics/map_objects/098.4bpp"

gUnknown_8394AA8:: @ 8394AA8
	.incbin "graphics/map_objects/099.4bpp"

gUnknown_8394B28:: @ 8394B28
	.incbin "graphics/map_objects/100.4bpp"

gUnknown_8394BA8:: @ 8394BA8
	.incbin "graphics/map_objects/101.4bpp"

gUnknown_8394C28:: @ 8394C28
	.incbin "graphics/map_objects/102.4bpp"

gUnknown_8394D28:: @ 8394D28
	.incbin "graphics/map_objects/103.4bpp"

gUnknown_8394DA8:: @ 8394DA8
	.incbin "graphics/map_objects/104.4bpp"

gUnknown_8394E28:: @ 8394E28
	.incbin "graphics/map_objects/105.4bpp"

gUnknown_8394EA8:: @ 8394EA8
	.incbin "graphics/map_objects/19.gbapal"

gUnknown_8394EC8:: @ 8394EC8
	.incbin "graphics/map_objects/106.4bpp"

gUnknown_83950C8:: @ 83950C8
	.incbin "graphics/map_objects/107.4bpp"

gUnknown_83952C8:: @ 83952C8
	.incbin "graphics/map_objects/20.gbapal"

gUnknown_83952E8:: @ 83952E8
	.incbin "graphics/map_objects/108.4bpp"

gUnknown_8395AE8:: @ 8395AE8
	.incbin "graphics/map_objects/21.gbapal"

gUnknown_8395B08:: @ 8395B08
	.incbin "graphics/map_objects/151.4bpp"
	.incbin "graphics/map_objects/unk_396B08.4bpp"

gUnknown_8397708:: @ 8397708
	.incbin "graphics/map_objects/060.4bpp"

gUnknown_8398008:: @ 8398008
	.incbin "graphics/map_objects/11.gbapal"

gUnknown_8398028:: @ 8398028
	.incbin "graphics/map_objects/12.gbapal"

	.incbin "baserom.gba", 0x398048, 0x600

gUnknown_8398648::
	.incbin "graphics/map_objects/fldeff_cut.4bpp"
	.incbin "graphics/map_objects/fldeff_cut.4bpp"

gUnknown_8398688::
	.incbin "graphics/map_objects/fldeff_cut.gbapal"
	.incbin "baserom.gba", 0x3986A8, 0xCE0

gUnknown_8399388:: @ 8399388
	.incbin "baserom.gba", 0x399388, 0x908

gUnknown_8399C90:: @ 8399C90
	.incbin "baserom.gba", 0x399C90, 0x5F38

gUnknown_839FBC8:: @ 839FBC8
	.incbin "baserom.gba", 0x39FBC8, 0x144

gUnknown_839FD0C:: @ 839FD0C
	.incbin "baserom.gba", 0x39FD0C, 0x51

gUnknown_839FD5D:: @ 839FD5D
	.incbin "baserom.gba", 0x39FD5D, 0x53

gMapObjectGraphicsInfoPointers:: @ 839FDB0
	.4byte gMapObjectGraphicsInfo_83A3BB0
	.4byte gMapObjectGraphicsInfo_83A3BD4
	.4byte gMapObjectGraphicsInfo_83A3BF8
	.4byte gMapObjectGraphicsInfo_83A3C1C
	.4byte gMapObjectGraphicsInfo_83A4858
	.4byte gMapObjectGraphicsInfo_83A48A0
	.4byte gMapObjectGraphicsInfo_83A48C4
	.4byte gMapObjectGraphicsInfo_83A4564
	.4byte gMapObjectGraphicsInfo_83A4588
	.4byte gMapObjectGraphicsInfo_83A45AC
	.4byte gMapObjectGraphicsInfo_83A45D0
	.4byte gMapObjectGraphicsInfo_83A487C
	.4byte gMapObjectGraphicsInfo_83A48E8
	.4byte gMapObjectGraphicsInfo_83A490C
	.4byte gMapObjectGraphicsInfo_83A3C64
	.4byte gMapObjectGraphicsInfo_83A3C88
	.4byte gMapObjectGraphicsInfo_83A3CAC
	.4byte gMapObjectGraphicsInfo_83A3CD0
	.4byte gMapObjectGraphicsInfo_83A3D3C
	.4byte gMapObjectGraphicsInfo_83A3DA8
	.4byte gMapObjectGraphicsInfo_83A3DF0
	.4byte gMapObjectGraphicsInfo_83A3CF4
	.4byte gMapObjectGraphicsInfo_83A3D18
	.4byte gMapObjectGraphicsInfo_83A3D60
	.4byte gMapObjectGraphicsInfo_83A3DCC
	.4byte gMapObjectGraphicsInfo_83A4390
	.4byte gMapObjectGraphicsInfo_83A43B4
	.4byte gMapObjectGraphicsInfo_83A3E14
	.4byte gMapObjectGraphicsInfo_83A3E5C
	.4byte gMapObjectGraphicsInfo_83A3EEC
	.4byte gMapObjectGraphicsInfo_83A3E38
	.4byte gMapObjectGraphicsInfo_83A3D84
	.4byte gMapObjectGraphicsInfo_83A3E80
	.4byte gMapObjectGraphicsInfo_83A3F34
	.4byte gMapObjectGraphicsInfo_83A4420
	.4byte gMapObjectGraphicsInfo_83A3F58
	.4byte gMapObjectGraphicsInfo_83A424C
	.4byte gMapObjectGraphicsInfo_83A4228
	.4byte gMapObjectGraphicsInfo_83A4270
	.4byte gMapObjectGraphicsInfo_83A3F7C
	.4byte gMapObjectGraphicsInfo_83A3FA0
	.4byte gMapObjectGraphicsInfo_83A3FC4
	.4byte gMapObjectGraphicsInfo_83A3FE8
	.4byte gMapObjectGraphicsInfo_83A4078
	.4byte gMapObjectGraphicsInfo_83A409C
	.4byte gMapObjectGraphicsInfo_83A40C0
	.4byte gMapObjectGraphicsInfo_83A40E4
	.4byte gMapObjectGraphicsInfo_83A3EA4
	.4byte gMapObjectGraphicsInfo_83A3EC8
	.4byte gMapObjectGraphicsInfo_83A4618
	.4byte gMapObjectGraphicsInfo_83A4054
	.4byte gMapObjectGraphicsInfo_83A4978
	.4byte gMapObjectGraphicsInfo_83A400C
	.4byte gMapObjectGraphicsInfo_83A42B8
	.4byte gMapObjectGraphicsInfo_83A4108
	.4byte gMapObjectGraphicsInfo_83A412C
	.4byte gMapObjectGraphicsInfo_83A4294
	.4byte gMapObjectGraphicsInfo_83A41BC
	.4byte gMapObjectGraphicsInfo_83A4030
	.4byte gMapObjectGraphicsInfo_83A3F10
	.4byte gMapObjectGraphicsInfo_83A3C40
	.4byte gMapObjectGraphicsInfo_83A4150
	.4byte gMapObjectGraphicsInfo_83A4174
	.4byte gMapObjectGraphicsInfo_83A4198
	.4byte gMapObjectGraphicsInfo_83A4300
	.4byte gMapObjectGraphicsInfo_83A44D4
	.4byte gMapObjectGraphicsInfo_83A44F8
	.4byte gMapObjectGraphicsInfo_83A4324
	.4byte gMapObjectGraphicsInfo_83A4468
	.4byte gMapObjectGraphicsInfo_83A448C
	.4byte gMapObjectGraphicsInfo_83A44B0
	.4byte gMapObjectGraphicsInfo_83A436C
	.4byte gMapObjectGraphicsInfo_83A4834
	.4byte gMapObjectGraphicsInfo_83A47A4
	.4byte gMapObjectGraphicsInfo_83A4810
	.4byte gMapObjectGraphicsInfo_83A4660
	.4byte gMapObjectGraphicsInfo_83A47C8
	.4byte gMapObjectGraphicsInfo_83A47EC
	.4byte gMapObjectGraphicsInfo_83A43D8
	.4byte gMapObjectGraphicsInfo_83A43FC
	.4byte gMapObjectGraphicsInfo_83A4684
	.4byte gMapObjectGraphicsInfo_83A46A8
	.4byte gMapObjectGraphicsInfo_83A46CC
	.4byte gMapObjectGraphicsInfo_83A46F0
	.4byte gMapObjectGraphicsInfo_83A4714
	.4byte gMapObjectGraphicsInfo_83A4780
	.4byte gMapObjectGraphicsInfo_83A475C
	.4byte gMapObjectGraphicsInfo_83A4738
	.4byte gMapObjectGraphicsInfo_83A50EC
	.4byte gMapObjectGraphicsInfo_83A463C
	.4byte gMapObjectGraphicsInfo_83A41E0
	.4byte gMapObjectGraphicsInfo_83A42DC
	.4byte gMapObjectGraphicsInfo_83A4348
	.4byte gMapObjectGraphicsInfo_83A4930
	.4byte gMapObjectGraphicsInfo_83A4954
	.4byte gMapObjectGraphicsInfo_83A4444
	.4byte gMapObjectGraphicsInfo_83A451C
	.4byte gMapObjectGraphicsInfo_83A4540
	.4byte gMapObjectGraphicsInfo_83A49C0
	.4byte gMapObjectGraphicsInfo_83A49E4
	.4byte gMapObjectGraphicsInfo_83A4A08
	.4byte gMapObjectGraphicsInfo_83A4A2C
	.4byte gMapObjectGraphicsInfo_83A4A50
	.4byte gMapObjectGraphicsInfo_83A4A74
	.4byte gMapObjectGraphicsInfo_83A4A98
	.4byte gMapObjectGraphicsInfo_83A4ABC
	.4byte gMapObjectGraphicsInfo_83A4AE0
	.4byte gMapObjectGraphicsInfo_83A4B04
	.4byte gMapObjectGraphicsInfo_83A5110
	.4byte gMapObjectGraphicsInfo_83A499C
	.4byte gMapObjectGraphicsInfo_83A4B28
	.4byte gMapObjectGraphicsInfo_83A4F84
	.4byte gMapObjectGraphicsInfo_83A4FF0
	.4byte gMapObjectGraphicsInfo_83A50C8
	.4byte gMapObjectGraphicsInfo_83A5014
	.4byte gMapObjectGraphicsInfo_83A5080
	.4byte gMapObjectGraphicsInfo_83A50A4
	.4byte gMapObjectGraphicsInfo_83A5038
	.4byte gMapObjectGraphicsInfo_83A4B4C
	.4byte gMapObjectGraphicsInfo_83A4B70
	.4byte gMapObjectGraphicsInfo_83A505C
	.4byte gMapObjectGraphicsInfo_83A4B94
	.4byte gMapObjectGraphicsInfo_83A4BB8
	.4byte gMapObjectGraphicsInfo_83A4BDC
	.4byte gMapObjectGraphicsInfo_83A4C00
	.4byte gMapObjectGraphicsInfo_83A4C24
	.4byte gMapObjectGraphicsInfo_83A4C48
	.4byte gMapObjectGraphicsInfo_83A4C6C
	.4byte gMapObjectGraphicsInfo_83A4C90
	.4byte gMapObjectGraphicsInfo_83A4CB4
	.4byte gMapObjectGraphicsInfo_83A4CD8
	.4byte gMapObjectGraphicsInfo_83A4CFC
	.4byte gMapObjectGraphicsInfo_83A4D20
	.4byte gMapObjectGraphicsInfo_83A4D44
	.4byte gMapObjectGraphicsInfo_83A4FA8
	.4byte gMapObjectGraphicsInfo_83A4D68
	.4byte gMapObjectGraphicsInfo_83A4D8C
	.4byte gMapObjectGraphicsInfo_83A4DB0
	.4byte gMapObjectGraphicsInfo_83A4DD4
	.4byte gMapObjectGraphicsInfo_83A4E64
	.4byte gMapObjectGraphicsInfo_83A4E88
	.4byte gMapObjectGraphicsInfo_83A4EAC
	.4byte gMapObjectGraphicsInfo_83A4EF4
	.4byte gMapObjectGraphicsInfo_83A4ED0
	.4byte gMapObjectGraphicsInfo_83A4F18
	.4byte gMapObjectGraphicsInfo_83A4F3C
	.4byte gMapObjectGraphicsInfo_83A4F60
	.4byte gMapObjectGraphicsInfo_83A4FCC
	.4byte gMapObjectGraphicsInfo_83A4DF8
	.4byte gMapObjectGraphicsInfo_83A4E1C
	.4byte gMapObjectGraphicsInfo_83A4E40
	.4byte gMapObjectGraphicsInfo_83A5134

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

	.incbin "baserom.gba", 0x3a3820, 0xa0

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

	.incbin "baserom.gba", 0x3a3900, 0x120

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

	.incbin "baserom.gba", 0x3A3A80, 0x130

gMapObjectGraphicsInfo_83A3BB0:: @ 83A3BB0
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3470
	.4byte gSpriteImages_83A00A0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3BD4:: @ 83A3BD4
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0140
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3BF8:: @ 83A3BF8
	.2byte 0xFFFF, 0x1100, 0x11FF, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (1 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3584
	.4byte gSpriteImages_83A0270
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3C1C:: @ 83A3C1C
	.2byte 0xFFFF, 0x1100, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3638
	.4byte gSpriteImages_83A0330
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3C40:: @ 83A3C40
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A04C0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3C64:: @ 83A3C64
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0420
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3C88:: @ 83A3C88
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0470
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3CAC:: @ 83A3CAC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0508
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3CD0:: @ 83A3CD0
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0550
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3CF4:: @ 83A3CF4
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A05A0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3D18:: @ 83A3D18
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A05E8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3D3C:: @ 83A3D3C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0638
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3D60:: @ 83A3D60
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0688
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3D84:: @ 83A3D84
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A06D8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3DA8:: @ 83A3DA8
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0C40
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3DCC:: @ 83A3DCC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0720
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3DF0:: @ 83A3DF0
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0770
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3E14:: @ 83A3E14
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A07C0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3E38:: @ 83A3E38
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0808
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3E5C:: @ 83A3E5C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0858
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3E80:: @ 83A3E80
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A08A8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3EA4:: @ 83A3EA4
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A08F8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3EC8:: @ 83A3EC8
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0940
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3EEC:: @ 83A3EEC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0988
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3F10:: @ 83A3F10
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A09D8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3F34:: @ 83A3F34
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0A20
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3F58:: @ 83A3F58
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0AB8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3F7C:: @ 83A3F7C
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0B00
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3FA0:: @ 83A3FA0
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0B50
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3FC4:: @ 83A3FC4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0BA0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A3FE8:: @ 83A3FE8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0BF0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A400C:: @ 83A400C
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0C90
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4030:: @ 83A4030
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0CE0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4054:: @ 83A4054
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0D30
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4078:: @ 83A4078
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0D78
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A409C:: @ 83A409C
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0DC8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A40C0:: @ 83A40C0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0E18
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A40E4:: @ 83A40E4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0E68
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4108:: @ 83A4108
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0EB8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A412C:: @ 83A412C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0F08
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4150:: @ 83A4150
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0F58
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4174:: @ 83A4174
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0FA8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4198:: @ 83A4198
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0FF8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A41BC:: @ 83A41BC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1040
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A41E0:: @ 83A41E0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1090
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4204:: @ 83A4204
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A10D8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4228:: @ 83A4228
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1120
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A424C:: @ 83A424C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1170
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4270:: @ 83A4270
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A11C0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4294:: @ 83A4294
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1210
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A42B8:: @ 83A42B8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1260
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A42DC:: @ 83A42DC
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A12B0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4300:: @ 83A4300
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A35E4
	.4byte gSpriteImages_83A12F8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4324:: @ 83A4324
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1348
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4348:: @ 83A4348
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1390
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A436C:: @ 83A436C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1398
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4390:: @ 83A4390
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A13E0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A43B4:: @ 83A43B4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1430
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A43D8:: @ 83A43D8
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1480
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A43FC:: @ 83A43FC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A14C8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4420:: @ 83A4420
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0A70
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4444:: @ 83A4444
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3660
	.4byte gSpriteImages_83A1510
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4468:: @ 83A4468
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1530
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A448C:: @ 83A448C
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1578
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A44B0:: @ 83A44B0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A15C0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A44D4:: @ 83A44D4
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1608
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A44F8:: @ 83A44F8
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1650
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A451C:: @ 83A451C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3658
	.4byte gSpriteImages_83A1698
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4540:: @ 83A4540
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A16B8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4564:: @ 83A4564
	.2byte 0xFFFF, 0x1110, 0x1102, 0x200, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3470
	.4byte gSpriteImages_83A0188
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4588:: @ 83A4588
	.2byte 0xFFFF, 0x1110, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0228
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A45AC:: @ 83A45AC
	.2byte 0xFFFF, 0x1110, 0x11FF, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (1 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3584
	.4byte gSpriteImages_83A02D0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A45D0:: @ 83A45D0
	.2byte 0xFFFF, 0x1110, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3638
	.4byte gSpriteImages_83A0378
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A45F4:: @ 83A45F4
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 10 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 2
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A0140
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4618:: @ 83A4618
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A16C0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A463C:: @ 83A463C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1708
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4660:: @ 83A4660
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1750
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4684:: @ 83A4684
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1798
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A46A8:: @ 83A46A8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A17E0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A46CC:: @ 83A46CC
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1828
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A46F0:: @ 83A46F0
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1870
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4714:: @ 83A4714
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A18B8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4738:: @ 83A4738
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1900
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A475C:: @ 83A475C
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1948
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4780:: @ 83A4780
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1990
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A47A4:: @ 83A47A4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A19D8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A47C8:: @ 83A47C8
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1A20
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A47EC:: @ 83A47EC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1A68
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4810:: @ 83A4810
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1AB0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4834:: @ 83A4834
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x100, 16, 32
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1AF8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4858:: @ 83A4858
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3668
	.4byte gSpriteImages_83A1B40
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A487C:: @ 83A487C
	.2byte 0xFFFF, 0x1110, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3668
	.4byte gSpriteImages_83A1BA0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A48A0:: @ 83A48A0
	.2byte 0xFFFF, 0x1100, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A363C
	.4byte gSpriteImages_83A0330
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A48C4:: @ 83A48C4
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3640
	.4byte gSpriteImages_83A03C0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A48E8:: @ 83A48E8
	.2byte 0xFFFF, 0x1100, 0x1102, 0x100, 16, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A363C
	.4byte gSpriteImages_83A0378
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A490C:: @ 83A490C
	.2byte 0xFFFF, 0x1100, 0x1102, 0x200, 32, 32
	.byte 0 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3640
	.4byte gSpriteImages_83A03F0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4930:: @ 83A4930
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 32, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_32x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C00
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4954:: @ 83A4954
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C08
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4978:: @ 83A4978
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x100, 16, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1C10
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A499C:: @ 83A499C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1D38
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A49C0:: @ 83A49C0
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C58
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A49E4:: @ 83A49E4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C60
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4A08:: @ 83A4A08
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C68
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4A2C:: @ 83A4A2C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C70
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4A50:: @ 83A4A50
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x100, 16, 32
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C78
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4A74:: @ 83A4A74
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C80
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4A98:: @ 83A4A98
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C88
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4ABC:: @ 83A4ABC
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C90
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4AE0:: @ 83A4AE0
	.2byte 0xFFFF, 0x1113, 0x11FF, 0x200, 32, 32
	.byte 10 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1C98
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4B04:: @ 83A4B04
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (0 << 4) | (1 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3314
	.4byte gSpriteImages_83A1CA0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4B28:: @ 83A4B28
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1D80
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4B4C:: @ 83A4B4C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1E10
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4B70:: @ 83A4B70
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1E58
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4B94:: @ 83A4B94
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1EA0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4BB8:: @ 83A4BB8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1EE8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4BDC:: @ 83A4BDC
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1F30
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4C00:: @ 83A4C00
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1F78
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4C24:: @ 83A4C24
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1FC0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4C48:: @ 83A4C48
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2008
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4C6C:: @ 83A4C6C
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2050
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4C90:: @ 83A4C90
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2098
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4CB4:: @ 83A4CB4
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A20E0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4CD8:: @ 83A4CD8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2128
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4CFC:: @ 83A4CFC
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2170
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4D20:: @ 83A4D20
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A21B8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4D44:: @ 83A4D44
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2200
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4D68:: @ 83A4D68
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2248
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4D8C:: @ 83A4D8C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2290
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4DB0:: @ 83A4DB0
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A22D8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4DD4:: @ 83A4DD4
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2320
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4DF8:: @ 83A4DF8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2368
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4E1C:: @ 83A4E1C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A23B0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4E40:: @ 83A4E40
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A23F8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4E64:: @ 83A4E64
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2440
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4E88:: @ 83A4E88
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2488
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4EAC:: @ 83A4EAC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A24D0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4ED0:: @ 83A4ED0
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2518
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4EF4:: @ 83A4EF4
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2560
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4F18:: @ 83A4F18
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x200, 32, 32
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A25A8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4F3C:: @ 83A4F3C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x200, 32, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_32x32
	.4byte gSubspriteTables_83A37F0
	.4byte gAnimTable_83A33BC
	.4byte gSpriteImages_83A25F0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4F60:: @ 83A4F60
	.2byte 0xFFFF, 0x1105, 0x11FF, 0x80, 16, 16
	.byte 4 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2638
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4F84:: @ 83A4F84
	.2byte 0xFFFF, 0x1106, 0x11FF, 0x80, 16, 16
	.byte 5 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2680
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4FA8:: @ 83A4FA8
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2878
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4FCC:: @ 83A4FCC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A28C0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A4FF0:: @ 83A4FF0
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A26C8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A5014:: @ 83A5014
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1DC8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A5038:: @ 83A5038
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2710
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A505C:: @ 83A505C
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2758
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A5080:: @ 83A5080
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A27A0
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A50A4:: @ 83A50A4
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x80, 16, 16
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A27E8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A50C8:: @ 83A50C8
	.2byte 0xFFFF, 0x1104, 0x11FF, 0x80, 16, 16
	.byte 3 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x16
	.4byte gSubspriteTables_83A3748
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2830
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A50EC:: @ 83A50EC
	.2byte 0xFFFF, 0x1103, 0x11FF, 0x100, 16, 32
	.byte 2 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 1
	.align 2
	.4byte gEventObjectBaseOam_16x32
	.4byte gSubspriteTables_83A379C
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A2908
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A5110:: @ 83A5110
	.2byte 0xFFFF, 0x1114, 0x11FF, 0x800, 64, 64
	.byte 10 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_64x64
	.4byte gSubspriteTables_83A38D0
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1CA8
	.4byte gDummySpriteAffineAnimTable

gMapObjectGraphicsInfo_83A5134:: @ 83A5134
	.2byte 0xFFFF, 0x1115, 0x11FF, 0x1000, 128, 64
	.byte 10 | (1 << 4) | (0 << 6) | (0 << 7)
	.byte 0
	.align 2
	.4byte gEventObjectBaseOam_128x64
	.4byte gSubspriteTables_83A3A50
	.4byte gAnimTable_83A3368
	.4byte gSpriteImages_83A1CF0
	.4byte gDummySpriteAffineAnimTable

gUnknown_83A5158:: @ 83A5158
	.incbin "baserom.gba", 0x3A5158, 0xB0

gUnknown_83A5208:: @ 83A5208
	.incbin "baserom.gba", 0x3A5208, 0x70

gUnknown_83A5278:: @ 83A5278
	.incbin "baserom.gba", 0x3A5278, 0xB8

gUnknown_83A5330:: @ 83A5330
	.incbin "baserom.gba", 0x3A5330, 0x10

gUnknown_83A5340::
	.incbin "baserom.gba", 0x3A5340, 0x8

gUnknown_83A5348:: @ 83A5348
	.incbin "baserom.gba", 0x3A5348, 0xB90

gUnknown_83A5ED8::
	.incbin "baserom.gba", 0x3A5ED8, 0x120

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
	.incbin "baserom.gba", 0x3A65BC, 0x2C8

gUnknown_83A6884:: @ 83A6884
	.incbin "baserom.gba", 0x3A6884, 0xD4

gUnknown_83A6958:: @ 83A6958
	.incbin "baserom.gba", 0x3A6958, 0x6

gUnknown_83A695E:: @ 83A695E
	.incbin "baserom.gba", 0x3A695E, 0x6C6
