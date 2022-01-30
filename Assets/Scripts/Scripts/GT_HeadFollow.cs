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
            SetAimTarget(aimTransform);
        }
        if (Input.GetKeyDown(KeyCode.S))
        {
            StopLookingAtTarget();
        }

        if (lookingAtTarget && aimTransform != null)
        {
            float lookAngle = Vector3.Angle(transform.forward, Vector3.ProjectOnPlane(aimTransform.position - transform.position, Vector3.up));
            aimConstraint.weight = Mathf.Lerp(0.9f,0f,(lookAngle - 140) / 20f);
        }
    }

    public void SetAimTarget(Transform aim, float transition = 0.25f)
    {
        if (lookingAtTarget) return;
        StartCoroutine(SetAimTargetRoutine(aim, transition));
    }
    public void StopLookingAtTarget(float transition = 0.25f)
    {
        if (!lookingAtTarget) return;
        StartCoroutine(StopLookingAtTargetRoutine(transition));
    }
    
    // Sets the transform the GT will look at. It will take it "transition" seconds to look at the transform.
    IEnumerator SetAimTargetRoutine(Transform aim, float transition)
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
    IEnumerator StopLookingAtTargetRoutine(float transition = 0.25f)
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
