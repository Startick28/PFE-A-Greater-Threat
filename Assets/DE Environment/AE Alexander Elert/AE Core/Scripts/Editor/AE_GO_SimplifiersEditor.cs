#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

using DEShaders.Utils;
using DEShaders.GraphicalUserInterface;
[CustomEditor(typeof(AE_GO_Simplifiers)), CanEditMultipleObjects]
public class AE_GO_SimplifiersEditor : Editor
{
    #region [Properties]
    /// <summary>
    /// Serialized Property
    /// </summary>
    private SerializedProperty AEObjects, AEObjectsModType, shadowCastingMode, receiveShadows;
    
    /// <summary>
    /// Logo Texture2D
    /// </summary>
    private Texture2D AECoverImage;
    /// <summary>
    /// AE_GO_Simplifiers
    /// </summary>
    private AE_GO_Simplifiers simplifiers;

    /// <summary>
    /// GUI Button Width
    /// </summary>
    private int ButtonWidth = 160;
    #endregion
    #region [Unity Calls]
    private void OnEnable()
    {
        if (!AECoverImage)
        {
            AECoverImage = ("ae-gameobject-simplifiers-cover-image").GetTexture2D();
        }
        simplifiers = (AE_GO_Simplifiers)target;
        AEObjects = serializedObject.FindProperty("AEObjects");
        AEObjectsModType = serializedObject.FindProperty("AEObjectsModType");

        shadowCastingMode = serializedObject.FindProperty("shadowCastingMode");
        receiveShadows = serializedObject.FindProperty("receiveShadows");
    }

    public override void OnInspectorGUI()
    {
        HeaderGUI();
        ObjectGUI();
        ColliderGUI();
        PhysicsGUI();
        ResetGUI();
        serializedObject.ApplyModifiedProperties();
    }
    #endregion
    #region [GUI]
    /// <summary>
    /// Header GUI
    /// </summary>
    private void HeaderGUI()
    {
        EditorGUILayout.LabelField(new GUIContent(AECoverImage), GUILayout.Height(AECoverImage.height / 2));
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("VERSION " + simplifiers.version, DEShadersStyles.LabelStyle(size: 9));
        GUILayout.FlexibleSpace();
        ColorUtility.TryParseHtmlString("#03adfc", out Color col);

        EditorGUI.BeginChangeCheck();
        GUILayout.Button("TUTORIALS & DOCUMENTATION", DEShadersStyles.LinkStyle(col, false, 9));
        if (EditorGUI.EndChangeCheck())
        {
            Application.OpenURL(simplifiers.documentationPath);
        }
        EditorGUILayout.EndHorizontal();
    }
    /// <summary>
    /// GameObjects Region
    /// </summary>
    private void ObjectGUI()
    {
        EditorGUI.BeginChangeCheck();
        Label(new GUIContent("GAMEOBJECTS SELECTOR"));
        EditorGUILayout.BeginVertical("box");

        AEObjectsModType.intValue = EditorGUILayout.Popup(AEObjectsModType.intValue, simplifiers.AEObjectsModContent);
        EditorGUILayout.HelpBox("Choose how you want to control the gameobjects.", MessageType.None);
        EditorGUILayout.BeginHorizontal();
        GUILayout.Space(10);
        EditorGUILayout.PropertyField(AEObjects, new GUIContent("Objects List"), true);
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.Space();

        Label(new GUIContent("SHADOWS SIMPLIFIER"));
        EditorGUILayout.PropertyField(shadowCastingMode);
        EditorGUILayout.HelpBox("Choose how you mesh renderers react to shadow-casting lights.", MessageType.None);

        EditorGUILayout.Space();

        EditorGUILayout.PropertyField(receiveShadows);
        EditorGUILayout.HelpBox("Choose if mesh is receiving shadows.", MessageType.None);

        

        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(simplifiers, "Undo Render Settings");
            EditorUtility.SetDirty(simplifiers);
            simplifiers.RefreshRendererSettings();
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(20);
    }
    /// <summary>
    /// Collision Region
    /// </summary>
    private void ColliderGUI()
    {
        EditorGUI.BeginChangeCheck();
        Label(new GUIContent("COLLISION SIMPLIFIER"));
        EditorGUILayout.BeginVertical("box");
        GUILayout.Button("Remove Colliders", GUILayout.Width(ButtonWidth));
        EditorGUILayout.HelpBox("Remove all collider components on the gameobject.\n(Note: this action can't be undone later!)", MessageType.Warning);
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(simplifiers, "Undo Remove Colliders");
            EditorUtility.SetDirty(simplifiers);
            simplifiers.RemoveColliders();
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(20);
    }
    /// <summary>
    /// Physics Region
    /// </summary>
    private void PhysicsGUI()
    {
        EditorGUI.BeginChangeCheck();
        Label(new GUIContent("PHYSICS SIMPLIFIER"));
        EditorGUILayout.BeginVertical("box");
        GUILayout.Button("Remove Rigidbodies", GUILayout.Width(ButtonWidth));
        EditorGUILayout.HelpBox("Remove all rigidbodies components on the gameobject.\n(Note: this action can't be undone later!)", MessageType.Warning);
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(simplifiers, "Undo Remove Rigidbodies");
            EditorUtility.SetDirty(simplifiers);
            simplifiers.RemoveRigidbody();
        }
    
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Remove Cloth", GUILayout.Width(ButtonWidth));
        EditorGUILayout.HelpBox("Remove all cloth components on the gameobject.\n(Note: this action can't be undone later!)", MessageType.Warning);
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(simplifiers, "Undo Remove Cloth");
            EditorUtility.SetDirty(simplifiers);
            simplifiers.RemoveCloth();
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(40);
    }
    /// <summary>
    /// Reset Button
    /// </summary>
    private void ResetGUI()
    {
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Reset", GUILayout.Width(ButtonWidth / 2));
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(simplifiers, "Undo Reset AE Simplifier Script");
            EditorUtility.SetDirty(simplifiers);
            simplifiers.Reset();
        }
    }
    #endregion
    #region [GUI Extention]
    /// <summary>
    /// Draw GUIContent Label
    /// </summary>
    /// <param name="content">GUI Label Content</param>
    private void Label(GUIContent content)
    {
        EditorGUILayout.LabelField(content, DEShadersStyles.LabelStyle(false, 8));
    }
    #endregion
}
#endif