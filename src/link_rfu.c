#include "global.h"
#include "librfu.h"
#include "link_rfu.h"

LINK_MANAGER lman;

static void rfu_LMAN_clearVariables(void);
static void rfu_LMAN_settingPCSWITCH(u32 a0);
static void rfu_LMAN_REQ_callback(u16 reqCommandId, u16 reqResult);
static void rfu_LMAN_MSC_callback(u16 reqCommandId);
static void rfu_LMAN_PARENT_checkRecvChildName(void);
static void rfu_LMAN_CHILD_checkSendChildName(void);
static void rfu_LMAN_CHILD_checkSendChildName2(void);
static void rfu_LMAN_CHILD_linkRecoveryProcess(void);
static u8 rfu_LMAN_CHILD_checkEnableParentCandidate(void);
static void rfu_LMAN_occureCallback(u8 a0, u8 a1);
static void rfu_LMAN_disconnect(u8 bmDisconnectSlot);
static void rfu_LMAN_reflectCommunicationStatus(u8 a0);
static void rfu_LMAN_checkNICommunicateStatus(void);
static void rfu_LMAN_managerChangeAgbClockMaster(void);

u32 rfu_LMAN_REQBN_softReset_and_checkID(void)
{
    u32 id = rfu_REQBN_softReset_and_checkID();
    if (id == RFU_ID)
        lman.RFU_powerOn_flag = 1;
    if (lman.state != 0x17 && lman.state != 0x01)
    {
        lman.state = lman.next_state = 0;
    }
    lman.pcswitch_flag = 0;
    lman.reserveDisconnectSlot_flag = 0;
    lman.acceptCount = 0;
    lman.acceptSlot_flag = 0;
    lman.parent_child = MODE_NEUTRAL;
    rfu_LMAN_managerChangeAgbClockMaster();
    return id;
}

void rfu_LMAN_REQ_sendData(u8 clockChangeFlag)
{
    if (gRfuLinkStatus->parentChild == MODE_CHILD)
    {
        if (lman.childClockSlave_flag == TRUE)
            clockChangeFlag = TRUE;
        else
            clockChangeFlag = FALSE;
    }
    else
        lman.parentAck_flag = 0;
    rfu_REQ_sendData(clockChangeFlag);
}

u8 rfu_LMAN_initializeManager(void (*LMAN_callback_p)(u8, u8), void (*MSC_callback_p)(u16))
{
    if (LMAN_callback_p == NULL)
    {
        return LMAN_ERROR_ILLEGAL_PARAMETER;
    }
    CpuFill16(0, &lman, sizeof(struct linkManagerTag));
    lman.parent_child = MODE_NEUTRAL;
    lman.LMAN_callback = LMAN_callback_p;
    lman.MSC_callback = MSC_callback_p;
    rfu_setMSCCallback(rfu_LMAN_MSC_callback);
    rfu_setREQCallback(rfu_LMAN_REQ_callback);
    return 0;
}

static void rfu_LMAN_endManager(void)
{
    CpuFill16(0, &lman, sizeof(struct linkManagerTag) - 8);
    lman.parent_child = MODE_NEUTRAL;
}

void rfu_LMAN_initializeRFU(INIT_PARAM *init_parameters)
{
    rfu_LMAN_clearVariables();
    lman.state = 1;
    lman.next_state = 2;
    lman.init_param = init_parameters;
    lman.linkRecovery_enable = init_parameters->linkRecovery_enable;
    lman.linkRecoveryTimer.count_max = init_parameters->linkRecovery_period;
    lman.NI_failCounter_limit = init_parameters->NI_failCounter_limit;
    if (init_parameters->fastSearchParent_flag)
    {
        lman.fastSearchParent_flag = 1;
    }
}

static void rfu_LMAN_clearVariables(void)
{
    u8 i;

    lman.state = lman.next_state = 0;
    lman.parent_child = MODE_NEUTRAL;
    lman.pcswitch_flag = 0;
    lman.child_slot = 0;
    lman.connectSlot_flag_old = 0;
    lman.nameAcceptTimer.active = 0;
    lman.linkRecoveryTimer.active = 0;
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        lman.nameAcceptTimer.count[i] = 0;
        lman.linkRecoveryTimer.count[i] = 0;
    }
}

void rfu_LMAN_powerDownRFU(void)
{
    lman.state = LMAN_STATE_STOP_MODE;
}

u8 rfu_LMAN_establishConnection(u8 parent_child, u16 connect_period, u16 name_accept_period, u16 *acceptable_serialNo_list)
{
    u8 i;
    u16 *serial_list;

    if (lman.state != 0 && (lman.state != LMAN_STATE_WAIT_RECV_CHILD_NAME || parent_child != 1))
    {
        lman.param[0] = 1;
        rfu_LMAN_occureCallback(LMAN_MSG_LMAN_API_ERROR_RETURN, 0x01);
        return 1;
    }
    if (rfu_getMasterSlave() == AGB_CLK_SLAVE)
    {
        lman.param[0] = 2;
        rfu_LMAN_occureCallback(LMAN_MSG_LMAN_API_ERROR_RETURN, 0x01);
        return 2;
    }
    for (i = 0, serial_list = acceptable_serialNo_list; i < 16; i++)
    {
        if (*serial_list++ == 0xFFFF)
        {
            break;
        }
    }
    if (i == 16)
    {
        lman.param[0] = 4;
        rfu_LMAN_occureCallback(LMAN_MSG_LMAN_API_ERROR_RETURN, 0x01);
        return 4;
    }
    if (parent_child > 1)
    {
        lman.pcswitch_flag = 1;
        parent_child = 1;
        connect_period = 0;
    }
    else
    {
        lman.pcswitch_flag = 0;
    }
    if (parent_child != 0)
    {
        lman.state = 5;
    }
    else
    {
        lman.state = 9;
        if (lman.fastSearchParent_flag)
        {
            lman.fastSearchParent_flag = 2;
        }
    }
    lman.parent_child = parent_child;
    lman.connect_period = connect_period;
    lman.nameAcceptTimer.count_max = name_accept_period;
    lman.acceptable_serialNo_list = acceptable_serialNo_list;
    return 0;
}

