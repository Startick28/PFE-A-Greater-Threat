using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class CanSeePlayer : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (context.sensorManager.CanSeePlayer())
        {
            blackboard.focusedPlayer = context.sensorManager.GetSeenPlayer();
            return State.Success;
        } 
        return State.Failure;
    }
}
