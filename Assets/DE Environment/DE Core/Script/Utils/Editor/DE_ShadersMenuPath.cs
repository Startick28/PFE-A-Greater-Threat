/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/
#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

using System.IO;
using System.Collections.Generic;

using DEShaders.Containers;

public class DE_ShadersMenuPath : ScriptableObject
{
    public string password;
    public List<MenuPaths> Paths = new List<MenuPaths>();
    public ManagerInfo Info_Slot_0, Info_Slot_1, Info_Slot_2, Info_Slot_3, Info_Slot_4;

    public string Logo = "";
    public int Count 
    { 
        get 
        { 
            return Paths.Count; 
        } 
    }
    [MenuItem("Assets/Create/DE Shaders/Create Menu Path File")]
    public static void CreateDEShadersMenuPath()
    {
        if (!EditorPrefs.HasKey("DE_SHADERS_PASSWORD"))
        {
            var path = Path.Combine("Assets", "DE Environment", "DE Core", "Script", "DE Shaders Path.asset");
            var obj = ScriptableObject.CreateInstance(typeof(DE_ShadersMenuPath));
            AssetDatabase.CreateAsset(obj, path); ; ;
            AssetDatabase.Refresh();
            EditorGUIUtility.PingObject(obj);
        }
        else
        {
            Debug.Log("Allready Created!");
        }
    }
    [MenuItem("Assets/DE Shaders/Lock File")]
    public static void LockFile()
    {
        EditorPrefs.DeleteKey("DE_SHADERS_PASSWORD");
    }
}
#endif