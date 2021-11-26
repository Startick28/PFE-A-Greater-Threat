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
        EmittedSound sound = context.sensorManager.GetLoudestHeardSound();
        blackboard.moveToPosition.x = sound.position.x;
        blackboard.moveToPosition.z = sound.position.z;
        return State.Success;
    }
}
