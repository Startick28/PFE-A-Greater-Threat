using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class LoudestSoundPosition : ActionNode
{
    protected override void OnStart() {
        
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        blackboard.loudestSoundHeard = context.sensorManager.GetLoudestHeardSound();
        blackboard.moveToPosition.x = blackboard.loudestSoundHeard.position.x;
        blackboard.moveToPosition.z = blackboard.loudestSoundHeard.position.z;
        return State.Success;
    }
}
