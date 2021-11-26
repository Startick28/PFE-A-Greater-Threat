using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class IsPlayerPresent : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (context.sensorManager.IsPlayerPresent())
        {
            blackboard.nearestPresentPlayer = context.sensorManager.GetNearestPresentPlayer();
            return State.Success;
        } 
        return State.Failure;
    }
}
