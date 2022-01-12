using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class IsLookingAtPlayerLocked : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (blackboard.lookAtPlayerLock >= 0f) return State.Success;
        return State.Failure;
    }
}
