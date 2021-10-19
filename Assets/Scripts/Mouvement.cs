using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
using Photon.Pun.Demo.PunBasics;
using UnityEngine.UI;
public class Mouvement : MonoBehaviourPunCallbacks
{
    float hMouvement;
    float vMouvement;
    float speed;
    [SerializeField]
    GameObject health;
    PhotonView view;
    [SerializeField]
    TextMesh playerNameMesh;
    [SerializeField]
    float HP;
    Text ping;
    [SerializeField]
    GameObject Bullet;
    void Awake()
    {
    }
    public void setName(string str)
    {
        name = str;
    }
    // Start is called before the first frame update
    void Start()
    {
        PhotonNetwork.AutomaticallySyncScene = true;

        speed = 20;
        view = GetComponent<PhotonView>();
        if (view.IsMine)
        {
            ping = GameObject.Find("PingText").GetComponent<Text>();
            HP = 100f;
            Debug.LogError(HP);
        }
        playerNameMesh.text = photonView.Owner.NickName;
        
        foreach(Player player in PhotonNetwork.PlayerList)
        {
            Debug.Log(player.NickName+ " "+ player.CustomProperties);
        }
        
        CameraWork _cameraWork = this.gameObject.GetComponent<CameraWork>();
        if (_cameraWork != null)
        {
            if (photonView.IsMine)
            {
                _cameraWork.OnStartFollowing();
            }
        }
        else
        {
            Debug.LogError("<Color=Red><a>Missing</a></Color> CameraWork Component on playerPrefab.", this);
        }
        StartCoroutine(ChangeColor(0.1f));

    }
    IEnumerator ChangeColor(float waitTime)
    {
        yield return new WaitForSeconds(waitTime);
        Color color = new Color(float.Parse(photonView.Owner.CustomProperties["red"].ToString()), float.Parse(photonView.Owner.CustomProperties["green"].ToString()), float.Parse(photonView.Owner.CustomProperties["blue"].ToString()));
        GetComponent<Renderer>().material.color = color;

    }
    IEnumerator DisplayPing(float waitTime)
    {
        yield return new WaitForSeconds(waitTime);
        if (view.IsMine)
        {
            ping.text = "Ping : " + PhotonNetwork.GetPing();
        }
    }
    IEnumerator DisplayHealth(float waitTime)
    {
        yield return new WaitForSeconds(waitTime);
        float value = Mathf.Max(float.Parse(photonView.Owner.CustomProperties["HP"].ToString()) / 100f * 4f,0);
        health.transform.localScale = new Vector3(value, health.transform.localScale.y, health.transform.localScale.z);
        health.transform.localPosition = new Vector3((value - 4)/2,2,0);
    }

    // Update is called once per frame
    void Update()
    {
        /*ExitGames.Client.Photon.Hashtable playerProperties = photonView.Owner.CustomProperties;

        if (playerProperties.Count != 0)
        {
            Color playerColor = new Color((float)playerProperties["red"], (float)playerProperties["green"], (float)playerProperties["blue"]);
            GetComponent<Renderer>().material.color = playerColor;
        }
        */

        foreach (Player player in PhotonNetwork.PlayerList)
        {
            Debug.Log(player.NickName + " " + player.CustomProperties);
        }
        StartCoroutine(DisplayPing(0.5f));
        StartCoroutine(DisplayHealth(0.5f));

        if (view.IsMine)
        {
            hMouvement = Input.GetAxis("Horizontal");
            vMouvement = Input.GetAxis("Vertical");
            transform.position += new Vector3(hMouvement, 0, vMouvement) * speed * Time.deltaTime;
            if(transform.position.y <= -10) 
            {
                transform.position = new Vector3(0, 5, 0);
                transform.rotation = Quaternion.identity;
            }
            if (Input.GetKeyDown(KeyCode.Space))
            {
                GetComponent<Rigidbody>().AddForce(Vector3.up * 400);
            }
            if (Input.GetKeyDown(KeyCode.Mouse0))
            {
                PhotonNetwork.Instantiate(Bullet.name, transform.position + Vector3.forward, Quaternion.identity);
            }
            if (Input.GetKeyDown(KeyCode.P))
            {
                HP -= 10;
                photonView.Owner.CustomProperties["HP"] = HP;
                PhotonNetwork.SetPlayerCustomProperties(photonView.Owner.CustomProperties);
            }
        }
    }
}
