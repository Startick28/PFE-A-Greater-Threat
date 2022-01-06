using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Chest : Interactable
{
    [Header("Crate Setup")]
    [SerializeField] private GameObject crateTop;
    [SerializeField] private int id;


    [Header("Chest Gun Setup")]
    [SerializeField] RarityType rarity;
    [SerializeField] BasicGun prefabGun;
    [SerializeField] bool isOpened;
    

    [Header("Animation Setup")]
    [SerializeField] private float rotationZ = 90;
    [SerializeField] private float timeToOpen = 3f;
    [SerializeField] private float gunDeplacementY = 0.5f;

    public int Id
    {
        get { return id; }
        set
        {
            id = value;
        }
    }

    [PunRPC]
    public override void interact(FPSCharacterController player)
    {       

        if(players.Count == 0)
        {
            return;
            Debug.Log("Error this function should not be able to be called if no players or entity are around");
        }
        //Pour l'instant on augmente les stats du premier joueur � s'�tre approch� du coffre
        BasicGun playerGun = player.GetComponentInChildren<BasicGun>();
        if(playerGun == null)
        {
            Debug.Log("Error demanded basic or gun MeshRenderer gun was not found for chest interaction");
        }
        //Remove chest's collider
        gameObject.GetComponent<BoxCollider>().enabled = false;

        BasicGun gun = Instantiate(prefabGun, transform.position ,Quaternion.identity);
        gun.transform.Translate(0,0,- (gun.transform.localScale.x / 4));
        gun.Rarity = rarity;
        gun.canInteract = true;
        gun.GetComponent<BoxCollider>().enabled = true;
        gun.GetComponentInChildren<MeshRenderer>().enabled = true;
        // Default layer
        gun.gameObject.layer = 0;
        gun.GetComponentInChildren<MeshRenderer>().material.color = Color.yellow;

        player.GetComponent<FPSCharacterController>().nearestInteractable = gun;

        // Animations
        if (!isOpened)
        {
            StartCoroutine(Rotate(timeToOpen));
            StartCoroutine(MoveGun(timeToOpen, gun.transform));
        }

        finishInteraction();
        //throw new System.NotImplementedException();
    }

    public override void finishInteraction()
    {
        canInteract = false;
        isOpened = true;
    }


    // Start is called before the first frame update
    void Start()
    {
        iType = InteractionType.chest;
        collider = GetComponent<BoxCollider>();
        canInteract = true;
        isOpened = false;
    }

    IEnumerator Rotate(float duration)
    {
        float startRotation = crateTop.transform.eulerAngles.z;
        float endRotation = startRotation + rotationZ;
        float t = 0.0f;
        while (t < duration)
        {
            t += Time.deltaTime;
            float zrotation = Mathf.Lerp(startRotation, endRotation, t / duration);
            crateTop.transform.eulerAngles = new Vector3(crateTop.transform.eulerAngles.x, crateTop.transform.eulerAngles.y,
            zrotation);
            yield return null;
        }
    }

    IEnumerator MoveGun(float duration,Transform transformGun)
    {
        float startPosition = transformGun.position.y;
        float endPosition = startPosition + gunDeplacementY;
        float t = 0.0f;
        duration *= 2;
        while (t < duration)
        {
            t += Time.deltaTime;
            float yPosition = Mathf.Lerp(startPosition, endPosition, t / duration);
            transformGun.position = new Vector3(transformGun.position.x, yPosition, transformGun.position.z);
            yield return null;
        }
    }
}