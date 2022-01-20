using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class EndgameSpawner : MonoBehaviour
{
    [SerializeField] private GameObject ArackPrefab;

    [SerializeField] private float startSpawnFrequency = 2f;

    private float spawnFrequency;
    private float spawnTimer;

    private bool endgameStarted = false;

    // Start is called before the first frame update
    void Start()
    {
        spawnFrequency = startSpawnFrequency;
        spawnTimer = spawnFrequency;
    }

    // Update is called once per frame
    void Update()
    {
        if (endgameStarted)
        {
            spawnTimer -= Time.deltaTime;
            if (spawnTimer <= 0)
            {
                spawnTimer += spawnFrequency;
                Debug.Log("spawn");
                Spawn();
            }
        }
    }

    public void StartEndgame()
    {
        endgameStarted = true;
    }

    void Spawn()
    {
        if (EnemiesManager.Instance)
        {
            EnemiesManager.Instance.photonView.RPC("InstantiateEnemy", RpcTarget.All, transform.position);
        }
    }

}
