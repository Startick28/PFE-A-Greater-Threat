using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_HeavyClawAttack : ActionNode
{
    public bool rightClawAttack;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (rightClawAttack)
        {
            context.animator.SetTrigger("HeavyClawsAttackRight");
            if (EnemiesManager.Instance)
            {
                EnemiesManager.Instance.photonView.RPC("GT_RightClawHeavyAttack", 
                                                        Photon.Pun.RpcTarget.All
                                                        );
            }
        }
        else
        {
            context.animator.SetTrigger("HeavyClawsAttackLeft");
            if (EnemiesManager.Instance)
            {
                EnemiesManager.Instance.photonView.RPC("GT_LeftClawHeavyAttack", 
                                                        Photon.Pun.RpcTarget.All
                                                        );
            }
        }
        
        return State.Success;
    }
}
