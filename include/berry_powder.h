#ifndef GUARD_BERRY_POWDER_H
#define GUARD_BERRY_POWDER_H

u32 GetBerryPowder(void);
void SetBerryPowder(u32 *powder, u32 amount);
void ApplyNewEncryptionKeyToBerryPowder(u32 newKey);
bool8 GiveBerryPowder(u32 amountToAdd);

#endif //GUARD_BERRY_POWDER_H
