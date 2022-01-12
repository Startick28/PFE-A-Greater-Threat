using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyScript : MonoBehaviour
{
    // Enemy's general variables 
    float maxHealth = 100;
    float currentHealth = 100;
    [SerializeField] private int id;
    public int ID
    {
        get { return this.id; }
        set { id = value; }
    }

    // Attacks colliders
    public Collider BiteAttackCollider;
    public Collider ClawsAttackRightCollider;
    public Collider ClawsAttackLeftCollider;
    public Collider JumpBiteAttackCollider;

    NavMeshAgent agent;
    Animator animator;

    public GameObject focusedPlayer;

    void Awake()
    {
        agent = gameObject.GetComponent<NavMeshAgent>();
        animator = gameObject.GetComponent<Animator>();
    }
    

    // Fonctions qui seront amen�s � �tre appel�es par des joueurs ou par le monstre lui-m�me
    public void Die()
    {
        Destroy(this.gameObject);
    }

    public void TakeDamage(float damage)
    {
        currentHealth -= damage;
        if (currentHealth <= 0) 
        {
            if (EnemiesManager.Instance) EnemiesManager.Instance.photonView.RPC("EnemyDieWithId", Photon.Pun.RpcTarget.All, ID);
        }
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

    public void BiteAttack()
    {
        //Code
    }

    public void ClawsAttack(float attackAngle)
    {
        animator.SetFloat("AttackAngle", attackAngle);
        animator.SetTrigger("ClawAttackTrigger");
    }

    public void JumpBiteAttack()
    {
        animator.SetTrigger("JumpBiteTrigger");
    }

    public void SpitAttack()
    {
        //Code
    }

    public void DisengageJump(float jumpLengthX, float jumpLengthY)
    {
        animator.SetFloat("JumpLengthX", jumpLengthX);
        animator.SetFloat("JumpLengthY", jumpLengthY);
        animator.SetTrigger("JumpTrigger");
    }

    public void Dodge()
    {
        //Code
    }

    public void Roar()
    {
        //Code
    }

}
