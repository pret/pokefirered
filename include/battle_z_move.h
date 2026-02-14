#ifndef GUARD_BATTLE_Z_MOVE_H
#define GUARD_BATTLE_Z_MOVE_H

#define MOVE_Z_STATUS   0xFFFF

struct SignatureZMove
{
    u16 species;
    enum Item item;
    enum Move move;
    enum Move zmove;
};

bool32 IsZMove(enum Move move);
bool32 CanUseZMove(enum BattlerId battler);
enum Move GetUsableZMove(enum BattlerId battler, enum Move move);
void ActivateZMove(enum BattlerId battler);
bool32 IsViableZMove(enum BattlerId battler, enum Move move);
bool32 TryChangeZTrigger(enum BattlerId battler, u32 moveIndex);
enum Move GetTypeBasedZMove(enum Move move);
enum Move GetSignatureZMove(enum Move move, u32 species, enum Item item);
bool32 MoveSelectionDisplayZMove(enum Move zmove, enum BattlerId battler);
void SetZEffect(void);
void AssignUsableZMoves(enum BattlerId battler, enum Move *moves);
u32 GetZMovePower(enum Move move);

#endif // GUARD_BATTLE_Z_MOVE_H
