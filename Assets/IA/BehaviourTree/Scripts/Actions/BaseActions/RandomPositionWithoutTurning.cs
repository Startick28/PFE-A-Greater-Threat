using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class RandomPositionWithoutTurning : ActionNode
{
    public Vector2 min = Vector2.one * -10;
    public Vector2 max = Vector2.one * 10;

    Vector3 objective;

    protected override void OnStart() {
        objective = new Vector3(context.transform.position.x + Random.Range(min.x, max.x), context.transform.position.y, context.transform.position.z + Random.Range(min.y, max.y));
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        Vector3 direction = objective - context.transform.position;
        Vector3 playerOnPlane = Vector3.ProjectOnPlane(blackboard.nearestPresentPlayer.transform.position, context.transform.up);
        if (Vector3.Dot(direction, context.transform.position - playerOnPlane) <= 0)
        {
            objective = new Vector3(context.transform.position.x + Random.Range(min.x, max.x), context.transform.position.y, context.transform.position.z + Random.Range(min.y, max.y));
            return State.Running;
        }
        blackboard.moveToPosition.x = objective.x;
        blackboard.moveToPosition.z = objective.z;
        return State.Success;
    }
}
