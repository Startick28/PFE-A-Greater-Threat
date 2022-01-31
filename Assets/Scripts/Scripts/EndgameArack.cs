using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EndgameArack : MonoBehaviour
{

    public Vector3 FinalObjective;

    private NavMeshAgent agent;
    private BehaviourTreeAI.BehaviourTreeRunner treeRunner;
    private Rigidbody rb;  
    private AgentRootMotion rootMotion;

    private bool touchFloor = false;


    void Start()
    {
        rootMotion = GetComponent<AgentRootMotion>();
        agent = GetComponent<NavMeshAgent>();
        treeRunner = GetComponent<BehaviourTreeAI.BehaviourTreeRunner>();
        rb = GetComponent<Rigidbody>();
        rootMotion.enabled = false;
        agent.enabled = false;
        treeRunner.enabled = false;
        rb.useGravity = true;
        rb.drag = 0;
    }


    void Update()
    {
        if (!touchFloor)
        {
            int layerMask = (1 << 10);
            RaycastHit hit;
            if (Physics.Raycast(transform.position + Vector3.up, Vector3.down, out hit, 1.5f, layerMask))
            {
                touchFloor = true;
                StartCoroutine(StartBehavior());
            }
        }
    }

    private IEnumerator StartBehavior()
    {
        NavMeshHit myNavHit;
        if(NavMesh.SamplePosition(transform.position, out myNavHit, 100 , -1))
        {
            transform.position = myNavHit.position;
        }
        rb.useGravity = false;
        rb.drag = float.PositiveInfinity;
        rootMotion.enabled = true;
        agent.enabled = true;
        yield return new WaitForSeconds(0.8f);
        treeRunner.enabled = true;
        Destroy(this);
    }
}
