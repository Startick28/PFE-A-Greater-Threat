using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AmmunitionCollectible : Interactable
{
    [SerializeField]
    int quantity;

    [SerializeField]
    int type;

    [SerializeField] private int id;
    public int Id
    {
        get { return id; }
        set
        {
            id = value;
        }
    }
    public override void finishInteraction()
    {
        
    }

    public override void interact(FPSCharacterController player)
    {
       
        if(player != null)
        {
           
            player.collectAmmunition(quantity, type);
        }
        else
        { 
            return;
        }
        
        finishInteraction();
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
