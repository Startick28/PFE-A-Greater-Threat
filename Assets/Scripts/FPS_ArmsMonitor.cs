using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class FPS_ArmsMonitor : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField]
    FPSCharacterController parentController;



    [SerializeField]
    Animator animator;

    public void Start()
    {

    }


    public void onEquip()
    {
        //Debug.Log("");
        parentController.onEquip();
    }

    public void onUnEquip()
    {
        //Debug.Log("");
        parentController.onUnEquip();
    }

    public void onFire()
    {
        parentController.onFire();
    }

    public void onReloadComplete()
    {
        parentController.onReloadComplete();
    }

    public void onSlowDownReload()
    {
        parentController.onSlowDownReload();
    }

    public void onSpeedUpReload()
    {
        parentController.onSpeedUpReload();
    }

}


