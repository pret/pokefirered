const struct Subsprite gSubsprites_83A3728[] = {
    {
        .x = -8,
        .y = -8,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 0,
        .priority = 2
    }
};

const struct Subsprite gSubsprites_83A372C[] = {
    {
        .x = -8,
        .y = -8,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 0,
        .priority = 1
    }
};

const struct Subsprite gSubsprites_83A3730[] = {
    {
        .x = -8,
        .y = -8,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = -8,
        .y = 0,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 2,
        .priority = 3
    }
};

const struct Subsprite gSubsprites_83A3738[] = {
    {
        .x = -8,
        .y = -8,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = -8,
        .y = -8,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 0,
        .priority = 3
    }
};

const struct Subsprite gSubsprites_83A3740[] = {
    {
        .x = -8,
        .y = -8,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = -8,
        .y = -8,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 0,
        .priority = 3
    }
};

const struct SubspriteTable gObjectEventSpriteOamTables_16x16[] = {
    {0, NULL},
    {1, gSubsprites_83A3728},
    {1, gSubsprites_83A372C},
    {2, gSubsprites_83A3730},
    {2, gSubsprites_83A3738},
    {2, gSubsprites_83A3740},
};

const struct Subsprite gSubsprites_83A3778[] = {
    {
        .x = -8,
        .y = -16,
        .shape = SPRITE_SHAPE(16x32),
        .size = SPRITE_SIZE(16x32),
        .tileOffset = 0,
        .priority = 2
    }
};

const struct Subsprite gSubsprites_83A377C[] = {
    {
        .x = -8,
        .y = -16,
        .shape = SPRITE_SHAPE(16x32),
        .size = SPRITE_SIZE(16x32),
        .tileOffset = 0,
        .priority = 1
    }
};

const struct Subsprite gSubsprites_83A3780[] = {
    {
        .x = -8,
        .y = -16,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = -8,
        .y = 0,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 4,
        .priority = 2
    },
    {
        .x = -8,
        .y = 8,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 6,
        .priority = 3
    }
};

const struct Subsprite gSubsprites_83A378C[] = {
    {
        .x = -8,
        .y = -16,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = -8,
        .y = 0,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 4,
        .priority = 3
    }
};

const struct Subsprite gSubsprites_83A3794[] = {
    {
        .x = -8,
        .y = -16,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = -8,
        .y = 0,
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .tileOffset = 4,
        .priority = 3
    }
};

const struct SubspriteTable gObjectEventSpriteOamTables_16x32[] = {
    {0, NULL},
    {1, gSubsprites_83A3778},
    {1, gSubsprites_83A377C},
    {3, gSubsprites_83A3780},
    {2, gSubsprites_83A378C},
    {2, gSubsprites_83A3794},
};

const struct Subsprite gSubsprites_83A37CC[] = {
    {
        .x = -16,
        .y = -16,
        .shape = SPRITE_SHAPE(32x32),
        .size = SPRITE_SIZE(32x32),
        .tileOffset = 0,
        .priority = 2
    }
};

const struct Subsprite gSubsprites_83A37D0[] = {
    {
        .x = -16,
        .y = -16,
        .shape = SPRITE_SHAPE(32x32),
        .size = SPRITE_SIZE(32x32),
        .tileOffset = 0,
        .priority = 1
    }
};

const struct Subsprite gSubsprites_83A37D4[] = {
    {
        .x = -16,
        .y = -16,
        .shape = SPRITE_SHAPE(32x16),
        .size = SPRITE_SIZE(32x16),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = -16,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 8,
        .priority = 2
    },
    {
        .x = -16, 
        .y = 8, 
        .shape = SPRITE_SHAPE(32x8), 
        .size = SPRITE_SIZE(32x8), 
        .tileOffset = 12, 
        .priority = 3
    }
};

