using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class HandleManager : Interactable
{
    static HandleManager instance;
    [SerializeField]
    List<GameObject> handles;
    [SerializeField]
    GameObject Plateform;

    static public HandleManager Instance()
    {
        return instance;
    }
    public override void finishInteraction()
    {
        throw new System.NotImplementedException();
    }

    public void interactWithID(int id)
    {
        foreach(GameObject handle in handles)
        {
            if(handle.GetComponent<handleInteraction>().id == id)
            {
                Debug.Log("Calling interaction with handle Manager handle");
                handle.GetComponent<handleInteraction>().interactWithHandleManger();
            }
        }

        foreach (GameObject handle in handles)
        {
            if (handle.GetComponent<handleInteraction>().canInteract == true)
            {
                return;
            }
        }
        Animator plateform = Plateform.gameObject.GetComponent<Animator>();
        plateform.SetBool("Interact", true);
        Plateform.GetComponent<WinInteraction>().canInteract = true;
    }
    public override void interact(FPSCharacterController player)
    {

    }

    // Start is called before the first frame update
    void Start()
    {
        instance = this;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
