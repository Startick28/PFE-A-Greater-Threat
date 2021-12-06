using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class JumpBiteAttack : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        context.animator.SetTrigger("JumpBiteTrigger");
        context.monsterColliderInfos.JumpBiteAttackCollider.enabled = true;
        if (EnemiesManager.Instance)
        {
            EnemiesManager.Instance.EnemyJumpBiteAttackWithId(context.monsterID);
        }
        return State.Success;
    }
}