const struct Subsprite gSubsprites_83A37E0[] = {
    {
        .x = -16,
        .y = -16,
        .shape = SPRITE_SHAPE(32x16),
        .size = SPRITE_SIZE(32x16),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = -16,
        .y = 0,
        .shape = SPRITE_SHAPE(32x16),
        .size = SPRITE_SIZE(32x16),
        .tileOffset = 8,
        .priority = 3
    }
};

const struct Subsprite gSubsprites_83A37E8[] = {
    {
        .x = -16,
        .y = -16,
        .shape = SPRITE_SHAPE(32x16),
        .size = SPRITE_SIZE(32x16),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = -16,
        .y = 0,
        .shape = SPRITE_SHAPE(32x16),
        .size = SPRITE_SIZE(32x16),
        .tileOffset = 8,
        .priority = 3
    }
};

const struct SubspriteTable gObjectEventSpriteOamTables_32x32[] = {
    {0, NULL},
    {1, gSubsprites_83A37CC},
    {1, gSubsprites_83A37D0},
    {3, gSubsprites_83A37D4},
    {2, gSubsprites_83A37E0},
    {2, gSubsprites_83A37E8},
};

const struct Subsprite gUnknown_83A3820[] = {
    {
        .x = -24,
        .y = -24,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = 8,
        .y = -24,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 4,
        .priority = 2
    },
    {
        .x = -24,
        .y = -16,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 6,
        .priority = 2
    },
    {
        .x = 8,
        .y = -16,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 10,
        .priority = 2
    },
    {
        .x = -24,
        .y = -8,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 12,
        .priority = 2
    },
    {
        .x = 8,
        .y = -8,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 16,
        .priority = 2
    },
    {
        .x = -24,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 18,
        .priority = 2
    },
    {
        .x = 8,
        .y = 0,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 22,
        .priority = 2
    },
    {
        .x = -24,
        .y = 8,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 24,
        .priority = 2
    },
    {
        .x = 8,
        .y = 8,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 28,
        .priority = 2
    },
    {
        .x = -24,
        .y = 16,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 30,
        .priority = 2
    },
    {
        .x = 8,
        .y = 16,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 34,
        .priority = 2
    }
};

const struct SubspriteTable gUnknown_83A3850[] = {
    {12, gUnknown_83A3820},
    {12, gUnknown_83A3820},
    {12, gUnknown_83A3820},
    {12, gUnknown_83A3820},
    {12, gUnknown_83A3820},
    {12, gUnknown_83A3820},
};

const struct Subsprite gUnknown_83A3880[] = {
    {
        .x = -32,
        .y = -16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 0,
        .priority = 2
    }
};

const struct Subsprite gUnknown_83A3884[] = {
    {
        .x = -32,
        .y = -16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 0,
        .priority = 1
    }
};

const struct Subsprite gUnknown_83A3888[] = {
    {
        .x = -32,
        .y = -16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 0,
        .priority = 2
    }
};

const struct Subsprite gUnknown_83A388C[] = {
    {
        .x = -32,
        .y = -16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 0,
        .priority = 2
    }
};

const struct SubspriteTable gUnknown_83A3890[] = {
    {0, NULL},
    {1, gUnknown_83A3880},
    {1, gUnknown_83A3884},
    {1, gUnknown_83A3888},
    {1, gUnknown_83A388C},
    {1, gUnknown_83A388C},
};

const struct Subsprite gSubsprites_83A38C0[] = {
    {
        .x = -32,
        .y = -32,
        .shape = SPRITE_SHAPE(64x64),
        .size = SPRITE_SIZE(64x64),
        .tileOffset = 0,
        .priority = 2
    }
};

const struct Subsprite gSubsprites_83A38C4[] = {
    {
        .x = -32,
        .y = -32,
        .shape = SPRITE_SHAPE(64x64),
        .size = SPRITE_SIZE(64x64),
        .tileOffset = 0,
        .priority = 1
    }
};

