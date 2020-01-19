static const union AnimCmd sAnimCmd_Red_1[] = {
    ANIMCMD_FRAME(1, 20),
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_FRAME(4, 24),
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_Leaf_1[] = {
    ANIMCMD_FRAME(1, 20),
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_FRAME(4, 24),
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_Pokedude_1[] = {
    ANIMCMD_FRAME(1, 24),
    ANIMCMD_FRAME(2, 9),
    ANIMCMD_FRAME(3, 24),
    ANIMCMD_FRAME(0, 9),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_OldMan_1[] = {
    ANIMCMD_FRAME(1, 24),
    ANIMCMD_FRAME(2, 9),
    ANIMCMD_FRAME(3, 24),
    ANIMCMD_FRAME(0, 9),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_RSBrendan_1[] = {
    ANIMCMD_FRAME(0, 24),
    ANIMCMD_FRAME(1, 9),
    ANIMCMD_FRAME(2, 24),
    ANIMCMD_FRAME(0, 9),
    ANIMCMD_FRAME(3, 50),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_RSMay_1[] = {
    ANIMCMD_FRAME(0, 24),
    ANIMCMD_FRAME(1, 9),
    ANIMCMD_FRAME(2, 24),
    ANIMCMD_FRAME(0, 9),
    ANIMCMD_FRAME(3, 50),
    ANIMCMD_END
};

const union AnimCmd *const sBackAnims_Red[] = {
    sAnim_GeneralFrame0,
    sAnimCmd_Red_1
};

const union AnimCmd *const sBackAnims_Leaf[] = {
    sAnim_GeneralFrame0,
    sAnimCmd_Leaf_1
};

const union AnimCmd *const sBackAnims_Pokedude[] = {
    sAnim_GeneralFrame0,
    sAnimCmd_Pokedude_1
};

const union AnimCmd *const sBackAnims_OldMan[] = {
    sAnim_GeneralFrame0,
    sAnimCmd_OldMan_1
};

const union AnimCmd *const sBackAnims_RSBrendan[] = {
    sAnim_GeneralFrame3,
    sAnimCmd_RSBrendan_1
};

const union AnimCmd *const sBackAnims_RSMay[] = {
    sAnim_GeneralFrame3,
    sAnimCmd_RSMay_1
};

const union AnimCmd *const *const gTrainerBackAnimsPtrTable[] = {
    sBackAnims_Red,
    sBackAnims_Leaf,
    sBackAnims_RSBrendan,
    sBackAnims_RSMay,
    sBackAnims_Pokedude,
    sBackAnims_OldMan
};
