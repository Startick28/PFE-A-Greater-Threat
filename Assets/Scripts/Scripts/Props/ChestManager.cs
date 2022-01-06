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
            child.GetComponent<Chest>().Id = id;
            id++;
        }
    }

    public void OpenChest(int id, FPSCharacterController player)
    {
        foreach (Transform child in transform)
        {
            if(child.GetComponent<Chest>().Id == id)
            {
                child.GetComponent<Chest>().interact(player);
            }
        }
    }
}
