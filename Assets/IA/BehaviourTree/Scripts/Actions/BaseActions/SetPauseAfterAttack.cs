using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class SetPauseAfterAttack : ActionNode
{
    public float pauseDuration;
    public bool lockLookAtPlayer;
    public float lockDuration;
    float startTime;

    protected override void OnStart() {
        startTime = Time.time;
        blackboard.pausingAfterAttack = pauseDuration;
        if (lockLookAtPlayer) blackboard.lookAtPlayerLock = lockDuration;
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {      
        if (Time.time - startTime > pauseDuration) {
            return State.Success;
        }
        return State.Running;
    }
}
