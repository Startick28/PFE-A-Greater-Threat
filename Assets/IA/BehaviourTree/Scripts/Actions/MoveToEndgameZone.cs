using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class MoveToEndgameZone : ActionNode
{
    public float speed = 6;
    public float angularSpeed = 720;
    public float stoppingDistance = 1f;
    public bool updatePosition = false;
    public bool updateRotation = true;
    public float acceleration = 40.0f;
    public float tolerance = 2f;

    protected override void OnStart() {
        context.agent.stoppingDistance = stoppingDistance;
        context.agent.speed = speed;
        context.agent.angularSpeed = angularSpeed;
        context.agent.updatePosition = updatePosition;
        context.agent.updateRotation = updateRotation;
        context.agent.acceleration = acceleration;

        context.agent.destination = context.endgameArackScript.FinalObjective;
        if (EnemiesManager.Instance)
        {
            EnemiesManager.Instance.photonView.RPC("EnemyMoveToPositionWithId", 
                                                    Photon.Pun.RpcTarget.All,
                                                    context.monsterID,
                                                    context.endgameArackScript.FinalObjective,
                                                    stoppingDistance,
                                                    speed,
                                                    angularSpeed,
                                                    updateRotation,
                                                    acceleration);
        }
    }

    protected override void OnStop() {
        context.agent.ResetPath();
    }

    protected override State OnUpdate() {
        if (context.agent.pathPending) {
            Debug.Log("merde");
            return State.Running;
        }

        if (context.agent.remainingDistance < tolerance) {
            return State.Success;
        }

        if (context.agent.pathStatus == UnityEngine.AI.NavMeshPathStatus.PathInvalid) {
            return State.Failure;
        }

        return State.Running;
    }
}
