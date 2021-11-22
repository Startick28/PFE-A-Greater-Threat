using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class ActivateObject : ActionNode
{

    GameObject objectToActivate;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        objectToActivate.SetActive(true);
        return State.Success;
    }
}
