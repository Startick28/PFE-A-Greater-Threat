using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestController : MonoBehaviour
{
    private int id = 0;
    private SoundEmitter soundEmitter;

    void Start()
    {
        soundEmitter = gameObject.GetComponent<SoundEmitter>();
    }

    void Update()
    {
        if (Input.GetKeyDown("space"))
        {
            soundEmitter.Emit();
            Debug.Log("EMIT");
            //EnemiesManager.Instance.photonView.RPC("InstantiateEnemy", RpcTarget.All, new Vector3(Random.Range(-20, 0), 1, 30));
        }
        if (Input.GetKeyDown(KeyCode.K))
        {
            //EnemiesManager.Instance.photonView.RPC("EnemyDieWithId", RpcTarget.All, id);
        }
        if (Input.GetKeyDown(KeyCode.L))
        {
            EnemiesManager.Instance.photonView.RPC("EnemyMoveToPositionWithId", RpcTarget.All, id, new Vector3(Random.Range(-20, 0), 1, 30),0.5f,10f,5f,true,40.0f, true );
        }
        if (Input.GetKeyDown(KeyCode.LeftArrow))
        {
            id--;
        }
        if (Input.GetKeyDown(KeyCode.RightArrow))
        {
            id++;
        }
    }

    public void GetHit(float damages)
    {
        //Debug.Log("Player took " + damages + " damages !! LETSGO");
    }
}
