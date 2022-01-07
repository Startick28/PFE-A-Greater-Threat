using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonForceField : Interactable
{
    [Header("Button Setup")]
    [SerializeField] private int id;
    [SerializeField] private GameObject handle;


    [Header("Door Setup")]
    [SerializeField] private bool isOpened;
    [SerializeField] private float timeToOpenDoor = 3f;


    [Header("Animation Setup")]
    [SerializeField] private float timeToAnimation = 3f;
    [SerializeField] private float rotationX = -176;

    public int Id
    {
        get { return id; }
        set
        {
            id = value;
        }
    }

    public bool IsOpened
    {
        get { return isOpened; }
        set
        {
            isOpened = value;
        }
    }

    [PunRPC]
    public override void interact(FPSCharacterController player)
    {
        if (players.Count == 0)
        {
            Debug.Log("Error this function should not be able to be called if no players or entity are around");
            return;
        }
        StartCoroutine(OpenDoor(timeToOpenDoor));
        StartCoroutine(Rotate(timeToAnimation));
        finishInteraction();
        //throw new System.NotImplementedException();
    }

    public override void finishInteraction()
    {
        canInteract = false;
    }


    // Start is called before the first frame update
    void Start()
    {
        iType = InteractionType.button;
        canInteract = true;
        isOpened = false;
    }

    IEnumerator OpenDoor(float duration)
    {
        yield return new WaitForSeconds(duration);
        isOpened = true;
    }

    IEnumerator Rotate(float duration)
    {
        float startRotation = handle.transform.eulerAngles.x;
        float endRotation = startRotation + rotationX;
        float t = 0.0f;
        while (t < duration)
        {
            t += Time.deltaTime;
            float xRotation = Mathf.Lerp(startRotation, endRotation, t / duration);
            handle.transform.eulerAngles = new Vector3(xRotation, handle.transform.eulerAngles.y, handle.transform.eulerAngles.z);
            yield return null;
        }
    }
}
