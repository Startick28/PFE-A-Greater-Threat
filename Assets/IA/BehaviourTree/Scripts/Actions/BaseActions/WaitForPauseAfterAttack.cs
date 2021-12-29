using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class WaitForPauseAfterAttack : ActionNode
{
    float duration = 1;
    float startTime;

    protected override void OnStart() {
        startTime = Time.time;
        duration = blackboard.pausingAfterAttack;
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (Time.time - startTime > duration) {
            return State.Success;
        }
        return State.Running;
    }
}
