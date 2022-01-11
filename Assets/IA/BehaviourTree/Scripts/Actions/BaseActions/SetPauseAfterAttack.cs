using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class SetPauseAfterAttack : ActionNode
{
    public float pauseDuration;
    float startTime;

    protected override void OnStart() {
        startTime = Time.time;
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        blackboard.pausingAfterAttack = pauseDuration;
        if (Time.time - startTime > pauseDuration) {
            return State.Success;
        }
        return State.Running;
    }
}
