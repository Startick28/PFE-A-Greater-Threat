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
    Vector3[] spawnPosition;
    // Start is called before the first frame update
    
    void Start()
    {
        spawnPosition = new Vector3[4];
        //spawnPosition = new Vector3(newX, newY, 418);
        spawnPosition[0] = new Vector3(-456, -5.13f, -368.72f);
        spawnPosition[1] = new Vector3(-229.5f, -25.47f, 583.5f);
        spawnPosition[2] = new Vector3(608, 2.19f, 249.16f);
        spawnPosition[3] = new Vector3(210, -11.08f, -458.05f);
        if (PhotonNetwork.LocalPlayer.CustomProperties.ContainsKey("SpawnIndex"))
        {
            int spawnIndex = int.Parse(PhotonNetwork.LocalPlayer.CustomProperties["SpawnIndex"].ToString());
            Debug.Log("Spawning at position " + spawnIndex);
            GameObject player = PhotonNetwork.Instantiate(cubePlayer.name, spawnPosition[spawnIndex], Quaternion.identity);
            ForestMusic.Instance.AudioSource = player.GetComponentInChildren<AudioSource>();
        }
        else
        {
            Debug.Log("Spawning at a random position");
            PhotonNetwork.Instantiate(cubePlayer.name, spawnPosition[(int)Random.Range(0,3)], Quaternion.identity);
        }
        /* if (PhotonNetwork.IsMasterClient)
        {
            PhotonNetwork.Instantiate(enemy.name, new Vector3(-30, -0.6799681f, -19.24005f), Quaternion.identity);
            PhotonNetwork.Instantiate(enemy.name, new Vector3(-32, -0.6799681f, -19.24005f), Quaternion.identity);
        } */
        if (StaticClass.CrossSceneMaster)
        {
            PhotonNetwork.SetMasterClient(PhotonNetwork.LocalPlayer);
            //PhotonNetwork.Instantiate("Enemies", new Vector3(0, 0, 0), Quaternion.identity);
        }
    }
}
