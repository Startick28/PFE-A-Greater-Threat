using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
public class BasicGun : MonoBehaviour
{
    int loadedBullets; // When this is equal to 0, player has to use bullets in inventory to reload
    // Start is called before the first frame update

    int maxLoadedBullets = 10;
    [SerializeField]
    float fireRate;

    
    float fireTime;

    float timeSinceFire;
    PhotonView view;
    void Start()
    {
        view = transform.parent.parent.gameObject.GetComponent<PhotonView>();
        
        
        loadedBullets = maxLoadedBullets;
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
       
}
