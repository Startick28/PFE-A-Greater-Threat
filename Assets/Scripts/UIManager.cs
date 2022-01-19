using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Photon.Pun;
using TMPro;
using Photon.Realtime;
using UnityEngine.Video;

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

    [SerializeField]
    TextMeshProUGUI playerBullets;

    [SerializeField]
    VideoClip greenClip;
    [SerializeField]
    VideoClip redClip;
    [SerializeField]
    VideoClip flatClip;

    [SerializeField]
    VideoPlayer[] healthPlayers; 

    // Start is called before the first frame update
    void Start()
    {
        var photonViews = UnityEngine.Object.FindObjectsOfType<PhotonView>();

        for(int i = 0;i<4;i++)
        {
            healthPlayers[i].clip = flatClip;
            healthPlayers[i].Play();
        }
        


        foreach (var view in photonViews)
        {
            //Objects in the scene don't have an owner, its means view.owner will be null
            if (view.IsMine && view.gameObject.name.Contains("Player"))
            {
                player = view;
                playerHealth.value = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100.0f;
                
                playerBullets.text = view.gameObject.GetComponentInChildren<BasicGun>().getLoadedBullets().ToString() + "/" 
                    + view.gameObject.GetComponentInChildren<BasicGun>().getMaxLoadedBullets().ToString();
            }
        }
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
                    //playerHealth.value = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100.0f;

                    bloodScreen.alpha = 0.5f - (float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100) / 2.0f;
                    float health = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString());
                    if(health>66 && healthPlayers[0].clip != greenClip)
                    {
                        healthPlayers[0].clip = greenClip;
                        healthPlayers[0].Play();
                    }
                    else if(health>33 && healthPlayers[0].clip != redClip)
                    {
                        healthPlayers[0].clip = redClip;
                        healthPlayers[0].Play();
                    }
                    else if(healthPlayers[0].clip != flatClip)
                    {
                        healthPlayers[0].clip = flatClip;
                        healthPlayers[0].Play();
                    }
                    player = view;
                    GameObject playerGun = view.GetComponent<FPSCharacterController>().getCurrentWeapon();
                    if (playerGun != null)
                    {
                        playerBullets.text = playerGun.GetComponent<BasicGun>().LoadedBullets.ToString();
                    }
                    else
                    {
                        playerBullets.text = "0";
                    }
                }
            }
        }
        else
        {
            //playerHealth.value = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100.0f;
            bloodScreen.alpha = 0.5f - (float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100.0f)/2;
            playerName.text = PhotonNetwork.LocalPlayer.NickName;
            GameObject playerGun = player.GetComponent<FPSCharacterController>().getCurrentWeapon();
            if(playerGun != null)
            {
                playerBullets.text = playerGun.GetComponent<BasicGun>().getLoadedBullets().ToString() + "/"
                + playerGun.GetComponent<BasicGun>().getMaxLoadedBullets().ToString();
            }
            else
            {
                playerBullets.text = "0/0";
            }
            
        }
        int i = 0;
        foreach (var currentPlayer in PhotonNetwork.PlayerList)
        {
            if(currentPlayer != PhotonNetwork.LocalPlayer)
            {
                //playersHealth[i].value = float.Parse(currentPlayer.CustomProperties["HP"].ToString()) / 100.0f;
                playersNames[i].text = currentPlayer.NickName;
                float health = float.Parse(currentPlayer.CustomProperties["HP"].ToString());
                if (health > 66 && healthPlayers[i].clip != greenClip)
                {
                    healthPlayers[i].clip = greenClip;
                    healthPlayers[i].Play();
                }
                else if (health > 33 && healthPlayers[0].clip != redClip)
                {
                    healthPlayers[i].clip = redClip;
                    healthPlayers[i].Play();
                }
                else if (healthPlayers[i].clip != flatClip)
                {
                    healthPlayers[i].clip = flatClip;
                    healthPlayers[i].Play();
                }
                i++;
            }
        }

        /*while (i <= 2)
        {
            playersHealth[i].gameObject.SetActive(false);
            playersNames[i].gameObject.SetActive(false);
            i++;
        }*/
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
