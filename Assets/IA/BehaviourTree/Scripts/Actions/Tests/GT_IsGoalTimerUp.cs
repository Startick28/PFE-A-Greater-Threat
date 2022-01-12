using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_IsGoalTimerUp : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (context.goalManager.IsGoalTimerUp()) return State.Success;
        return State.Failure;
    }
}
