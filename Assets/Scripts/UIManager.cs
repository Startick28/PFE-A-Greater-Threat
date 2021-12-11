using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Photon.Pun;
using TMPro;
using Photon.Realtime;

public class UIManager : MonoBehaviourPunCallbacks
{
    [SerializeField]
    TextMeshProUGUI playerName;
    PhotonView player;
    [SerializeField]
    Slider playerHealth;

    [SerializeField]
    TextMeshProUGUI[] playersNames;
    [SerializeField]
    Slider[] playersHealth;
    [SerializeField]
    CanvasGroup bloodScreen;

    float HP;
    // Start is called before the first frame update
    void Start()
    {
        HP = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString());
        var photonViews = UnityEngine.Object.FindObjectsOfType<PhotonView>();
        foreach (var view in photonViews)
        {
            //Objects in the scene don't have an owner, its means view.owner will be null
            if (view.IsMine && view.gameObject.name.Contains("Player"))
            {
                player = view;
                playerHealth.value = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100.0f;
            }
        }
    }

    public void LoseHealth()
    {
        HP -= 10.0f;
        PhotonNetwork.LocalPlayer.CustomProperties["HP"] = HP;
        PhotonNetwork.SetPlayerCustomProperties(PhotonNetwork.LocalPlayer.CustomProperties);
    }

    // Update is called once per frame
    void Update()
    {
        if(player == null)
        {

            var photonViews = UnityEngine.Object.FindObjectsOfType<PhotonView>();
            foreach (var view in photonViews)
            {
                //Objects in the scene don't have an owner, its means view.owner will be null
                if (view.IsMine && view.gameObject.name.Contains("Player"))
                {
                    bloodScreen.alpha = 0.5f - (HP / 100)/2.0f;
                    playerHealth.value = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100.0f;
                    player = view;
                }
            }
        }
        else
        {
            playerHealth.value = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100.0f;
            bloodScreen.alpha = 0.5f - (float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100.0f)/2;
            playerName.text = PhotonNetwork.LocalPlayer.NickName;
        }
        int i = 0;
        foreach (var currentPlayer in PhotonNetwork.PlayerList)
        {
            if(currentPlayer != PhotonNetwork.LocalPlayer)
            {
                playersHealth[i].value = float.Parse(currentPlayer.CustomProperties["HP"].ToString()) / 100.0f;
                playersNames[i].text = currentPlayer.NickName;
                i++;
            }
        }
        while (i <= 2)
        {
            playersHealth[i].gameObject.SetActive(false);
            playersNames[i].gameObject.SetActive(false);
            i++;
        }
    }

    public override void OnPlayerPropertiesUpdate(Player targetPlayer, ExitGames.Client.Photon.Hashtable changedProps)
    {
        foreach (var element in changedProps)
        {
            if (!targetPlayer.CustomProperties.ContainsKey(element.Key))
            {
                targetPlayer.CustomProperties.Add(element.Key, element.Value);
            }
            else
            {
                targetPlayer.CustomProperties[element.Key] = element.Value;
            }
            Debug.Log(element.Key + " " + element.Value + " " + targetPlayer.NickName);
        }
    }
}
