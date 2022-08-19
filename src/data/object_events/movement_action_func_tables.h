static bool8 MovementAction_FaceDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FaceUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FaceLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FaceRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_PauseSpriteAnim(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FaceDownFast_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FaceUpFast_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FaceLeftFast_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FaceRightFast_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowerDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowerDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowerUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowerUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowerLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowerLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowerRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowerRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkNormalDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkNormalDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkNormalUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkNormalUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkNormalLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkNormalLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkNormalRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkNormalRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceSlowDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceSlowUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceSlowLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceSlowRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceSlow_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceNormalDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceNormalUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceNormalLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceNormalRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlace_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceFastDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceFastUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceFastLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceFastRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceFasterDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceFasterUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceFasterLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkInPlaceFasterRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Jump2Down_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Jump2Down_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Jump2Up_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Jump2Up_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Jump2Left_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Jump2Left_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Jump2Right_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Jump2Right_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Delay1_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Delay2_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Delay4_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Delay8_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Delay16_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Delay_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFastDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFastDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFastUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFastUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFastLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFastLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFastRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFastRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RideWaterCurrentDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RideWaterCurrentDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RideWaterCurrentUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RideWaterCurrentUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RideWaterCurrentLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RideWaterCurrentLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RideWaterCurrentRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RideWaterCurrentRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFasterDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFasterDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFasterUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFasterUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFasterLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFasterLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFasterRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkFasterRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SlideDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SlideDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SlideUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SlideUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SlideLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SlideLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SlideRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SlideRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_PlayerRunDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_PlayerRunDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_PlayerRunUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_PlayerRunUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_PlayerRunLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_PlayerRunLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_PlayerRunRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_PlayerRunRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RunDownSlow_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RunDownSlow_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RunUpSlow_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RunUpSlow_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RunLeftSlow_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RunLeftSlow_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RunRightSlow_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RunRightSlow_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_StartAnimInDirection_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FacePlayer_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FaceAwayPlayer_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_LockFacingDirection_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_UnlockFacingDirection_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceDownUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceDownUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceUpDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceUpDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceLeftRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceLeftRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceRightLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpInPlaceRightLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FaceOriginalDirection_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_NurseJoyBowDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_EnableJumpLandingGroundEffect_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_DisableJumpLandingGroundEffect_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_DisableAnimation_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RestoreAnimation_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SetInvisible_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SetVisible_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_EmoteExclamationMark_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_EmoteQuestionMark_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_EmoteX_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_EmoteDoubleExclamationMark_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_EmoteSmile_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RevealTrainer_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RevealTrainer_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RockSmashBreak_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RockSmashBreak_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RockSmashBreak_Step2(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_CutTree_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_CutTree_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_CutTree_Step2(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SetFixedPriority_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_ClearFixedPriority_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_InitAffineAnim_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_ClearAffineAnim_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkDownStartAffine_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkDownStartAffine_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkDownAffine_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkDownAffine_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieFaceDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieFaceUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieFaceLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieFaceRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroEndWheelieFaceDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroEndWheelieFaceUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroEndWheelieFaceLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroEndWheelieFaceRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_UnusedAcroActionDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_UnusedAcroActionUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_UnusedAcroActionLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_UnusedAcroActionRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopFaceDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopFaceDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopFaceUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopFaceUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopFaceLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopFaceLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopFaceRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopFaceRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieHopRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieJumpDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieJumpDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieJumpUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieJumpUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieJumpLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieJumpLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieJumpRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieJumpRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieInPlaceDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieInPlaceUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieInPlaceLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieInPlaceRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieMoveDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieMoveDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieMoveUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieMoveUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieMoveLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieMoveLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieMoveRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroPopWheelieMoveRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieMoveDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieMoveDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieMoveUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieMoveUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieMoveLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieMoveLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieMoveRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_AcroWheelieMoveRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SpinDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SpinDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SpinUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SpinUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SpinLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SpinLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SpinRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_SpinRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RaiseHand_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RaiseHandAndStop_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RaiseHandAndJump_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_RaiseHandAndSwim_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowestDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowestDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowestUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowestUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowestLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowestLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowestRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WalkSlowestRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_ShakeHeadOrWalkInPlace_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_ShakeHeadOrWalkInPlace_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_GlideDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_GlideDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_GlideUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_GlideUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_GlideLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_GlideLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_GlideRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_GlideRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FlyUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FlyUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FlyUp_Step2(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FlyDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_FlyDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialWithEffectDown_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialWithEffectDown_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialWithEffectUp_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialWithEffectUp_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialWithEffectLeft_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialWithEffectLeft_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialWithEffectRight_Step0(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_JumpSpecialWithEffectRight_Step1(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_WaitSpriteAnim(struct ObjectEvent *, struct Sprite *);
static bool8 MovementAction_Finish(struct ObjectEvent *, struct Sprite *);

static bool8 (*const sMovementActionFuncs_FaceDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FaceUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FaceLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FaceRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FaceDownFast[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FaceUpFast[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FaceLeftFast[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FaceRightFast[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowerDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowerUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowerLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowerRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkNormalDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkNormalUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkNormalLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkNormalRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_Jump2Down[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_Jump2Up[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_Jump2Left[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_Jump2Right[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_Delay1[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_Delay2[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_Delay4[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_Delay8[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_Delay16[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkFastDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkFastUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkFastLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkFastRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceSlowDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceSlowUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceSlowLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceSlowRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceNormalDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceNormalUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceNormalLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceNormalRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceFastDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceFastUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceFastLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceFastRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceFasterDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceFasterUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceFasterLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkInPlaceFasterRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_RideWaterCurrentDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_RideWaterCurrentUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_RideWaterCurrentLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_RideWaterCurrentRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkFasterDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkFasterUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkFasterLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkFasterRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SlideDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SlideUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SlideLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SlideRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_PlayerRunDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_PlayerRunUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_PlayerRunLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_PlayerRunRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_PlayerRunDownSlow[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_PlayerRunUpSlow[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_PlayerRunLeftSlow[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_PlayerRunRightSlow[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_StartAnimInDirection[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpSpecialDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpSpecialUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpSpecialLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpSpecialRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FacePlayer[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FaceAwayPlayer[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_LockFacingDirection[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_UnlockFacingDirection[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpInPlaceDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpInPlaceUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpInPlaceLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpInPlaceRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpInPlaceDownUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpInPlaceUpDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpInPlaceLeftRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpInPlaceRightLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FaceOriginalDirection[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_NurseJoyBowDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_EnableJumpLandingGroundEffect[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_DisableJumpLandingGroundEffect[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_DisableAnimation[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_RestoreAnimation[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SetInvisible[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SetVisible[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_EmoteExclamationMark[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_EmoteQuestionMark[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_EmoteX[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_EmoteDoubleExclMark[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_EmoteSmile[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_RevealTrainer[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_RockSmashBreak[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_CutTree[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SetFixedPriority[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_ClearFixedPriority[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_InitAffineAnim[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_ClearAffineAnim[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkDownStartAffine[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkDownAffine[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieFaceDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieFaceUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieFaceLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieFaceRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroPopWheelieDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroPopWheelieUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroPopWheelieLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroPopWheelieRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroEndWheelieFaceDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroEndWheelieFaceUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroEndWheelieFaceLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroEndWheelieFaceRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieHopFaceDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieHopFaceUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieHopFaceLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieHopFaceRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieHopDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieHopUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieHopLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieHopRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieJumpDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieJumpUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieJumpLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieJumpRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieInPlaceDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieInPlaceUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieInPlaceLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieInPlaceRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroPopWheelieMoveDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroPopWheelieMoveUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroPopWheelieMoveLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroPopWheelieMoveRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieMoveDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieMoveUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieMoveLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_AcroWheelieMoveRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SpinDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SpinUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SpinLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_SpinRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_RaiseHandAndStop[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_RaiseHandAndJump[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_RaiseHandAndSwim[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowestDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowestUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowestLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_WalkSlowestRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_ShakeHeadOrWalkInPlace[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_GlideDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_GlideUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_GlideLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_GlideRight[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FlyUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_FlyDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpSpecialWithEffectDown[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpSpecialWithEffectUp[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpSpecialWithEffectLeft[])(struct ObjectEvent *, struct Sprite *);
static bool8 (*const sMovementActionFuncs_JumpSpecialWithEffectRight[])(struct ObjectEvent *, struct Sprite *);

static u8 GetMoveDirectionFastAnimNum(u8 direction);
static u8 GetMoveDirectionFasterAnimNum(u8 direction);
static u8 GetMoveDirectionFastestAnimNum(u8 direction);

static bool8 (*const *const sMovementActionFuncs[])(struct ObjectEvent *, struct Sprite *) = {
    [MOVEMENT_ACTION_FACE_DOWN]                          = sMovementActionFuncs_FaceDown,
    [MOVEMENT_ACTION_FACE_UP]                            = sMovementActionFuncs_FaceUp,
    [MOVEMENT_ACTION_FACE_LEFT]                          = sMovementActionFuncs_FaceLeft,
    [MOVEMENT_ACTION_FACE_RIGHT]                         = sMovementActionFuncs_FaceRight,
    [MOVEMENT_ACTION_FACE_DOWN_FAST]                     = sMovementActionFuncs_FaceDownFast,
    [MOVEMENT_ACTION_FACE_UP_FAST]                       = sMovementActionFuncs_FaceUpFast,
    [MOVEMENT_ACTION_FACE_LEFT_FAST]                     = sMovementActionFuncs_FaceLeftFast,
    [MOVEMENT_ACTION_FACE_RIGHT_FAST]                    = sMovementActionFuncs_FaceRightFast,
    [MOVEMENT_ACTION_WALK_SLOWER_DOWN]                   = sMovementActionFuncs_WalkSlowerDown,
    [MOVEMENT_ACTION_WALK_SLOWER_UP]                     = sMovementActionFuncs_WalkSlowerUp,
    [MOVEMENT_ACTION_WALK_SLOWER_LEFT]                   = sMovementActionFuncs_WalkSlowerLeft,
    [MOVEMENT_ACTION_WALK_SLOWER_RIGHT]                  = sMovementActionFuncs_WalkSlowerRight,
    [MOVEMENT_ACTION_WALK_SLOW_DOWN]                     = sMovementActionFuncs_WalkSlowDown,
    [MOVEMENT_ACTION_WALK_SLOW_UP]                       = sMovementActionFuncs_WalkSlowUp,
    [MOVEMENT_ACTION_WALK_SLOW_LEFT]                     = sMovementActionFuncs_WalkSlowLeft,
    [MOVEMENT_ACTION_WALK_SLOW_RIGHT]                    = sMovementActionFuncs_WalkSlowRight,
    [MOVEMENT_ACTION_WALK_NORMAL_DOWN]                   = sMovementActionFuncs_WalkNormalDown,
    [MOVEMENT_ACTION_WALK_NORMAL_UP]                     = sMovementActionFuncs_WalkNormalUp,
    [MOVEMENT_ACTION_WALK_NORMAL_LEFT]                   = sMovementActionFuncs_WalkNormalLeft,
    [MOVEMENT_ACTION_WALK_NORMAL_RIGHT]                  = sMovementActionFuncs_WalkNormalRight,
    [MOVEMENT_ACTION_JUMP_2_DOWN]                        = sMovementActionFuncs_Jump2Down,
    [MOVEMENT_ACTION_JUMP_2_UP]                          = sMovementActionFuncs_Jump2Up,
    [MOVEMENT_ACTION_JUMP_2_LEFT]                        = sMovementActionFuncs_Jump2Left,
    [MOVEMENT_ACTION_JUMP_2_RIGHT]                       = sMovementActionFuncs_Jump2Right,
    [MOVEMENT_ACTION_DELAY_1]                            = sMovementActionFuncs_Delay1,
    [MOVEMENT_ACTION_DELAY_2]                            = sMovementActionFuncs_Delay2,
    [MOVEMENT_ACTION_DELAY_4]                            = sMovementActionFuncs_Delay4,
    [MOVEMENT_ACTION_DELAY_8]                            = sMovementActionFuncs_Delay8,
    [MOVEMENT_ACTION_DELAY_16]                           = sMovementActionFuncs_Delay16,
    [MOVEMENT_ACTION_WALK_FAST_DOWN]                     = sMovementActionFuncs_WalkFastDown,
    [MOVEMENT_ACTION_WALK_FAST_UP]                       = sMovementActionFuncs_WalkFastUp,
    [MOVEMENT_ACTION_WALK_FAST_LEFT]                     = sMovementActionFuncs_WalkFastLeft,
    [MOVEMENT_ACTION_WALK_FAST_RIGHT]                    = sMovementActionFuncs_WalkFastRight,
    [MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_DOWN]            = sMovementActionFuncs_WalkInPlaceSlowDown,
    [MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_UP]              = sMovementActionFuncs_WalkInPlaceSlowUp,
    [MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_LEFT]            = sMovementActionFuncs_WalkInPlaceSlowLeft,
    [MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_RIGHT]           = sMovementActionFuncs_WalkInPlaceSlowRight,
    [MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_DOWN]          = sMovementActionFuncs_WalkInPlaceNormalDown,
    [MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_UP]            = sMovementActionFuncs_WalkInPlaceNormalUp,
    [MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_LEFT]          = sMovementActionFuncs_WalkInPlaceNormalLeft,
    [MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_RIGHT]         = sMovementActionFuncs_WalkInPlaceNormalRight,
    [MOVEMENT_ACTION_WALK_IN_PLACE_FAST_DOWN]            = sMovementActionFuncs_WalkInPlaceFastDown,
    [MOVEMENT_ACTION_WALK_IN_PLACE_FAST_UP]              = sMovementActionFuncs_WalkInPlaceFastUp,
    [MOVEMENT_ACTION_WALK_IN_PLACE_FAST_LEFT]            = sMovementActionFuncs_WalkInPlaceFastLeft,
    [MOVEMENT_ACTION_WALK_IN_PLACE_FAST_RIGHT]           = sMovementActionFuncs_WalkInPlaceFastRight,
    [MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_DOWN]          = sMovementActionFuncs_WalkInPlaceFasterDown,
    [MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_UP]            = sMovementActionFuncs_WalkInPlaceFasterUp,
    [MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_LEFT]          = sMovementActionFuncs_WalkInPlaceFasterLeft,
    [MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_RIGHT]         = sMovementActionFuncs_WalkInPlaceFasterRight,
    [MOVEMENT_ACTION_RIDE_WATER_CURRENT_DOWN]            = sMovementActionFuncs_RideWaterCurrentDown,
    [MOVEMENT_ACTION_RIDE_WATER_CURRENT_UP]              = sMovementActionFuncs_RideWaterCurrentUp,
    [MOVEMENT_ACTION_RIDE_WATER_CURRENT_LEFT]            = sMovementActionFuncs_RideWaterCurrentLeft,
    [MOVEMENT_ACTION_RIDE_WATER_CURRENT_RIGHT]           = sMovementActionFuncs_RideWaterCurrentRight,
    [MOVEMENT_ACTION_WALK_FASTER_DOWN]                   = sMovementActionFuncs_WalkFasterDown,
    [MOVEMENT_ACTION_WALK_FASTER_UP]                     = sMovementActionFuncs_WalkFasterUp,
    [MOVEMENT_ACTION_WALK_FASTER_LEFT]                   = sMovementActionFuncs_WalkFasterLeft,
    [MOVEMENT_ACTION_WALK_FASTER_RIGHT]                  = sMovementActionFuncs_WalkFasterRight,
    [MOVEMENT_ACTION_SLIDE_DOWN]                         = sMovementActionFuncs_SlideDown,
    [MOVEMENT_ACTION_SLIDE_UP]                           = sMovementActionFuncs_SlideUp,
    [MOVEMENT_ACTION_SLIDE_LEFT]                         = sMovementActionFuncs_SlideLeft,
    [MOVEMENT_ACTION_SLIDE_RIGHT]                        = sMovementActionFuncs_SlideRight,
    [MOVEMENT_ACTION_PLAYER_RUN_DOWN]                    = sMovementActionFuncs_PlayerRunDown,
    [MOVEMENT_ACTION_PLAYER_RUN_UP]                      = sMovementActionFuncs_PlayerRunUp,
    [MOVEMENT_ACTION_PLAYER_RUN_LEFT]                    = sMovementActionFuncs_PlayerRunLeft,
    [MOVEMENT_ACTION_PLAYER_RUN_RIGHT]                   = sMovementActionFuncs_PlayerRunRight,
    [MOVEMENT_ACTION_PLAYER_RUN_DOWN_SLOW]               = sMovementActionFuncs_PlayerRunDownSlow,
    [MOVEMENT_ACTION_PLAYER_RUN_UP_SLOW]                 = sMovementActionFuncs_PlayerRunUpSlow,
    [MOVEMENT_ACTION_PLAYER_RUN_LEFT_SLOW]               = sMovementActionFuncs_PlayerRunLeftSlow,
    [MOVEMENT_ACTION_PLAYER_RUN_RIGHT_SLOW]              = sMovementActionFuncs_PlayerRunRightSlow,
    [MOVEMENT_ACTION_START_ANIM_IN_DIRECTION]            = sMovementActionFuncs_StartAnimInDirection,
    [MOVEMENT_ACTION_JUMP_SPECIAL_DOWN]                  = sMovementActionFuncs_JumpSpecialDown,
    [MOVEMENT_ACTION_JUMP_SPECIAL_UP]                    = sMovementActionFuncs_JumpSpecialUp,
    [MOVEMENT_ACTION_JUMP_SPECIAL_LEFT]                  = sMovementActionFuncs_JumpSpecialLeft,
    [MOVEMENT_ACTION_JUMP_SPECIAL_RIGHT]                 = sMovementActionFuncs_JumpSpecialRight,
    [MOVEMENT_ACTION_FACE_PLAYER]                        = sMovementActionFuncs_FacePlayer,
    [MOVEMENT_ACTION_FACE_AWAY_PLAYER]                   = sMovementActionFuncs_FaceAwayPlayer,
    [MOVEMENT_ACTION_LOCK_FACING_DIRECTION]              = sMovementActionFuncs_LockFacingDirection,
    [MOVEMENT_ACTION_UNLOCK_FACING_DIRECTION]            = sMovementActionFuncs_UnlockFacingDirection,
    [MOVEMENT_ACTION_JUMP_DOWN]                          = sMovementActionFuncs_JumpDown,
    [MOVEMENT_ACTION_JUMP_UP]                            = sMovementActionFuncs_JumpUp,
    [MOVEMENT_ACTION_JUMP_LEFT]                          = sMovementActionFuncs_JumpLeft,
    [MOVEMENT_ACTION_JUMP_RIGHT]                         = sMovementActionFuncs_JumpRight,
    [MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN]                 = sMovementActionFuncs_JumpInPlaceDown,
    [MOVEMENT_ACTION_JUMP_IN_PLACE_UP]                   = sMovementActionFuncs_JumpInPlaceUp,
    [MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT]                 = sMovementActionFuncs_JumpInPlaceLeft,
    [MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT]                = sMovementActionFuncs_JumpInPlaceRight,
    [MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN_UP]              = sMovementActionFuncs_JumpInPlaceDownUp,
    [MOVEMENT_ACTION_JUMP_IN_PLACE_UP_DOWN]              = sMovementActionFuncs_JumpInPlaceUpDown,
    [MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT_RIGHT]           = sMovementActionFuncs_JumpInPlaceLeftRight,
    [MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT_LEFT]           = sMovementActionFuncs_JumpInPlaceRightLeft,
    [MOVEMENT_ACTION_FACE_ORIGINAL_DIRECTION]            = sMovementActionFuncs_FaceOriginalDirection,
    [MOVEMENT_ACTION_NURSE_JOY_BOW_DOWN]                 = sMovementActionFuncs_NurseJoyBowDown,
    [MOVEMENT_ACTION_ENABLE_JUMP_LANDING_GROUND_EFFECT]  = sMovementActionFuncs_EnableJumpLandingGroundEffect,
    [MOVEMENT_ACTION_DISABLE_JUMP_LANDING_GROUND_EFFECT] = sMovementActionFuncs_DisableJumpLandingGroundEffect,
    [MOVEMENT_ACTION_DISABLE_ANIMATION]                  = sMovementActionFuncs_DisableAnimation,
    [MOVEMENT_ACTION_RESTORE_ANIMATION]                  = sMovementActionFuncs_RestoreAnimation,
    [MOVEMENT_ACTION_SET_INVISIBLE]                      = sMovementActionFuncs_SetInvisible,
    [MOVEMENT_ACTION_SET_VISIBLE]                        = sMovementActionFuncs_SetVisible,
    [MOVEMENT_ACTION_EMOTE_EXCLAMATION_MARK]             = sMovementActionFuncs_EmoteExclamationMark,
    [MOVEMENT_ACTION_EMOTE_QUESTION_MARK]                = sMovementActionFuncs_EmoteQuestionMark,
    [MOVEMENT_ACTION_EMOTE_X]                            = sMovementActionFuncs_EmoteX,
    [MOVEMENT_ACTION_EMOTE_DOUBLE_EXCL_MARK]             = sMovementActionFuncs_EmoteDoubleExclMark,
    [MOVEMENT_ACTION_EMOTE_SMILE]                        = sMovementActionFuncs_EmoteSmile,
    [MOVEMENT_ACTION_REVEAL_TRAINER]                     = sMovementActionFuncs_RevealTrainer,
    [MOVEMENT_ACTION_ROCK_SMASH_BREAK]                   = sMovementActionFuncs_RockSmashBreak,
    [MOVEMENT_ACTION_CUT_TREE]                           = sMovementActionFuncs_CutTree,
    [MOVEMENT_ACTION_SET_FIXED_PRIORITY]                 = sMovementActionFuncs_SetFixedPriority,
    [MOVEMENT_ACTION_CLEAR_FIXED_PRIORITY]               = sMovementActionFuncs_ClearFixedPriority,
    [MOVEMENT_ACTION_INIT_AFFINE_ANIM]                   = sMovementActionFuncs_InitAffineAnim,
    [MOVEMENT_ACTION_CLEAR_AFFINE_ANIM]                  = sMovementActionFuncs_ClearAffineAnim,
    [MOVEMENT_ACTION_WALK_DOWN_START_AFFINE]             = sMovementActionFuncs_WalkDownStartAffine,
    [MOVEMENT_ACTION_WALK_DOWN_AFFINE]                   = sMovementActionFuncs_WalkDownAffine,
    [MOVEMENT_ACTION_ACRO_WHEELIE_FACE_DOWN]             = sMovementActionFuncs_AcroWheelieFaceDown,
    [MOVEMENT_ACTION_ACRO_WHEELIE_FACE_UP]               = sMovementActionFuncs_AcroWheelieFaceUp,
    [MOVEMENT_ACTION_ACRO_WHEELIE_FACE_LEFT]             = sMovementActionFuncs_AcroWheelieFaceLeft,
    [MOVEMENT_ACTION_ACRO_WHEELIE_FACE_RIGHT]            = sMovementActionFuncs_AcroWheelieFaceRight,
    [MOVEMENT_ACTION_ACRO_POP_WHEELIE_DOWN]              = sMovementActionFuncs_AcroPopWheelieDown,
    [MOVEMENT_ACTION_ACRO_POP_WHEELIE_UP]                = sMovementActionFuncs_AcroPopWheelieUp,
    [MOVEMENT_ACTION_ACRO_POP_WHEELIE_LEFT]              = sMovementActionFuncs_AcroPopWheelieLeft,
    [MOVEMENT_ACTION_ACRO_POP_WHEELIE_RIGHT]             = sMovementActionFuncs_AcroPopWheelieRight,
    [MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_DOWN]         = sMovementActionFuncs_AcroEndWheelieFaceDown,
    [MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_UP]           = sMovementActionFuncs_AcroEndWheelieFaceUp,
    [MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_LEFT]         = sMovementActionFuncs_AcroEndWheelieFaceLeft,
    [MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_RIGHT]        = sMovementActionFuncs_AcroEndWheelieFaceRight,
    [MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_DOWN]         = sMovementActionFuncs_AcroWheelieHopFaceDown,
    [MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_UP]           = sMovementActionFuncs_AcroWheelieHopFaceUp,
    [MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_LEFT]         = sMovementActionFuncs_AcroWheelieHopFaceLeft,
    [MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_RIGHT]        = sMovementActionFuncs_AcroWheelieHopFaceRight,
    [MOVEMENT_ACTION_ACRO_WHEELIE_HOP_DOWN]              = sMovementActionFuncs_AcroWheelieHopDown,
    [MOVEMENT_ACTION_ACRO_WHEELIE_HOP_UP]                = sMovementActionFuncs_AcroWheelieHopUp,
    [MOVEMENT_ACTION_ACRO_WHEELIE_HOP_LEFT]              = sMovementActionFuncs_AcroWheelieHopLeft,
    [MOVEMENT_ACTION_ACRO_WHEELIE_HOP_RIGHT]             = sMovementActionFuncs_AcroWheelieHopRight,
    [MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN]             = sMovementActionFuncs_AcroWheelieJumpDown,
    [MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_UP]               = sMovementActionFuncs_AcroWheelieJumpUp,
    [MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_LEFT]             = sMovementActionFuncs_AcroWheelieJumpLeft,
    [MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_RIGHT]            = sMovementActionFuncs_AcroWheelieJumpRight,
    [MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_DOWN]         = sMovementActionFuncs_AcroWheelieInPlaceDown,
    [MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_UP]           = sMovementActionFuncs_AcroWheelieInPlaceUp,
    [MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_LEFT]         = sMovementActionFuncs_AcroWheelieInPlaceLeft,
    [MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_RIGHT]        = sMovementActionFuncs_AcroWheelieInPlaceRight,
    [MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_DOWN]         = sMovementActionFuncs_AcroPopWheelieMoveDown,
    [MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_UP]           = sMovementActionFuncs_AcroPopWheelieMoveUp,
    [MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_LEFT]         = sMovementActionFuncs_AcroPopWheelieMoveLeft,
    [MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_RIGHT]        = sMovementActionFuncs_AcroPopWheelieMoveRight,
    [MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_DOWN]             = sMovementActionFuncs_AcroWheelieMoveDown,
    [MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_UP]               = sMovementActionFuncs_AcroWheelieMoveUp,
    [MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_LEFT]             = sMovementActionFuncs_AcroWheelieMoveLeft,
    [MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_RIGHT]            = sMovementActionFuncs_AcroWheelieMoveRight,
    [MOVEMENT_ACTION_SPIN_DOWN]                          = sMovementActionFuncs_SpinDown,
    [MOVEMENT_ACTION_SPIN_UP]                            = sMovementActionFuncs_SpinUp,
    [MOVEMENT_ACTION_SPIN_LEFT]                          = sMovementActionFuncs_SpinLeft,
    [MOVEMENT_ACTION_SPIN_RIGHT]                         = sMovementActionFuncs_SpinRight,
    [MOVEMENT_ACTION_RAISE_HAND_AND_STOP]                = sMovementActionFuncs_RaiseHandAndStop,
    [MOVEMENT_ACTION_RAISE_HAND_AND_JUMP]                = sMovementActionFuncs_RaiseHandAndJump,
    [MOVEMENT_ACTION_RAISE_HAND_AND_SWIM]                = sMovementActionFuncs_RaiseHandAndSwim,
    [MOVEMENT_ACTION_WALK_SLOWEST_DOWN]                  = sMovementActionFuncs_WalkSlowestDown,
    [MOVEMENT_ACTION_WALK_SLOWEST_UP]                    = sMovementActionFuncs_WalkSlowestUp,
    [MOVEMENT_ACTION_WALK_SLOWEST_LEFT]                  = sMovementActionFuncs_WalkSlowestLeft,
    [MOVEMENT_ACTION_WALK_SLOWEST_RIGHT]                 = sMovementActionFuncs_WalkSlowestRight,
    [MOVEMENT_ACTION_SHAKE_HEAD_OR_WALK_IN_PLACE]        = sMovementActionFuncs_ShakeHeadOrWalkInPlace,
    [MOVEMENT_ACTION_GLIDE_DOWN]                         = sMovementActionFuncs_GlideDown,
    [MOVEMENT_ACTION_GLIDE_UP]                           = sMovementActionFuncs_GlideUp,
    [MOVEMENT_ACTION_GLIDE_LEFT]                         = sMovementActionFuncs_GlideLeft,
    [MOVEMENT_ACTION_GLIDE_RIGHT]                        = sMovementActionFuncs_GlideRight,
    [MOVEMENT_ACTION_FLY_UP]                             = sMovementActionFuncs_FlyUp,
    [MOVEMENT_ACTION_FLY_DOWN]                           = sMovementActionFuncs_FlyDown,
    [MOVEMENT_ACTION_JUMP_SPECIAL_WITH_EFFECT_DOWN]      = sMovementActionFuncs_JumpSpecialWithEffectDown,
    [MOVEMENT_ACTION_JUMP_SPECIAL_WITH_EFFECT_UP]        = sMovementActionFuncs_JumpSpecialWithEffectUp,
    [MOVEMENT_ACTION_JUMP_SPECIAL_WITH_EFFECT_LEFT]      = sMovementActionFuncs_JumpSpecialWithEffectLeft,
    [MOVEMENT_ACTION_JUMP_SPECIAL_WITH_EFFECT_RIGHT]     = sMovementActionFuncs_JumpSpecialWithEffectRight,
};

static bool8 (*const sMovementActionFuncs_FaceDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FaceDown_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_FaceUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FaceUp_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_FaceLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FaceLeft_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_FaceRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FaceRight_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sDirectionAnimFuncsBySpeed[])(u8) = {
    [MOVE_SPEED_NORMAL] = GetMoveDirectionAnimNum,
    [MOVE_SPEED_FAST_1] = GetMoveDirectionFastAnimNum,
    [MOVE_SPEED_FAST_2] = GetMoveDirectionFastAnimNum,
    [MOVE_SPEED_FASTER] = GetMoveDirectionFasterAnimNum,
    [MOVE_SPEED_FASTEST] = GetMoveDirectionFastestAnimNum,
};

static bool8 (*const sMovementActionFuncs_WalkSlowestDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowestDown_Step0,
    MovementAction_WalkSlowestDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowestUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowestUp_Step0,
    MovementAction_WalkSlowestUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowestLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowestLeft_Step0,
    MovementAction_WalkSlowestLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowestRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowestRight_Step0,
    MovementAction_WalkSlowestRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowerDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowerDown_Step0,
    MovementAction_WalkSlowerDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowerUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowerUp_Step0,
    MovementAction_WalkSlowerUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowerLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowerLeft_Step0,
    MovementAction_WalkSlowerLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowerRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowerRight_Step0,
    MovementAction_WalkSlowerRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowUp_Step0,
    MovementAction_WalkSlowUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowDown_Step0,
    MovementAction_WalkSlowDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowLeft_Step0,
    MovementAction_WalkSlowLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkSlowRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkSlowRight_Step0,
    MovementAction_WalkSlowRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkNormalDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkNormalDown_Step0,
    MovementAction_WalkNormalDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkNormalUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkNormalUp_Step0,
    MovementAction_WalkNormalUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkNormalLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkNormalLeft_Step0,
    MovementAction_WalkNormalLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkNormalRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkNormalRight_Step0,
    MovementAction_WalkNormalRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static const s16 sJumpInitDisplacements[] = {
    [JUMP_DISTANCE_IN_PLACE] = 0,
    [JUMP_DISTANCE_NORMAL] = 1,
    [JUMP_DISTANCE_FAR] = 1,
};

static const s16 sJumpDisplacements[] = {
    [JUMP_DISTANCE_IN_PLACE] = 0,
    [JUMP_DISTANCE_NORMAL] = 0,
    [JUMP_DISTANCE_FAR] = 1,
};

static bool8 (*const sMovementActionFuncs_Jump2Down[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_Jump2Down_Step0,
    MovementAction_Jump2Down_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_Jump2Up[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_Jump2Up_Step0,
    MovementAction_Jump2Up_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_Jump2Left[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_Jump2Left_Step0,
    MovementAction_Jump2Left_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_Jump2Right[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_Jump2Right_Step0,
    MovementAction_Jump2Right_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_Delay1[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_Delay1_Step0,
    MovementAction_Delay_Step1,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_Delay2[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_Delay2_Step0,
    MovementAction_Delay_Step1,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_Delay4[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_Delay4_Step0,
    MovementAction_Delay_Step1,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_Delay8[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_Delay8_Step0,
    MovementAction_Delay_Step1,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_Delay16[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_Delay16_Step0,
    MovementAction_Delay_Step1,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_WalkFastDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkFastDown_Step0,
    MovementAction_WalkFastDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkFastUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkFastUp_Step0,
    MovementAction_WalkFastUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkFastLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkFastLeft_Step0,
    MovementAction_WalkFastLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkFastRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkFastRight_Step0,
    MovementAction_WalkFastRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_GlideDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_GlideDown_Step0,
    MovementAction_GlideDown_Step1,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_GlideUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_GlideUp_Step0,
    MovementAction_GlideUp_Step1,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_GlideLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_GlideLeft_Step0,
    MovementAction_GlideLeft_Step1,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_GlideRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_GlideRight_Step0,
    MovementAction_GlideRight_Step1,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_FaceDownFast[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FaceDownFast_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_FaceUpFast[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FaceUpFast_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_FaceLeftFast[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FaceLeftFast_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_FaceRightFast[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FaceRightFast_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceSlowDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceSlowDown_Step0,
    MovementAction_WalkInPlaceSlow_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceSlowUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceSlowUp_Step0,
    MovementAction_WalkInPlaceSlow_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceSlowLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceSlowLeft_Step0,
    MovementAction_WalkInPlaceSlow_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceSlowRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceSlowRight_Step0,
    MovementAction_WalkInPlaceSlow_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceNormalDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceNormalDown_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceNormalUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceNormalUp_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceNormalLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceNormalLeft_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceNormalRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceNormalRight_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceFastDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceFastDown_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceFastUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceFastUp_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceFastLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceFastLeft_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceFastRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceFastRight_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceFasterDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceFasterDown_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceFasterUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceFasterUp_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceFasterLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceFasterLeft_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkInPlaceFasterRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkInPlaceFasterRight_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_RideWaterCurrentDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RideWaterCurrentDown_Step0,
    MovementAction_RideWaterCurrentDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_RideWaterCurrentUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RideWaterCurrentUp_Step0,
    MovementAction_RideWaterCurrentUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_RideWaterCurrentLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RideWaterCurrentLeft_Step0,
    MovementAction_RideWaterCurrentLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_RideWaterCurrentRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RideWaterCurrentRight_Step0,
    MovementAction_RideWaterCurrentRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkFasterDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkFasterDown_Step0,
    MovementAction_WalkFasterDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkFasterUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkFasterUp_Step0,
    MovementAction_WalkFasterUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkFasterLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkFasterLeft_Step0,
    MovementAction_WalkFasterLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkFasterRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkFasterRight_Step0,
    MovementAction_WalkFasterRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_SlideDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SlideDown_Step0,
    MovementAction_SlideDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_SlideUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SlideUp_Step0,
    MovementAction_SlideUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_SlideLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SlideLeft_Step0,
    MovementAction_SlideLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_SlideRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SlideRight_Step0,
    MovementAction_SlideRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_PlayerRunDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_PlayerRunDown_Step0,
    MovementAction_PlayerRunDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_PlayerRunUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_PlayerRunUp_Step0,
    MovementAction_PlayerRunUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_PlayerRunLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_PlayerRunLeft_Step0,
    MovementAction_PlayerRunLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_PlayerRunRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_PlayerRunRight_Step0,
    MovementAction_PlayerRunRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_PlayerRunDownSlow[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RunDownSlow_Step0,
    MovementAction_RunDownSlow_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_PlayerRunUpSlow[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RunUpSlow_Step0,
    MovementAction_RunUpSlow_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_PlayerRunLeftSlow[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RunLeftSlow_Step0,
    MovementAction_RunLeftSlow_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_PlayerRunRightSlow[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RunRightSlow_Step0,
    MovementAction_RunRightSlow_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_StartAnimInDirection[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_StartAnimInDirection_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpSpecialDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpSpecialDown_Step0,
    MovementAction_JumpSpecialDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpSpecialUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpSpecialUp_Step0,
    MovementAction_JumpSpecialUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpSpecialLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpSpecialLeft_Step0,
    MovementAction_JumpSpecialLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpSpecialRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpSpecialRight_Step0,
    MovementAction_JumpSpecialRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpSpecialWithEffectDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpSpecialWithEffectDown_Step0,
    MovementAction_JumpSpecialWithEffectDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpSpecialWithEffectUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpSpecialWithEffectUp_Step0,
    MovementAction_JumpSpecialWithEffectUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpSpecialWithEffectLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpSpecialWithEffectLeft_Step0,
    MovementAction_JumpSpecialWithEffectLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpSpecialWithEffectRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpSpecialWithEffectRight_Step0,
    MovementAction_JumpSpecialWithEffectRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_FacePlayer[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FacePlayer_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_FaceAwayPlayer[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FaceAwayPlayer_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_LockFacingDirection[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_LockFacingDirection_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_UnlockFacingDirection[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_UnlockFacingDirection_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpDown_Step0,
    MovementAction_JumpDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpUp_Step0,
    MovementAction_JumpUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpLeft_Step0,
    MovementAction_JumpLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpRight_Step0,
    MovementAction_JumpRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpInPlaceDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpInPlaceDown_Step0,
    MovementAction_JumpInPlaceDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpInPlaceUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpInPlaceUp_Step0,
    MovementAction_JumpInPlaceUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpInPlaceLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpInPlaceLeft_Step0,
    MovementAction_JumpInPlaceLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpInPlaceRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpInPlaceRight_Step0,
    MovementAction_JumpInPlaceRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpInPlaceDownUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpInPlaceDownUp_Step0,
    MovementAction_JumpInPlaceDownUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpInPlaceUpDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpInPlaceUpDown_Step0,
    MovementAction_JumpInPlaceUpDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpInPlaceLeftRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpInPlaceLeftRight_Step0,
    MovementAction_JumpInPlaceLeftRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_JumpInPlaceRightLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_JumpInPlaceRightLeft_Step0,
    MovementAction_JumpInPlaceRightLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_FaceOriginalDirection[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FaceOriginalDirection_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_NurseJoyBowDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_NurseJoyBowDown_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_EnableJumpLandingGroundEffect[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_EnableJumpLandingGroundEffect_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_DisableJumpLandingGroundEffect[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_DisableJumpLandingGroundEffect_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_DisableAnimation[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_DisableAnimation_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_RestoreAnimation[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RestoreAnimation_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_SetInvisible[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SetInvisible_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_SetVisible[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SetVisible_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_EmoteExclamationMark[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_EmoteExclamationMark_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_EmoteQuestionMark[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_EmoteQuestionMark_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_EmoteX[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_EmoteX_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_EmoteDoubleExclMark[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_EmoteDoubleExclamationMark_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_EmoteSmile[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_EmoteSmile_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_RevealTrainer[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RevealTrainer_Step0,
    MovementAction_RevealTrainer_Step1,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_RockSmashBreak[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RockSmashBreak_Step0,
    MovementAction_RockSmashBreak_Step1,
    MovementAction_RockSmashBreak_Step2,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_CutTree[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_CutTree_Step0,
    MovementAction_CutTree_Step1,
    MovementAction_CutTree_Step2,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_SetFixedPriority[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SetFixedPriority_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_ClearFixedPriority[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_ClearFixedPriority_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_InitAffineAnim[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_InitAffineAnim_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_ClearAffineAnim[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_ClearAffineAnim_Step0,
    MovementAction_Finish,
};

static bool8 (*const sMovementActionFuncs_WalkDownStartAffine[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkDownStartAffine_Step0,
    MovementAction_WalkDownStartAffine_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_WalkDownAffine[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_WalkDownAffine_Step0,
    MovementAction_WalkDownAffine_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieFaceDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieFaceDown_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieFaceUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieFaceUp_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieFaceLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieFaceLeft_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieFaceRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieFaceRight_Step0,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroPopWheelieDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroPopWheelieDown_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroPopWheelieUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroPopWheelieUp_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroPopWheelieLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroPopWheelieLeft_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroPopWheelieRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroPopWheelieRight_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroEndWheelieFaceDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroEndWheelieFaceDown_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroEndWheelieFaceUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroEndWheelieFaceUp_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroEndWheelieFaceLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroEndWheelieFaceLeft_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroEndWheelieFaceRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroEndWheelieFaceRight_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const MovementActionFuncs_UnusedAcroActionDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_UnusedAcroActionDown_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const MovementActionFuncs_UnusedAcroActionUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_UnusedAcroActionUp_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const MovementActionFuncs_UnusedAcroActionLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_UnusedAcroActionLeft_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const MovementActionFuncs_UnusedAcroActionRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_UnusedAcroActionRight_Step0,
    MovementAction_WaitSpriteAnim,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieHopFaceDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieHopFaceDown_Step0,
    MovementAction_AcroWheelieHopFaceDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieHopFaceUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieHopFaceUp_Step0,
    MovementAction_AcroWheelieHopFaceUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieHopFaceLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieHopFaceLeft_Step0,
    MovementAction_AcroWheelieHopFaceLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieHopFaceRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieHopFaceRight_Step0,
    MovementAction_AcroWheelieHopFaceRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieHopDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieHopDown_Step0,
    MovementAction_AcroWheelieHopDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieHopUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieHopUp_Step0,
    MovementAction_AcroWheelieHopUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieHopLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieHopLeft_Step0,
    MovementAction_AcroWheelieHopLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieHopRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieHopRight_Step0,
    MovementAction_AcroWheelieHopRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieJumpDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieJumpDown_Step0,
    MovementAction_AcroWheelieJumpDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieJumpUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieJumpUp_Step0,
    MovementAction_AcroWheelieJumpUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieJumpLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieJumpLeft_Step0,
    MovementAction_AcroWheelieJumpLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieJumpRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieJumpRight_Step0,
    MovementAction_AcroWheelieJumpRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieInPlaceDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieInPlaceDown_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieInPlaceUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieInPlaceUp_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieInPlaceLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieInPlaceLeft_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieInPlaceRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieInPlaceRight_Step0,
    MovementAction_WalkInPlace_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroPopWheelieMoveDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroPopWheelieMoveDown_Step0,
    MovementAction_AcroPopWheelieMoveDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroPopWheelieMoveUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroPopWheelieMoveUp_Step0,
    MovementAction_AcroPopWheelieMoveUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroPopWheelieMoveLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroPopWheelieMoveLeft_Step0,
    MovementAction_AcroPopWheelieMoveLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroPopWheelieMoveRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroPopWheelieMoveRight_Step0,
    MovementAction_AcroPopWheelieMoveRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieMoveDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieMoveDown_Step0,
    MovementAction_AcroWheelieMoveDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieMoveUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieMoveUp_Step0,
    MovementAction_AcroWheelieMoveUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieMoveLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieMoveLeft_Step0,
    MovementAction_AcroWheelieMoveLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_AcroWheelieMoveRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_AcroWheelieMoveRight_Step0,
    MovementAction_AcroWheelieMoveRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_SpinDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SpinDown_Step0,
    MovementAction_SpinDown_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_SpinUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SpinUp_Step0,
    MovementAction_SpinUp_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_SpinLeft[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SpinLeft_Step0,
    MovementAction_SpinLeft_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_SpinRight[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_SpinRight_Step0,
    MovementAction_SpinRight_Step1,
    MovementAction_PauseSpriteAnim,
};

static bool8 (*const sMovementActionFuncs_RaiseHandAndStop[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RaiseHand_Step0,
    MovementAction_RaiseHandAndStop_Step1,
};

static bool8 (*const sMovementActionFuncs_RaiseHandAndJump[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RaiseHand_Step0,
    MovementAction_RaiseHandAndJump_Step1,
};

static bool8 (*const sMovementActionFuncs_RaiseHandAndSwim[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_RaiseHand_Step0,
    MovementAction_RaiseHandAndSwim_Step1,
};

static bool8 (*const sMovementActionFuncs_ShakeHeadOrWalkInPlace[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_ShakeHeadOrWalkInPlace_Step0,
    MovementAction_ShakeHeadOrWalkInPlace_Step1,
};

static bool8 (*const sMovementActionFuncs_FlyUp[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FlyUp_Step0,
    MovementAction_FlyUp_Step1,
    MovementAction_FlyUp_Step2,
};

static bool8 (*const sMovementActionFuncs_FlyDown[])(struct ObjectEvent *, struct Sprite *) = {
    MovementAction_FlyDown_Step0,
    MovementAction_FlyDown_Step1,
    MovementAction_FlyUp_Step2,
};
