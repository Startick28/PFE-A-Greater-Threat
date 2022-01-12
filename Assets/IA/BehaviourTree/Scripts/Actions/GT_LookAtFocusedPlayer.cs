using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_LookAtFocusedPlayer : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        context.headFollow.SetAimTarget(blackboard.focusedPlayer.transform);
        return State.Success;
    }
}
