/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
*/
#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

using System.IO;

using DEShaders.GraphicalUserInterface;
using DEShaders.Containers;
using DEShaders.Lights;
using DEShaders.Utils;

public class AE_Manager : EditorWindow
{
    public static string version
    {
        get
        {
            return AlexanderElert.SchematicVersionControl.VERSION;
        }
    }

    // Editor Window
    public static readonly Vector2 EditorWindowSize = new Vector2(512, 512);
    private static int mainToolbar = 0;
    // GUI
    private Vector2 scrollPos = Vector2.zero;
    private static bool foldoutPackages, foldoutScene, foldoutLighting, foldoutRendering;

    private DEShadersGUI.AboutGUI aboutGUI;
    private DEShadersGUI.MainGUI mainGUI;

    // Lighting Settings
    private DE_RenderingPath renderingPath;
    private DE_ColorSpace colorSpace;
    
    // Editor
    private DE_ShadersMenuPath paths;
    private static string path => Path.Combine("Assets", "DE Environment", "AE Alexander Elert", "AE Core", "Scripts", "AE Path.asset");
    [MenuItem("Window/Alexander Elert/AE Manager...", priority = 1)]
    public static void Init()
    {
        var window = GetWindow(typeof(AE_Manager), true, "AE Manager" + version);

        window.minSize = EditorWindowSize;
        window.maxSize = EditorWindowSize;
        window.Show();
    }

