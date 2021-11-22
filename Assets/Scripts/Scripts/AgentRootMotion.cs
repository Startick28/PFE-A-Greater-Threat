using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

// Ensures an agent can be moved using root motion animations
public class AgentRootMotion : MonoBehaviour
{
    NavMeshAgent agent;
    Animator animator;

    void Start() {
        agent = GetComponent<NavMeshAgent>();
        animator = GetComponent<Animator>();
        agent.updatePosition = false;
    }

    void Update()
    {
        animator.SetFloat("Velocity", agent.velocity.magnitude);
    }

    void OnAnimatorMove () {
        Vector3 position = animator.rootPosition;
        position.y = agent.nextPosition.y;
        transform.position = position;
        agent.nextPosition = transform.position;
        transform.rotation = animator.rootRotation;
    }
}
