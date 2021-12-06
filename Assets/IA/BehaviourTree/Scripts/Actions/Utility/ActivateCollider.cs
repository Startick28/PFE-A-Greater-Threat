using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class ActivateCollider : ActionNode
{
    public Collider colliderToActivate;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        colliderToActivate.enabled = true;
        return State.Success;
    }
}
