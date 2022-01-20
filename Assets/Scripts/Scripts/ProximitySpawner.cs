using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class ProximitySpawner : MonoBehaviour
{
    
    void OnTriggerEnter(Collider col)
    {
        if (col.CompareTag("Player"))
        {
            if (EnemiesManager.Instance)
            {
                EnemiesManager.Instance.photonView.RPC("InstantiateEnemy", RpcTarget.All, transform.position);
                Destroy(this.gameObject);
            }
        }
    }
}
