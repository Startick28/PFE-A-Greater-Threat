using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class JumpMovement : ActionNode
{
    public Vector3 jumpPosition;
    public bool jumpOnPlayer = true;

    protected override void OnStart() {
        if (jumpOnPlayer) jumpPosition = blackboard.lastDetectedPlayer.transform.position;
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {

        Vector3 direction = (jumpPosition - context.transform.position);
        direction = Vector3.ProjectOnPlane(direction, context.transform.up);
        float angle = context.transform.rotation.eulerAngles.y * Mathf.Deg2Rad;
        context.animator.SetFloat("JumpLengthX", direction.x*Mathf.Cos(angle) - direction.z*Mathf.Sin(angle));
        context.animator.SetFloat("JumpLengthY", direction.z*Mathf.Cos(angle) + direction.x*Mathf.Sin(angle));
        context.animator.SetTrigger("JumpTrigger");
        return State.Success;
    }
}
