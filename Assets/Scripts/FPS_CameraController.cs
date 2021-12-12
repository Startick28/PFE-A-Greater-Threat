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

    public void addRecoil(float verticalAngle, float horizontalAngle)
    {
        //Add input to camera angles;
        currentXAngle += verticalAngle;
        currentYAngle += horizontalAngle;

        //Clamp vertical rotation;
        currentXAngle = Mathf.Clamp(currentXAngle, -upperVerticalLimit, lowerVerticalLimit);

        UpdateRotation();
    }




}
