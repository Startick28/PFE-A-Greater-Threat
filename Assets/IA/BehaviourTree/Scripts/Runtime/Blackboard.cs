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

        public void Update()
        {
            
        }

        public void SetContext(Context c)
        {
            context = c;
        }
    }
}