using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_PositionAroundGoalWithoutTurning : ActionNode
{
    public float minDistanceFromGoal;
    public float maxDistanceFromGoal;

    Vector3 objective;

    protected override void OnStart() {
        Vector3 randomVec = Quaternion.Euler(0f, Random.Range(0f,360f), 0f) * Vector3.right * Random.Range(minDistanceFromGoal, maxDistanceFromGoal);
        objective = new Vector3(context.goalManager.GetCurrentGoal().x + randomVec.x, blackboard.moveToPosition.y, context.goalManager.GetCurrentGoal().z + randomVec.z);
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        Vector3 direction = objective - context.transform.position;
        if (Vector3.Dot(direction, context.transform.position - blackboard.nearestPresentPlayer.transform.position) <= 0 || 
            blackboard.IsPathTooLong(context.transform.position, objective))
        {
            Vector3 randomVec = Quaternion.Euler(0f, Random.Range(0f,360f), 0f) * Vector3.right * Random.Range(minDistanceFromGoal, maxDistanceFromGoal);
            objective = new Vector3(context.goalManager.GetCurrentGoal().x + randomVec.x, blackboard.moveToPosition.y, context.goalManager.GetCurrentGoal().z + randomVec.z);            
            return State.Running;
        }
        blackboard.moveToPosition.x = objective.x;
        blackboard.moveToPosition.z = objective.z;
        return State.Success;
    }
}
