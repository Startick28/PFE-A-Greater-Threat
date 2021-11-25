using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public enum InteractionType { chest}

public abstract class Interactable : MonoBehaviour
{
    // Start is called before the first frame update

    public bool canInteract;
    protected Collider collider;
    public InteractionType iType;
    protected List<FPSCharacterController> players = new List<FPSCharacterController>();

    public abstract void interact();

    public abstract void finishInteraction();

    private void OnTriggerEnter(Collider other)
    {
        Debug.Log("entered the trigger");
        FPSCharacterController playerController = other.gameObject.GetComponent<FPSCharacterController>();
        if (playerController != null && canInteract)
        {
            
               Debug.Log("chest is now NearestInteractabe");
               playerController.nearestInteractable = this;
               players.Add(playerController);
            
            
        }
    }

    private void OnTriggerExit(Collider other)
    {
        Debug.Log("exited the trigger");
        FPSCharacterController playerController = other.gameObject.GetComponent<FPSCharacterController>();
        if (playerController != null)
        {
            if(playerController.nearestInteractable == this)
            {
                playerController.nearestInteractable = null;
                players.Remove(playerController);
            }

        }
    }
}