const struct Subsprite gSubsprites_83A38C8[] = {
    {
        .x = -32,
        .y = -32,
        .shape = SPRITE_SHAPE(64x64),
        .size = SPRITE_SIZE(64x64),
        .tileOffset = 0,
        .priority = 2
    }
};

const struct Subsprite gSubsprites_83A38CC[] = {
    {
        .x = -32,
        .y = -32,
        .shape = SPRITE_SHAPE(64x64),
        .size = SPRITE_SIZE(64x64),
        .tileOffset = 0,
        .priority = 2
    }
};

const struct SubspriteTable gObjectEventSpriteOamTables_64x64[] = {
    {0, NULL},
    {1, gSubsprites_83A38C0},
    {1, gSubsprites_83A38C4},
    {1, gSubsprites_83A38C8},
    {1, gSubsprites_83A38CC},
    {1, gSubsprites_83A38CC},
};

const struct Subsprite gUnknown_83A3900[] = {
    {
        .x = -48,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = -16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 2
    },
    {
        .x = 16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 8,
        .priority = 2
    },
    {
        .x = -48,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 12,
        .priority = 2
    },
    {
        .x = -16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 16,
        .priority = 2
    },
    {
        .x = 16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 20,
        .priority = 2
    },
    {
        .x = -48,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 24,
        .priority = 2
    },
    {
        .x = -16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 28,
        .priority = 2
    },
    {
        .x = 16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 32,
        .priority = 2
    },
    {
        .x = -48,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 36,
        .priority = 2
    },
    {
        .x = -16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 40,
        .priority = 2
    },
    {
        .x = 16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 44,
        .priority = 2
    },
    {
        .x = -48,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 48,
        .priority = 2
    },
    {
        .x = -16,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 52,
        .priority = 2
    },
    {
        .x = 16,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 56,
        .priority = 2
    }
};

const struct Subsprite gUnknown_83A393C[] = {
    {
        .x = -48,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = -16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 1
    },
    {
        .x = 16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 8,
        .priority = 1
    },
    {
        .x = -48,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 12,
        .priority = 1
    },
    {
        .x = -16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 16,
        .priority = 1
    },
    {
        .x = 16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 20,
        .priority = 1
    },
    {
        .x = -48,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 24,
        .priority = 1
    },
    {
        .x = -16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 28,
        .priority = 1
    },
    {
        .x = 16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 32,
        .priority = 1
    },
    {
        .x = -48,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 36,
        .priority = 1
    },
    {
        .x = -16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 40,
        .priority = 1
    },
    {
        .x = 16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 44,
        .priority = 1
    },
    {
        .x = -48,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 48,
        .priority = 1
    },
    {
        .x = -16,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 52,
        .priority = 1
    },
    {
        .x = 16,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 56,
        .priority = 1
    }
};

const struct Subsprite gUnknown_83A3978[] = {
    {
        .x = -48,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = -16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 2
    },
    {
        .x = 16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 8,
        .priority = 2
    },
    {
        .x = -48,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 12,
        .priority = 2
    },
    {
        .x = -16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 16,
        .priority = 2
    },
    {
        .x = 16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 20,
        .priority = 2
    },
    {
        .x = -48,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 24,
        .priority = 2
    },
    {
        .x = -16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 28,
        .priority = 2
    },
    {
        .x = 16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 32,
        .priority = 2
    },
    {
        .x = -48,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 36,
        .priority = 2
    },
    {
        .x = -16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 40,
        .priority = 2
    },
    {
        .x = 16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 44,
        .priority = 2
    },
    {
        .x = -48,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 48,
        .priority = 2
    },
    {
        .x = -16,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 52,
        .priority = 2
    },
    {
        .x = 16,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 56,
        .priority = 2
    }
};

