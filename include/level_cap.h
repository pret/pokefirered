#ifndef GUARD_LEVEL_CAP_H
#define GUARD_LEVEL_CAP_H

#define GYM_BADGE_COUNT 8

enum GymBadgeLevelCaps {
    LEVEL_CAP_NO_BADGES = 14,    // Before first badge
    LEVEL_CAP_BADGE_1 = 21,      // After first badge
    LEVEL_CAP_BADGE_2 = 24,      // After second badge
    LEVEL_CAP_BADGE_3 = 29,      // After third badge
    LEVEL_CAP_BADGE_4 = 43,      // After fourth badge
    LEVEL_CAP_BADGE_5 = 43,      // After fifth badge
    LEVEL_CAP_BADGE_6 = 47,      // After sixth badge
    LEVEL_CAP_BADGE_7 = 50,      // After seventh badge
    LEVEL_CAP_BADGE_8 = 63,      // After eighth badge
};

u8 GetCurrentLevelCap(void);

#endif // GUARD_LEVEL_CAP_H
