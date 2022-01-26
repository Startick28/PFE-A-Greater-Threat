using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_PositionAroundGoal : ActionNode
{
    public float minDistanceFromGoal;
    public float maxDistanceFromGoal;

    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        Vector3 randomVec = Quaternion.Euler(0f, Random.Range(0f,360f), 0f) * Vector3.right * Random.Range(minDistanceFromGoal, maxDistanceFromGoal);
        Vector3 objective = new Vector3(context.goalManager.GetCurrentGoal().x + randomVec.x, 
                                        context.transform.position.y, 
                                        context.goalManager.GetCurrentGoal().z + randomVec.z);

        if (blackboard.IsPathTooLong(context.transform.position, objective))
        {
            return State.Running;
        }

        blackboard.moveToPosition.x = objective.x;
        blackboard.moveToPosition.y = objective.y;
        blackboard.moveToPosition.z = objective.z;
        return State.Success;
    }
}