const struct Subsprite gUnknown_83A39B4[] = {
    {
        .x = -48,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = -16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 1
    },
    {
        .x = 16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 8,
        .priority = 1
    },
    {
        .x = -48,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 12,
        .priority = 1
    },
    {
        .x = -16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 16,
        .priority = 1
    },
    {
        .x = 16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 20,
        .priority = 1
    },
    {
        .x = -48,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 24,
        .priority = 2
    },
    {
        .x = -16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 28,
        .priority = 2
    },
    {
        .x = 16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 32,
        .priority = 2
    },
    {
        .x = -48,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 36,
        .priority = 2
    },
    {
        .x = -16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 40,
        .priority = 2
    },
    {
        .x = 16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 44,
        .priority = 2
    },
    {
        .x = -48,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 48,
        .priority = 2
    },
    {
        .x = -16,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 52,
        .priority = 2
    },
    {
        .x = 16,
        .y = 12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 56,
        .priority = 2
    }
};

const struct SubspriteTable gUnknown_83A39F0[] = {
    {15, gUnknown_83A3900},
    {15, gUnknown_83A3900},
    {15, gUnknown_83A393C},
    {15, gUnknown_83A3978},
    {15, gUnknown_83A39B4},
    {15, gUnknown_83A39B4},
};

const struct Subsprite gSubsprites_83A3A20[] = {
    {
        .x = -32,
        .y = -16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = 32,
        .y = -16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 32,
        .priority = 2
    },
    {
        .x = -32,
        .y = 16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 64,
        .priority = 2
    },
    {
        .x = 32,
        .y = 16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 96,
        .priority = 2
    }
};

const struct Subsprite gSubsprites_83A3A30[] = {
    {
        .x = -32,
        .y = -16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = 32,
        .y = -16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 32,
        .priority = 1
    },
    {
        .x = -32,
        .y = 16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 64,
        .priority = 1
    },
    {
        .x = 32,
        .y = 16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 96,
        .priority = 1
    }
};

const struct Subsprite gSubsprites_83A3A40[] = {
    {
        .x = -32,
        .y = -16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = 32,
        .y = -16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 32,
        .priority = 1
    },
    {
        .x = -32,
        .y = 16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 64,
        .priority = 2
    },
    {
        .x = 32,
        .y = 16,
        .shape = SPRITE_SHAPE(64x32),
        .size = SPRITE_SIZE(64x32),
        .tileOffset = 96,
        .priority = 2
    }
};

const struct SubspriteTable gObjectEventSpriteOamTables_8x8[] = {
    {4, gSubsprites_83A3A20},
    {4, gSubsprites_83A3A20},
    {4, gSubsprites_83A3A30},
    {4, gSubsprites_83A3A40},
    {4, gSubsprites_83A3A40},
    {4, gSubsprites_83A3A40},
};

const struct Subsprite gUnknown_83A3A80[] = {
    {
        .x = -48,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = -16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 2
    },
    {
        .x = 16,
        .y = -20,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 8,
        .priority = 2
    },
    {
        .x = 32,
        .y = -20,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 10,
        .priority = 2
    },
    {
        .x = -48,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 11,
        .priority = 2
    },
    {
        .x = -16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 15,
        .priority = 2
    },
    {
        .x = 16,
        .y = -12,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 19,
        .priority = 2
    },
    {
        .x = 32,
        .y = -12,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 21,
        .priority = 2
    },
    {
        .x = -48,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 22,
        .priority = 2
    },
    {
        .x = -16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 26,
        .priority = 2
    },
    {
        .x = 16,
        .y = -4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 30,
        .priority = 2
    },
    {
        .x = 32,
        .y = -4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 32,
        .priority = 2
    },
    {
        .x = -48,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 33,
        .priority = 2
    },
    {
        .x = -16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 37,
        .priority = 2
    },
    {
        .x = 16,
        .y = 4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 41,
        .priority = 2
    },
    {
        .x = 32,
        .y = 4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 43,
        .priority = 2
    }
};

