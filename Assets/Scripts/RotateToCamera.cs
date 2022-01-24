using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateToCamera : MonoBehaviour
{
    Camera targetCamera;
    Camera[] cameras;

    public float RotationSpeed;

    //values for internal use
    private Quaternion _lookRotation;
    private Quaternion temp;
    private Vector3 _direction;

    // Start is called before the first frame update
    void Start()
    {
        RotationSpeed = 10;
    }

    // Update is called once per frame
    void Update()
    {
        if (targetCamera == null)
        {
            cameras = FindObjectsOfType<Camera>();
            foreach(Camera camera in cameras)
            {
                if (camera.enabled == true)
                {
                    targetCamera = camera;

                    _direction = (transform.position - camera.transform.position ).normalized;

                    //create the rotation we need to be in to look at the target
                    _lookRotation = Quaternion.LookRotation(_direction);

                    //rotate us over time according to speed until we are in the required rotation
                    transform.rotation = Quaternion.Slerp(transform.rotation, _lookRotation, Time.deltaTime * RotationSpeed);

                }
            }
        }
        else
        {
            if(targetCamera.enabled == true)
            {
                _direction = (transform.position - targetCamera.transform.position).normalized;

                //create the rotation we need to be in to look at the target
                _lookRotation = Quaternion.LookRotation(_direction);

                //rotate us over time according to speed until we are in the required rotation
                temp = Quaternion.Slerp(transform.rotation, _lookRotation, Time.deltaTime * RotationSpeed);

                transform.rotation = new Quaternion(0, temp.y, 0, temp.w);
            }
        }
    }
}
