using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_InterceptLoudestSound : ActionNode
{
    public GameObject MoveAroundWallPrefab;
    public float speed = 10f;
    public float angularSpeed = 720;
    public float stoppingDistance = 1f;
    public bool updatePosition = false;
    public bool updateRotation = true;
    public float acceleration = 40.0f;
    public float tolerance = 2f;

    GameObject createdWall;

    bool isPathTooLong;

    protected override void OnStart() {
        isPathTooLong = false;

        Vector3 positionToIntercept = (context.goalManager.GetCurrentGoal() + 3 * blackboard.loudestSoundHeard.position) / 4f;
        blackboard.moveToPosition.x = positionToIntercept.x;
        blackboard.moveToPosition.z = positionToIntercept.z;

        isPathTooLong = blackboard.IsPathTooLong(context.transform.position, blackboard.moveToPosition);
        if (isPathTooLong) return;

        createdWall = Instantiate(MoveAroundWallPrefab, blackboard.loudestSoundHeard.position, Quaternion.identity);
        createdWall.transform.localScale = Vector3.one * Mathf.Max( Mathf.Min(Vector3.Distance(positionToIntercept, blackboard.loudestSoundHeard.position) * 3f / 4f,
                                                                              Vector3.Distance(context.transform.position, blackboard.loudestSoundHeard.position) - 2f), 
                                                            0f);

        context.agent.stoppingDistance = stoppingDistance;
        context.agent.speed = speed;
        context.agent.angularSpeed = angularSpeed;
        context.agent.updatePosition = updatePosition;
        context.agent.updateRotation = updateRotation;
        context.agent.acceleration = acceleration;
    }

    protected override void OnStop() {
        Destroy(createdWall);
    }

    protected override State OnUpdate() {
        if (isPathTooLong) return State.Failure;

        context.agent.destination = blackboard.moveToPosition;
        if (EnemiesManager.Instance)
        {
            EnemiesManager.Instance.photonView.RPC("EnemyMoveToPositionWithId", 
                                                    Photon.Pun.RpcTarget.All,
                                                    context.monsterID,
                                                    blackboard.moveToPosition,
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
