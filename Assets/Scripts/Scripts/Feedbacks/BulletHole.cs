using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletHole : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        transform.position += transform.forward / 1000;
        transform.Rotate(new Vector3(0, 0, Random.Range(0, 360)) * Time.deltaTime);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
