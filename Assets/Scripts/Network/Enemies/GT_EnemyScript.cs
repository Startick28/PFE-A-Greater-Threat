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
    [SerializeField] private AudioSource audioSource;
    [SerializeField] private AudioClip roarAfterJumpClip;
    [SerializeField] private AudioClip roarClip;

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
    }

    public void LeftClawHeavyAttack()
    {
        animator.SetTrigger("HeavyClawsAttackLeft");
    }

    public void JumpAttack()
    {
        animator.SetTrigger("JumpClawsAttack");
    }

    public void ComboHitAttack()
    {
        animator.SetTrigger("ClawsAttackCombo");
    }

    public void Roar()
    {
        //Code
    }

    public void SetRightClawHeavyAttackCollider()
    {
        HeavyClawsAttackRightCollider.enabled = true;
    }

    public void SetLeftClawHeavyAttackCollider()
    {
        HeavyClawsAttackLeftCollider.enabled = true;
    }
    public void SetJumpAttackCollider()
    {
        JumpAttackCollider.enabled = true;
    }
    public void SetComboHitAttackCollider()
    {
        RComboHitAttackCollider.enabled = true;
        LComboHitAttackCollider.enabled = true;
    }

    public void StopAgentRotation()
    {
        agent.updateRotation = false;
    }
    public void StartAgentRotation()
    {
        agent.updateRotation = true;
    }


    public List<GameObject> monsterFocusingPlayer(GameObject player)
    {
        List<GameObject> result = new List<GameObject>();
        foreach (Transform child in GameObject.Find("EnnemiesManager").transform)
        {
            child.GetComponent<EnemyScript>();
            if (child.GetComponent<EnemyScript>().focusedPlayer == player)
            {
                result.Add(child.gameObject);
            }
        }
        return result;
    }

    public void RoarAfterJumpSound()
    {
        audioSource.PlayOneShot(roarAfterJumpClip, 0.5f); 
    }

    public void RoarSound()
    {
        audioSource.PlayOneShot(roarClip, 0.5f);
    }
}
