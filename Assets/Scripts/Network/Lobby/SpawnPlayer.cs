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
        /*float newX = Random.Range(108f, 116.0f);
        float newY = Random.Range(190.0f, 221f);
        spawnPosition = new Vector3(newX, terrain.SampleHeight(new Vector3(newX,0f,newY)), newY);*/
        spawnPosition = new Vector3(-189.8284f, 20, 174.907f);
        PhotonNetwork.Instantiate(cubePlayer.name, spawnPosition, Quaternion.identity);
        /* if (PhotonNetwork.IsMasterClient)
        {
            PhotonNetwork.Instantiate(enemy.name, new Vector3(-30, -0.6799681f, -19.24005f), Quaternion.identity);
            PhotonNetwork.Instantiate(enemy.name, new Vector3(-32, -0.6799681f, -19.24005f), Quaternion.identity);
        } */
        if (StaticClass.CrossSceneMaster)
        {
            PhotonNetwork.SetMasterClient(PhotonNetwork.LocalPlayer);
            PhotonNetwork.Instantiate("Enemies", new Vector3(0, 0, 0), Quaternion.identity);
        }
    }
}
