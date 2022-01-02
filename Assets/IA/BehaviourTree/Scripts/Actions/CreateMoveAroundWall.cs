using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class CreateMoveAroundWall : ActionNode
{

    public bool setParentToPlayer;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (setParentToPlayer)
        {
            //transform.SetParent(blackboard.lastDetectedPlayer.transform);
        }
        
        return State.Success;
    }
}
