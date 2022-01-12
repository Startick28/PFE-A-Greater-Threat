using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_IsPlayerAttackedByAracks : ActionNode
{
    protected override void OnStart() {
        blackboard.attackingAracks = context.greaterThreatColliders.monsterFocusingPlayer(blackboard.focusedPlayer);
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (blackboard.attackingAracks.Count > 0) return State.Success;
        return State.Failure;
    }
}
