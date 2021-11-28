using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class ChaseDetectedPlayer : ActionNode
{
    public float speed = 10;
    public float angularSpeed = 720;
    public float stoppingDistance = 0.5f;
    public bool updatePosition = false;
    public bool updateRotation = true;
    public float acceleration = 40.0f;
    public float range = 1.0f;

    protected override void OnStart() {
        context.agent.stoppingDistance = stoppingDistance;
        context.agent.speed = speed;
        context.agent.angularSpeed = angularSpeed;
        context.agent.updatePosition = updatePosition;
        context.agent.updateRotation = updateRotation;
        context.agent.acceleration = acceleration;
        
    }

    protected override void OnStop() {
        context.agent.ResetPath();
    }

    protected override State OnUpdate() {
        if (context.sensorManager.CanSeePlayer())
        {
            context.agent.destination = blackboard.lastDetectedPlayer.transform.position;
        }
        else
        {
            if (context.agent.pathStatus == UnityEngine.AI.NavMeshPathStatus.PathComplete)
            {
                context.agent.destination = context.transform.position + Quaternion.AngleAxis(Random.Range(-120f,120f), context.transform.up) * context.transform.forward * Random.Range(3f,5f);
            }
        }
        if (context.agent.pathPending) {
            return State.Running;
        }

        if (Vector3.Distance(context.transform.position, blackboard.lastDetectedPlayer.transform.position) < range) {
            context.agent.ResetPath();
            return State.Success;
        }

        if (context.agent.pathStatus == UnityEngine.AI.NavMeshPathStatus.PathInvalid) {
            return State.Failure;
        }

        return State.Running;
    }
}
