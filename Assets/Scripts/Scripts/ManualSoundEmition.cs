using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ManualSoundEmition : MonoBehaviour
{

    SoundEmitter emitter;
    // Start is called before the first frame update
    void Start()
    {
        emitter = gameObject.GetComponent<SoundEmitter>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.E))
        {
            Debug.Log("Emit");
            emitter.Emit();
        }
    }
}
