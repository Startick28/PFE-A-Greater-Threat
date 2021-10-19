using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
using UnityEngine.UI;

public class CreateAndJoinRooms : MonoBehaviourPunCallbacks
{
    public InputField createInput;
    public InputField joinField;
    public InputField nameField;
    public string nameChosen;
    public void CreateRoom()
    {
        PhotonNetwork.CreateRoom(createInput.text); 
    }

    public void JoinRoom()
    {
        PhotonNetwork.JoinRoom(joinField.text);
    }

    public override void OnJoinedRoom()
    {
        ExitGames.Client.Photon.Hashtable pp = new ExitGames.Client.Photon.Hashtable();
        pp["red"] = Random.Range(0f, 1f);
        pp["blue"] = Random.Range(0f, 1f);
        pp["green"] = Random.Range(0f, 1f);
        pp["HP"] = 100;
        PhotonNetwork.SetPlayerCustomProperties(pp);
        PlacePlayerName();
        PhotonNetwork.LoadLevel("Game");
    }
    private void Start()
    {
        if (!PlayerPrefs.HasKey("PlayerName"))
        {
            return;
        }
        else
        {
            string PlayerName = PlayerPrefs.GetString("PlayerName");
            nameField.text = PlayerName;
        }
    }
    public void PlacePlayerName()
    {
        string PlayerNickName = nameField.text;
        PhotonNetwork.NickName = PlayerNickName;
        PlayerPrefs.SetString("PlayerName", PlayerNickName);
    }
}
