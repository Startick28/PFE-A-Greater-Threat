using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class SetAnimatorInt : ActionNode
{
    public string intName;
    public int intValue;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        context.animator.SetInteger(intName, intValue);
        return State.Success;
    }
}