u8 rfu_LMAN_CHILD_connectParent(u16 parentId, u16 connect_period)
{
    u8 i;

    if (lman.state != 0 && (lman.state < 9 || lman.state > 11))
    {
        lman.param[0] = 1;
        rfu_LMAN_occureCallback(LMAN_MSG_LMAN_API_ERROR_RETURN, 0x01);
        return 1;
    }
    if (rfu_getMasterSlave() == AGB_CLK_SLAVE)
    {
        lman.param[0] = 2;
        rfu_LMAN_occureCallback(LMAN_MSG_LMAN_API_ERROR_RETURN, 0x01);
        return 2;
    }
    for (i = 0; i < gRfuLinkStatus->findParentCount; i++)
    {
        if (gRfuLinkStatus->partner[i].id == parentId)
        {
            break;
        }
    }
    if (gRfuLinkStatus->findParentCount == 0 || i == gRfuLinkStatus->findParentCount)
    {
        lman.param[0] = 3;
        rfu_LMAN_occureCallback(LMAN_MSG_LMAN_API_ERROR_RETURN, 0x01);
        return 3;
    }
    if (lman.state == 0 || lman.state == 9)
    {
        lman.state = 12;
        lman.next_state = 13;
    }
    else
    {
        lman.state = 11;
        lman.next_state = 12;
    }
    lman.work = parentId;
    lman.connect_period = connect_period;
    if (lman.pcswitch_flag != 0)
    {
        lman.pcswitch_flag = 7;
    }
    return 0;
}

static void rfu_LMAN_PARENT_stopWaitLinkRecoveryAndDisconnect(u8 bm_targetSlot)
{
    u8 i;

    if ((bm_targetSlot & lman.linkRecoveryTimer.active)==0)
        return;
    lman.linkRecoveryTimer.active &= ~bm_targetSlot;
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if ((bm_targetSlot >> i) & 1)
        {
            lman.linkRecoveryTimer.count[i] = 0;
        }
    }
    i = gRfuLinkStatus->linkLossSlotFlag & bm_targetSlot;
    if (i)
    {
        rfu_LMAN_disconnect(i);
    }
    lman.param[0] = i;
    rfu_LMAN_occureCallback(LMAN_MSG_LINK_RECOVERY_FAILED_AND_DISCONNECTED, i);
}

void rfu_LMAN_stopManager(bool8 forced_stop_and_RFU_reset_flag)
{
    u8 msg = 0;
    lman.pcswitch_flag = 0;
    if (forced_stop_and_RFU_reset_flag)
    {
        rfu_LMAN_clearVariables();
        lman.state = 23;
        return;
    }
    switch (lman.state)
    {
    case 5:
        lman.state = 8;
        lman.next_state = 0;
        msg = LMAN_MSG_SEARCH_CHILD_PERIOD_EXPIRED;
        break;
    case 6:
        lman.state = 7;
        lman.next_state = 8;
        break;
    case 7:
        lman.state = 7;
        lman.next_state = 8;
        break;
    case 8:
        break;
    case 9:
        lman.state = lman.next_state = 0;
        msg = LMAN_MSG_SEARCH_PARENT_PERIOD_EXPIRED;
        break;
    case 10:
        lman.state = 11;
        lman.next_state = 0;
        break;
    case 11:
        lman.state = 11;
        lman.next_state = 0;
        break;
    case 12:
        lman.state = lman.next_state = 0;
        msg = LMAN_MSG_CONNECT_PARENT_FAILED;
        break;
    case 13:
        lman.state = 14;
        break;
    case 14:
        lman.state = 14;
        break;
    case 15:
        break;
    case 16:
        lman.state = lman.state_bak[0];
        lman.next_state = lman.state_bak[1];
        rfu_LMAN_disconnect(gRfuLinkStatus->linkLossSlotFlag);
        lman.param[0] = gRfuLinkStatus->linkLossSlotFlag;
        rfu_LMAN_occureCallback(LMAN_MSG_LINK_RECOVERY_FAILED_AND_DISCONNECTED, 0x01);
        return;
    case 17:
        lman.state = 18;
        break;
    case 18:
        lman.state = 18;
        break;
    default:
        lman.state = lman.next_state = 0;
        msg = LMAN_MSG_MANAGER_STOPPED;
        break;
    }
    if (lman.state == 0)
    {
        rfu_LMAN_occureCallback(msg, 0);
    }
}

