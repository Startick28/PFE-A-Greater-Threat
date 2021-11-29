using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Chest : Interactable
{

    [PunRPC]
    public override void interact()
    {
        Debug.Log("interacted with chest");
        if(players.Count == 0)
        {
            Debug.Log("Error this function should not be able to be called if no players or entity are around");
        }
        //Pour l'instant on augmente les stats du premier joueur à s'être approché du coffre
        BasicGun playerGun = players[0].GetComponentInChildren<BasicGun>();
        MeshRenderer gunRenderer = playerGun.GetComponentInChildren<MeshRenderer>();
        if(playerGun == null ||  gunRenderer == null)
        {
            Debug.Log("Error demanded basic or gun MeshRenderer gun was not found for chest interaction");
        }

        playerGun.setFireRate(4);
        gunRenderer.material.color = Color.yellow;
        finishInteraction();
        //throw new System.NotImplementedException();
    }

    public override void finishInteraction()
    {
        canInteract = false;
        GetComponent<MeshRenderer>().material.color = Color.red * Color.grey;
    }

    // Start is called before the first frame update
    void Start()
    {
        iType = InteractionType.chest;
        collider = GetComponent<BoxCollider>();
        canInteract = true;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
