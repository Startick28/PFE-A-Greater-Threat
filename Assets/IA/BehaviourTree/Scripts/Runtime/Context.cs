using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace BehaviourTreeAI {

    // The context is a shared object every node has access to.
    // Commonly used components and subsytems should be stored here
    // It will be somewhat specfic to your game exactly what to add here.
    // Feel free to extend this class 
    public class Context {
        public GameObject gameObject;
        public Transform transform;
        public Animator animator;
        public Rigidbody physics;
        public NavMeshAgent agent;
        public SphereCollider sphereCollider;
        public BoxCollider boxCollider;
        public CapsuleCollider capsuleCollider;
        public CharacterController characterController;
        public SensorManager sensorManager;
        // Add other game specific systems here
        public int monsterID;
        public EnemyScript monsterColliderInfos;
        
        //GT Specifics
        public GoalManager goalManager;
        public GT_EnemyScript greaterThreatColliders;
        public GT_HeadFollow headFollow;

        //Endgame Aracks
        public EndgameArack endgameArackScript;

        public static Context CreateFromGameObject(GameObject gameObject) {
            // Fetch all commonly used components
            Context context = new Context();
            context.gameObject = gameObject;
            context.transform = gameObject.transform;
            context.animator = gameObject.GetComponent<Animator>();
            context.physics = gameObject.GetComponent<Rigidbody>();
            context.agent = gameObject.GetComponent<NavMeshAgent>();
            context.sphereCollider = gameObject.GetComponent<SphereCollider>();
            context.boxCollider = gameObject.GetComponent<BoxCollider>();
            context.capsuleCollider = gameObject.GetComponent<CapsuleCollider>();
            context.characterController = gameObject.GetComponent<CharacterController>();
            context.sensorManager = gameObject.GetComponent<SensorManager>();
            // Add whatever else you need here...
            context.monsterColliderInfos = gameObject.GetComponent<EnemyScript>();
            if (context.monsterColliderInfos != null) context.monsterID = context.monsterColliderInfos.ID;
            //GT Specifics 
            context.goalManager = gameObject.GetComponent<GoalManager>();
            context.greaterThreatColliders = gameObject.GetComponent<GT_EnemyScript>();
            if (context.greaterThreatColliders != null) context.monsterID = -1;
            context.headFollow = gameObject.GetComponent<GT_HeadFollow>();
            //Endgame Aracks
            context.endgameArackScript = gameObject.GetComponent<EndgameArack>();

            return context;
        }
    }
}