static bool8 rfu_LMAN_linkWatcher(u16 REQ_commandID)
{
    u8 i;
    u8 bm_linkLossSlot;
    u8 reason;
    u8 bm_linkRecoverySlot;
    u8 bm_disconnectSlot;

    bool8 disconnect_occure_flag = FALSE;
    rfu_REQBN_watchLink(REQ_commandID, &bm_linkLossSlot, &reason, &bm_linkRecoverySlot);
    if (bm_linkLossSlot)
    {
        lman.param[0] = bm_linkLossSlot;
        lman.param[1] = reason;
        if (lman.linkRecovery_enable)
        {
            lman.linkRecovery_start_flag = 1;
            if (lman.parent_child == 0 && reason == REASON_DISCONNECTED)
            {
                lman.linkRecovery_start_flag = 4;
            }
            if (lman.linkRecovery_start_flag == 1)
            {
                for (i = 0; i < RFU_CHILD_MAX; i++)
                {
                    if ((bm_linkLossSlot >> i) & 1)
                    {
                        lman.linkRecoveryTimer.active |= (1 << i);
                        lman.linkRecoveryTimer.count[i] = lman.linkRecoveryTimer.count_max;
                    }
                }
                rfu_LMAN_occureCallback(0x31, 0x01);
            }
            else
            {
                lman.linkRecovery_start_flag = 0;
                rfu_LMAN_disconnect(bm_linkLossSlot);
                disconnect_occure_flag = TRUE;
                rfu_LMAN_occureCallback(LMAN_MSG_LINK_RECOVERY_FAILED_AND_DISCONNECTED, 0x01);
            }
        }
        else
        {
            rfu_LMAN_disconnect(bm_linkLossSlot);
            disconnect_occure_flag = TRUE;
            rfu_LMAN_occureCallback(0x30, 0x02);
        }
        rfu_LMAN_managerChangeAgbClockMaster();
    }
    if (gRfuLinkStatus->parentChild == MODE_PARENT)
    {
        if (bm_linkRecoverySlot)
        {
            for (i = 0; i < RFU_CHILD_MAX; i++)
            {
                if ((lman.linkRecoveryTimer.active >> i) & 1 && (bm_linkRecoverySlot >> i) & 1)
                {
                    lman.linkRecoveryTimer.count[i] = 0;
                }
            }
            lman.linkRecoveryTimer.active &= ~bm_linkRecoverySlot;
            lman.param[0] = bm_linkRecoverySlot;
            rfu_LMAN_occureCallback(0x32, 0x01);
        }
        if (lman.linkRecoveryTimer.active)
        {
            bm_disconnectSlot = 0;
            for (i = 0; i < RFU_CHILD_MAX; i++)
            {
                if ((lman.linkRecoveryTimer.active >> i) & 1 && lman.linkRecoveryTimer.count[i] && --lman.linkRecoveryTimer.count[i] == 0)
                {
                    lman.linkRecoveryTimer.active &= ~(1 << i);
                    bm_disconnectSlot |= (1 << i);
                }
            }
            if (bm_disconnectSlot)
            {
                rfu_LMAN_disconnect(bm_disconnectSlot);
                disconnect_occure_flag = TRUE;
                lman.param[0] = bm_disconnectSlot;
                rfu_LMAN_occureCallback(LMAN_MSG_LINK_RECOVERY_FAILED_AND_DISCONNECTED, 0x01);
            }
        }
        if (!lman.linkRecoveryTimer.active)
        {
            lman.linkRecovery_start_flag = 0;
        }
    }
    return disconnect_occure_flag;
}

void rfu_LMAN_syncVBlank(void)
{
    if (rfu_syncVBlank())
    {
        rfu_LMAN_occureCallback(0xF1, 0x00);
        rfu_LMAN_managerChangeAgbClockMaster();
    }
}

void rfu_LMAN_manager_entity(u32 rand)
{
    u8 msg;

    if (lman.LMAN_callback == NULL && lman.state != 0)
    {
        lman.state = 0;
        return;
    }
    if (lman.pcswitch_flag)
    {
        rfu_LMAN_settingPCSWITCH(rand);
    }
    while (1)
    {
        if (lman.state != 0)
        {
            rfu_waitREQComplete();
            lman.active = 1;
            switch (lman.state)
            {
            case 23:
                if (rfu_LMAN_REQBN_softReset_and_checkID() == RFU_ID)
                {
                    msg=LMAN_MSG_MANAGER_FORCED_STOPPED_AND_RFU_RESET;
                }
                else
                {
                    msg=LMAN_MSG_RFU_FATAL_ERROR;
                }
                lman.state = lman.next_state = 0;
                rfu_LMAN_occureCallback(msg, 0);
                break;
            case 1:
                if (rfu_LMAN_REQBN_softReset_and_checkID() == RFU_ID)
                {
                    lman.state = lman.next_state;
                    lman.next_state = 3;
                }
                else
                {
                    lman.state = lman.next_state = 0;
                    rfu_LMAN_occureCallback(LMAN_MSG_RFU_FATAL_ERROR, 0);
                }
                break;
            case 2:
                rfu_REQ_reset();
                break;
            case 3:
                rfu_REQ_configSystem(lman.init_param->availSlot_flag, lman.init_param->maxMFrame, lman.init_param->MC_TimerCount);
                break;
            case 4:
                rfu_REQ_configGameData(lman.init_param->mboot_flag, lman.init_param->serialNo, (const u8 *)lman.init_param->gameName, lman.init_param->userName);
                break;
            case 5:
                rfu_REQ_startSearchChild();
                break;
            case 6:
                rfu_REQ_pollSearchChild();
                break;
            case 7:
                rfu_REQ_endSearchChild();
                break;
            case 8:
                break;
            case 9:
                rfu_REQ_startSearchParent();
                break;
            case 10:
                rfu_REQ_pollSearchParent();
                break;
            case 11:
                rfu_REQ_endSearchParent();
                break;
            case 12:
                rfu_REQ_startConnectParent(lman.work);
                break;
            case 13:
                rfu_REQ_pollConnectParent();
                break;
            case 14:
                rfu_REQ_endConnectParent();
                break;
            case 15:
                break;
            case 16:
                rfu_REQ_CHILD_startConnectRecovery(gRfuLinkStatus->linkLossSlotFlag);
                break;
            case 17:
                rfu_REQ_CHILD_pollConnectRecovery();
                break;
            case 18:
                rfu_REQ_CHILD_endConnectRecovery();
                break;
            case 19:
                rfu_REQ_changeMasterSlave();
                break;
            case 20:
                break;
            case 21:
                rfu_REQ_stopMode();
                break;
            case 22:
                break;
            default:
                break;
            }
            rfu_waitREQComplete();
            lman.active = 0;
        }
        if (lman.state == LMAN_STATE_END_LINK_RECOVERY || lman.state == LMAN_STATE_MS_CHANGE)
            ;
        else
            break;
    }
    if (gRfuLinkStatus->parentChild == MODE_PARENT)
    {
        if (rfu_LMAN_linkWatcher(0))
            return;
    }
    rfu_LMAN_PARENT_checkRecvChildName();
    rfu_LMAN_CHILD_checkSendChildName();
    rfu_LMAN_CHILD_linkRecoveryProcess();
    rfu_LMAN_checkNICommunicateStatus();
}

