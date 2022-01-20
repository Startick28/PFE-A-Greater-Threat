using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Reanimate : Interactable
{
    public void died()
    {
        canInteract = true;
        GetComponent<SphereCollider>().enabled = true;
    }
    private void Start()
    {
        canInteract = false;
        GetComponent<SphereCollider>().enabled = false;
    }
    public override void finishInteraction()
    {

    }

    public override void interact(FPSCharacterController player)
    {
        GetComponent<SphereCollider>().enabled = false;
        gameObject.transform.parent.GetComponent<FPSCharacterController>().Reanimate();
    }
}
