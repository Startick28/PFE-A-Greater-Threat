using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class sousMap : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        FPSCharacterController player = other.GetComponent<FPSCharacterController>();
        if(player != null)
        {
            player.transform.Translate(new Vector3(0, 300, 0), Space.World);
        }
    }
}
