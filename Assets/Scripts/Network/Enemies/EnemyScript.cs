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

    // Attack's collider
    [SerializeField] private Collider BiteAttackCollider;
    [SerializeField] private Collider ClawsAttackCollider;
    [SerializeField] private Collider ClawsAttackRightCollider;
    [SerializeField] private Collider ClawsAttackLeftCollider;
    [SerializeField] private Collider JumpBiteAttackCollider;
    [SerializeField] private Collider SpitAttackCollider;

    [SerializeField] NavMeshAgent agent;
    
    
    void Start()
    {
    }

    void Update()
    {
    }


    // Fonctions qui seront amen�s � �tre appel�es par des joueurs ou par le monstre lui-m�me
    public void Die()
    {
        Destroy(this.gameObject);
    }

    public void TakeDamage(float damage)
    {
        if (currentHealth > 0)
        {
            currentHealth -= damage;
        }
    }

    public void GetHit()
    {
        //Code
    }

    // Fonction qui seront appel�es selon par l'abre de d�cision du monstre
    public void MoveToPosition(Vector3 position, float stoppingDistance, float runingSpeed, float walkingSpeed, bool updateRotation, float acceleration, bool isRuning)
    {
        agent.stoppingDistance = stoppingDistance;
        agent.speed = (isRuning ? runingSpeed : walkingSpeed);
        agent.updateRotation = updateRotation;
        agent.acceleration = acceleration; // Diff�rence waling/runing?
        agent.destination = position;
    }

    public void ChasePlayer()
    {

    }

    public void BiteAttack()
    {
        //Code
    }

    public void ClawsAttack()
    {
        //Code
    }

    public void JumpBiteAttack()
    {
        //Code
    }

    public void SpitAttack()
    {
        //Code
    }

    public void DisengageJump()
    {
        //Code
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
