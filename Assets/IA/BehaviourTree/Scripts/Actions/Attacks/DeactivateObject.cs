using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class DeactivateObject : ActionNode
{

    GameObject objectToDeactivate;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        objectToDeactivate.SetActive(false);
        return State.Success;
    }
}
