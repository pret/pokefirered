#include "global.h"
#include "berry.h"
#include "text.h"
#include "constants/items.h"

static const u8 sBerryDescriptionPart1_Cheri[] = _("とても かわいい はなが さく.");
static const u8 sBerryDescriptionPart2_Cheri[] = _("まっかな みは とても からい.");
static const u8 sBerryDescriptionPart1_Chesto[] = _("そとの かわの ぶぶんも なかみも すべてが");
static const u8 sBerryDescriptionPart2_Chesto[] = _("かたい. どこを たべても しぶい.");
static const u8 sBerryDescriptionPart1_Pecha[] = _("とても あまくて おいしい.");
static const u8 sBerryDescriptionPart2_Pecha[] = _("やわらかいので はこぶときは ちゅうい.");
static const u8 sBerryDescriptionPart1_Rawst[] = _("はっぱの ぶぶんが ながく まるまっていると");
static const u8 sBerryDescriptionPart2_Rawst[] = _("みが とても にがく なるらしい.");
static const u8 sBerryDescriptionPart1_Aspear[] = _("かたい みの なかには すいぶんが とても");
static const u8 sBerryDescriptionPart2_Aspear[] = _("おおく ふくまれている. かなり すっぱい.");
static const u8 sBerryDescriptionPart1_Leppa[] = _("クラボなどに くらべて すこし そだつのが");
static const u8 sBerryDescriptionPart2_Leppa[] = _("おそい. みが ちいさいほど おいしい.");
static const u8 sBerryDescriptionPart1_Oran[] = _("いろいろな あじが まざった ふしぎな み.");
static const u8 sBerryDescriptionPart2_Oran[] = _("みを つけるのに はんにち かかる.");
static const u8 sBerryDescriptionPart1_Persim[] = _("たいようが だいすき. ひに あたると");
static const u8 sBerryDescriptionPart2_Persim[] = _("どんどん いろが あざやかに なる.");
static const u8 sBerryDescriptionPart1_Lum[] = _("そだつのに じかんが かかるが たいせつに");
static const u8 sBerryDescriptionPart2_Lum[] = _("そだてると みが 2つ つくことも ある.");
static const u8 sBerryDescriptionPart1_Sitrus[] = _("オレンとは きょうだいの ような そんざい.");
static const u8 sBerryDescriptionPart2_Sitrus[] = _("おおきくて あじも ととのっている.");
static const u8 sBerryDescriptionPart1_Figy[] = _("たべられた あとのような かたちの なかには");
static const u8 sBerryDescriptionPart2_Figy[] = _("からい せいぶんが つまっている.");
static const u8 sBerryDescriptionPart1_Wiki[] = _("まわりに ついている イボイボは ポケモンが");
static const u8 sBerryDescriptionPart2_Wiki[] = _("もちやすいように できたと いわれている.");
static const u8 sBerryDescriptionPart1_Mago[] = _("おおきく なれば なるほど みが まがる.");
static const u8 sBerryDescriptionPart2_Mago[] = _("まがるほど あまくて おいしい.");
static const u8 sBerryDescriptionPart1_Aguav[] = _("ちいさい サイズの はなで しかも ひかりを");
static const u8 sBerryDescriptionPart2_Aguav[] = _("ひつようと しない めずらしい きのみ.");
static const u8 sBerryDescriptionPart1_Iapapa[] = _("とても おおきな すっぱい きのみ.");
static const u8 sBerryDescriptionPart2_Iapapa[] = _("そだてるには みじかくても 1にち かかる.");
static const u8 sBerryDescriptionPart1_Razz[] = _("あかい みは たべると ちょっぴり からい.");
static const u8 sBerryDescriptionPart2_Razz[] = _("そだつのが はやく 4じかんで みを つける");
static const u8 sBerryDescriptionPart1_Bluk[] = _("そとがわは あおいいろだが たべると");
static const u8 sBerryDescriptionPart2_Bluk[] = _("くちの なかが まっくろに なる.");
static const u8 sBerryDescriptionPart1_Nanab[] = _("せかいで 7ばんめに はっけん されたので");
static const u8 sBerryDescriptionPart2_Nanab[] = _("ナナという せつが ゆうりょく. あまい.");
static const u8 sBerryDescriptionPart1_Wepear[] = _("ちいさな しろい はなが さく. にがさと");
static const u8 sBerryDescriptionPart2_Wepear[] = _("すっぱさが まざりあった びみょうな あじ.");
static const u8 sBerryDescriptionPart1_Pinap[] = _("かぜに よわく さむさにも よわい.");
static const u8 sBerryDescriptionPart2_Pinap[] = _("みの なかが からく そとがわが すっぱい.");
static const u8 sBerryDescriptionPart1_Pomeg[] = _("どんなに みずを あげても えいようが");
static const u8 sBerryDescriptionPart2_Pomeg[] = _("あっても 6つの み しか つけない.");
static const u8 sBerryDescriptionPart1_Kelpsy[] = _("ねっこの ような かたちの めずらしい");
static const u8 sBerryDescriptionPart2_Kelpsy[] = _("しゅるい. とても おおきな はなが さく.");
static const u8 sBerryDescriptionPart1_Qualot[] = _("みずが だいすき. ずっと あめが ふる");
static const u8 sBerryDescriptionPart2_Qualot[] = _("ばしょでも しっかりと そだつ.");
static const u8 sBerryDescriptionPart1_Hondew[] = _("とても こうかで なかなか めに することが");
static const u8 sBerryDescriptionPart2_Hondew[] = _("できない きのみ. とても おいしい.");
static const u8 sBerryDescriptionPart1_Grepa[] = _("やわらかさと まるい かたちからは");
static const u8 sBerryDescriptionPart2_Grepa[] = _("そうぞうが できないほど すっぱい.");
static const u8 sBerryDescriptionPart1_Tamato[] = _("くちびるが まがって しまうほど からい.");
static const u8 sBerryDescriptionPart2_Tamato[] = _("そだてるにも じかんが かかる.");
static const u8 sBerryDescriptionPart1_Cornn[] = _("おおむかしから はえていた. たくさん");
static const u8 sBerryDescriptionPart2_Cornn[] = _("うえないと みが つかないときも ある.");
static const u8 sBerryDescriptionPart1_Magost[] = _("とても あじの バランスが よいと");
static const u8 sBerryDescriptionPart2_Magost[] = _("ひょうばんの きのみ.");
static const u8 sBerryDescriptionPart1_Rabuta[] = _("たくさんの けが はえている めずらしい");
static const u8 sBerryDescriptionPart2_Rabuta[] = _("しゅるい. かなり にがい.");
static const u8 sBerryDescriptionPart1_Nomel[] = _("かなり すっぱい. 1くち たべると");
static const u8 sBerryDescriptionPart2_Nomel[] = _("3にちかん ほかの あじが しなくなる.");
static const u8 sBerryDescriptionPart1_Spelon[] = _("まっかになった みは とてつもなく からい.");
static const u8 sBerryDescriptionPart2_Spelon[] = _("イボからも からい せいぶんが でている.");
static const u8 sBerryDescriptionPart1_Pamtre[] = _("どこからともなく うみを ただよってくる.");
static const u8 sBerryDescriptionPart2_Pamtre[] = _("せかいの どこかで そだっている らしい.");
static const u8 sBerryDescriptionPart1_Watmel[] = _("とても おおきく 50センチを こえるものも");
static const u8 sBerryDescriptionPart2_Watmel[] = _("はっけん された. ものすごく あまい.");
static const u8 sBerryDescriptionPart1_Durin[] = _("みただけで にがい. あまりにも にがいので");
static const u8 sBerryDescriptionPart2_Durin[] = _("そのままで たべたひとは だれもいない.");
static const u8 sBerryDescriptionPart1_Belue[] = _("つるつるとして おいしそうだが とてつもなく");
static const u8 sBerryDescriptionPart2_Belue[] = _("すっぱい. そだてるにも じかんが かかる.");
static const u8 sBerryDescriptionPart1_Liechi[] = _("なぞのタネ. チイラのみには うみの");
static const u8 sBerryDescriptionPart2_Liechi[] = _("ちからが やどるという うわさが ある.");
static const u8 sBerryDescriptionPart1_Ganlon[] = _("なぞのタネ. リュガのみには りくの");
static const u8 sBerryDescriptionPart2_Ganlon[] = _("ちからが やどるという うわさが ある.");
static const u8 sBerryDescriptionPart1_Salac[] = _("なぞのタネ. カムラのみには そらの");
static const u8 sBerryDescriptionPart2_Salac[] = _("ちからが やどるという うわさが ある.");
static const u8 sBerryDescriptionPart1_Petaya[] = _("なぞのタネ. ヤタピのみには すべての");
static const u8 sBerryDescriptionPart2_Petaya[] = _("いきものの ちからが やどると いわれている");
static const u8 sBerryDescriptionPart1_Apicot[] = _("ふしぎな ふしぎな きのみ. なにが");
static const u8 sBerryDescriptionPart2_Apicot[] = _("おこるのか なにが できるのか わからない.");
static const u8 sBerryDescriptionPart1_Lansat[] = _("でんせつのみ と いわれている. この みを");
static const u8 sBerryDescriptionPart2_Lansat[] = _("もつと とても しあわせに なるらしい.");
static const u8 sBerryDescriptionPart1_Starf[] = _("あまりにも ちからが つよすぎるため");
static const u8 sBerryDescriptionPart2_Starf[] = _("せかいの はてに すてた まぼろしのみ.");
static const u8 sBerryDescriptionPart1_Enigma[] = _("しょうたい ふめいの きのみ.");
static const u8 sBerryDescriptionPart2_Enigma[] = _("ほしの ちからを もっている らしい.");

