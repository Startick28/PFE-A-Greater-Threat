using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
public class BasicGun : Interactable
{

    [SerializeField] RarityType rarity;
    public RarityType Rarity
    {
        get { return rarity; }
        set { rarity = value; }
    }

    int loadedBullets; // When this is equal to 0, player has to use bullets in inventory to reload
    // Start is called before the first frame update

    int maxLoadedBullets = 10;
    [SerializeField]
    float fireRate;

    
    float fireTime;

    float timeSinceFire;
    private PhotonView view;
    public PhotonView View
    {
        set { view = value; }
    }

    void Start()
    {
        if(transform.parent != null)
        {
            view = transform.parent.parent.gameObject.GetComponent<PhotonView>();
        }

        loadedBullets = maxLoadedBullets;
        iType = InteractionType.gun;
        collider = GetComponent<BoxCollider>();
        setFireTime();
        //fireTime = 1;
        timeSinceFire = fireTime + 1;
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        timeSinceFire += Time.deltaTime;
        //Debug.Log(timeSinceFire);
    }

    public void fire(Vector3 position,Vector3 direction)
    {
        if(timeSinceFire>fireTime)
        {
            Debug.Log(loadedBullets);
            if (loadedBullets == 0)
            {
                Debug.Log("Tried to shoot with empty mag");
                return;
            }
            //Debug.Log("Tried to shoot with basic gun");
            int layerMask = 1 << 26;
            RaycastHit hit;
            Debug.DrawRay(position, direction * 1000, Color.red);
            if (Physics.Raycast(position, direction, out hit, Mathf.Infinity, layerMask))
            {
                Debug.DrawRay(position, direction * hit.distance, Color.yellow);
                Debug.Log("Did Hit");
                /* EnemyTestScript enemy = hit.collider.GetComponent<EnemyTestScript>();
                if(enemy != null)
                {
                    enemy.view.RPC("takeDamage", RpcTarget.All, 10.0f);
                } */
                hit.collider.GetComponent<EnemyDataManager>().takeDamage(10.0f);

            }
            loadedBullets--;
            timeSinceFire = 0;
        }
        else
        {

            //Debug.Log("cannot fire right now");
            
        }
       
    }

    public void reload()
    {
        loadedBullets = maxLoadedBullets;
    }

    public int getLoadedBullets()
    {
        return loadedBullets;
    }

    public void setFireTime()
    {
        if (fireRate > 0)
        {
            fireTime = 1 / fireRate;
        }
        else
        {
            fireTime = 1;
        }
    }

    public void setFireRate(float newRate)
    {
        fireRate = newRate;
        setFireTime();
    }

    [PunRPC]
    public override void interact()
    {
        Debug.Log("interacted with gun");
        if (players.Count == 0)
        {
            return;
            Debug.Log("Error this function should not be able to be called if no players or entity are around");
        }
        //Pour l'instant on augmente les stats du premier joueur à s'être approché du coffre
        BasicGun playerGun = players[0].GetComponentInChildren<BasicGun>();
        MeshRenderer gunRenderer = playerGun.GetComponentInChildren<MeshRenderer>();
        if (playerGun == null || gunRenderer == null)
        {
            Debug.Log("Error demanded basic or gun MeshRenderer gun was not found for chest interaction");
        }

        playerGun.GetComponentInParent<FPSCharacterController>().changeGun(this);
        finishInteraction();
    }

    public override void finishInteraction()
    {
        canInteract = false;
    }

    private void OnTriggerEnter(Collider other)
    {
        Debug.Log("Gun Trigger");
        FPSCharacterController playerController = other.gameObject.GetComponent<FPSCharacterController>();
        Debug.Log("Name GameObject : " + other.gameObject.name);
        Debug.Log("Can Interact : "+canInteract + " player : "+ playerController);
        if (playerController != null && canInteract)
        {
            Debug.Log("gun is now NearestInteractabe");
            playerController.nearestInteractable = this;
            players.Add(playerController);
        }
    }
}
