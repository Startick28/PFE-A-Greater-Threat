using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;

public class GT_InterceptAttackedPlayer : ActionNode
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

    protected override void OnStart() {

        Vector3 positionToIntercept = blackboard.focusedPlayer.transform.position * (blackboard.attackingAracks.Count + 1);
        foreach(GameObject arack in blackboard.attackingAracks)
        {
            positionToIntercept -= arack.transform.position;
        }

        positionToIntercept = 2 * (positionToIntercept - blackboard.focusedPlayer.transform.position) + blackboard.focusedPlayer.transform.position;

        blackboard.moveToPosition.x = positionToIntercept.x;
        blackboard.moveToPosition.z = positionToIntercept.z;

        createdWall = Instantiate(MoveAroundWallPrefab, blackboard.focusedPlayer.transform.position, Quaternion.identity);
        createdWall.transform.SetParent(blackboard.focusedPlayer.transform);

        createdWall.transform.localScale = Vector3.one * Mathf.Max( Mathf.Min(Vector3.Distance(positionToIntercept, blackboard.focusedPlayer.transform.position) - 2f,
                                                                              Vector3.Distance(context.transform.position, blackboard.focusedPlayer.transform.position) - 2f), 
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