using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyDataManager : MonoBehaviour
{
    // Start is called before the first frame update

    float health;
    float maxHealth = 100;


    void Start()
    {
        health = maxHealth;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void die()
    {
        Destroy(this.gameObject);
    }

    void takeDamage(float damage)
    {
        health -= damage;
        if(health<= 0)
        {
            die();
        }
    }
}
