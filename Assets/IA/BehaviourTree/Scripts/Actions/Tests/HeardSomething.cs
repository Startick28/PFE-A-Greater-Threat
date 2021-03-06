using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class HeardSomething : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (context.sensorManager.HeardSomething()) return State.Success;
        return State.Failure;
    }
}
