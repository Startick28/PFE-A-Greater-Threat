using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
public class SpawnPlayer : MonoBehaviourPunCallbacks
{
    [SerializeField] GameObject cubePlayer;
    [SerializeField] GameObject enemy;
    Vector3 spawnPosition;
    // Start is called before the first frame update
    void Start()
    {
        spawnPosition = new Vector3(Random.Range(-1, 1f), Random.Range(1, 2.5f) , Random.Range(-1, 2.5f));
        PhotonNetwork.Instantiate(cubePlayer.name, spawnPosition, Quaternion.identity);
        if (PhotonNetwork.IsMasterClient)
        {
            PhotonNetwork.Instantiate(enemy.name, new Vector3(-30, -0.6799681f, -19.24005f), Quaternion.identity);
            PhotonNetwork.Instantiate(enemy.name, new Vector3(-32, -0.6799681f, -19.24005f), Quaternion.identity);
        }
        
    }
}
