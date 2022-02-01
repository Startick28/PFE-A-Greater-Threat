using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using UnityEngine.UI;
using Photon.Realtime;
using System.Linq;
using TMPro;
public class LauncherLobby : MonoBehaviourPunCallbacks
{
    public static LauncherLobby Instance;
    [SerializeField] InputField roomNameInputField;
    [SerializeField] Text errorText;
    [SerializeField] Text roomNameText;

    [SerializeField] Transform roomListContent;
    [SerializeField] GameObject roomListItemPrefab;

    [SerializeField] Transform playerListContent;
    [SerializeField] GameObject playerListItemPrefab;

    [SerializeField] GameObject startGameButton;
    [SerializeField] Slider progressBar;
    [SerializeField]
    TextMeshProUGUI Ratio;
    [SerializeField]
    TMP_InputField NickName;
    private void Awake()
    {
        Instance = this;
    }
    void Start()
    {
        progressBar.gameObject.SetActive(false);
        PhotonNetwork.ConnectUsingSettings();
        MenuManager.Instance.OpenMenu("loadingMenu");
    }

    public override void OnConnectedToMaster()
    {
        PhotonNetwork.JoinLobby();
        PhotonNetwork.AutomaticallySyncScene = true;
    }

    public override void OnJoinedLobby()
    {
        ExitGames.Client.Photon.Hashtable PlayerProperties = new ExitGames.Client.Photon.Hashtable();
        PlayerProperties["HP"] = 100;
        PhotonNetwork.SetPlayerCustomProperties(PlayerProperties);
        MenuManager.Instance.OpenMenu("mainMenu");
        PhotonNetwork.NickName = "Player" + Random.Range(0, 1000).ToString("0000");
        Debug.Log(PhotonNetwork.NickName + " is Connected");
    }

    public void CreateRoom()
    {
        if(string.IsNullOrEmpty(roomNameInputField.text))
        {
            return;
        }
        PhotonNetwork.CreateRoom(roomNameInputField.text);
        MenuManager.Instance.OpenMenu("loadingMenu");
        progressBar.gameObject.SetActive(true);
        Ratio.gameObject.SetActive(true);
        if (NickName.text != "")
        {
            Debug.Log("Updated Nickname from " + PhotonNetwork.NickName + " to " + NickName.text);
            PhotonNetwork.NickName = NickName.text;
        }
    }

    public override void OnJoinedRoom()
    {
        MenuManager.Instance.OpenMenu("roomMenu");
        roomNameText.text = PhotonNetwork.CurrentRoom.Name;

        Player[] players = PhotonNetwork.PlayerList;

        foreach(Transform child in playerListContent)
        {
            Destroy(child.gameObject);
        }

        for (int i = 0; i < players.Count(); i++)
        {
            
            Instantiate(playerListItemPrefab, playerListContent).GetComponent<PlayerListItem>().SetUp(players[i]);
        }

        int j = 0;
        foreach (Player player in PhotonNetwork.PlayerList)
        {
            if(player.IsLocal)
            {
                Debug.Log("ADd index " + j);
                if (!player.CustomProperties.ContainsKey("SpawnIndex"))
                {
                    player.CustomProperties.Add("SpawnIndex", j);
                }
                else
                {
                    player.CustomProperties["SpawnIndex"] = j;
                }
            }
            j++;
        }

        startGameButton.SetActive(PhotonNetwork.IsMasterClient);
    }

    public override void OnMasterClientSwitched(Player newMasterClient)
    {
        startGameButton.SetActive(PhotonNetwork.IsMasterClient);
    }

    public override void OnCreateRoomFailed(short returnCode, string message)
    {
        errorText.text = "Room Creation Failed : " + message;
        MenuManager.Instance.OpenMenu("errorMenu");
    }

    public void LeaveRoom()
    {
        PhotonNetwork.LeaveRoom();
        MenuManager.Instance.OpenMenu("loadingMenu");
        string[] removedProperties = new string[1];
        removedProperties[0] = "SpawnIndex";
        PhotonNetwork.RemovePlayerCustomProperties(removedProperties);
    }

    public void JoinRoom(RoomInfo info)
    {
        PhotonNetwork.JoinRoom(info.Name);
        MenuManager.Instance.OpenMenu("loadingMenu");
        progressBar.gameObject.SetActive(true);
        Ratio.gameObject.SetActive(true);
        if (NickName.text != "")
        {
            Debug.Log("Updated Nickname from " + PhotonNetwork.NickName + " to " + NickName.text);
            PhotonNetwork.NickName = NickName.text;
        }
    }

    public void StartGame()
    {
        // Permet de charger la scene que l'on veut, le 1 repr�sente l'index de la scene indiqu� dans le build settings d'unity
        StaticClass.CrossSceneMaster = true;
        startGameButton.GetComponent<Button>().interactable = false;
        PhotonNetwork.LoadLevel("Soutenance");
    }

    public override void OnLeftRoom()
    {
        MenuManager.Instance.OpenMenu("mainMenu");
    }

    public override void OnRoomListUpdate(List<RoomInfo> roomList)
    {
        foreach(Transform trans in roomListContent)
        {
            Destroy(trans.gameObject);
        }

        for(int i = 0; i < roomList.Count; i++)
        {
            if (roomList[i].RemovedFromList)
                continue;
            Instantiate(roomListItemPrefab, roomListContent).GetComponent<RoomListItem>().SetUp(roomList[i]);
        }
    }

    public override void OnPlayerEnteredRoom(Player newPlayer)
    {
        Instantiate(playerListItemPrefab, playerListContent).GetComponent<PlayerListItem>().SetUp(newPlayer);
    }
    private void Update()
    {
        Ratio.text = System.Math.Round(PhotonNetwork.LevelLoadingProgress * 100.00f).ToString() + "%";
        progressBar.value =  PhotonNetwork.LevelLoadingProgress;
    }
}
