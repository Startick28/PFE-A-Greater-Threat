using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using UnityEngine.SceneManagement;
public class WinInteraction : Interactable
{
    private Collider coll;
    private bool isInTheArea = false;
    private void Start()
    {
        coll = GetComponent<Collider>();
        canInteract = false;
    }
    public override void finishInteraction()
    {
        throw new System.NotImplementedException();
    }

    public override void interact(FPSCharacterController localPlayer)
    {
        if(isInTheArea)
        {
            SceneManager.LoadScene("winScene");
        }
        else
        {
            SceneManager.LoadScene("loseScene");
        }
        /*var players = FindObjectsOfType<FPSCharacterController>();
        foreach(var player in players)
        {
            if (player.GetComponent<PhotonView>().IsMine)
            {
                if (coll.bounds.Contains(player.transform.position))
                {
                    PhotonNetwork.LoadLevel("winScene");
                }
                else
                {
                    PhotonNetwork.LoadLevel("loseScene");
                }
            }
        }*/

    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.name.StartsWith("FPS"))
        {
            if (other.GetComponent<PhotonView>() != null)
            {
                if (other.GetComponent<PhotonView>().IsMine)
                    isInTheArea = true;
            }
        }    }

    private void OnTriggerExit(Collider other)
    {
        if (other.name.StartsWith("FPS"))
        {
            if (other.GetComponent<PhotonView>() != null)
            {
                if (other.GetComponent<PhotonView>().IsMine)
                    isInTheArea = false;
            }
        }
    }
}
