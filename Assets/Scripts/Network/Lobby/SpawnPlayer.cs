using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
public class SpawnPlayer : MonoBehaviourPunCallbacks
{
    [SerializeField] GameObject cubePlayer;
    [SerializeField] GameObject enemy;
    [SerializeField] Terrain terrain;
    Vector3 spawnPosition;
    // Start is called before the first frame update
    
    void Start()
    {
        float newX = Random.Range(50f, 400f);
        float newY = Random.Range(50f, 400f);
        spawnPosition = new Vector3(newX, terrain.SampleHeight(new Vector3(newX,0f,newY)), newY);
        PhotonNetwork.Instantiate(cubePlayer.name, spawnPosition, Quaternion.identity);
        /* if (PhotonNetwork.IsMasterClient)
        {
            PhotonNetwork.Instantiate(enemy.name, new Vector3(-30, -0.6799681f, -19.24005f), Quaternion.identity);
            PhotonNetwork.Instantiate(enemy.name, new Vector3(-32, -0.6799681f, -19.24005f), Quaternion.identity);
        } */
        
    }
}
