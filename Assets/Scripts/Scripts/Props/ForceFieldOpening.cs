// ----------------------------------------------------------------------------------------------------------
// Door script copyright 2017 by Creepy Cat do not distribute/sale full or partial code without my permission
// ----------------------------------------------------------------------------------------------------------
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ForceFieldOpening : MonoBehaviour
{

    [SerializeField] private List<ButtonForceField> buttons;
    [SerializeField] private Shader ForceFieldA;
    [SerializeField] private Shader ForceFieldB;
    [SerializeField] private Collider collider;

    [SerializeField] private Texture deactivatedTexture;
    [SerializeField] private Texture activatedTexture;

    //Record initial positions


    bool canBeOpened()
    {
        foreach(ButtonForceField button in buttons)
        {
            if (button.IsOpened)
                return false;
        }
        return true;
    }

    void deactivateForceField()
    {
       /* ForceFieldA.SetTexture("_BaseMap", deactivatedTexture);
        ForceFieldA.SetTexture("_BaseMap", deactivatedTexture);
        ForceFieldA.SetTexture("_EmissionMap", deactivatedTexture);
        ForceFieldB.SetTexture("_EmissionMap", deactivatedTexture);*/
        collider.enabled = false;
    }

    void activateForceField()
    {
       /* ForceFieldA.SetTexture("_BaseMap", activatedTexture);
        ForceFieldB.SetTexture("_BaseMap", activatedTexture);
        ForceFieldA.SetTexture("_EmissionMap", activatedTexture);
        ForceFieldB.SetTexture("_EmissionMap", activatedTexture);*/
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
