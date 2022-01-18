using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Reanimate : Interactable
{
    public void died()
    {
        canInteract = true;
    }
    private void Start()
    {
        canInteract = false;
    }
    public override void finishInteraction()
    {

    }

    public override void interact(FPSCharacterController player)
    {
        gameObject.transform.parent.GetComponent<FPSCharacterController>().Reanimate();
    }
}
