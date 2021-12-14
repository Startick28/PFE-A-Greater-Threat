using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class RandomlyChasePlayer : ActionNode
{
    public float speed = 10;
    public float angularSpeed = 720;
    public float stoppingDistance = 0.5f;
    public bool updatePosition = false;
    public bool updateRotation = true;
    public float acceleration = 40.0f;
    public float range = 1.0f;

    public float axisRange = 70f;
    public float minDistance = 3f;
    public float maxDistance = 5f;

    protected override void OnStart() {
        context.agent.stoppingDistance = stoppingDistance;
        context.agent.speed = speed;
        context.agent.angularSpeed = angularSpeed;
        context.agent.updatePosition = updatePosition;
        context.agent.updateRotation = updateRotation;
        context.agent.acceleration = acceleration;

        context.agent.destination = context.transform.position + Quaternion.AngleAxis(Random.Range(-axisRange,axisRange), context.transform.up) * context.transform.forward * Random.Range(minDistance,maxDistance);
        if (EnemiesManager.Instance)
        {
            EnemiesManager.Instance.photonView.RPC("EnemyMoveToPositionWithId", 
                                                    Photon.Pun.RpcTarget.All,
                                                    context.monsterID,
                                                    context.agent.destination,
                                                    stoppingDistance,
                                                    speed,
                                                    angularSpeed,
                                                    updateRotation,
                                                    acceleration);
        }
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (context.sensorManager.CanSeePlayer())
        {
            return State.Failure;
        }

        if (context.agent.remainingDistance < range) {
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
