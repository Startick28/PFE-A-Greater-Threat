using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterActionExecution : MonoBehaviour
{
    static int nextID = 0;


    private int _monsterID;
    public int MonsterID { get {return _monsterID;} private set{} }
    private BehaviourTreeAI.Context context;


    [Header("MoveToPosition")]
    [SerializeField] private float walkingSpeed = 5;
    [SerializeField] private float runingSpeed = 10;
    [SerializeField] private float stoppingDistance = 0.5f;
    [SerializeField] private bool updateRotation = true;
    [SerializeField] private float acceleration = 40.0f;
    [SerializeField] private float tolerance = 1.0f;

    [Header("BiteAttack")]
    [SerializeField] private Collider BiteAttackCollider;

    [Header("ClawsAttack")]
    [SerializeField] private Collider ClawsAttackCollider;

    [Header("ClawsAttackRight")]
    [SerializeField] private Collider ClawsAttackRightCollider;

    [Header("ClawsAttackLeft")]
    [SerializeField] private Collider ClawsAttackLeftCollider;

    [Header("JumpBiteAttack")]
    [SerializeField] private Collider JumpBiteAttackCollider;

    [Header("SpitAttack")]
    [SerializeField] private Collider SpitAttackCollider;

    void Start()
    {
        _monsterID = nextID;
        nextID++;

        // THIS SCRIPT HAS TO BE INSTANTIATED AFTER BehaviorTreeRunner TO WORK
        context = gameObject.GetComponent<BehaviourTreeAI.BehaviourTreeRunner>().GetContext();
    }

    public void MoveToPosition(Vector3 position, bool isRuning = false) 
    {
        context.agent.stoppingDistance = stoppingDistance;
        context.agent.speed = (isRuning ? runingSpeed : walkingSpeed);
        context.agent.destination = position;
        context.agent.updateRotation = updateRotation;
        context.agent.acceleration = acceleration; // Différence waling/runing?
    }

    public void BiteAttack() {}

    public void ClawsAttack() {}

    public void ClawsAttackRight() {}

    public void ClawsAttackLeft() {}

    public void JumpBiteAttack() {}

    public void SpitAttack() {}

    // side : side towards which the monster is jumping. Back 0, Front 1, Left 2, Right 3
    public void Jump(int side) {}

    public void Idle(int idleType) 
    {
        context.agent.ResetPath();
        // TODO : set animation trigger depending on the idle type.
    }

    
    // side : side from which the monster got hit. Back 0, Front 1, Left 2, Right 3
    public void GetHit(int side) {} 

    public void Die() {}
}
