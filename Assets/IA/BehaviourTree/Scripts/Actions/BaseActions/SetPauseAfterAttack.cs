using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class SetPauseAfterAttack : ActionNode
{
    public float pauseDuration;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        blackboard.pausingAfterAttack = pauseDuration;
        return State.Success;
    }
}
