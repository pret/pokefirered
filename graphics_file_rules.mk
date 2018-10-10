FONTGFXDIR := data/graphics/fonts

$(FONTGFXDIR)/font0_latin.latfont: $(FONTGFXDIR)/font0_latin.png
	$(GFX) $< $@

$(FONTGFXDIR)/font0_jap.fwjpnfont: $(FONTGFXDIR)/font0_jap.png
	$(GFX) $< $@

$(FONTGFXDIR)/font1_latin.latfont: $(FONTGFXDIR)/font1_latin.png
	$(GFX) $< $@

$(FONTGFXDIR)/font1_jap.fwjpnfont: $(FONTGFXDIR)/font1_jap.png
	$(GFX) $< $@

$(FONTGFXDIR)/font2_latin.latfont: $(FONTGFXDIR)/font2_latin.png
	$(GFX) $< $@

$(FONTGFXDIR)/font2_jap.fwjpnfont: $(FONTGFXDIR)/font2_jap.png
	$(GFX) $< $@

$(FONTGFXDIR)/font4_latin.latfont: $(FONTGFXDIR)/font4_latin.png
	$(GFX) $< $@

$(FONTGFXDIR)/font4_jap.fwjpnfont: $(FONTGFXDIR)/font4_jap.png
	$(GFX) $< $@

$(FONTGFXDIR)/font5_latin.latfont: $(FONTGFXDIR)/font5_latin.png
	$(GFX) $< $@

$(FONTGFXDIR)/font5_jap.fwjpnfont: $(FONTGFXDIR)/font5_jap.png
	$(GFX) $< $@

$(FONTGFXDIR)/font9_jap.fwjpnfont: $(FONTGFXDIR)/font9_jap.png
	$(GFX) $< $@