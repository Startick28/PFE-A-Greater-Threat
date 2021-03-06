using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CMF;
public class FPS_CharacterInput : CharacterKeyboardInput
{
    //bool isCrouchkeyPressed;
    public KeyCode fireKey = KeyCode.Mouse0;
    public KeyCode crouchKey = KeyCode.C;
    public KeyCode reloadKey = KeyCode.R;
    public KeyCode runKey = KeyCode.LeftShift;
    public KeyCode zoomKey = KeyCode.Mouse1;
    public KeyCode interactKey = KeyCode.E;
    public KeyCode equipKey = KeyCode.LeftAlt;
    public KeyCode healKey = KeyCode.T;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public bool isCrouchKeyPressed()
    {
        return Input.GetKey(crouchKey);
    }

    public bool isFireKeyPressed()
    {
        return Input.GetKey(fireKey);
    }

    public bool isRunKeyPressed()
    {
        return Input.GetKey(runKey);
    }

    public bool isReloadKeyPressed()
    {
        return Input.GetKey(reloadKey);
    }

    public bool isZoomKeyPressed()
    {
        return Input.GetKey(zoomKey);
    }

    public bool isInteractKeyPressed()
    {
        return Input.GetKeyDown(interactKey);
    }

    public float getCurrentMouseScroll()
    {
        return Input.mouseScrollDelta.y;
    }

    public bool isHealKeyPressed()
    {
        return Input.GetKeyDown(healKey);
    }
}
