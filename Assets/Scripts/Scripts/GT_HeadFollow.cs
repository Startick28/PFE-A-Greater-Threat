using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Animations.Rigging;

public class GT_HeadFollow : MonoBehaviour
{
    MultiAimConstraint aimConstraint;
    RigBuilder rigBuilder;

    public Transform aimTransform;

    bool lookingAtTarget = false;

    void Start()
    {
        aimConstraint = GetComponentInChildren<MultiAimConstraint>();
        rigBuilder = GetComponent<RigBuilder>();
    }

    void Update()
    {
        //DEBUG
        if (Input.GetKeyDown(KeyCode.B))
        {
            StartCoroutine(SetAimTarget(aimTransform));
        }
        if (Input.GetKeyDown(KeyCode.S))
        {
            StartCoroutine(StopLookingAtTarget());
        }

        if (lookingAtTarget)
        {
            float lookAngle = Vector3.Angle(transform.forward, Vector3.ProjectOnPlane(aimTransform.position - transform.position, Vector3.up));
            
        }
    }
    
    // Sets the transform the GT will look at. It will take it "transition" seconds to look at the transform.
    public IEnumerator SetAimTarget(Transform aim, float transition = 0.15f)
    {
        var data = aimConstraint.data.sourceObjects;
        data.Clear();
        data.Add(new WeightedTransform(aim, 1f));
        aimConstraint.data.sourceObjects = data;
        rigBuilder.Build();
        for (float t = 0f; t < transition; t+= Time.deltaTime)
        {
            aimConstraint.weight = Mathf.Lerp(0f,0.9f, t/transition);
            yield return null;
        }
        aimConstraint.weight = 0.9f;
        lookingAtTarget = true;
    }

    // Clears the transform the GT is looking at.
    public IEnumerator StopLookingAtTarget(float transition = 0.25f)
    {
        float initWeight = aimConstraint.weight;
        for (float t = 0f; t < transition; t+= Time.deltaTime)
        {
            aimConstraint.weight = Mathf.Lerp(initWeight,0f, t/transition);
            yield return null;
        }
        aimConstraint.weight = 0f;
        var data = aimConstraint.data.sourceObjects;
        data.Clear();
        aimConstraint.data.sourceObjects = data;
        rigBuilder.Build();
        lookingAtTarget = false;
    }
}
