using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class handleInteraction : Interactable
{
    // Start is called before the first frame update
    public int id;

    [SerializeField] private Animator anim;

    void Start()
    {
        canInteract = true;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
    }

    public void interactWithHandleManger()
    {
        anim.SetBool("Interact", true);
        canInteract = false;
        Debug.Log("HELLOOO FROM THE OTHER SIDE ");
    }
    public override void interact(FPSCharacterController player)
    {
        anim.SetBool("Interact", true);
        canInteract = false;
        Debug.Log("HELLOOO FROM THE OTHER SIDE ");
    }

    public override void finishInteraction()
    {
        throw new System.NotImplementedException();
    }
}
