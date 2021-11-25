using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class DisengageJump : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {

        Vector3 direction = (blackboard.lastDetectedPlayer.transform.position - context.transform.position);
        direction = Vector3.ProjectOnPlane(direction, context.transform.up);

        direction =  Quaternion.AngleAxis(Random.Range(90f,270f), context.transform.up) * direction;

        float angle = context.transform.rotation.eulerAngles.y * Mathf.Deg2Rad;
        context.animator.SetFloat("JumpLengthX", direction.x*Mathf.Cos(angle) - direction.z*Mathf.Sin(angle));
        context.animator.SetFloat("JumpLengthY", direction.z*Mathf.Cos(angle) + direction.x*Mathf.Sin(angle));
        context.animator.SetTrigger("JumpTrigger");
        return State.Success;
    }
}