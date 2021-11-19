using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class ArackControllerTest : MonoBehaviour
{
    NavMeshAgent agent;
    Animator animator;

    Vector3 objective;

    void Start() {
        agent = GetComponent<NavMeshAgent>();
        animator = GetComponent<Animator>();
        agent.updatePosition = false;
    }

    void Update() {

        if ( Input.GetMouseButtonDown (0)){ 
            RaycastHit hit; 
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition); 
            if ( Physics.Raycast (ray,out hit,100.0f)) {
                objective = hit.point;
                agent.SetDestination(hit.point);
            }
        }
        if ( Input.GetKeyDown(KeyCode.A)){ 
            animator.SetTrigger("JumpBiteTrigger");
        }
        if ( Input.GetKeyDown(KeyCode.Z)){ 
            RaycastHit hit; 
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition); 
            Physics.Raycast (ray,out hit,100.0f);
            float angle = Vector3.SignedAngle( transform.forward, Vector3.ProjectOnPlane(hit.point - transform.position, transform.up), Vector3.up );

            animator.SetFloat("AttackAngle",angle);
            print(animator.GetFloat("AttackAngle"));
            animator.SetTrigger("ClawAttackTrigger");
        }

        if ( Input.GetKeyDown(KeyCode.Space))
        {
            RaycastHit hit; 
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition); 
            Physics.Raycast (ray,out hit,100.0f);
            Vector3 direction = (hit.point - transform.position);
            direction = Vector3.ProjectOnPlane(direction, transform.up);
            float angle = transform.rotation.eulerAngles.y * Mathf.Deg2Rad;
            animator.SetFloat("JumpLengthX", direction.x*Mathf.Cos(angle) - direction.z*Mathf.Sin(angle));
            animator.SetFloat("JumpLengthY", direction.z*Mathf.Cos(angle) + direction.x*Mathf.Sin(angle));
            animator.SetTrigger("JumpTrigger");
        }
        

        animator.SetFloat("Velocity", agent.velocity.magnitude);
        
        if (Vector3.Distance(objective, transform.position) < 1f) agent.ResetPath();

        //var localVelocity = transform.InverseTransformDirection(agent.velocity);
        //animator.SetFloat("Velocity", localVelocity.z);
        //animator.SetFloat("RotationSpeed", localVelocity.x);
    }

    void OnAnimatorMove () {
        Vector3 position = animator.rootPosition;
        position.y = agent.nextPosition.y;
        transform.position = position;
        agent.nextPosition = transform.position;
        
        transform.rotation = animator.rootRotation;
        
    }
}
