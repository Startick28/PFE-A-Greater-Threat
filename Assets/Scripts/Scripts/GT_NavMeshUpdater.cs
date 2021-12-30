using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GT_NavMeshUpdater : MonoBehaviour
{
    [SerializeField] private LocalNavMeshBuilder navMeshBuilder;
    [SerializeField] private float updateFrequency = 0.5f;
    float updateTimer;

    void Start()
    {
        updateTimer = updateFrequency;
    }

    // Update is called once per frame
    void Update()
    {
        updateTimer -= Time.deltaTime;
        if (updateTimer <= 0)
        {
            updateTimer += updateFrequency;
            
        }
    }
}
