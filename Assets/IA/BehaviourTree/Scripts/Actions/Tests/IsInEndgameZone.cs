using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class IsInEndgameZone : ActionNode
{
    public float distanceFromZone = 3f;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (Vector3.Distance(context.transform.position, context.endgameArackScript.FinalObjective) <= distanceFromZone || blackboard.reachedEndgameZone) 
        {
            blackboard.reachedEndgameZone = true;
            return State.Success;
        }
        return State.Failure;
    }
}
