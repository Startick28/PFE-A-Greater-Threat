using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class ClawAttack : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        float angle = Vector3.SignedAngle( context.transform.forward, Vector3.ProjectOnPlane(blackboard.lastDetectedPlayer.transform.position - context.transform.position, context.transform.up), Vector3.up );
        context.animator.SetFloat("AttackAngle",angle);
        context.animator.SetTrigger("ClawAttackTrigger");
        return State.Success;
    }
}
