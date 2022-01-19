using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class IsPlayerIntercepted : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (blackboard.playerIntercepted) 
        {
            return State.Success;
        }
        return State.Failure;
    }
}
