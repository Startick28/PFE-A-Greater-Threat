using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemiesManager : MonoBehaviourPunCallbacks
{
    public static EnemiesManager Instance;

    private void Awake()
    {
        if (Instance != null && Instance != this) Destroy(gameObject);
        Instance = this;
    }

    private int lastId = 0;
    [SerializeField] private GameObject enemy;
    [SerializeField] private GameObject endgameEnemyPrefab;
    
    [SerializeField] public GT_EnemyScript greaterThreat;
    [SerializeField] private GameObject bloodEffect;

    // Instantiate an enemy with RPC.
    // How to call it : 
    // EnemiesManager.Instance.photonView.RPC("InstantiateEnemy", RpcTarget.All, position);
    [PunRPC]
    public void InstantiateEnemy(Vector3 position)
    {
        GameObject enemyInstantiate = Instantiate(enemy, position, Quaternion.identity);
        enemyInstantiate.transform.parent = gameObject.transform;
        enemyInstantiate.GetComponent<EnemyScript>().ID = lastId;
        lastId++;
    }


    // Instantiate an enemy with RPC.
    // How to call it : 
    // EnemiesManager.Instance.photonView.RPC("InstantiateEndgameEnemy", RpcTarget.All, position);
    [PunRPC]
    public void InstantiateEndgameEnemy(Vector3 position, Vector3 endgameObjective)
    {
        GameObject enemyInstantiate = Instantiate(endgameEnemyPrefab, position, Quaternion.identity);
        enemyInstantiate.GetComponent<EndgameArack>().FinalObjective = endgameObjective;
        enemyInstantiate.transform.parent = gameObject.transform;
        enemyInstantiate.GetComponent<EnemyScript>().ID = lastId;
        lastId++;
    }

    [PunRPC]
    public void RemoveAllArrack()
    {
        foreach (Transform child in transform)
            Destroy(child.gameObject);
    }

    // Parcours tous les enfants de l'EnemiesManager en fonction d'un ID.
    // Appel par la suite la fonction TakeDamage de l'enfant en question
    // Pour appeler la fonction :
    // this.photonView.RPC("EnemyTakeDamageWithId", RpcTarget.All, id, damages);
    [PunRPC]
    public void EnemyTakeDamageWithId(int id, float damages)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy != null)
            {
                if (enemy.ID == id)
                {
                    enemy.TakeDamage(damages);
                    return;
                }
            }
        }
    }

    [PunRPC]
    public void InstantiateBloodEffect(float x, float y, float z)
    {
        Instantiate(bloodEffect, new Vector3(x, y, z), Quaternion.identity);
    }

    [PunRPC]
    public void EnemyDieWithId(int id)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy != null)
            {
                if (enemy.ID == id)
                {
                    enemy.Die();
                    return;
                }
            }
        }
    }

    [PunRPC]
    public void EnemyGetHit(int id)
    {
        if (!photonView.IsMine)
        {
            foreach (Transform child in transform)
            {
                EnemyScript enemy = child.GetComponent<EnemyScript>();
                if (enemy != null)
                {
                    if (enemy.ID == id)
                    {
                        enemy.GetHit();
                        return;
                    }
                }
                
            }
        }
    }

    [PunRPC]
    public void EnemyMoveToPositionWithId(int id, Vector3 position, float stoppingDistance, float speed, float angularSpeed, bool updateRotation, float acceleration)
    {
        if (!photonView.IsMine)
        {
            if (id == -1)
            {
                greaterThreat.MoveToPosition(position, stoppingDistance, speed, angularSpeed, updateRotation, acceleration);
                return;
            }
            foreach (Transform child in transform)
            {
                EnemyScript enemy = child.GetComponent<EnemyScript>();
                if (enemy != null)
                {
                    if (enemy.ID == id)
                    {
                        enemy.MoveToPosition(position, stoppingDistance, speed, angularSpeed, updateRotation, acceleration);
                        return;
                    }
                }
            }
        }
    }

    [PunRPC]
    public void EnemyBiteAttackWithId(int id)
    {
        if (!photonView.IsMine)
        {
            foreach (Transform child in transform)
            {
                EnemyScript enemy = child.GetComponent<EnemyScript>();
                if (enemy.ID == id)
                {
                    enemy.BiteAttack();
                    return;
                }
            }
        }
    }

    [PunRPC]
    public void EnemyClawsAttackWithId(int id, float attackAngle = 0f)
    {
        if (!photonView.IsMine)
        {
            foreach (Transform child in transform)
            {
                EnemyScript enemy = child.GetComponent<EnemyScript>();
                if (enemy.ID == id)
                {
                    enemy.ClawsAttack(attackAngle);
                    return;
                }
            }
        }
    }

    [PunRPC]
    public void EnemyJumpBiteAttackWithId(int id)
    {
        if (!photonView.IsMine)
        {
            foreach (Transform child in transform)
            {
                EnemyScript enemy = child.GetComponent<EnemyScript>();
                if (enemy.ID == id)
                {
                    enemy.JumpBiteAttack();
                    return;
                }
            }
        }
    }

    [PunRPC]
    public void EnemySpitAttackWithId(int id)
    {
        if (!photonView.IsMine)
        {
            foreach (Transform child in transform)
            {
                EnemyScript enemy = child.GetComponent<EnemyScript>();
                if (enemy.ID == id)
                {
                    enemy.SpitAttack();
                    return;
                }
            }
        }
    }

    [PunRPC]
    public void EnemyDisengageJumpWithId(int id, float jumpLengthX = 0f, float jumpLengthY = 0f)
    {
        if (!photonView.IsMine)
        {
            foreach (Transform child in transform)
            {
                EnemyScript enemy = child.GetComponent<EnemyScript>();
                if (enemy.ID == id)
                {
                    enemy.DisengageJump(jumpLengthX, jumpLengthY);
                    return;
                }
            }
        }
    }

    [PunRPC]
    public void EnemyDodgeWithId(int id)
    {
        if (!photonView.IsMine)
        {
            foreach (Transform child in transform)
            {
                EnemyScript enemy = child.GetComponent<EnemyScript>();
                if (enemy.ID == id)
                {
                    enemy.Dodge();
                    return;
                }
            }
        }
    }

    [PunRPC]
    public void EnemyRoarWithId(int id)
    {
        if (!photonView.IsMine)
        {
            foreach (Transform child in transform)
            {
                EnemyScript enemy = child.GetComponent<EnemyScript>();
                if (enemy.ID == id)
                {
                    enemy.Roar();
                    return;
                }
            }
        }
    }

    [PunRPC]
    public void GT_ComboHitAttack()
    {
        if (!photonView.IsMine)
        {
            greaterThreat.ComboHitAttack();
        }
    }

    [PunRPC]
    public void GT_RightClawHeavyAttack()
    {
        if (!photonView.IsMine)
        {
            greaterThreat.RightClawHeavyAttack();
        }
    }

    [PunRPC]
    public void GT_LeftClawHeavyAttack()
    {
        if (!photonView.IsMine)
        {
            greaterThreat.LeftClawHeavyAttack();
        }
    }

    [PunRPC]
    public void GT_JumpAttack()
    {
        if (!photonView.IsMine)
        {
            greaterThreat.JumpAttack();
        }
    }
}
