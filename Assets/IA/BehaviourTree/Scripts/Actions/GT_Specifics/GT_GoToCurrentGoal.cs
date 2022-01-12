using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_GoToCurrentGoal : ActionNode
{
    public float noPlayerSpeed = 40f;
    public float yesPlayerSpeed = 20f;
    public float angularSpeed = 720;
    public float stoppingDistance = 5f;
    public bool updatePosition = false;
    public bool updateRotation = true;
    public float acceleration = 40.0f;
    public float tolerance = 20f;

    protected override void OnStart() {
        context.agent.stoppingDistance = stoppingDistance;
        context.agent.speed = yesPlayerSpeed;
        context.agent.angularSpeed = angularSpeed;
        context.agent.updatePosition = updatePosition;
        context.agent.updateRotation = updateRotation;
        context.agent.acceleration = acceleration;
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        
        context.agent.speed = context.goalManager.IsAnyPlayerClose() ? yesPlayerSpeed : noPlayerSpeed;

        context.agent.destination = context.goalManager.GetCurrentGoal();
        
        if (EnemiesManager.Instance)
        {
            EnemiesManager.Instance.photonView.RPC("EnemyMoveToPositionWithId", 
                                                    Photon.Pun.RpcTarget.All,
                                                    context.monsterID,
                                                    context.goalManager.GetCurrentGoal(),
                                                    stoppingDistance,
                                                    context.agent.speed,
                                                    angularSpeed,
                                                    updateRotation,
                                                    acceleration);
        }

        if (context.agent.hasPath && context.agent.remainingDistance < tolerance) {
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