static void rfu_LMAN_settingPCSWITCH(u32 rand)
{
    if (lman.pcswitch_flag == 5)
    {
        lman.parent_child = MODE_PARENT;
        lman.state = 5;
        lman.connect_period = lman.pcswitch_period_bak;
        if (lman.connect_period)
        {
            lman.pcswitch_flag = 6;
        }
        else
        {
            lman.pcswitch_flag = 1;
        }
    }
    if (lman.pcswitch_flag == 1)
    {
        lman.parent_child = MODE_PARENT;
        lman.state = 5;
        lman.connect_period = rand % 140;
        lman.pcswitch_period_bak = 140 - lman.connect_period;
        if (lman.connect_period)
        {
            lman.pcswitch_flag = 2;
        }
        else
        {
            lman.pcswitch_flag = 3;
        }
    }
    if (lman.pcswitch_flag == 3)
    {
        lman.parent_child = MODE_CHILD;
        lman.connect_period = 40;
        lman.pcswitch_flag = 4;
        lman.state = 9;
    }
}

static void rfu_LMAN_REQ_callback(u16 reqCommandId, u16 reqResult)
{
    u8 sp0;
    register u8 *stwiRecvBuffer asm("r0");
    u8 *tmp;
    u8 i;

    if (lman.active != 0)
    {
        lman.active = 0;
        switch (reqCommandId)
        {
        case ID_RESET_REQ:
            if (reqResult == 0)
            {
                lman.state = lman.next_state;
                lman.next_state = 4;
            }
            break;
        case ID_SYSTEM_CONFIG_REQ:
            if (reqResult == 0)
            {
                lman.state = lman.next_state;
                lman.next_state = 0;
            }
            break;
        case ID_GAME_CONFIG_REQ:
            if (reqResult == 0)
            {
                lman.state = lman.next_state = 0;
                rfu_LMAN_occureCallback(0x00, 0x00);
            }
            break;
        case ID_SC_START_REQ:
            if (reqResult == 0)
            {
                lman.state = lman.next_state = 6;
            }
            break;
        case ID_SC_POLL_REQ:
            if (lman.connect_period && --lman.connect_period == 0)
            {
                lman.state = 7;
                lman.next_state = 8;
            }
            break;
        case ID_SC_END_REQ:
            if (reqResult == 0)
            {
                lman.state = lman.next_state;
                lman.next_state = 0;
                if (lman.pcswitch_flag == 0)
                {
                    rfu_LMAN_occureCallback(0x13, 0x00);
                }
            }
            break;
        case ID_SP_START_REQ:
            if (reqResult == 0)
            {
                if (lman.fastSearchParent_flag == 1 && lman.connect_period > 1)
                {
                    lman.connect_period--;
                }
                lman.state = lman.next_state = 10;
            }
            break;
        case ID_SP_POLL_REQ:
            if (reqResult == 0)
            {
                sp0 = rfu_LMAN_CHILD_checkEnableParentCandidate();
                lman.param[0] = sp0;
                if (sp0)
                {
                    rfu_LMAN_occureCallback(0x20, 0x01);
                }
                if (lman.fastSearchParent_flag && lman.connect_period != 1 && gRfuLinkStatus->findParentCount == RFU_CHILD_MAX)
                {
                    rfu_REQ_endSearchParent();
                    rfu_waitREQComplete();
                    lman.state = 9;
                    lman.fastSearchParent_flag = 1;
                }
            }
            if (lman.connect_period && --lman.connect_period == 0)
            {
                lman.state = 11;
                lman.next_state = 0;
            }
            break;
        case ID_SP_END_REQ:
            if (reqResult == 0)
            {
                lman.state = lman.next_state;
                if (lman.pcswitch_flag == 0)
                {
                    if (lman.state == 0)
                    {
                        rfu_LMAN_occureCallback(0x21, 0x00);
                    }
                }
                else if (lman.pcswitch_flag != 7)
                {
                    lman.state = 5;
                    lman.pcswitch_flag = 5;
                }
            }
            break;
        case ID_CP_START_REQ:
            if (reqResult == 0)
            {
                lman.state = lman.next_state = 13;
            }
            break;
        case ID_CP_POLL_REQ:
            if (reqResult == 0 && !rfu_getConnectParentStatus(&sp0, &lman.child_slot) && !sp0)
            {
                lman.state = 14;
            }
            if (lman.connect_period && --lman.connect_period == 0)
            {
                lman.state = 14;
            }
            break;
        case ID_CP_END_REQ:
            if (reqResult == 0 && !rfu_getConnectParentStatus(&sp0, &lman.child_slot))
            {
                if (!sp0)
                {
                    lman.state = 19;
                    lman.next_state = 15;
                    lman.work = 0x22;
                    lman.param[0] = lman.child_slot;
                }
                else
                {
                    lman.state = lman.next_state = 0;
                    lman.work = 0x23;
                    lman.param[0] = sp0;
                    if (lman.pcswitch_flag)
                    {
                        lman.pcswitch_flag = 3;
                        lman.state = 9;
                    }
                }
                rfu_LMAN_occureCallback(lman.work, 0x01);
                lman.work = 0;
            }
            break;
        case ID_CPR_START_REQ:
            if (reqResult == 0)
            {
                lman.param[0] = gRfuLinkStatus->linkLossSlotFlag;
                lman.state = lman.next_state = 17;
                for (lman.child_slot = 0; lman.child_slot < RFU_CHILD_MAX; lman.child_slot++)
                {
                    if ((gRfuLinkStatus->linkLossSlotFlag >> lman.child_slot) & 1)
                    {
                        break;
                    }
                }
            }
            break;
        case ID_CPR_POLL_REQ:
            if (reqResult == 0 && !rfu_CHILD_getConnectRecoveryStatus(&sp0) && sp0 < 2)
            {
                lman.state = 18;
            }
            if (lman.linkRecoveryTimer.count[lman.child_slot] && --lman.linkRecoveryTimer.count[lman.child_slot] == 0)
            {
                lman.state = 18;
            }
            break;
        case ID_CPR_END_REQ:
            if (reqResult == 0 && !rfu_CHILD_getConnectRecoveryStatus(&sp0))
            {
                if (!sp0)
                {
                    lman.state = 19;
                    lman.next_state = 22;
                    lman.work = 0x32;
                }
                else
                {
                    lman.state = lman.next_state = 0;
                    rfu_LMAN_disconnect(gRfuLinkStatus->linkLossSlotFlag);
                    lman.work = 0x33;
                }
                lman.linkRecoveryTimer.count[lman.child_slot] = 0;
                lman.linkRecoveryTimer.active = 0;
                lman.linkRecovery_start_flag = 0;
                rfu_LMAN_occureCallback(lman.work, 0x01);
                lman.work = 0;
            }
            break;
        case ID_MS_CHANGE_REQ:
            if (reqResult == 0)
            {
                if (lman.next_state == 22)
                {
                    lman.state = lman.state_bak[0];
                    lman.next_state = lman.state_bak[1];
                    lman.childClockSlave_flag = 1;
                    rfu_LMAN_occureCallback(0x41, 0x00);
                }
                else if (lman.next_state == 15)
                {
                    lman.state = lman.next_state;
                    lman.childClockSlave_flag = 1;
                    rfu_LMAN_occureCallback(0x41, 0x00);
                    lman.nameAcceptTimer.active |= 1 << lman.child_slot;
                    lman.nameAcceptTimer.count[lman.child_slot] = lman.nameAcceptTimer.count_max;
                    rfu_clearSlot(TYPE_NI_SEND, lman.child_slot);
                    tmp = &sp0;
                    *tmp = rfu_NI_CHILD_setSendGameName(lman.child_slot, 0x0e);
                    if (*tmp)
                    {
                        lman.state = lman.next_state = 0;
                        rfu_LMAN_managerChangeAgbClockMaster();
                        rfu_LMAN_disconnect(gRfuLinkStatus->connSlotFlag | gRfuLinkStatus->linkLossSlotFlag);
                        lman.param[0] = sp0;
                        rfu_LMAN_occureCallback(0x25, 0x01);
                    }
                }
            }
            break;
        case ID_STOP_MODE_REQ:
            if (reqResult == 0)
            {
                lman.state = lman.next_state = 0;
                rfu_LMAN_occureCallback(0x42, 0x00);
            }
            break;
        }
        lman.active = 1;
    }
    else if (reqResult == 3 && lman.msc_exe_flag && (reqCommandId == ID_DATA_TX_REQ || reqCommandId == ID_DATA_RX_REQ || reqCommandId == ID_MS_CHANGE_REQ))
    {
        rfu_REQ_RFUStatus();
        rfu_waitREQComplete();
        rfu_getRFUStatus(&sp0);
        if (sp0 == 0 && gRfuLinkStatus->parentChild == MODE_CHILD)
        {
            stwiRecvBuffer = rfu_getSTWIRecvBuffer()->rxPacketAlloc.rfuPacket8.data;
            stwiRecvBuffer[4] = gRfuLinkStatus->connSlotFlag;
            stwiRecvBuffer[5] = 1;
            rfu_LMAN_linkWatcher(0x29);
            reqResult = 0;
        }
    }
    switch (reqCommandId)
    {
    case ID_DISCONNECT_REQ:
        if (reqResult == 0)
        {
            stwiRecvBuffer = rfu_getSTWIRecvBuffer()->rxPacketAlloc.rfuPacket8.data;
            lman.param[0] = stwiRecvBuffer[8];
            rfu_LMAN_reflectCommunicationStatus(lman.param[0]);
            if (lman.linkRecoveryTimer.active)
            {
                lman.linkRecoveryTimer.active &= ~lman.param[0];
                for (i = 0; i < RFU_CHILD_MAX; i++)
                {
                    if ((lman.param[0] >> i) & 1)
                    {
                        lman.linkRecoveryTimer.count[i] = 0;
                    }
                }
                if (lman.parent_child == 0)
                {
                    lman.state = lman.next_state = 0;
                }
            }
            sp0 = lman.acceptSlot_flag & lman.param[0];
            for (i = 0; i < RFU_CHILD_MAX; i++)
            {
                if ((sp0 >> i) & 1 && lman.acceptCount)
                {
                    lman.acceptCount--;
                }
            }
            lman.acceptSlot_flag &= ~lman.param[0];
            if (lman.pcswitch_flag)
            {
                if (gRfuLinkStatus->parentChild == MODE_NEUTRAL)
                {
                    if (lman.pcswitch_flag == 8)
                    {
                        lman.connect_period = lman.pcswitch_period_bak;
                        lman.pcswitch_flag = 6;
                        lman.state = 6;
                    }
                    else if (lman.state != 6 && lman.state != 7)
                    {
                        lman.pcswitch_flag = 1;
                        lman.state = 5;
                    }
                }
            }
            if (gRfuLinkStatus->parentChild == MODE_NEUTRAL)
            {
                if (lman.state == 0)
                {
                    lman.parent_child = MODE_NEUTRAL;
                }
            }
            if (lman.active == 0)
            {
                rfu_LMAN_occureCallback(0x40, 0x01);
            }
        }
        break;
    case ID_DATA_RX_REQ:
        rfu_LMAN_CHILD_checkSendChildName2();
        if (gRfuLinkStatus->parentChild != MODE_NEUTRAL)
        {
            rfu_LMAN_occureCallback(0x50, 0x00);
        }
        break;
    case ID_RESET_REQ:
    case ID_STOP_MODE_REQ:
        if (reqResult == 0)
        {
            lman.reserveDisconnectSlot_flag = 0;
            lman.acceptCount = 0;
            lman.acceptSlot_flag = 0;;
            lman.parent_child = MODE_NEUTRAL;
            rfu_LMAN_managerChangeAgbClockMaster();
            if (reqCommandId == 61)
            {
                rfu_LMAN_endManager();
            }
        }
        break;
    }
    if (reqResult != 0)
    {
        if (reqCommandId == ID_SP_START_REQ && reqResult != 0 && lman.pcswitch_flag == 4)
        {
            gRfuLinkStatus->parentChild = MODE_PARENT;
            gRfuLinkStatus->connSlotFlag = 0xF;
            rfu_LMAN_disconnect(15);
            rfu_waitREQComplete();
            return;
        }
        else
        {
            lman.param[0] = reqCommandId;
            lman.param[1] = reqResult;
            if (lman.active)
            {
                lman.state = lman.next_state = 0;
            }
            rfu_LMAN_occureCallback(0xf0, 0x02);
            rfu_LMAN_managerChangeAgbClockMaster();
        }
    }
    if (reqCommandId == ID_CLOCK_SLAVE_MS_CHANGE_ERROR_BY_DMA_REQ)
    {
        rfu_LMAN_occureCallback(0xf2, 0x00);
        rfu_LMAN_managerChangeAgbClockMaster();
    }
}

