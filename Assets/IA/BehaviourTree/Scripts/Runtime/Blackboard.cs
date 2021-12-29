using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BehaviourTreeAI {

    // This is the blackboard container shared between all nodes.
    // Use this to store temporary data that multiple nodes need read and write access to.
    // Add other properties here that make sense for your specific use case.
    [System.Serializable]
    public class Blackboard {
        private Context context;
        public Vector3 moveToPosition;
        public Vector3 lastPlayerSeenPosition;
        public Vector3 lastPlayerSeenEstimatedDirection;
        public bool hasEstimationOfPlayerDirection = false;
        public GameObject lastDetectedPlayer;
        public GameObject nearestPresentPlayer;


        // Greater Threat Specifics //

        public float pausingAfterAttack;


        public void Update()
        {  
            pausingAfterAttack -= Time.deltaTime;
        }

        public void SetContext(Context c)
        {
            context = c;
        }
    }
}