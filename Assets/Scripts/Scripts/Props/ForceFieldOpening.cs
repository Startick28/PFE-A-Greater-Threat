// ----------------------------------------------------------------------------------------------------------
// Door script copyright 2017 by Creepy Cat do not distribute/sale full or partial code without my permission
// ----------------------------------------------------------------------------------------------------------
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ForceFieldOpening : MonoBehaviour
{

    [SerializeField] private List<ButtonForceField> buttons;
    [SerializeField] private Material openMaterial;
    [SerializeField] private Material closeMaterial;
    [SerializeField] private Collider collider;

    [SerializeField] private GameObject forceFieldA;
    [SerializeField] private GameObject forceFieldB;

    //Record initial positions

    private MeshRenderer materialForceFieldA;
    private Material materialForceFieldB;

    bool canBeOpened()
    {
        foreach(ButtonForceField button in buttons)
        {
            if (!button.IsOpened)
                return false;
        }
        return true;
    }

    void deactivateForceField()
    {
        forceFieldA.GetComponent<MeshRenderer>().material = openMaterial;
        forceFieldB.GetComponent<MeshRenderer>().material = openMaterial;
        collider.enabled = false;
    }

    void activateForceField()
    {
        forceFieldA.GetComponent<MeshRenderer>().material = closeMaterial;
        forceFieldB.GetComponent<MeshRenderer>().material = closeMaterial;
        collider.enabled = true;
    }
    
    //Open or close doors
    void Update()
    {
        if(canBeOpened())
        {
            deactivateForceField();
        }
        else
        {
            activateForceField();
        }
    }
}