static void rfu_LMAN_MSC_callback(u16 reqCommandId)
{
    u8 r7;
    u8 ackFlag;

    r7 = lman.active;
    lman.active = 0;
    lman.msc_exe_flag = 1;
    if (gRfuLinkStatus->parentChild == MODE_CHILD)
    {
        rfu_LMAN_linkWatcher(reqCommandId);
        if (lman.childClockSlave_flag != 1)
        {
            rfu_LMAN_managerChangeAgbClockMaster();
            lman.msc_exe_flag = 0;
            lman.active = r7;
            return;
        }
    }
    else
    {
        if (!rfu_UNI_PARENT_getDRAC_ACK(&ackFlag))
        {
            lman.parentAck_flag |= ackFlag;
        }
    }
    if (lman.MSC_callback != NULL)
    {
        lman.MSC_callback(reqCommandId);
        rfu_waitREQComplete();
        if (lman.childClockSlave_flag == 2)
        {
            rfu_LMAN_managerChangeAgbClockMaster();
        }
    }
    lman.msc_exe_flag = 0;
    lman.active = r7;
}

static void rfu_LMAN_PARENT_checkRecvChildName(void)
{
    u8 flags;
    u8 sp0;
    u8 i;
    u8 r5;
    u8 r4;
    const u16 *ptr;

    if (lman.state == 5 || lman.state == 6 || lman.state == 7 || lman.state == 8)
    {
        flags = ((gRfuLinkStatus->connSlotFlag ^ lman.connectSlot_flag_old) & gRfuLinkStatus->connSlotFlag) & ~gRfuLinkStatus->getNameFlag;
        lman.connectSlot_flag_old = gRfuLinkStatus->connSlotFlag;
        if (flags)
        {
            lman.param[0] = flags;
            rfu_LMAN_occureCallback(0x10, 0x01);
        }
        sp0 = 0x00;
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            r4 = 1 << i;
            r5 = 0x00;
            if (flags & r4)
            {
                lman.nameAcceptTimer.count[i] = lman.nameAcceptTimer.count_max;
                lman.nameAcceptTimer.active |= r4;
            }
            else if (lman.nameAcceptTimer.active & r4)
            {
                if (gRfuSlotStatusNI[i]->recv.state == SLOT_STATE_RECV_SUCCESS)
                {
                    if (gRfuSlotStatusNI[i]->recv.dataType == 1) // Game identification information
                    {
                        r5 = 0x02;
                        for (ptr = lman.acceptable_serialNo_list; *ptr != 0xFFFF; ptr++)
                        {
                            if (gRfuLinkStatus->partner[i].serialNo == *ptr)
                            {
                                lman.acceptSlot_flag |= r4;
                                lman.acceptCount++;
                                sp0 |= r4;
                                r5 |= 0x01;
                                break;
                            }
                        }
                        if (!(r5 & 0x01))
                        {
                            r5 |= 0x04;
                        }
                    }
                }
                else if (--lman.nameAcceptTimer.count[i] == 0)
                {
                    r5 = 0x06;
                }
                if (r5 & 0x02)
                {
                    lman.nameAcceptTimer.active &= ~r4;
                    lman.nameAcceptTimer.count[i] = 0;
                    rfu_clearSlot(TYPE_NI_RECV, i);
                }
                if (r5 & 0x04)
                {
                    lman.reserveDisconnectSlot_flag |= r4;
                }
            }
        }
        if (sp0)
        {
            lman.param[0] = sp0;
            rfu_LMAN_occureCallback(0x11, 0x01);
        }
        if (lman.reserveDisconnectSlot_flag)
        {
            r5 = 0x01;
            if (gRfuLinkStatus->sendSlotUNIFlag && ((lman.parentAck_flag & lman.acceptSlot_flag) != lman.acceptSlot_flag))
            {
                r5 = 0x00;
            }
            if (r5)
            {
                rfu_LMAN_disconnect(lman.reserveDisconnectSlot_flag);
                lman.param[0] = lman.reserveDisconnectSlot_flag;
                lman.reserveDisconnectSlot_flag = 0;
                rfu_LMAN_occureCallback(0x12, 0x01);
            }
        }
        if (lman.nameAcceptTimer.active == 0 && lman.state == 8)
        {
            if (lman.pcswitch_flag == 0)
            {
                lman.state = lman.next_state = 0;
                rfu_LMAN_occureCallback(0x14, 0x00);
            }
            else
            {
                if (lman.pcswitch_flag == 2)
                {
                    lman.pcswitch_flag = 3;
                    lman.state = 9;
                }
                else
                {
                    lman.pcswitch_flag = 1;
                    lman.state = 5;
                }
                if (lman.acceptSlot_flag)
                {
                    lman.connect_period = 0;
                    lman.pcswitch_flag = 8;
                    lman.state = 5;
                }
            }
        }
    }
}

