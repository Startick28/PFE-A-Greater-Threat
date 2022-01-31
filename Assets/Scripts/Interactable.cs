using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public enum InteractionType { chest, gun, button, ammunition, player, handle, win, redButton,healthKit }

public enum RarityType { blanche, bleu, dore }

public abstract class Interactable : MonoBehaviour
{
    // Start is called before the first frame update

    public bool canInteract;
    protected Collider collider;
    public InteractionType iType;
    protected List<FPSCharacterController> players = new List<FPSCharacterController>();
    public abstract void interact(FPSCharacterController player);

    public abstract void finishInteraction();

    private void OnTriggerStay(Collider other)
    {
        FPSCharacterController playerController = other.gameObject.GetComponent<FPSCharacterController>();
        if (playerController != null && canInteract)
        {
            ActivateOutline();
            //Debug.Log("chest is now NearestInteractabe");
            playerController.nearestInteractable = this;
               players.Add(playerController);
        }
        else
        {
            DisableOutline();
        }
    }

    protected void DisableOutline()
    {
        if (GetComponent<Outline>())
            GetComponent<Outline>().enabled = false;
        else if (GetComponentInChildren<Outline>())
            GetComponentInChildren<Outline>().enabled = false;
    }

    protected void ActivateOutline()
    {
        if (GetComponent<Outline>())
            GetComponent<Outline>().enabled = true;
        else if (GetComponentInChildren<Outline>())
            GetComponentInChildren<Outline>().enabled = true;
    }
    private void OnTriggerExit(Collider other)
    {
        //Debug.Log("exited the trigger");
        FPSCharacterController playerController = other.gameObject.GetComponent<FPSCharacterController>();
        if (playerController != null)
        {
            DisableOutline();
            if (playerController.nearestInteractable == this)
            {
                playerController.nearestInteractable = null;
                players.Remove(playerController);
            }

        }
    }
}
