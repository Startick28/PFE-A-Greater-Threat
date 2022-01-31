using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

// Ensures an agent can be moved using root motion animations
public class AgentRootMotion : MonoBehaviour
{
    NavMeshAgent agent;
    Animator animator;

    Quaternion desiredRotation;

    float epsilon = 5f;

    void OnEnable() {
        agent = GetComponent<NavMeshAgent>();
        animator = GetComponent<Animator>();
        agent.updatePosition = false;

        NavMeshHit myNavHit;
        if(NavMesh.SamplePosition(transform.position, out myNavHit, 100 , -1))
        {
            transform.position = myNavHit.position;
        }
    }

    void Update()
    {
        animator.SetFloat("Velocity", agent.velocity.magnitude);

        int layerMask = (1 << 10);
        RaycastHit slopeHit;

        //Perform raycast from the object's position downwards
        if (Physics.Raycast(transform.position + Vector3.up, Vector3.down, out slopeHit, 10f, layerMask))
        {
            //Drawline to show the hit point
            //Debug.DrawLine(transform.position + Vector3.up, slopeHit.point, Color.red);

            //Get slope angle from the raycast hit normal then calcuate new pos of the object
            Quaternion newRot = Quaternion.FromToRotation(transform.up, slopeHit.normal) * transform.rotation;

            //Apply the rotation 
            desiredRotation = Quaternion.Lerp(desiredRotation, newRot, Time.deltaTime * 10f);
            if (Quaternion.Angle(transform.rotation, newRot) > epsilon) transform.rotation = desiredRotation;

        }
    }

    void OnAnimatorMove () {
        Vector3 position = animator.rootPosition;
        position.y = agent.nextPosition.y;
        transform.position = position;
        agent.nextPosition = transform.position;
        transform.rotation = animator.rootRotation; 
    }
}
