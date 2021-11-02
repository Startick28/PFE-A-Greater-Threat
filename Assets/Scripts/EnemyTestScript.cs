using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
using Photon.Chat;
public class EnemyTestScript : MonoBehaviour
{
    float maxHealth = 100;
    float currentHealth = 100;
    Renderer renderer;
    public PhotonView view;
    // Start is called before the first frame update
    void Start()
    {
        view = GetComponent<PhotonView>();
        renderer = GetComponent<Renderer>();
        renderer.material.color = Color.red;
    }

    // Update is called once per frame
    void Update()
    {
        renderer.material.color = new Color(currentHealth / maxHealth, 0, 0);

        if(currentHealth>0)
        {
            //currentHealth -= 10 * Time.deltaTime;
            //takeDamage(10 * Time.deltaTime);
        }
        if (Input.GetKeyDown(KeyCode.P))
        {
            view.RPC("takeDamage", RpcTarget.All,10.0f);
        }
    }
    public void OnPhotonSerializeView(PhotonStream stream, PhotonMessageInfo info)
    {
        if (stream.IsWriting)
        {
            stream.SendNext(currentHealth);
        }
        if (stream.IsReading)
        {
            currentHealth = (int)stream.ReceiveNext();
        }

    }

    [PunRPC]
    public void takeDamage(float damage)
    {
        if(currentHealth>0)
        {
            currentHealth -= damage;
        }
        
    }
}
