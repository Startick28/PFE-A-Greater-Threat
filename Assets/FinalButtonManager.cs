using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FinalButtonManager : MonoBehaviour
{
    static FinalButtonManager instance;
    [SerializeField]
    List<GameObject> finalButtons;
    public void InteractWithRedButtonWithID(int id)
    {
        foreach(GameObject button in finalButtons)
        {
            if(button.GetComponent<InteractRedButton>().id == id)
            {
                button.GetComponent<InteractRedButton>().interactRedButton();
            }
        }
    }
    static public FinalButtonManager Instance()
    {
        return instance;
    }

    public void Start()
    {
        instance = this;
    }
}
