using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyTestScript : MonoBehaviour
{
    float maxHealth = 100;
    float currentHealth = 100;
    Renderer renderer;
    // Start is called before the first frame update
    void Start()
    {
        renderer = GetComponent<Renderer>();
        renderer.material.color = Color.red;
    }

    // Update is called once per frame
    void Update()
    {
        renderer.material.color = new Color(currentHealth / maxHealth, 0, 0);

        if(currentHealth>0)
        {
            //currentHealth -= 10 * Time.deltaTime;
            //takeDamage(10 * Time.deltaTime);
        }
        
    }

    public void takeDamage(float damage)
    {
        if(currentHealth>0)
        {
            currentHealth -= damage;
        }
        
    }
}
