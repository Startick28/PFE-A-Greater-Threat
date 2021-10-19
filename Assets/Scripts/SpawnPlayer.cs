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
        spawnPosition = new Vector3(Random.Range(-2.5f, 2.5f), Random.Range(-2.5f, 2.5f) , Random.Range(-2.5f, 2.5f));
        PhotonNetwork.Instantiate(cubePlayer.name, spawnPosition, Quaternion.identity);
    }
    public override void OnPlayerEnteredRoom(Player newPlayer)
    {
        ExitGames.Client.Photon.Hashtable pp = new ExitGames.Client.Photon.Hashtable();
        pp["red"] = Random.Range(0f, 1f);
        pp["blue"] = Random.Range(0f, 1f);
        pp["green"] = Random.Range(0f, 1f);
        newPlayer.SetCustomProperties(pp);
    }
}
