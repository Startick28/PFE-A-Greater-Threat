/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/
#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

using System.IO;
using System.Collections;
using System.Collections.Generic;
using DEShaders.Utils;

[CustomEditor(typeof(DE_PreviewManager),editorForChildClasses:(false), isFallback = false)]
[CanEditMultipleObjects]
public class DE_PreviewManagerEditor : Editor
{
    private static Texture2D icon_logo;
    private static GUIContent logo;
    private readonly float size = 100;
    private void OnEnable()
    {
        if (logo == null)
        {
            var path = Path.Combine("Assets", "DE Environment", "DE Core", "Script", "DE Shaders Path.asset");
            var p = (DE_ShadersMenuPath)AssetDatabase.LoadAssetAtPath(path, typeof(DE_ShadersMenuPath));
            icon_logo = p.Logo.GetTexture2D();
        }
        logo = new GUIContent(icon_logo);
    }
    public override void OnInspectorGUI()
    {
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField(logo, GUILayout.Width(size), GUILayout.Height(size));
        EditorGUILayout.BeginVertical();
        EditorGUILayout.LabelField("Do not destroy this component!", EditorStyles.boldLabel);
        EditorGUILayout.LabelField("This component belongs to\n DE Mesh Tools and will be\n removed automatically!",GUILayout.Height(60));
        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();
    }
}
#endif