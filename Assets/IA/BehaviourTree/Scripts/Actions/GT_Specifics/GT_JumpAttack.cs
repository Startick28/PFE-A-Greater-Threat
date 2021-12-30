using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_JumpAttack : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        context.animator.SetTrigger("JumpClawsAttack");
        context.greaterThreatColliders.JumpAttackCollider.enabled = true;
        if (EnemiesManager.Instance)
        {
            EnemiesManager.Instance.photonView.RPC("GT_JumpAttack", 
                                                    Photon.Pun.RpcTarget.All
                                                    );
        }
        return State.Success;
    }
}