    [MenuItem("Assets/Create/Alexander Elert/Setup/Create AE Path File")]
    public static void CreateAEManagerPath()
    {
        if (!File.Exists(Application.dataPath.Replace("Assets", path)))
        {
            var obj = CreateInstance(typeof(DE_ShadersMenuPath));
            AssetDatabase.CreateAsset(obj, path);
            AssetDatabase.Refresh();
            EditorGUIUtility.PingObject(obj);
            var pm = (DE_ShadersMenuPath)AssetDatabase.LoadAssetAtPath(path, typeof(DE_ShadersMenuPath));
        }
        else
        {
            Debug.Log("Already Created!");
        }
    }
    private void OnEnable()
    {
        renderingPath = DE_Lights.GetRenderingPath();
        colorSpace = DE_Lights.GetColorSpace();
    }
    public void OnGUI()
    {
        if (aboutGUI == null)
        {
            aboutGUI = new DEShadersGUI.AboutGUI(
               "Æ Manager",
               "Alexander Elert",
               version,
               new string[] { "Daniel Wipf", "Alexander Elert", "David Olshefski" },
               new string[] { "Daniel Wipf" },
               new string[] { "VRFX Realtime Studio GmbH", "Grimselweg 5", "6005 Luzern", "Switzerland" },
               "https://www.vrfxrealtimestudio.com/",
               "daniel@vrfx.ch"
               );
        }
        if (mainGUI == null)
        {
            mainGUI = new DEShadersGUI.MainGUI(
                mainToolbar: ref mainToolbar,
                toolbarNames: new string[] { "Info", "Setup", "About" },
                actions: new System.Action[] { InfoGUI, delegate { SetupGUI("AE Path.asset"); }, aboutGUI.OnGUI },
                name: "Æ Manager",
                version: version,
                editorWindowSize: EditorWindowSize,
                logofileName: "alexander-elert-logo",
                publisherLink: "https://assetstore.unity.com/publishers/46732",
                discordLink: "https://discord.com/invite/NJZhZVY",
                websiteLink: "http://www.alexanderelert.com/",
                mailLink: "alexanderelert@outlook.com",
                publisher: "Alexander Elert"
                );
        }
        mainGUI.OnGUI();

        Event e = Event.current;
        if (e.control && e.shift && e.keyCode == KeyCode.I)
            Selection.activeObject = (DE_ShadersMenuPath)AssetDatabase.LoadAssetAtPath(path, typeof(DE_ShadersMenuPath));
    }
    void InfoGUI()
    {
        var LabelStyle = new GUIStyle(GUI.skin.label);
        LabelStyle.alignment = TextAnchor.UpperLeft;
        LabelStyle.fontSize = 11;

        EditorGUILayout.LabelField("Welcome to Æ Manager!", EditorStyles.boldLabel);
        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Setup: ", EditorStyles.miniBoldLabel);
        EditorGUILayout.LabelField("Please read the AE_Core_Documentation and follow\nthe strunctions for a quickly an correct installation!\n\n" +
            "Current Demo Available Versions:\n" +
            "- Standard Render Pipeline\n" +
            "- URP (10.4.0)\n" +
            "- HDRP (10.4.0)\n", LabelStyle, GUILayout.Height(100));


        

    }
    void SetupGUI(string pathPackageName)
    {
        int width = 80;
        scrollPos = EditorGUILayout.BeginScrollView(scrollPos, GUIStyle.none, GUIStyle.none);
        if (!paths)
        {
            paths = (DE_ShadersMenuPath)AssetDatabase.LoadAssetAtPath(path, typeof(DE_ShadersMenuPath));
        }
        if (!paths)
        {
            EditorGUILayout.LabelField($"{pathPackageName} does not exist!", EditorStyles.boldLabel);
            EditorGUILayout.LabelField("Please create or move it to:", EditorStyles.miniBoldLabel);
            EditorGUILayout.LabelField(path, EditorStyles.miniBoldLabel);
        }
        else
        {
            foldoutPackages = EditorGUILayout.Foldout(foldoutPackages, new GUIContent("Setup Import Packages"));
            if (foldoutPackages)
            {
                if (paths.Paths.Count > 0)
                {
                    EditorGUILayout.BeginVertical("tooltip", GUILayout.Width(375));
                    MenuPathsRenderPipeline pipeline = paths.Paths[0].renderPipeline;
                    pipeline.DrawPipelineGUI();


                    // Labels
                    for (int i = 0; i < paths.Paths.Count; i++)
                    {
                        var packagePaths = paths.Paths[i].packagePaths;
                        if (packagePaths.Count > 0)
                        {
#if UNITY_2019_1_OR_NEWER
                            if (paths.Paths[i].renderPipeline != pipeline)
                            {
                                pipeline = paths.Paths[i].renderPipeline;
                                pipeline.DrawPipelineGUI(i);
                            }
                            var name = paths.Paths[i].name;
                            if (name.Contains(" 7.") || name.Contains(" 7_"))
                            {
#if UNITY_2019_4
                                EditorGUILayout.BeginHorizontal();
                                EditorGUILayout.LabelField(name, DEShadersStyles.LabelStyle(false, 10));
                                if (GUILayout.Button("Import", DEShadersStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter), GUILayout.Width(width)))
                                {
                                    AssetDatabase.StartAssetEditing();
                                    for (int j = 0; j < packagePaths.Count; j++)
                                    {
                                        if (packagePaths[j] != "")
                                            AssetDatabase.ImportPackage(packagePaths[j], false);
                                    }
                                    AssetDatabase.StopAssetEditing();
                                }
                                EditorGUILayout.EndHorizontal();
#endif
                            }
                            else if (name.Contains(" 8.") || name.Contains(" 8_"))
                            {
#if UNITY_2020_1
                                EditorGUILayout.BeginHorizontal();
                                EditorGUILayout.LabelField(name, DEShadersStyles.LabelStyle(false, 10));
                                if (GUILayout.Button("Import", DEShadersStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter), GUILayout.Width(width)))
                                {
                                    AssetDatabase.StartAssetEditing();
                                    for (int j = 0; j < packagePaths.Count; j++)
                                    {
                                        if (packagePaths[j] != "")
                                            AssetDatabase.ImportPackage(packagePaths[j], false);
                                    }
                                    AssetDatabase.StopAssetEditing();
                                }
                                EditorGUILayout.EndHorizontal();
#endif
                            }

                            else if (name.Contains(" 10.") || name.Contains(" 10_"))
                            {
#if UNITY_2020_2 || UNITY_2020_3
                                EditorGUILayout.BeginHorizontal();
                                EditorGUILayout.LabelField(name, DEShadersStyles.LabelStyle(false, 10));
                                if (GUILayout.Button("Import", DEShadersStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter), GUILayout.Width(width)))
                                {
                                    AssetDatabase.StartAssetEditing();
                                    for (int j = 0; j < packagePaths.Count; j++)
                                    {
                                        if (packagePaths[j] != "")
                                            AssetDatabase.ImportPackage(packagePaths[j], false);
                                    }
                                    AssetDatabase.StopAssetEditing();
                                }
                                EditorGUILayout.EndHorizontal();
#endif
                            }

                            else
                            {
                                EditorGUILayout.BeginHorizontal();
                                EditorGUILayout.LabelField(name, DEShadersStyles.LabelStyle(false, 10));
                                if (GUILayout.Button("Import", DEShadersStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter), GUILayout.Width(width)))
                                {
                                    AssetDatabase.StartAssetEditing();
                                    for (int j = 0; j < packagePaths.Count; j++)
                                    {
                                        if (packagePaths[j] != "")
                                            AssetDatabase.ImportPackage(packagePaths[j], false);
                                    }
                                    AssetDatabase.StopAssetEditing();
                                }
                                EditorGUILayout.EndHorizontal();
                            }
#else
                                if (paths.Paths[i].renderPipeline == MenuPathsRenderPipeline.Standard)
                        {
                            EditorGUILayout.BeginHorizontal();
                            EditorGUILayout.LabelField(paths.Paths[i].name, DEShadersStyles.LabelStyle(false, 10));
                            if (GUILayout.Button("Import", DEShadersStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter), GUILayout.Width(width)))
                            {
                                AssetDatabase.StartAssetEditing();
                                for (int j = 0; j < packagePaths.Count; j++)
                                {
                                    if (packagePaths[j] != "")
                                        AssetDatabase.ImportPackage(packagePaths[j], false);
                                }
                                AssetDatabase.StopAssetEditing();
                            }
                            EditorGUILayout.EndHorizontal();
                        }
#endif
                        }
                    }
                    EditorGUILayout.EndVertical();
                }
            }

            foldoutScene = EditorGUILayout.Foldout(foldoutScene, new GUIContent("Load Demo Scenes"));
            if (foldoutScene)
            {
                if (paths.Paths.Count > 0)
                {

                    EditorGUILayout.BeginVertical("tooltip", GUILayout.Width(375));
                    MenuPathsRenderPipeline pipeline = paths.Paths[0].renderPipeline;
                    pipeline.DrawPipelineGUI();
                    // Labels
                    for (int i = 0; i < paths.Paths.Count; i++)
                    {
                        var scenes2018 = paths.Paths[i].scenePaths2018;
                        var names2018 = paths.Paths[i].names2018;
                        var scenes2019 = paths.Paths[i].scenePaths2019;
                        var names2019 = paths.Paths[i].names2019;
#if UNITY_2019_1_OR_NEWER
                        if (paths.Paths[i].renderPipeline != pipeline)
                        {
                            pipeline = paths.Paths[i].renderPipeline;
                            pipeline.DrawPipelineGUI(i);
                        }

                        for (int j = 0; j < scenes2019.Count; j++)
                        {
                            if (names2019[j].Contains(" 7.") || names2019[j].Contains(" 7_"))
                            {
#if UNITY_2019_4
                                EditorGUILayout.BeginHorizontal();
                                EditorGUILayout.LabelField(names2019[j], DEShadersStyles.LabelStyle(false, 10));
                                if (GUILayout.Button("Load", DEShadersStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter), GUILayout.Width(width)))
                                {
                                    if (scenes2019[j] != "")
                                        scenes2019[j].LoadScene();
                                }
                                EditorGUILayout.EndHorizontal();
#endif
                            }
                            else if (names2019[j].Contains(" 8.") || names2019[j].Contains(" 8_"))
                            {
#if UNITY_2020_1
                                EditorGUILayout.BeginHorizontal();
                                EditorGUILayout.LabelField(names2019[j], DEShadersStyles.LabelStyle(false, 10));
                                if (GUILayout.Button("Load", DEShadersStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter), GUILayout.Width(width)))
                                {
                                    if (scenes2019[j] != "")
                                        scenes2019[j].LoadScene();
                                }
                                EditorGUILayout.EndHorizontal();
#endif
                            }

                            else if (names2019[j].Contains(" 10.") || names2019[j].Contains(" 10_"))
                            {
#if UNITY_2020_2 || UNITY_2020_3
                                EditorGUILayout.BeginHorizontal();
                                EditorGUILayout.LabelField(names2019[j], DEShadersStyles.LabelStyle(false, 10));
                                if (GUILayout.Button("Load", DEShadersStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter), GUILayout.Width(width)))
                                {
                                    if (scenes2019[j] != "")
                                        scenes2019[j].LoadScene();
                                }
                                EditorGUILayout.EndHorizontal();
#endif
                            }


                            else
                            {
                                EditorGUILayout.BeginHorizontal();
                                EditorGUILayout.LabelField(names2019[j], DEShadersStyles.LabelStyle(false, 10));
                                if (GUILayout.Button("Load", DEShadersStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter), GUILayout.Width(width)))
                                {
                                    if (scenes2019[j] != "")
                                        scenes2019[j].LoadScene();
                                }
                                EditorGUILayout.EndHorizontal();
                            }
                        }

