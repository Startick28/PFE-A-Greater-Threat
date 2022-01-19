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
    GameObject[] weaponModels;

    [SerializeField]
    Animator modelAnimator;

    [SerializeField]
    Transform cameraTransform; //This is the player camera that the player has to follow



    // Start is called before the first frame update
    void Start()
    {
        //drawGunModel.SetActive(false);
       // idleGunModel.SetActive(true);
        foreach(GameObject model in weaponModels)
        {
            model.SetActive(false);
        }
    }

    // Update is called once per frame
    void Update()
    {
        //transform.rotation = new Quaternion(0.0f,0.0f,0.0f,1.0f);
    }


    public void onWeaponInHand(int index)
    {
        
        weaponModels[index * 2].SetActive(false);
        weaponModels[index * 2 + 1].SetActive(true);
    }

    public void onWeaponPutBack(int index)
    {
        weaponModels[index * 2+1].SetActive(false);
        weaponModels[index * 2].SetActive(true);
    }

    public void setUpModels(int type)
    {
        weaponModels[type - 1].SetActive(true);
    }



    public void onEquip(int weaponIndex)
    {

    }


    public void onUnequip(int weaponIndex)
    {
        modelAnimator.SetLayerWeight(1, 0);
    }
}
