using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_ComboHitAttack : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        context.animator.SetTrigger("ClawsAttackCombo");
        if (EnemiesManager.Instance)
        {
            EnemiesManager.Instance.photonView.RPC("GT_ComboHitAttack", 
                                                    Photon.Pun.RpcTarget.All
                                                    );
        }
        return State.Success;
    }
}
