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
    VideoPlayer healthCurrentPlayer;

    [SerializeField]
    TextMeshProUGUI[] playersNames;
    [SerializeField]
    GameObject[] playersHealth;
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
        healthCurrentPlayer.clip = flatClip;
        healthCurrentPlayer.Play();
        for (int i = 0;i<3;i++)
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
                //playerHealth.value = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100.0f;
                
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

            var players = FindObjectsOfType<FPSCharacterController>();
            foreach (var player in players)
            {
                //Objects in the scene don't have an owner, its means view.owner will be null
                if (player.gameObject.GetComponent<PhotonView>().IsMine)
                {
                    //playerHealth.value = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100.0f;
                    this.player = player.gameObject.GetComponent<PhotonView>();
                    bloodScreen.alpha = 0.5f - (float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100) / 2.0f;
                    float health = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString());

                    if (health > 66)
                    {
                        if (healthCurrentPlayer.clip != greenClip)
                        {
                            healthCurrentPlayer.clip = greenClip;
                            healthCurrentPlayer.Play();
                        }
                    }
                    else if (health <= 66 && health > 0 && healthCurrentPlayer.clip != redClip)
                    {
                        healthCurrentPlayer.clip = redClip;
                        healthCurrentPlayer.Play();
                    }
                    else if (health <= 0 && healthCurrentPlayer.clip != flatClip)
                    {
                        healthCurrentPlayer.clip = flatClip;
                        healthCurrentPlayer.Play();
                    }

                    GameObject playerGun = player.getCurrentWeapon();
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

            bloodScreen.alpha = Mathf.Max(0.34f - (float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString()) / 100) / 3.0f,0);
            float health = float.Parse(PhotonNetwork.LocalPlayer.CustomProperties["HP"].ToString());

            healthCurrentPlayer.playbackSpeed = 2 - (health / 100);

            if (health > 66 )
            {
                if(healthCurrentPlayer.clip != greenClip)
                {
                    healthCurrentPlayer.clip = greenClip;
                    healthCurrentPlayer.Play();
                }
            }
            else if (health <= 66 && health > 0 && healthCurrentPlayer.clip != redClip)
            {
                healthCurrentPlayer.clip = redClip;
                healthCurrentPlayer.Play();
            }
            else if (health <=0 && healthCurrentPlayer.clip != flatClip)
            {
                healthCurrentPlayer.clip = flatClip;
                healthCurrentPlayer.Play();
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

                if (health > 66)
                {
                    if (healthPlayers[i].clip != greenClip)
                    {
                        healthPlayers[i].clip = greenClip;
                        healthPlayers[i].Play();
                    }
                }
                else if (health <= 66 && health > 0 && healthPlayers[i].clip != redClip)
                {
                    healthPlayers[i].clip = redClip;
                    healthPlayers[i].Play();
                }
                else if (health <= 0 && healthPlayers[i].clip != flatClip)
                {
                    healthPlayers[i].clip = flatClip;
                    healthPlayers[i].Play();
                }
                i++;
            }
        }
        
        while (i <= 2)
        {
           // playersHealth[i].gameObject.SetActive(false);
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
