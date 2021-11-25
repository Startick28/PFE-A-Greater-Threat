using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemiesManager : MonoBehaviourPunCallbacks
{
    public static EnemiesManager Instance;

    private void Awake()
    {
        Instance = this;
    }

    private int lastId = 0;
    [SerializeField] private GameObject enemy;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    // Instantiate an enemy with RPC.
    // How to call it : 
    // EnemiesManager.Instance.photonView.RPC("InstantiateEnemy", RpcTarget.All, position);
    [PunRPC]
    void InstantiateEnemy(Vector3 position)
    {
        GameObject enemyInstantiate = Instantiate(enemy, position, Quaternion.identity);
        enemyInstantiate.transform.parent = gameObject.transform;
        enemyInstantiate.GetComponent<EnemyScript>().ID = lastId;
        lastId++;
    }


    // Parcours tous les enfants de l'EnemiesManager en fonction d'un ID.
    // Appel par la suite la fonction TakeDamage de l'enfant en question
    // Pour appeler la fonction :
    // this.photonView.RPC("EnemyTakeDamageWithId", RpcTarget.All, id, damages);
    [PunRPC]
    void EnemyTakeDamageWithId(int id, float damages)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.TakeDamage(damages);
            }
        }
    }

    [PunRPC]
    void EnemyDieWithId(int id)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.Die();
            }
        }
    }

    [PunRPC]
    void EnemyGetHit(int id)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.GetHit();
            }
        }
    }

    [PunRPC]
    void EnemyMoveToPositionWithId(int id, Vector3 position, float stoppingDistance, float runingSpeed, float walkingSpeed, bool updateRotation, float acceleration, bool isRuning)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.MoveToPosition(position, stoppingDistance, runingSpeed, walkingSpeed, updateRotation, acceleration, isRuning);
            }
        }
    }

    [PunRPC]
    void EnemyBiteAttackWithId(int id)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.BiteAttack();
            }
        }
    }

    [PunRPC]
    void EnemyClawsAttackWithId(int id)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.ClawsAttack();
            }
        }
    }

    [PunRPC]
    void EnemyJumpBiteAttackWithId(int id)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.JumpBiteAttack();
            }
        }
    }

    [PunRPC]
    void EnemySpitAttackWithId(int id)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.SpitAttack();
            }
        }
    }

    [PunRPC]
    void EnemyDisengageJumpWithId(int id)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.DisengageJump();
            }
        }
    }

    [PunRPC]
    void EnemyDodgeWithId(int id)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.Dodge();
            }
        }
    }

    [PunRPC]
    void EnemyRoarWithId(int id)
    {
        foreach (Transform child in transform)
        {
            EnemyScript enemy = child.GetComponent<EnemyScript>();
            if (enemy.ID == id)
            {
                enemy.Roar();
            }
        }
    }


}
