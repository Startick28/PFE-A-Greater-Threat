using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestController : MonoBehaviour
{
    private SoundEmitter soundEmitter;

    void Start()
    {
        soundEmitter = gameObject.GetComponent<SoundEmitter>();
    }

    void Update()
    {
        if (Input.GetKeyDown("space"))
        {
            soundEmitter.Emit();
        }
    }
}
