using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class InRangeOfPlayer : ActionNode
{
    public float range;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (blackboard.focusedPlayer == null) return State.Failure;
        if (Vector3.Distance(blackboard.focusedPlayer.transform.position, context.transform.position) <= range)
        {
            return State.Success;
        }
        
        return State.Failure;
    }
}
