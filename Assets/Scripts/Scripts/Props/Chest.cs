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
    [SerializeField] List<GameObject> prefabGun;
    [SerializeField] bool isOpened;
    

    [Header("Animation Setup")]
    [SerializeField] private float rotationZ = 90;
    [SerializeField] private float timeToOpen = 3f;
    [SerializeField] private float gunDeplacementY = 0.5f;
    [SerializeField] private AudioClip crateSound;

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

        if (players.Count == 0)
        {
            return;
            Debug.Log("Error this function should not be able to be called if no players or entity are around");
        }
        //Pour l'instant on augmente les stats du premier joueur � s'�tre approch� du coffre
        GameObject playerGun = player.getCurrentWeapon();
        if (playerGun == null)
        {
            Debug.Log("Error demanded basic or gun MeshRenderer gun was not found for chest interaction");
        }
        //Remove chest's collider
        gameObject.GetComponent<BoxCollider>().enabled = false;
        GetComponent<AudioSource>().PlayOneShot(crateSound);

        int randomGunIndex = Random.Range(0, prefabGun.Count);
        Debug.Log("RandomGunIndex : " + randomGunIndex);
        GameObject gun = Instantiate(prefabGun[randomGunIndex], transform.position ,Quaternion.identity);
        //Si l'objet est un gun
        if (gun.GetComponent<BasicGun>())
        {
            //gun.transform.Translate(0, transform.localScale.y / 2, 0);
            gun.transform.Translate(0, 0, -(gun.transform.localScale.x / 4));
            gun.GetComponent<BasicGun>().Rarity = rarity;
            gun.GetComponent<BasicGun>().canInteract = true;
            gun.GetComponent<BasicGun>().Id = id;
            gun.GetComponent<BoxCollider>().enabled = true;
            gun.GetComponentInChildren<MeshRenderer>().enabled = true;
            // Default layer
            gun.gameObject.layer = 0;

            player.GetComponent<FPSCharacterController>().nearestInteractable = gun.GetComponent<BasicGun>();
        }
        //Si l'objet est une munition
        else if(gun.GetComponent<AmmunitionCollectible>())
        {
            //gun.transform.Translate(0, 0.5f, -(gun.transform.localScale.x / 4));
            gun.transform.Translate(0, transform.localScale.y/2, 0);
            gun.GetComponent<AmmunitionCollectible>().canInteract = true;
            gun.GetComponent<BoxCollider>().enabled = true;
            gun.GetComponent<AmmunitionCollectible>().Id = id;

            // Default layer
            gun.gameObject.layer = 0;

            player.GetComponent<FPSCharacterController>().nearestInteractable = gun.GetComponent<AmmunitionCollectible>();
        }
        else if (gun.GetComponent<HealthKit>())
        {
            //gun.transform.Translate(0, 0.5f, -(gun.transform.localScale.x / 4));
            gun.transform.Translate(0, transform.localScale.y / 2, 0);
            gun.GetComponent<HealthKit>().canInteract = true;
            gun.GetComponent<BoxCollider>().enabled = true;
            gun.GetComponent<HealthKit>().Id = id;

            // Default layer
            gun.gameObject.layer = 0;

            player.GetComponent<FPSCharacterController>().nearestInteractable = gun.GetComponent<HealthKit>();
        }

        gun.transform.SetParent(transform.parent);

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
        //setRandomRarity();
        canInteract = true;
        isOpened = false;
    }

    private void setRandomRarity()
    {
        // 33% de chance d'�tre bleu
        if(Random.Range(0,3) == 1)
        {
            rarity = RarityType.bleu;
        }
        // 16% de chance d'�tre dor�
        else if(Random.Range(0,2) == 1)
        {
            rarity = RarityType.dore;
        }
        // 51% de chance d'�tre blanche
        else
        {
            rarity = RarityType.blanche;
        }
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
        crateTop.transform.eulerAngles = new Vector3(crateTop.transform.eulerAngles.x, crateTop.transform.eulerAngles.y, endRotation);
        crateTop.GetComponent<Collider>().enabled = false;
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
            if(transformGun)
            {
                transformGun.position = new Vector3(transformGun.position.x, yPosition, transformGun.position.z);
            }
            yield return null;
        }
    }
}
