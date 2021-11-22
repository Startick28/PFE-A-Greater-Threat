using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class PlayerPosition : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        Vector3 pos = blackboard.lastDetectedPlayer.transform.position;
        blackboard.moveToPosition.x = pos.x;
        blackboard.moveToPosition.z = pos.z;
        return State.Success;
    }
}
