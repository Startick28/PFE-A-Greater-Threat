using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BasicGun : MonoBehaviour
{
    int loadedBullets; // When this is equal to 0, player has to use bullets in inventory to reload
    // Start is called before the first frame update

    int maxLoadedBullets = 10;
    void Start()
    {
        loadedBullets = maxLoadedBullets;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void fire(Vector3 position,Vector3 direction)
    {
        Debug.Log(loadedBullets);
        if(loadedBullets == 0)
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
            EnemyTestScript enemy = hit.collider.GetComponent<EnemyTestScript>();
            if(enemy != null)
            {
                enemy.takeDamage(10);
            }
            

        }
        loadedBullets--;
    }

    public void reload()
    {
        loadedBullets = maxLoadedBullets;
    }

    public int getLoadedBullets()
    {
        return loadedBullets;
    }
}