static void rfu_LMAN_CHILD_checkSendChildName(void)
{
    u16 imeBak = REG_IME;
    REG_IME = 0;
    if (lman.state == 15)
    {
        if (--lman.nameAcceptTimer.count[lman.child_slot] == 0 || gRfuSlotStatusNI[lman.child_slot]->send.state == SLOT_STATE_SEND_FAILED)
        {
            rfu_LMAN_requestChangeAgbClockMaster();
            lman.state = 24;
            rfu_clearSlot(TYPE_NI_SEND, lman.child_slot);
            lman.nameAcceptTimer.active &= ~(1 << lman.child_slot);
            lman.nameAcceptTimer.count[lman.child_slot] = 0;
        }
    }
    REG_IME = imeBak;
    if (lman.state == 24)
    {
        if (lman.childClockSlave_flag == 1)
        {
            rfu_LMAN_requestChangeAgbClockMaster();
        }
        if (lman.childClockSlave_flag == 0)
        {
            lman.state = lman.next_state = 0;
            rfu_LMAN_disconnect(gRfuLinkStatus->connSlotFlag | gRfuLinkStatus->linkLossSlotFlag);
            lman.param[0] = 0;
            rfu_LMAN_occureCallback(0x25, 0x01);
        }
    }
}

static void rfu_LMAN_CHILD_checkSendChildName2(void)
{
    if (lman.state == 15 && gRfuSlotStatusNI[lman.child_slot]->send.state == SLOT_STATE_SEND_SUCCESS)
    {
        lman.state = lman.next_state = 0;
        rfu_clearSlot(TYPE_NI_SEND, lman.child_slot);
        lman.nameAcceptTimer.active &= ~(1 << lman.child_slot);
        lman.nameAcceptTimer.count[lman.child_slot] = 0;
        rfu_LMAN_occureCallback(0x24, 0x00);
    }
}

