using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;


namespace BehaviourTreeAI {

    // This is the blackboard container shared between all nodes.
    // Use this to store temporary data that multiple nodes need read and write access to.
    // Add other properties here that make sense for your specific use case.
    [System.Serializable]
    public class Blackboard {

        public enum AttackType
        {
            NONE,
            jumpBiteAttack,
            clawAttack,
            disengageJump,
            GT_ComboHitAttack,
            GT_HeavyClawAttack,
            GT_JumpAttack
        }

        private Context context;
        public Vector3 moveToPosition;
        public Vector3 lastPlayerSeenPosition;
        public Vector3 lastPlayerSeenEstimatedDirection;
        public bool hasEstimationOfPlayerDirection = false;
        public GameObject focusedPlayer;
        public GameObject nearestPresentPlayer;
        public EmittedSound loudestSoundHeard;

        public bool playerDetected = false;

        public float jumpBiteAttackCD = 0f;
        public float clawAttackCD = 0f;
        public float disengageJumpCD = 0f;

        // Greater Threat Specifics //

        public float pausingAfterAttack;
        public float GT_heavyClawAttackCD = 0f;
        public float GT_ComboHitAttackCD = 0f;
        public float GT_JumpAttackCD = 0f;

        public float lookAtPlayerLock = 0f;
        public List<GameObject> attackingAracks;
        public bool playerIntercepted = false;
        public bool canAttackPlayer = true;

        public bool reachedEndgameZone = false;

        public void Update()
        {  
            pausingAfterAttack -= Time.deltaTime;
            lookAtPlayerLock -= Time.deltaTime;
            if (GT_heavyClawAttackCD >= 0) GT_heavyClawAttackCD -= Time.deltaTime;
            if (GT_ComboHitAttackCD >= 0) GT_ComboHitAttackCD -= Time.deltaTime;
            if (GT_JumpAttackCD >= 0) GT_JumpAttackCD -= Time.deltaTime;
            if (jumpBiteAttackCD >= 0) jumpBiteAttackCD -= Time.deltaTime;
            if (clawAttackCD >= 0) clawAttackCD -= Time.deltaTime;
            if (disengageJumpCD >= 0) disengageJumpCD -= Time.deltaTime;
        }

        public void SetContext(Context c)
        {
            context = c;
            
            playerDetected = false;
            playerIntercepted = false;
            hasEstimationOfPlayerDirection = false;
            focusedPlayer = null;
            canAttackPlayer = true;
            reachedEndgameZone = false;
        }

        public void Reset()
        {
            AudioManager.Instance.view.RPC("StopFocusMusic", RpcTarget.All);
            playerDetected = false;
            attackingAracks = new List<GameObject>();
            playerIntercepted = false;
            hasEstimationOfPlayerDirection = false;
            focusedPlayer = null;
            context.headFollow.StopLookingAtTarget();
        }


        public bool IsPathTooLong(Vector3 startPosition, Vector3 endPosition)
        {
            NavMeshPath path = new NavMeshPath();
            if (NavMesh.CalculatePath(startPosition, endPosition, NavMesh.AllAreas, path) == false) return true;
            float pathLength = 0f;
            for ( int i = 1; i < path.corners.Length; ++i )
            {
                pathLength += Vector3.Distance( path.corners[i-1], path.corners[i] );
            }
            //Debug.Log("pathlength : " + pathLength);
            //Debug.Log("distance : " + Vector3.Distance(startPosition, endPosition));
            if (pathLength > Vector3.Distance(startPosition, endPosition) * 3f) return true; 

            return false;
        }

    }

}