const struct Berry gBerries[] = {
    [ITEM_CHERI_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("CHERI"),
            .firmness = BERRY_FIRMNESS_SOFT,
            .size = 20,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Cheri,
            .description2 = sBerryDescriptionPart2_Cheri,
            .stageDuration = 3,
            .spicy = 10,
            .dry = 0,
            .sweet = 0,
            .bitter = 0,
            .sour = 0,
            .smoothness = 25
        },

    [ITEM_CHESTO_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("CHESTO"),
            .firmness = BERRY_FIRMNESS_SUPER_HARD,
            .size = 80,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Chesto,
            .description2 = sBerryDescriptionPart2_Chesto,
            .stageDuration = 3,
            .spicy = 0,
            .dry = 10,
            .sweet = 0,
            .bitter = 0,
            .sour = 0,
            .smoothness = 25
        },

    [ITEM_PECHA_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("PECHA"),
            .firmness = BERRY_FIRMNESS_VERY_SOFT,
            .size = 40,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Pecha,
            .description2 = sBerryDescriptionPart2_Pecha,
            .stageDuration = 3,
            .spicy = 0,
            .dry = 0,
            .sweet = 10,
            .bitter = 0,
            .sour = 0,
            .smoothness = 25
        },

    [ITEM_RAWST_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("RAWST"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 32,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Rawst,
            .description2 = sBerryDescriptionPart2_Rawst,
            .stageDuration = 3,
            .spicy = 0,
            .dry = 0,
            .sweet = 0,
            .bitter = 10,
            .sour = 0,
            .smoothness = 25
        },

    [ITEM_ASPEAR_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("ASPEAR"),
            .firmness = BERRY_FIRMNESS_SUPER_HARD,
            .size = 50,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Aspear,
            .description2 = sBerryDescriptionPart2_Aspear,
            .stageDuration = 3,
            .spicy = 0,
            .dry = 0,
            .sweet = 0,
            .bitter = 0,
            .sour = 10,
            .smoothness = 25
        },

    [ITEM_LEPPA_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("LEPPA"),
            .firmness = BERRY_FIRMNESS_VERY_HARD,
            .size = 28,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Leppa,
            .description2 = sBerryDescriptionPart2_Leppa,
            .stageDuration = 4,
            .spicy = 10,
            .dry = 0,
            .sweet = 10,
            .bitter = 10,
            .sour = 10,
            .smoothness = 20
        },

    [ITEM_ORAN_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("ORAN"),
            .firmness = BERRY_FIRMNESS_SUPER_HARD,
            .size = 35,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Oran,
            .description2 = sBerryDescriptionPart2_Oran,
            .stageDuration = 3,
            .spicy = 10,
            .dry = 10,
            .sweet = 10,
            .bitter = 10,
            .sour = 10,
            .smoothness = 20
        },

    [ITEM_PERSIM_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("PERSIM"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 47,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Persim,
            .description2 = sBerryDescriptionPart2_Persim,
            .stageDuration = 3,
            .spicy = 10,
            .dry = 10,
            .sweet = 10,
            .bitter = 10,
            .sour = 10,
            .smoothness = 20
        },

    [ITEM_LUM_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("LUM"),
            .firmness = BERRY_FIRMNESS_SUPER_HARD,
            .size = 34,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Lum,
            .description2 = sBerryDescriptionPart2_Lum,
            .stageDuration = 12,
            .spicy = 10,
            .dry = 10,
            .sweet = 10,
            .bitter = 10,
            .sour = 10,
            .smoothness = 20
        },

    [ITEM_SITRUS_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("SITRUS"),
            .firmness = BERRY_FIRMNESS_VERY_HARD,
            .size = 95,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Sitrus,
            .description2 = sBerryDescriptionPart2_Sitrus,
            .stageDuration = 6,
            .spicy = 10,
            .dry = 10,
            .sweet = 10,
            .bitter = 10,
            .sour = 10,
            .smoothness = 20
        },

    [ITEM_FIGY_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("FIGY"),
            .firmness = BERRY_FIRMNESS_SOFT,
            .size = 100,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Figy,
            .description2 = sBerryDescriptionPart2_Figy,
            .stageDuration = 6,
            .spicy = 10,
            .dry = 0,
            .sweet = 0,
            .bitter = 0,
            .sour = 0,
            .smoothness = 25
        },

    [ITEM_WIKI_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("WIKI"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 115,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Wiki,
            .description2 = sBerryDescriptionPart2_Wiki,
            .stageDuration = 6,
            .spicy = 0,
            .dry = 10,
            .sweet = 0,
            .bitter = 0,
            .sour = 0,
            .smoothness = 25
        },

    [ITEM_MAGO_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("MAGO"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 126,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Mago,
            .description2 = sBerryDescriptionPart2_Mago,
            .stageDuration = 6,
            .spicy = 0,
            .dry = 0,
            .sweet = 10,
            .bitter = 0,
            .sour = 0,
            .smoothness = 25
        },

    [ITEM_AGUAV_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("AGUAV"),
            .firmness = BERRY_FIRMNESS_SUPER_HARD,
            .size = 64,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Aguav,
            .description2 = sBerryDescriptionPart2_Aguav,
            .stageDuration = 6,
            .spicy = 0,
            .dry = 0,
            .sweet = 0,
            .bitter = 10,
            .sour = 0,
            .smoothness = 25
        },

    [ITEM_IAPAPA_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("IAPAPA"),
            .firmness = BERRY_FIRMNESS_SOFT,
            .size = 223,
            .maxYield = 3,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Iapapa,
            .description2 = sBerryDescriptionPart2_Iapapa,
            .stageDuration = 6,
            .spicy = 0,
            .dry = 0,
            .sweet = 0,
            .bitter = 0,
            .sour = 10,
            .smoothness = 25
        },

    [ITEM_RAZZ_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("RAZZ"),
            .firmness = BERRY_FIRMNESS_VERY_HARD,
            .size = 120,
            .maxYield = 6,
            .minYield = 3,
            .description1 = sBerryDescriptionPart1_Razz,
            .description2 = sBerryDescriptionPart2_Razz,
            .stageDuration = 1,
            .spicy = 10,
            .dry = 10,
            .sweet = 0,
            .bitter = 0,
            .sour = 0,
            .smoothness = 20
        },

    [ITEM_BLUK_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("BLUK"),
            .firmness = BERRY_FIRMNESS_SOFT,
            .size = 108,
            .maxYield = 6,
            .minYield = 3,
            .description1 = sBerryDescriptionPart1_Bluk,
            .description2 = sBerryDescriptionPart2_Bluk,
            .stageDuration = 1,
            .spicy = 0,
            .dry = 10,
            .sweet = 10,
            .bitter = 0,
            .sour = 0,
            .smoothness = 20
        },

    [ITEM_NANAB_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("NANAB"),
            .firmness = BERRY_FIRMNESS_VERY_HARD,
            .size = 77,
            .maxYield = 6,
            .minYield = 3,
            .description1 = sBerryDescriptionPart1_Nanab,
            .description2 = sBerryDescriptionPart2_Nanab,
            .stageDuration = 1,
            .spicy = 0,
            .dry = 0,
            .sweet = 10,
            .bitter = 10,
            .sour = 0,
            .smoothness = 20
        },

    [ITEM_WEPEAR_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("WEPEAR"),
            .firmness = BERRY_FIRMNESS_SUPER_HARD,
            .size = 74,
            .maxYield = 6,
            .minYield = 3,
            .description1 = sBerryDescriptionPart1_Wepear,
            .description2 = sBerryDescriptionPart2_Wepear,
            .stageDuration = 1,
            .spicy = 0,
            .dry = 0,
            .sweet = 0,
            .bitter = 10,
            .sour = 10,
            .smoothness = 20
        },

    [ITEM_PINAP_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("PINAP"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 80,
            .maxYield = 6,
            .minYield = 3,
            .description1 = sBerryDescriptionPart1_Pinap,
            .description2 = sBerryDescriptionPart2_Pinap,
            .stageDuration = 1,
            .spicy = 10,
            .dry = 0,
            .sweet = 0,
            .bitter = 0,
            .sour = 10,
            .smoothness = 20
        },

    [ITEM_POMEG_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("POMEG"),
            .firmness = BERRY_FIRMNESS_VERY_HARD,
            .size = 135,
            .maxYield = 6,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Pomeg,
            .description2 = sBerryDescriptionPart2_Pomeg,
            .stageDuration = 3,
            .spicy = 10,
            .dry = 0,
            .sweet = 10,
            .bitter = 10,
            .sour = 0,
            .smoothness = 20
        },

    [ITEM_KELPSY_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("KELPSY"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 150,
            .maxYield = 6,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Kelpsy,
            .description2 = sBerryDescriptionPart2_Kelpsy,
            .stageDuration = 3,
            .spicy = 0,
            .dry = 10,
            .sweet = 0,
            .bitter = 10,
            .sour = 10,
            .smoothness = 20
        },

    [ITEM_QUALOT_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("QUALOT"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 110,
            .maxYield = 6,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Qualot,
            .description2 = sBerryDescriptionPart2_Qualot,
            .stageDuration = 3,
            .spicy = 10,
            .dry = 0,
            .sweet = 10,
            .bitter = 0,
            .sour = 10,
            .smoothness = 20
        },

    [ITEM_HONDEW_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("HONDEW"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 162,
            .maxYield = 6,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Hondew,
            .description2 = sBerryDescriptionPart2_Hondew,
            .stageDuration = 3,
            .spicy = 10,
            .dry = 10,
            .sweet = 0,
            .bitter = 10,
            .sour = 0,
            .smoothness = 20
        },

    [ITEM_GREPA_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("GREPA"),
            .firmness = BERRY_FIRMNESS_SOFT,
            .size = 149,
            .maxYield = 6,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Grepa,
            .description2 = sBerryDescriptionPart2_Grepa,
            .stageDuration = 3,
            .spicy = 0,
            .dry = 10,
            .sweet = 10,
            .bitter = 0,
            .sour = 10,
            .smoothness = 20
        },

    [ITEM_TAMATO_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("TAMATO"),
            .firmness = BERRY_FIRMNESS_SOFT,
            .size = 200,
            .maxYield = 4,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Tamato,
            .description2 = sBerryDescriptionPart2_Tamato,
            .stageDuration = 6,
            .spicy = 20,
            .dry = 10,
            .sweet = 0,
            .bitter = 0,
            .sour = 0,
            .smoothness = 30
        },

    [ITEM_CORNN_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("CORNN"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 75,
            .maxYield = 4,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Cornn,
            .description2 = sBerryDescriptionPart2_Cornn,
            .stageDuration = 6,
            .spicy = 0,
            .dry = 20,
            .sweet = 10,
            .bitter = 0,
            .sour = 0,
            .smoothness = 30
        },

    [ITEM_MAGOST_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("MAGOST"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 140,
            .maxYield = 4,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Magost,
            .description2 = sBerryDescriptionPart2_Magost,
            .stageDuration = 6,
            .spicy = 0,
            .dry = 0,
            .sweet = 20,
            .bitter = 10,
            .sour = 0,
            .smoothness = 30
        },

    [ITEM_RABUTA_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("RABUTA"),
            .firmness = BERRY_FIRMNESS_SOFT,
            .size = 226,
            .maxYield = 4,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Rabuta,
            .description2 = sBerryDescriptionPart2_Rabuta,
            .stageDuration = 6,
            .spicy = 0,
            .dry = 0,
            .sweet = 0,
            .bitter = 20,
            .sour = 10,
            .smoothness = 30
        },

    [ITEM_NOMEL_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("NOMEL"),
            .firmness = BERRY_FIRMNESS_SUPER_HARD,
            .size = 285,
            .maxYield = 4,
            .minYield = 2,
            .description1 = sBerryDescriptionPart1_Nomel,
            .description2 = sBerryDescriptionPart2_Nomel,
            .stageDuration = 6,
            .spicy = 10,
            .dry = 0,
            .sweet = 0,
            .bitter = 0,
            .sour = 20,
            .smoothness = 30
        },

    [ITEM_SPELON_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("SPELON"),
            .firmness = BERRY_FIRMNESS_SOFT,
            .size = 133,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Spelon,
            .description2 = sBerryDescriptionPart2_Spelon,
            .stageDuration = 18,
            .spicy = 40,
            .dry = 10,
            .sweet = 0,
            .bitter = 0,
            .sour = 0,
            .smoothness = 70
        },

    [ITEM_PAMTRE_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("PAMTRE"),
            .firmness = BERRY_FIRMNESS_VERY_SOFT,
            .size = 244,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Pamtre,
            .description2 = sBerryDescriptionPart2_Pamtre,
            .stageDuration = 18,
            .spicy = 0,
            .dry = 40,
            .sweet = 10,
            .bitter = 0,
            .sour = 0,
            .smoothness = 70
        },

    [ITEM_WATMEL_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("WATMEL"),
            .firmness = BERRY_FIRMNESS_SOFT,
            .size = 250,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Watmel,
            .description2 = sBerryDescriptionPart2_Watmel,
            .stageDuration = 18,
            .spicy = 0,
            .dry = 0,
            .sweet = 40,
            .bitter = 10,
            .sour = 0,
            .smoothness = 70
        },

    [ITEM_DURIN_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("DURIN"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 280,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Durin,
            .description2 = sBerryDescriptionPart2_Durin,
            .stageDuration = 18,
            .spicy = 0,
            .dry = 0,
            .sweet = 0,
            .bitter = 40,
            .sour = 10,
            .smoothness = 70
        },

    [ITEM_BELUE_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("BELUE"),
            .firmness = BERRY_FIRMNESS_VERY_SOFT,
            .size = 300,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Belue,
            .description2 = sBerryDescriptionPart2_Belue,
            .stageDuration = 18,
            .spicy = 10,
            .dry = 0,
            .sweet = 0,
            .bitter = 0,
            .sour = 40,
            .smoothness = 70
        },

    [ITEM_LIECHI_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("LIECHI"),
            .firmness = BERRY_FIRMNESS_VERY_HARD,
            .size = 111,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Liechi,
            .description2 = sBerryDescriptionPart2_Liechi,
            .stageDuration = 24,
            .spicy = 40,
            .dry = 0,
            .sweet = 40,
            .bitter = 0,
            .sour = 10,
            .smoothness = 80
        },

    [ITEM_GANLON_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("GANLON"),
            .firmness = BERRY_FIRMNESS_VERY_HARD,
            .size = 33,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Ganlon,
            .description2 = sBerryDescriptionPart2_Ganlon,
            .stageDuration = 24,
            .spicy = 0,
            .dry = 40,
            .sweet = 0,
            .bitter = 40,
            .sour = 0,
            .smoothness = 80
        },

    [ITEM_SALAC_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("SALAC"),
            .firmness = BERRY_FIRMNESS_VERY_HARD,
            .size = 95,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Salac,
            .description2 = sBerryDescriptionPart2_Salac,
            .stageDuration = 24,
            .spicy = 0,
            .dry = 0,
            .sweet = 40,
            .bitter = 0,
            .sour = 40,
            .smoothness = 80
        },

    [ITEM_PETAYA_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("PETAYA"),
            .firmness = BERRY_FIRMNESS_VERY_HARD,
            .size = 237,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Petaya,
            .description2 = sBerryDescriptionPart2_Petaya,
            .stageDuration = 24,
            .spicy = 40,
            .dry = 0,
            .sweet = 0,
            .bitter = 40,
            .sour = 0,
            .smoothness = 80
        },

    [ITEM_APICOT_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("APICOT"),
            .firmness = BERRY_FIRMNESS_HARD,
            .size = 75,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Apicot,
            .description2 = sBerryDescriptionPart2_Apicot,
            .stageDuration = 24,
            .spicy = 0,
            .dry = 40,
            .sweet = 0,
            .bitter = 0,
            .sour = 40,
            .smoothness = 80
        },

    [ITEM_LANSAT_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("LANSAT"),
            .firmness = BERRY_FIRMNESS_SOFT,
            .size = 97,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Lansat,
            .description2 = sBerryDescriptionPart2_Lansat,
            .stageDuration = 24,
            .spicy = 10,
            .dry = 10,
            .sweet = 10,
            .bitter = 10,
            .sour = 10,
            .smoothness = 30
        },

    [ITEM_STARF_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("STARF"),
            .firmness = BERRY_FIRMNESS_SUPER_HARD,
            .size = 153,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Starf,
            .description2 = sBerryDescriptionPart2_Starf,
            .stageDuration = 24,
            .spicy = 10,
            .dry = 10,
            .sweet = 10,
            .bitter = 10,
            .sour = 10,
            .smoothness = 30
        },

    [ITEM_ENIGMA_BERRY - FIRST_BERRY_INDEX] =
        {
            .name = _("ENIGMA"),
            .firmness = BERRY_FIRMNESS_UNKNOWN,
            .size = 0,
            .maxYield = 2,
            .minYield = 1,
            .description1 = sBerryDescriptionPart1_Enigma,
            .description2 = sBerryDescriptionPart2_Enigma,
            .stageDuration = 24,
            .spicy = 40,
            .dry = 40,
            .sweet = 40,
            .bitter = 40,
            .sour = 40,
            .smoothness = 40
        },

};

const struct UnkStruct_0858AB24 gUnknown_83DFC9C[] = {
    { 50,  20},
    { 50,  20},
    { 50,  20},
    { 50,  20},
    { 50,  20},
    { 50,  30},
    { 50,  30},
    { 50,  30},
    { 50,  30},
    { 50,  30},
    { 60,  50},
    { 60,  50},
    { 60,  50},
    { 60,  50},
    { 60,  50},
    { 80,  70},
    { 80,  70},
    { 80,  70},
    { 80,  70},
    { 80,  70},
    {100, 100},
    {100, 100},
    {100, 100},
    {100, 100},
    {100, 100},
    {130, 150},
    {130, 150},
    {130, 150},
    {130, 150},
    {130, 150},
    {160, 250},
    {160, 250},
    {160, 250},
    {160, 250},
    {160, 250},
    {180, 500},
    {180, 500},
    {180, 500},
    {180, 500},
    {180, 500},
    {200, 750},
    {200, 750},
    {150, 200}
};

// Leftover from R/S
const struct BerryTree gBlankBerryTree = {};

#define ENIGMA_BERRY_STRUCT ({ \
    const struct Berry2 * berries = (const struct Berry2 *)gBerries; \
    berries[ITEM_ENIGMA_BERRY - FIRST_BERRY_INDEX]; \
})

void sub_809C718(void)
{
    s32 i;

    gSaveBlock1Ptr->enigmaBerry.berry = ENIGMA_BERRY_STRUCT;
    for (i = 0; i < 18; i++)
        gSaveBlock1Ptr->enigmaBerry.itemEffect[i] = 0;
    gSaveBlock1Ptr->enigmaBerry.holdEffect = 0;
    gSaveBlock1Ptr->enigmaBerry.holdEffectParam = 0;
    gSaveBlock1Ptr->enigmaBerry.checksum = GetEnigmaBerryChecksum(&gSaveBlock1Ptr->enigmaBerry);
}

void sub_809C794(void)
{
    CpuFill16(0, &gSaveBlock1Ptr->enigmaBerry, sizeof(gSaveBlock1Ptr->enigmaBerry));
    sub_809C718();
}

#ifdef NONMATCHING
void SetEnigmaBerry(u8 * berry)
{
    struct EnigmaBerry * enigmaBerry;

    sub_809C794();

    {
        const struct Berry2 * src = (const struct Berry2 *)berry;
        struct Berry2 * dest = &gSaveBlock1Ptr->enigmaBerry.berry;
        *dest = *src;
    }

    enigmaBerry = &gSaveBlock1Ptr->enigmaBerry;
    {
        s32 i = 0;
        u8 * dest = gSaveBlock1Ptr->enigmaBerry.itemEffect;
        const u8 * src = berry + 0x516;

        for (i = 0; i < 18; i++) dest[i] = src[i];
    }
    enigmaBerry->holdEffect = berry[0x528];
    enigmaBerry->holdEffectParam = berry[0x529];
    enigmaBerry->checksum = GetEnigmaBerryChecksum(enigmaBerry);
}
#else
NAKED
void SetEnigmaBerry(u8 * berry)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tadds r4, r0, 0\n"
                "\tbl sub_809C794\n"
                "\tadds r5, r4, 0\n"
                "\tldr r0, _0809C824 @ =gSaveBlock1Ptr\n"
                "\tldr r2, [r0]\n"
                "\tldr r0, _0809C828 @ =0x000030ec\n"
                "\tadds r4, r2, r0\n"
                "\tadds r1, r4, 0\n"
                "\tadds r0, r5, 0\n"
                "\tldm r0!, {r3,r6,r7}\n"
                "\tstm r1!, {r3,r6,r7}\n"
                "\tldm r0!, {r3,r6,r7}\n"
                "\tstm r1!, {r3,r6,r7}\n"
                "\tldr r0, [r0]\n"
                "\tstr r0, [r1]\n"
                "\tmovs r3, 0\n"
                "\tldr r0, _0809C82C @ =0x00003108\n"
                "\tadds r6, r2, r0\n"
                "\tldr r1, _0809C830 @ =0x00000516\n"
                "\tadds r2, r5, r1\n"
                "_0809C7F0:\n"
                "\tadds r0, r6, r3\n"
                "\tadds r1, r2, r3\n"
                "\tldrb r1, [r1]\n"
                "\tstrb r1, [r0]\n"
                "\tadds r3, 0x1\n"
                "\tcmp r3, 0x11\n"
                "\tble _0809C7F0\n"
                "\tmovs r3, 0xA5\n"
                "\tlsls r3, 3\n"
                "\tadds r0, r5, r3\n"
                "\tldrb r0, [r0]\n"
                "\tadds r1, r4, 0\n"
                "\tadds r1, 0x2E\n"
                "\tstrb r0, [r1]\n"
                "\tldr r6, _0809C834 @ =0x00000529\n"
                "\tadds r0, r5, r6\n"
                "\tldrb r0, [r0]\n"
                "\tadds r1, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tadds r0, r4, 0\n"
                "\tbl GetEnigmaBerryChecksum\n"
                "\tstr r0, [r4, 0x30]\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0809C824: .4byte gSaveBlock1Ptr\n"
                "_0809C828: .4byte 0x000030ec\n"
                "_0809C82C: .4byte 0x00003108\n"
                "_0809C830: .4byte 0x00000516\n"
                "_0809C834: .4byte 0x00000529");
}
#endif

u32 GetEnigmaBerryChecksum(struct EnigmaBerry * enigmaBerry)
{
    const u8 * src = (const u8 *)enigmaBerry;
    u32 result = 0;
    u32 i;

    for (i = 0; i < offsetof(struct EnigmaBerry, checksum); i++)
        result += src[i];

    return result;
}

bool32 IsEnigmaBerryValid(void)
{
    if (gSaveBlock1Ptr->enigmaBerry.berry.stageDuration == 0)
        return FALSE;
    if (gSaveBlock1Ptr->enigmaBerry.berry.maxYield == 0)
        return FALSE;
    if (GetEnigmaBerryChecksum(&gSaveBlock1Ptr->enigmaBerry) != gSaveBlock1Ptr->enigmaBerry.checksum)
        return FALSE;

    return TRUE;
}

const struct Berry * GetBerryInfo(u8 berryIdx)
{
    if (berryIdx == ITEM_TO_BERRY(ITEM_ENIGMA_BERRY) && IsEnigmaBerryValid())
        return (struct Berry *)&gSaveBlock1Ptr->enigmaBerry.berry;

    if (berryIdx == 0 || berryIdx > ITEM_TO_BERRY(ITEM_ENIGMA_BERRY))
        berryIdx = 1;

    return &gBerries[berryIdx - 1];
}

u8 ItemIdToBerryType(u16 itemId)
{
    if (itemId - FIRST_BERRY_INDEX < 0 || itemId - FIRST_BERRY_INDEX > ITEM_ENIGMA_BERRY - FIRST_BERRY_INDEX)
        return 1;

    return ITEM_TO_BERRY(itemId);
}

u16 BerryTypeToItemId(u16 berryType)
{
    if (berryType - 1 < 0 || berryType - 1 > ITEM_ENIGMA_BERRY - FIRST_BERRY_INDEX)
        return FIRST_BERRY_INDEX;

    return berryType + FIRST_BERRY_INDEX - 1;
}

void GetBerryNameByBerryType(u8 berryType, u8 * dest)
{
    const struct Berry * berry = GetBerryInfo(berryType);
    memcpy(dest, berry->name, 6);
    dest[6] = EOS;
}
