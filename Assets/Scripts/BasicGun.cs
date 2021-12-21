using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
public class BasicGun : MonoBehaviour
{
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
    PhotonView view;
    
    FPSCharacterController playerController;
    void Start()
    {
        view = transform.parent.parent.gameObject.GetComponent<PhotonView>();
        
        
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

    public float getNoise()
    {
        return noise;
    }


   
       
}
