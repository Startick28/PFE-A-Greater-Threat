using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GoToLastSeenPlayerPosition : ActionNode
{
    public float speed = 10;
    public float angularSpeed = 720;
    public float stoppingDistance = 0.5f;
    public bool updatePosition = false;
    public bool updateRotation = true;
    public float acceleration = 40.0f;
    public float range = 1.0f;
    Vector3 oldPlayerPosition = Vector3.zero;
    Vector3 newPlayerPosition = Vector3.zero;

    protected override void OnStart() {
        context.agent.stoppingDistance = stoppingDistance;
        context.agent.speed = speed;
        context.agent.angularSpeed = angularSpeed;
        context.agent.updatePosition = updatePosition;
        context.agent.updateRotation = updateRotation;
        context.agent.acceleration = acceleration;
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (context.sensorManager.CanSeePlayer())
        {
            oldPlayerPosition = newPlayerPosition;
            newPlayerPosition = blackboard.lastDetectedPlayer.transform.position;
            blackboard.lastPlayerSeenEstimatedDirection = (newPlayerPosition - oldPlayerPosition).normalized;
            blackboard.hasEstimationOfPlayerDirection = true;
            blackboard.lastPlayerSeenPosition = blackboard.lastDetectedPlayer.transform.position;
        }
        else if (context.agent.hasPath && context.agent.remainingDistance < range)  return State.Failure;

        context.agent.destination = blackboard.lastPlayerSeenPosition;
        if (EnemiesManager.Instance)
        {
            EnemiesManager.Instance.EnemyMoveToPositionWithId(context.monsterID,
                                                        blackboard.lastPlayerSeenPosition,
                                                        stoppingDistance,
                                                        speed,
                                                        angularSpeed,
                                                        updateRotation,
                                                        acceleration);
        }

        if (context.agent.hasPath && context.agent.remainingDistance < range) {
            return State.Success;
        }

        if (context.agent.pathPending) {
            return State.Running;
        }
        if (context.agent.pathStatus == UnityEngine.AI.NavMeshPathStatus.PathInvalid) {
            return State.Failure;
        }
        return State.Running;
    }
}
