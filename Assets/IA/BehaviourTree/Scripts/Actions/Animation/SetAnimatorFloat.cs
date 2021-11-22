using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class SetAnimatorFloat : ActionNode
{
    public string floatName;
    public float floatValue;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        context.animator.SetFloat(floatName, floatValue);
        return State.Success;
    }
}
