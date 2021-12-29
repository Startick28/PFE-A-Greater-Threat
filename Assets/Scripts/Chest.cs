using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Chest : Interactable
{
    [SerializeField] RarityType rarity;
    [SerializeField] BasicGun prefabGun;
    [SerializeField] bool isOpened;
    [SerializeField] Rigidbody topChestRigidBody;

    [PunRPC]
    public override void interact(FPSCharacterController player)
    {
        Debug.Log("interacted with chest");
        if (!isOpened)
            OpenAnimation();

        if(players.Count == 0)
        {
            return;
            Debug.Log("Error this function should not be able to be called if no players or entity are around");
        }
        //Pour l'instant on augmente les stats du premier joueur à s'être approché du coffre
        BasicGun playerGun = player.GetComponentInChildren<BasicGun>();
        if(playerGun == null)
        {
            Debug.Log("Error demanded basic or gun MeshRenderer gun was not found for chest interaction");
        }
        //Remove chest's collider
        gameObject.GetComponent<BoxCollider>().enabled = false;

        BasicGun gun = Instantiate(prefabGun, transform.position + Vector3.up,Quaternion.identity);
        gun.Rarity = rarity;
        gun.canInteract = true;
        gun.GetComponent<BoxCollider>().enabled = true;
        // Default layer
        gun.gameObject.layer = 0;
        gun.GetComponentInChildren<MeshRenderer>().material.color = Color.yellow;

        player.GetComponent<FPSCharacterController>().nearestInteractable = gun;
        finishInteraction();
        //throw new System.NotImplementedException();
    }

    public override void finishInteraction()
    {
        canInteract = false;
        isOpened = true;
    }

    public void OpenAnimation()
    {
        topChestRigidBody.angularVelocity = new Vector3(1f, 0, 0);
        StartCoroutine(stopOpening());
    }

    IEnumerator stopOpening()
    { 
        yield return new WaitForSeconds(4f);
        Debug.Log("fin anim");
        topChestRigidBody.angularVelocity = new Vector3(0, 0, 0);
    }
    // Start is called before the first frame update
    void Start()
    {
        iType = InteractionType.chest;
        collider = GetComponent<BoxCollider>();
        canInteract = true;
        isOpened = false;
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
