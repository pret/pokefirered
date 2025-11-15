#ifndef GUARD_BATTLE_HOLD_EFFECTS
#define GUARD_BATTLE_HOLD_EFFECTS

struct HoldEffectInfo
{
    u32 onSwitchIn:1;
    u32 onSwitchInFirstTurn:1;
    u32 mirrorHerb:1;
    u32 mirrorHerbFirstTurn:1;
    u32 whiteHerb:1;
    u32 whiteHerbFirstTurn:1;
    u32 whiteHerbEndTurn:1;
    u32 onStatusChange:1;
    u32 onHpThreshold:1;
    u32 keeMarangaBerry:1;
    u32 MentalHerb:1;
    u32 onTargetAfterHit:1;
    u32 onAttackerAfterHit:1;
    u32 lifeOrbShellBell:1;
    u32 leftovers:1;
    u32 orbs:1;
    u32 onEffect:1;
    u32 onFling:1;
    u32 padding:14;
};

extern const struct HoldEffectInfo gHoldEffectsInfo[];

typedef bool32 (*ActivationTiming)(enum HoldEffect holdEffect);
enum ItemEffect ItemBattleEffects(u32 primaryBattler, u32 secondaryBattler, enum HoldEffect holdEffect, ActivationTiming timing);

bool32 IsOnSwitchInActivation(enum HoldEffect holdEffect);
bool32 IsOnSwitchInFirstTurnActivation(enum HoldEffect holdEffect);
bool32 IsMirrorHerbActivation(enum HoldEffect holdEffect);
bool32 IsMirrorHerbFirstTurnActivation(enum HoldEffect holdEffect);
bool32 IsWhiteHerbActivation(enum HoldEffect holdEffect);
bool32 IsWhiteHerbFirstTurnActivation(enum HoldEffect holdEffect);
bool32 IsWhiteHerbEndTurnActivation(enum HoldEffect holdEffect);
bool32 IsOnStatusChangeActivation(enum HoldEffect holdEffect);
bool32 IsOnHpThresholdActivation(enum HoldEffect holdEffect);
bool32 IsKeeMarangaBerryActivation(enum HoldEffect holdEffect);
bool32 IsOnTargetHitActivation(enum HoldEffect holdEffect);
bool32 IsOnAttackerAfterHitActivation(enum HoldEffect holdEffect);
bool32 IsLifeOrbShellBellActivation(enum HoldEffect holdEffect);
bool32 IsLeftoversActivation(enum HoldEffect holdEffect);
bool32 IsOrbsActivation(enum HoldEffect holdEffect);
bool32 IsOnEffectActivation(enum HoldEffect holdEffect);
bool32 IsForceTriggerItemActivation(enum HoldEffect holdEffect);
bool32 IsOnBerryActivation(enum HoldEffect holdEffect);
bool32 IsOnFlingActivation(enum HoldEffect holdEffect);

#endif // GUARD_BATTLE_HOLD_EFFECTS
