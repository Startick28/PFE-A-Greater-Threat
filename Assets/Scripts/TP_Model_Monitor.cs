using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TP_Model_Monitor : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField]
    FPSCharacterController parentController;



    [SerializeField]
    Animator animator;

    //[SerializeField]
    //GameObject shotVFX;

    [SerializeField]
    GameObject idleGunModel;
    [SerializeField]
    GameObject drawGunModel;

    [SerializeField]
    GameObject idleMachineGunModel;
    [SerializeField]
    GameObject drawnMachineGunModel;


    // Start is called before the first frame update
    void Start()
    {
        drawGunModel.SetActive(false);
        idleGunModel.SetActive(true);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void onGunInHand()
    {
        //Debug.Log("gunInHand");
        idleGunModel.SetActive(false);
        drawGunModel.SetActive(true);
    }

    public void onGunPutBack()
    {
        //Debug.Log("gunPutBack");
        drawGunModel.SetActive(false);
        idleGunModel.SetActive(true);
    }

    public void onMachineGunInHand()
    {
        //Debug.Log("gunInHand");
        idleMachineGunModel.SetActive(false);
        drawnMachineGunModel.SetActive(true);
    }

    public void onMachineGunPutBack()
    {
        //Debug.Log("gunPutBack");
        drawnMachineGunModel.SetActive(false);
        idleMachineGunModel.SetActive(true);
    }
}
