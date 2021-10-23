using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CMF;

public class FPS_CameraController : CameraController
{
    float defaultFOV = 90;
    

    public void zoom()
    {
        cam.fieldOfView = defaultFOV / 2;
    }

    public void unZoom()
    {
        cam.fieldOfView = defaultFOV;
    }




}