static void rfu_LMAN_CHILD_linkRecoveryProcess(void)
{
    if (lman.parent_child == 0 && lman.linkRecovery_start_flag == 1)
    {
        lman.state_bak[0] = lman.state;
        lman.state_bak[1] = lman.next_state;
        lman.state = 16;
        lman.next_state = 17;
        lman.linkRecovery_start_flag = 2;
    }
}

static u8 rfu_LMAN_CHILD_checkEnableParentCandidate(void)
{
    u8 i;
    u16 *serialNo;
    u8 flags = 0x00;

    for (i = 0; i < gRfuLinkStatus->findParentCount; i++)
    {
        for (serialNo = lman.acceptable_serialNo_list; *serialNo != 0xFFFF; serialNo++)
        {
            if (gRfuLinkStatus->partner[i].serialNo == *serialNo)
            {
                flags |= (1 << i);
            }
        }
    }
    return flags;
}

static void rfu_LMAN_occureCallback(u8 a0, u8 a1)
{
    if (lman.LMAN_callback != NULL)
    {
        lman.LMAN_callback(a0, a1);
    }
    lman.param[0] = lman.param[1] = 0;
}

static void rfu_LMAN_disconnect(u8 a0)
{
    u8 unk_0e_bak = lman.active;
    lman.active = 1;
    rfu_REQ_disconnect(a0);
    rfu_waitREQComplete();
    lman.active = unk_0e_bak;
}

