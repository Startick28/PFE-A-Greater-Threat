using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using UnityEngine.SceneManagement;
public class WinInteraction : Interactable
{
    private Collider coll;
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
        var players = FindObjectsOfType<FPSCharacterController>();
        foreach(var player in players)
        {
            if (player.GetComponent<PhotonView>().IsMine)
            {
                if (coll.bounds.Contains(player.transform.position))
                {
                    SceneManager.LoadScene("winScene");
                }
                else
                {
                    SceneManager.LoadScene("loseScene");
                }
            }
        }

    }
}
