using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class GT_EnemyScript : MonoBehaviour
{

    // Attacks colliders
    public Collider RComboHitAttackCollider;
    public Collider LComboHitAttackCollider;
    public Collider HeavyClawsAttackRightCollider;
    public Collider HeavyClawsAttackLeftCollider;
    public Collider JumpAttackCollider;

    NavMeshAgent agent;
    Animator animator;

    void Awake()
    {
        agent = gameObject.GetComponent<NavMeshAgent>();
        animator = gameObject.GetComponent<Animator>();
    }
    
    public void GetHit()
    {
        //Code
    }

    // Fonction qui seront appel�es selon par l'abre de d�cision du monstre
    public void MoveToPosition(Vector3 position, float stoppingDistance, float speed, float angularSpeed, bool updateRotation, float acceleration)
    {
        agent.stoppingDistance = stoppingDistance;
        agent.speed = speed;
        agent.angularSpeed = angularSpeed;
        agent.updateRotation = updateRotation;
        agent.acceleration = acceleration;
        agent.destination = position;
    }

    public void RightClawHeavyAttack()
    {
        animator.SetTrigger("HeavyClawsAttackRight");
        HeavyClawsAttackRightCollider.enabled = true;
    }

    public void LeftClawHeavyAttack()
    {
        animator.SetTrigger("HeavyClawsAttackLeft");
        HeavyClawsAttackLeftCollider.enabled = true;
    }

    public void JumpAttack()
    {
        animator.SetTrigger("JumpClawsAttack");
        JumpAttackCollider.enabled = true;
    }

    public void ComboHitAttack()
    {
        animator.SetTrigger("ClawsAttackCombo");
        RComboHitAttackCollider.enabled = true;
        LComboHitAttackCollider.enabled = true;
    }

    public void Roar()
    {
        //Code
    }

}
