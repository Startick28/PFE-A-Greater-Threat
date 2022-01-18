using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class HandleManager : Interactable
{
    static HandleManager instance;
    [SerializeField]
    List<GameObject> handles;

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
        SceneManager.LoadScene("winScene");
    }
    public override void interact(FPSCharacterController player)
    {
        throw new System.NotImplementedException();
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
