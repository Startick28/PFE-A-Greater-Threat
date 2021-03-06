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
    [SerializeField]
    TextMeshProUGUI timeLeft;
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
    TextMeshProUGUI playerHeals;

    [SerializeField]
    VideoClip greenClip;
    [SerializeField]
    VideoClip redClip;
    [SerializeField]
    VideoClip flatClip;

    [SerializeField]
    VideoPlayer[] healthPlayers;

    [SerializeField]
    Image firstGun;
    [SerializeField]
    Image secondGun;


    [SerializeField]
    Sprite pistoletRare;
    [SerializeField]
    Sprite pistoletEpic;
    [SerializeField]
    Sprite pistoletLegendaire;


    [SerializeField]
    Sprite ARRare;
    [SerializeField]
    Sprite AREpic;
    [SerializeField]
    Sprite ARLegendaire;

    // Start is called before the first frame update
    void Start()
    {
        timeLeft.text = "";
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
                GameObject playerGun = player.GetComponent<FPSCharacterController>().getCurrentWeapon();
                if(playerGun != null)
                {
                    playerBullets.text = playerGun.GetComponent<BasicGun>().getLoadedBullets().ToString() + "/"
                    + player.GetComponent<FPSCharacterController>().getAmmuniation()[playerGun.GetComponent<BasicGun>().type - 1];

                }
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
                    playerHeals.text = (player.canHeal ) ? "1":"0";
                    GameObject playerGun = player.getCurrentWeapon();
                    if (playerGun != null)
                    {
                        playerBullets.text = playerGun.GetComponent<BasicGun>().LoadedBullets.ToString();
                        if(playerGun.GetComponent<BasicGun>().type == 1)
                        {
                            if(playerGun.GetComponent<BasicGun>().Rarity == RarityType.blanche)
                            {
                                firstGun.sprite = pistoletRare;
                            }
                            if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.bleu)
                            {
                                firstGun.sprite = pistoletEpic;
                            }
                            if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.dore)
                            {
                                firstGun.sprite = pistoletLegendaire;
                            }
                        }else if(playerGun.GetComponent<BasicGun>().type == 2)
                        {
                            if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.blanche)
                            {
                                firstGun.sprite = ARRare;
                            }
                            if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.bleu)
                            {
                                firstGun.sprite = AREpic;
                            }
                            if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.dore)
                            {
                                firstGun.sprite = ARLegendaire;
                            }
                        }
                    }
                    else
                    {
                        firstGun.sprite = null;
                        firstGun.enabled = false;
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
            playerHeals.text = (player.GetComponent<FPSCharacterController>().canHeal) ? "1" : "0";
            GameObject playerGun = player.GetComponent<FPSCharacterController>().getCurrentWeapon();
            BasicGun playerSecondGun = player.GetComponent<FPSCharacterController>().getSecondGun();
            if (playerGun != null)
            {
                firstGun.enabled = true;
                playerBullets.text = playerGun.GetComponent<BasicGun>().LoadedBullets.ToString();
                if (playerGun.GetComponent<BasicGun>().type == 1)
                {
                    if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.blanche)
                    {
                        firstGun.sprite = pistoletRare;
                    }
                    if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.bleu)
                    {
                        firstGun.sprite = pistoletEpic;
                    }
                    if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.dore)
                    {
                        firstGun.sprite = pistoletLegendaire;
                    }
                }
                else if (playerGun.GetComponent<BasicGun>().type == 2)
                {
                    if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.blanche)
                    {
                        firstGun.sprite = ARRare;
                    }
                    if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.bleu)
                    {
                        firstGun.sprite = AREpic;
                    }
                    if (playerGun.GetComponent<BasicGun>().Rarity == RarityType.dore)
                    {
                        firstGun.sprite = ARLegendaire;
                    }
                }
                else
                {
                    firstGun.sprite = null;
                    firstGun.enabled = false;
                }
                playerBullets.text = playerGun.GetComponent<BasicGun>().getLoadedBullets().ToString() + "/"
                + player.GetComponent<FPSCharacterController>().getAmmuniation()[playerGun.GetComponent<BasicGun>().type - 1];
            }
            else
            {
                firstGun.sprite = null;
                firstGun.enabled = false;
                playerBullets.text = "0/0";
            }
            if(playerSecondGun != null)
            {
                secondGun.enabled = true;
                if (playerSecondGun.type == 1)
                {
                    if (playerSecondGun.Rarity == RarityType.blanche)
                    {
                        secondGun.sprite = pistoletRare;
                    }
                    if (playerSecondGun.Rarity == RarityType.bleu)
                    {
                        secondGun.sprite = pistoletEpic;
                    }
                    if (playerSecondGun.Rarity == RarityType.dore)
                    {
                        secondGun.sprite = pistoletLegendaire;
                    }
                }
                else if (playerSecondGun.type == 2)
                {
                    if (playerSecondGun.Rarity == RarityType.blanche)
                    {
                        secondGun.sprite = ARRare;
                    }
                    if (playerSecondGun.Rarity == RarityType.bleu)
                    {
                        secondGun.sprite = AREpic;
                    }
                    if (playerSecondGun.Rarity == RarityType.dore)
                    {
                        secondGun.sprite = ARLegendaire;
                    }
                }
                else {
                    secondGun.sprite = null;
                    secondGun.enabled = false;
                }   
            }
            else
            {
                secondGun.sprite = null;
                secondGun.enabled = false;
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
        }
    }
}