static void rfu_LMAN_reflectCommunicationStatus(u8 a0)
{
    u8 i;

    if (gRfuLinkStatus->sendSlotNIFlag)
    {
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if (gRfuSlotStatusNI[i]->send.state & SLOT_BUSY_FLAG && gRfuSlotStatusNI[i]->send.bmSlot & a0)
            {
                rfu_changeSendTarget(TYPE_NI, i, gRfuSlotStatusNI[i]->send.bmSlot & ~a0);
            }
        }
    }
    if (gRfuLinkStatus->recvSlotNIFlag)
    {
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if (gRfuSlotStatusNI[i]->recv.state & SLOT_BUSY_FLAG && gRfuSlotStatusNI[i]->recv.bmSlot & a0)
            {
                rfu_NI_stopReceivingData(i);
            }
        }
    }
    if (gRfuLinkStatus->sendSlotUNIFlag)
    {
        gRfuLinkStatus->sendSlotUNIFlag &= ~a0;
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if (gRfuSlotStatusUNI[i]->send.state == SLOT_STATE_SEND_UNI && a0 & gRfuSlotStatusUNI[i]->send.bmSlot)
            {
                gRfuSlotStatusUNI[i]->send.bmSlot &= ~a0;
            }
        }
    }
}

static void rfu_LMAN_checkNICommunicateStatus(void)
{
    u8 i;
    u8 j;
    u8 flags;

    if (lman.NI_failCounter_limit)
    {
        if (gRfuLinkStatus->sendSlotNIFlag)
        {
            for (i = 0; i < RFU_CHILD_MAX; i++)
            {
                if (gRfuSlotStatusNI[i]->send.state & SLOT_BUSY_FLAG)
                {
                    flags = 0;
                    for (j = 0; j < RFU_CHILD_MAX; j++)
                    {
                        if ((gRfuSlotStatusNI[i]->send.bmSlot >> j) & 1 && gRfuSlotStatusNI[j]->send.failCounter > lman.NI_failCounter_limit)
                        {
                            flags |= (1 << j);
                        }
                        if (flags)
                        {
                            rfu_changeSendTarget(TYPE_NI, i, flags ^ gRfuSlotStatusNI[i]->send.bmSlot);
                        }
                    }
                }
            }
        }
        if (gRfuLinkStatus->recvSlotNIFlag)
        {
            for (i = 0; i < RFU_CHILD_MAX; i++)
            {
                if (gRfuSlotStatusNI[i]->recv.state & SLOT_BUSY_FLAG && gRfuSlotStatusNI[i]->recv.failCounter > lman.NI_failCounter_limit)
                {
                    rfu_NI_stopReceivingData(i);
                }
            }
        }
    }
}

void rfu_LMAN_setMSCCallback(void (*func)(u16))
{
    lman.MSC_callback = func;
    rfu_setMSCCallback(rfu_LMAN_MSC_callback);
}

static void rfu_LMAN_setLMANCallback(void (*func)(u8, u8))
{
    lman.LMAN_callback = func;
}

u8 rfu_LMAN_setLinkRecovery(u8 enable_flag, u16 recovery_period)
{
    u16 imeBak;
    if (lman.linkRecovery_enable && enable_flag == 0 && lman.linkRecoveryTimer.active)
    {
        return 5;
    }
    imeBak = REG_IME;
    REG_IME = 0;
    lman.linkRecovery_enable = enable_flag;
    lman.linkRecoveryTimer.count_max = recovery_period;
    REG_IME = imeBak;
    return 0;
}

static u8 rfu_LMAN_setNIFailCounterLimit(u16 NI_failCounter_limit)
{
    if (gRfuLinkStatus->sendSlotNIFlag | gRfuLinkStatus->recvSlotNIFlag)
    {
        lman.param[0] = 6;
        rfu_LMAN_occureCallback(LMAN_MSG_LMAN_API_ERROR_RETURN, 0x01);
        return 6;
    }
    lman.NI_failCounter_limit = NI_failCounter_limit;
    return 0;
}

static u8 rfu_LMAN_setFastSearchParent(u8 enable_flag)
{
    if (lman.state == 9 || lman.state == 10 || lman.state == 11)
    {
        lman.param[0] = 7;
        rfu_LMAN_occureCallback(LMAN_MSG_LMAN_API_ERROR_RETURN, 0x01);
        return 7;
    }
    if (enable_flag)
    {
        lman.fastSearchParent_flag = 1;
    }
    else
    {
        lman.fastSearchParent_flag = 0;
    }
    return 0;
}

static void rfu_LMAN_managerChangeAgbClockMaster(void)
{
    if (lman.childClockSlave_flag)
    {
        lman.childClockSlave_flag = 0;
        rfu_LMAN_occureCallback(0x45, 0x00);
    }
}

void rfu_LMAN_requestChangeAgbClockMaster(void)
{
    if (lman.childClockSlave_flag == 0)
    {
        rfu_LMAN_occureCallback(0x45, 0x00);
    }
    else if (lman.childClockSlave_flag == 1)
    {
        lman.childClockSlave_flag = 2;
    }
}

void rfu_LMAN_forceChangeSP(void)
{
    if (lman.pcswitch_flag)
    {
        switch (lman.state)
        {
        case 5:
            lman.pcswitch_flag = 3;
            lman.state = 9;
            break;
        case 6:
            lman.pcswitch_flag = 2;
            lman.connect_period = 1;
            break;
        case 7:
        case 8:
            lman.pcswitch_flag = 2;
            break;
        case 9:
        case 10:
            lman.connect_period = 40;
            break;
        case 11:
            lman.connect_period = 40;
            lman.state = 10;
            break;
        }
    }
}
