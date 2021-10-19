using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using UnityEngine.SceneManagement;
using Photon.Realtime;

public class ConnectToServer : MonoBehaviourPunCallbacks
{
    // Start is called before the first frame update
    void Start()
    {
        //PhotonNetwork.ConnectUsingSettings(new AppSettings() { AppIdRealtime = "4b4df78b-ad92-4255-bddd-185710a92784", FixedRegion = "eu" });
        PhotonNetwork.ConnectUsingSettings();
        Debug.Log("Connecting To photon.....");
    }

    //Was able to connect to the master Server
    public override void OnConnectedToMaster()
    {
        PhotonNetwork.JoinLobby();
        Debug.Log("Connected To the master");
    }

    public override void OnJoinedLobby()
    {
        UnityEngine.SceneManagement.SceneManager.LoadScene("Menu");
    }
}
