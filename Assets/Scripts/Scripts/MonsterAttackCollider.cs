using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterAttackCollider : MonoBehaviour
{
    Collider col;

    [SerializeField] private float attackDamages;
    [SerializeField] private float maxActiveTime;

    float activeTimer = 0f;    

    void Start()
    {
        col = gameObject.GetComponent<Collider>();
    }

    void Update()
    {
        if (col.enabled)
        {
            activeTimer += Time.deltaTime;
            if (activeTimer >= maxActiveTime)
            {
                col.enabled = false;
                activeTimer = 0f;
            }
        }
    }

    void OnTriggerEnter(Collider hit)
    {
        if (hit.CompareTag("Player"))
        {
            hit.gameObject.GetComponent<TestController>().GetHit(attackDamages);
            col.enabled = false;
        }
    }
}
