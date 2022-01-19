using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChestManager : MonoBehaviour
{

    public static ChestManager Instance;


    private void Awake()
    {
        Instance = this;
    }

    // Start is called before the first frame update
    private int id = 0;
    void Start()
    {
        foreach (Transform child in transform)
        {
            if (child.GetComponent<Chest>())
            {
                child.GetComponent<Chest>().Id = id;
            }
            else if (child.GetComponent<ButtonForceField>())
            {
                child.GetComponent<ButtonForceField>().Id = id;
            }
            id++;
        }
    }

    public void OpenChest(int id, FPSCharacterController player)
    {
        foreach (Transform child in transform)
        {
            if(child.GetComponent<Chest>())
            {
                if(child.GetComponent<Chest>().Id == id)
                    child.GetComponent<Chest>().interact(player);
            }
        }
    }

    public void OpenButton(int id, FPSCharacterController player)
    {
        foreach (Transform child in transform)
        {
            if (child.GetComponent<ButtonForceField>())
            {
                if(child.GetComponent<ButtonForceField>().Id == id)
                    child.GetComponent<ButtonForceField>().interact(player);
            }
        }
    }
}
