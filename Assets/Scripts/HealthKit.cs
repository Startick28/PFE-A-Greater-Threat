using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HealthKit : Interactable
{
    bool wasPickedUp = false;
    public override void finishInteraction()
    {
        if(wasPickedUp)
        {
            Destroy(this.gameObject);
        }
        
    }

    public override void interact(FPSCharacterController player)
    {
        if(player != null)
        {
            if(!player.canHeal)
            {
                player.canHeal = true;
                wasPickedUp = true;
            }
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        //Debug.Log("Gun Trigger");
        FPSCharacterController playerController = other.gameObject.GetComponent<FPSCharacterController>();
        //Debug.Log("Name GameObject : " + other.gameObject.name);
        //Debug.Log("Can Interact : " + canInteract + " player : " + playerController);
        if (playerController != null && canInteract)
        {
            //Debug.Log("gun is now NearestInteractabe");
            playerController.nearestInteractable = this;
            players.Add(playerController);
        }
        else
        {
            return;
        }
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
