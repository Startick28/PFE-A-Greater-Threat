using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class CanSeePlayerWithTimer : ActionNode
{
    public float durationToSeePlayer = 1f;

    private float seenTimer;

    protected override void OnStart() {
        seenTimer = Time.time;
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (context.sensorManager.CanSeePlayer())
        {
            if (Time.time - seenTimer > durationToSeePlayer) {
                blackboard.lastDetectedPlayer = context.sensorManager.GetSeenPlayer();
                return State.Success;
            }
            return State.Running;
        } 
        return State.Failure;
    }
}
