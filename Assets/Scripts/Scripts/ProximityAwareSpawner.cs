using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class ProximityAwareSpawner : MonoBehaviour
{    
    void OnTriggerEnter(Collider col)
    {
        if (col.CompareTag("Player"))
        {
            if (EnemiesManager.Instance && PhotonNetwork.LocalPlayer.IsMasterClient)
            {
                EnemiesManager.Instance.photonView.RPC("InstantiateAwareEnemy", RpcTarget.All, transform.position);
                Destroy(this.gameObject);
            }
        }
    }
}