const struct Subsprite gUnknown_83A3AC0[] = {
    {
        .x = -48,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = -16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 1
    },
    {
        .x = 16,
        .y = -20,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 8,
        .priority = 1
    },
    {
        .x = 32,
        .y = -20,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 10,
        .priority = 1
    },
    {
        .x = -48,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 11,
        .priority = 1
    },
    {
        .x = -16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 15,
        .priority = 1
    },
    {
        .x = 16,
        .y = -12,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 19,
        .priority = 1
    },
    {
        .x = 32,
        .y = -12,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 21,
        .priority = 1
    },
    {
        .x = -48,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 22,
        .priority = 1
    },
    {
        .x = -16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 26,
        .priority = 1
    },
    {
        .x = 16,
        .y = -4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 30,
        .priority = 1
    },
    {
        .x = 32,
        .y = -4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 32,
        .priority = 1
    },
    {
        .x = -48,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 33,
        .priority = 1
    },
    {
        .x = -16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 37,
        .priority = 1
    },
    {
        .x = 16,
        .y = 4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 41,
        .priority = 1
    },
    {
        .x = 32,
        .y = 4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 43,
        .priority = 1
    }
};

const struct Subsprite gUnknown_83A3B00[] = {
    {
        .x = -48,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 2
    },
    {
        .x = -16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 2
    },
    {
        .x = 16,
        .y = -20,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 8,
        .priority = 2
    },
    {
        .x = 32,
        .y = -20,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 10,
        .priority = 2
    },
    {
        .x = -48,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 11,
        .priority = 2
    },
    {
        .x = -16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 15,
        .priority = 2
    },
    {
        .x = 16,
        .y = -12,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 19,
        .priority = 2
    },
    {
        .x = 32,
        .y = -12,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 21,
        .priority = 2
    },
    {
        .x = -48,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 22,
        .priority = 2
    },
    {
        .x = -16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 26,
        .priority = 2
    },
    {
        .x = 16,
        .y = -4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 30,
        .priority = 2
    },
    {
        .x = 32,
        .y = -4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 32,
        .priority = 2
    },
    {
        .x = -48,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 33,
        .priority = 2
    },
    {
        .x = -16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 37,
        .priority = 2
    },
    {
        .x = 16,
        .y = 4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 41,
        .priority = 2
    },
    {
        .x = 32,
        .y = 4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 43,
        .priority = 2
    }
};

const struct Subsprite gUnknown_83A3B40[] = {
    {
        .x = -48,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = -16,
        .y = -20,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 1
    },
    {
        .x = 16,
        .y = -20,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 8,
        .priority = 1
    },
    {
        .x = 32,
        .y = -20,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 10,
        .priority = 1
    },
    {
        .x = -48,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 11,
        .priority = 1
    },
    {
        .x = -16,
        .y = -12,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 15,
        .priority = 1
    },
    {
        .x = 16,
        .y = -12,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 19,
        .priority = 1
    },
    {
        .x = 32,
        .y = -12,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 21,
        .priority = 1
    },
    {
        .x = -48,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 22,
        .priority = 2
    },
    {
        .x = -16,
        .y = -4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 26,
        .priority = 2
    },
    {
        .x = 16,
        .y = -4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 30,
        .priority = 2
    },
    {
        .x = 32,
        .y = -4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 32,
        .priority = 2
    },
    {
        .x = -48,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 33,
        .priority = 2
    },
    {
        .x = -16,
        .y = 4,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 37,
        .priority = 2
    },
    {
        .x = 16,
        .y = 4,
        .shape = SPRITE_SHAPE(16x8),
        .size = SPRITE_SIZE(16x8),
        .tileOffset = 41,
        .priority = 2
    },
    {
        .x = 32,
        .y = 4,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 43,
        .priority = 2
    }
};

const struct SubspriteTable gUnknown_83A3B80[] = {
    {16, gUnknown_83A3A80},
    {16, gUnknown_83A3A80},
    {16, gUnknown_83A3AC0},
    {16, gUnknown_83A3B00},
    {16, gUnknown_83A3B40},
    {16, gUnknown_83A3B40},
};