#else
                                for (int j = 0; j < scenes2018.Count;j++)
                    {
                        if (paths.Paths[i].renderPipeline == MenuPathsRenderPipeline.Standard)
                        {
                            EditorGUILayout.BeginHorizontal();
                            EditorGUILayout.LabelField(names2018[j], DEShadersStyles.LabelStyle(false, 10));
                            if (GUILayout.Button("Load", DEShadersStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter), GUILayout.Width(width)))
                            {
                                if (scenes2018[j] != "")
                                    scenes2018[j].LoadScene();
                            }
                            EditorGUILayout.EndHorizontal();
                        }
                    }
#endif

                    }
                    EditorGUILayout.EndVertical();
                }
            }
        }
        foldoutRendering = EditorGUILayout.Foldout(foldoutRendering, new GUIContent("Setup Rendering"));
        if (foldoutRendering)
        {
            var popupWidth = 120;
            EditorGUILayout.BeginVertical("tooltip", GUILayout.Width(375));

            EditorGUILayout.LabelField("Global Render Settings", EditorStyles.boldLabel);


            renderingPath.SetRenderPath(popupWidth);
            colorSpace.SetColorSpace(popupWidth);

            EditorGUI.BeginDisabledGroup(DE_Lights.GetApiCompatibilityLevel() == ApiCompatibilityLevel.NET_4_6);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(new GUIContent("Set API Compability Level", "Set API Compability Level to .NET 4.x"), GUILayout.ExpandWidth(true));
            if (GUILayout.Button("Set API", GUILayout.Width(popupWidth)))
                DE_Lights.SetAPICompabilityLevel();
            EditorGUILayout.EndHorizontal();
            EditorGUI.EndDisabledGroup();

            EditorGUILayout.Space();
            EditorGUILayout.EndVertical();

        }

        foldoutLighting = EditorGUILayout.Foldout(foldoutLighting, new GUIContent("Setup Lighting"));
        if (foldoutLighting)
        {
            var popupWidth = 120;
            EditorGUILayout.BeginVertical("tooltip", GUILayout.Width(375));

            EditorGUILayout.LabelField("Global Light Settings", EditorStyles.boldLabel);
            DE_Lights.UseLinearIntensity();
            DE_Lights.UseColorTemperature();
            DE_Lights.BakeLight(popupWidth);
            
            EditorGUILayout.Space();
            EditorGUILayout.EndVertical();
        }

        EditorGUILayout.EndScrollView();
    }
    
}
#endif
