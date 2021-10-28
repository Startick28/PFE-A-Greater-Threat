using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
public class SpawnPlayer : MonoBehaviourPunCallbacks
{
    [SerializeField]
    GameObject cubePlayer;
    Vector3 spawnPosition;
    // Start is called before the first frame update
    void Start()
    {
        spawnPosition = new Vector3(Random.Range(-1, 1f), Random.Range(1, 2.5f) , Random.Range(-1, 2.5f));
        PhotonNetwork.Instantiate(cubePlayer.name, spawnPosition, Quaternion.identity);
    }
}
