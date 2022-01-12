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
        blackboard.moveToPosition.x = context.goalManager.GetCurrentGoal().x + randomVec.x;
        blackboard.moveToPosition.z = context.goalManager.GetCurrentGoal().z + randomVec.z;
        return State.Success;
    }
}
