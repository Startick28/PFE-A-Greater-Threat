/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/
#if UNITY_EDITOR
using TMPro;
using UnityEngine;
using UnityEditor;
using System;
using System.Reflection;

[
    ExecuteInEditMode,
    AddComponentMenu("DE Shaders/Gizmo Handler")
]
public class DE_ShadersGizmoHandler : MonoBehaviour
{

    static MethodInfo setIconEnabled;
    static MethodInfo SetIconEnabled => setIconEnabled = setIconEnabled ??
        Assembly.GetAssembly(typeof(Editor))
        ?.GetType("UnityEditor.AnnotationUtility")
        ?.GetMethod("SetIconEnabled", BindingFlags.Static | BindingFlags.NonPublic);
    public void OnEnable()
    {
        SetGizmoIconEnabled(typeof(TextMeshPro), false);
    }
    public void OnDisable()
    {
        SetGizmoIconEnabled(typeof(TextMeshPro), true);
    }
    public static void SetGizmoIconEnabled(Type type, bool on)
    {
        if (SetIconEnabled == null) return;
        const int MONO_BEHAVIOR_CLASS_ID = 114; // https://docs.unity3d.com/Manual/ClassIDReference.html
        SetIconEnabled.Invoke(null, new object[] { MONO_BEHAVIOR_CLASS_ID, type.Name, on ? 1 : 0 });
    }
}
#endif
