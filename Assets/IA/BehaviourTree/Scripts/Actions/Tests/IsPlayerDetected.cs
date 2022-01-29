using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BehaviourTreeAI;
using Photon.Pun;

public class IsPlayerDetected : ActionNode
{
    protected override void OnStart() {
    }

    protected override void OnStop() {
    }

    protected override State OnUpdate() {
        if (context.sensorManager.PlayerDetected)
        {
            if (context.monsterColliderInfos != null) 
            {
                if (context.monsterColliderInfos.focusedPlayer == null)
                {
                    context.monsterColliderInfos.focusedPlayer = context.sensorManager.GetLastSeenPlayer();
                    if (!blackboard.playerDetected)
                    {
                        blackboard.playerDetected = true;
                        PhotonView view = context.monsterColliderInfos.focusedPlayer.GetComponent<PhotonView>();
                        view.RPC("PlayFocusMusic",RpcTarget.All, view.ViewID);
                    }
                }
            }
            return State.Success;
        } 
        if (context.monsterColliderInfos != null) context.monsterColliderInfos.focusedPlayer = null;
        return State.Failure;
    }

      
}
