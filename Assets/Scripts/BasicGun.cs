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
    [SerializeField]
    int magSize;
    [SerializeField]
    float fireRate;
    [SerializeField]
    float noise;
    [SerializeField]
    float recoil;
    [SerializeField]
    float fullReloadTime;
    [SerializeField]
    float fastReloadTime;

    [SerializeField]
    public int type; //Gun = 1, machineGun = 2,

    [SerializeField]
    private GameObject bulletHolePrefab;


    public bool canReload
    {
        get { return !(loadedBullets == magSize); }
    }

    public int LoadedBullets
    {
        get { return loadedBullets; }
    }

    public float Recoil
    {
        get { return recoil; }
        
    }

    public int MagSize
    {
        get { return magSize; }
    }

    public float FullReloadTime
    {
        get { return fullReloadTime; }
    }
    public float FastReloadTime
    {
        get { return fastReloadTime; }
    }

    public bool isReadyToFire
    {
        get { return timeSinceFire > fireTime; }
    }

    float fireTime;

    float timeSinceFire;
    private FPSCharacterController playerController;
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

        iType = InteractionType.gun;
        collider = GetComponent<BoxCollider>();
        loadedBullets = magSize;
        setFireTime();
        //fireTime = 1;
        timeSinceFire = fireTime + 1;
        playerController = GetComponentInParent<FPSCharacterController>();
    }

    // Update is called once per frame
    void FixedUpdate()
    {
       
        //Debug.Log(timeSinceFire);
    }

    private void Update()
    {
        timeSinceFire += Time.deltaTime;
    }

    public bool fire(Vector3 position,Vector3 direction)
    {
        
            Debug.Log(loadedBullets);
            if (loadedBullets == 0)
            {
                Debug.Log("Tried to shoot with empty mag");
                return false;
            }
            playerController.addRecoilToCamera(-recoil, Random.Range(-2.0f,2.0f));
            //Debug.Log("Tried to shoot with basic gun");
            int layerMask = 1 << 11;
            RaycastHit hit;
            Debug.DrawRay(position, direction * 1000, Color.red);
            if (Physics.Raycast(position, direction, out hit, Mathf.Infinity, layerMask))
            {
                // Instancie un bulletHole si la cible est un mur.
                if (layerMask == 10)
                {
                    Instantiate(bulletHolePrefab, hit.point, Quaternion.LookRotation(hit.normal));
                }
                Debug.DrawRay(position, direction * hit.distance, Color.yellow);
                Debug.Log("Did Hit");
                if (EnemiesManager.Instance)
                {
                    EnemiesManager.Instance.photonView.RPC("EnemyTakeDamageWithId", Photon.Pun.RpcTarget.All, hit.collider.GetComponent<EnemyScript>().ID, 10.0f);
                }
            }
            loadedBullets--;
            timeSinceFire = 0;
        return true;
       
    }

    public void reload(int bullets)
    {
        loadedBullets += bullets;
    }


    public int getMaxLoadedBullets()
    {
        return magSize;
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
    public override void interact(FPSCharacterController player)
    {
        Debug.Log("interacted with gun");
        if (players.Count == 0)
        {
            return;
            Debug.Log("Error this function should not be able to be called if no players or entity are around");
        }
        //Pour l'instant on augmente les stats du premier joueur � s'�tre approch� du coffre
        // Modifier la ligne en dessous par la méthode qui retourne le basic gun utilisé par le joueur
        //BasicGun playerGun = player.GetComponentInChildren<BasicGun>();

        GameObject playerGun = player.getCurrentWeapon(type);
        player.changeGun(this);
        /*if (playerGun == null)//Le joueur n'a pas d'arme de ce type
        {
            Debug.Log("Error demanded basic or gun MeshRenderer gun was not found for chest interaction");

        }
        else
        {
            
        }*/


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
        else
        {
            return;
        }
    }

    public float getNoise()
    {
        return noise;
    }


   
       
}
