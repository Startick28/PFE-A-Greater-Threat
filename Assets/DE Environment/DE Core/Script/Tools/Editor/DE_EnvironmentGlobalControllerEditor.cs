/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/
#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

using System.Collections.Generic;

using DEShaders.Utils;
using DEShaders.GraphicalUserInterface;

#if SPACE_PIPELINE
using SineSpace.Scripting.Components;
#endif

[CustomEditor(typeof(DE_EnvironmentGlobalController))]
[CanEditMultipleObjects]
public class DE_EnvironmentGlobalControllerEditor : Editor
{
    #region [Properties]
    /// <summary>
    /// Global Controller
    /// </summary>
    DE_EnvironmentGlobalController controller;
    /// <summary>
    /// Wind Properties
    /// </summary>
    SerializedProperty windZone, SynchWindZone, WindStrength, FadeWindDistanceMode, FadeWindDistanceBias , WindPulse, WindTurbulence, WindRandomness;
    /// <summary>
    /// Billboard Properties
    /// </summary>
    SerializedProperty BillboardEnabled, BillboardIntensity;
    /// <summary>
    /// Cloth Properties
    /// </summary>
    SerializedProperty ClothEnabled, ClothIntensity;
    /// <summary>
    /// Global Snow
    /// </summary>
    SerializedProperty SnowEnabled, SnowIntensityTopDown, SnowIntensityBottomUp;
    /// <summary>
    /// Global rain
    /// </summary>
    SerializedProperty RainEnbaled, RainIntensity, RainWetness;
    /// <summary>
    /// Water Surface affection
    /// </summary>
    SerializedProperty WaterEnabled;
#if VEGETATION_STUDIO_PRO
    /// <summary>
    /// Vegetation Studio Pro
    /// </summary>
    SerializedProperty WindWavesTexture, WindWavesSize, WindSpeedFactor;
    /// <summary>
    /// Vegetation Studio Pro Logo
    /// </summary>
    Texture2D VSPlogo;
#endif
#if SPACE_PIPELINE
    /// <summary>
    /// SineSpace Scripting Runtime
    /// </summary>
    SerializedProperty scriptingRuntime;
    /// <summary>
    /// scripting Runtime Button Content
    /// </summary>
    string scriptingRuntimeButtonContent;
#endif

    /// <summary>
    /// Powered by DE Environment Logo
    /// </summary>
    Texture2D logo;
    /// <summary>
    /// GUI Button
    /// </summary>
    string windZoneButtonContent;
    #endregion
    #region [Unity Actions]
    void OnEnable()
    {
        logo = EditorExtentions.GetTexture2D("T_LogoGlobalController");
        controller = (target as DE_EnvironmentGlobalController);

        windZone = serializedObject.FindProperty("windZone");
        SynchWindZone = serializedObject.FindProperty("SynchWindZone");
        WindStrength = serializedObject.FindProperty("WindStrength");
        FadeWindDistanceMode = serializedObject.FindProperty("FadeWindDistanceMode");
        FadeWindDistanceBias = serializedObject.FindProperty("FadeWindDistanceBias");
        WindPulse = serializedObject.FindProperty("WindPulse");
        WindTurbulence = serializedObject.FindProperty("WindTurbulence");
        WindRandomness = serializedObject.FindProperty("WindRandomness");

        BillboardEnabled = serializedObject.FindProperty("BillboardEnabled");
        BillboardIntensity = serializedObject.FindProperty("BillboardIntensity");

        ClothEnabled = serializedObject.FindProperty("ClothEnabled");
        ClothIntensity = serializedObject.FindProperty("ClothIntensity");

        SnowEnabled = serializedObject.FindProperty("SnowEnabled");
        SnowIntensityTopDown = serializedObject.FindProperty("SnowIntensityTopDown");
        SnowIntensityBottomUp = serializedObject.FindProperty("SnowIntensityBottomUp");

        RainEnbaled = serializedObject.FindProperty("RainEnbaled");
        RainIntensity = serializedObject.FindProperty("RainIntensity");
        RainWetness = serializedObject.FindProperty("RainWetness");

        WaterEnabled = serializedObject.FindProperty("WaterEnabled");

        controller.foldouts = new List<bool>() 
        { 
            true, 
            false,
            false, 
            false
        };
        controller.actions = new List<System.Action>()
        {
            WindGUI,
            SnowGUI, 
            RainGUI,
            WaterGUI
        };
        controller.guiContent = new List<GUIContent>()
        {
            new GUIContent("Wind", "Click here to open wind settings"),
            new GUIContent("Snow", "Click here to open snow settings"),
            new GUIContent("Rain", "Click here to open rain settings"),
            new GUIContent("Water", "Click here to open water settings")
        };

#if VEGETATION_STUDIO_PRO
        WindWavesTexture = serializedObject.FindProperty("WindWavesTexture");
        WindWavesSize = serializedObject.FindProperty("WindWavesSize");
        WindSpeedFactor = serializedObject.FindProperty("WindSpeedFactor");
        VSPlogo = (Texture2D)Resources.Load("AWESOME_Vegetation_Studio_Pro_Editor", typeof(Texture2D));
        controller.foldouts.Add(false);
        controller.actions.Add(VSPGUI);
        controller.guiContent.Add((new GUIContent("Vegetation Studio Pro", "Click here to open Vegetation Studio Pro settings")));
#endif

#if SPACE_PIPELINE
        scriptingRuntime = serializedObject.FindProperty("scriptingRuntime");
        controller.foldouts.Add(false);
        controller.actions.Add(SineSpaceGUI);
        controller.guiContent.Add((new GUIContent("SineSpace", "Click here to open SineSpace settings")));
#endif

    }
    public override void OnInspectorGUI()
    {

        EditorGUI.BeginChangeCheck();

        GeneralGUI();
        for (int i = 0; i < controller.foldouts.Count; i++)
        {
            if (i != controller.foldouts.Count - 1)
                controller.foldouts[i] = controller.foldouts[i].FoldoutField(controller.guiContent[i]);
            else
                controller.foldouts[i] = controller.foldouts[i].FoldoutField(controller.guiContent[i], isLastInRow: true);
            if (controller.foldouts[i])
                controller.actions[i]();
        }
        serializedObject.ApplyModifiedProperties();

        if (EditorGUI.EndChangeCheck())
            controller.SetShaders();
    }
    #endregion
    #region [GUI]
    /// <summary>
    /// General GUI
    /// </summary>
    private void GeneralGUI()
    {
        logo.DisplayLogo("DE Environment Global Controller " + controller.DEVersion);
    }
    /// <summary>
    /// Main Wind GUI
    /// </summary>
    private void WindGUI()
    {
        EditorGUILayout.LabelField("General Wind Setting", EditorStyles.boldLabel);
        EditorGUI.BeginDisabledGroup(controller.SynchWindZone && controller.windZone);
        WindStrength.PropertyField("Intensity", "Main Wind Strength");
        WindTurbulence.PropertyField("Turbulence", "Main Wind Turbulence");
        WindPulse.PropertyField("Pulse Magnitude", "Main Pulse Frequency");
        EditorGUI.EndDisabledGroup();

        EditorGUILayout.Space();
        WindRandomness.SliderField(0, 1, "Random Offset", "Main Wind bending random offset");
        EditorGUILayout.Space();

        WindZoneGUI();
        BillboardWindGUI();
        FadeWindGUI();
        ClothEnabledGUI();
    }
    
    /// <summary>
    /// Main WindZone GUI
    /// </summary>
    private void WindZoneGUI()
    {
        EditorGUILayout.LabelField("Wind Zone", EditorStyles.boldLabel);

        windZone.PropertyField("Wind Zone", "Unity Wind Zone");
        if (!controller.windZone)
        {
            EditorGUILayout.Space();
            EditorGUILayout.BeginHorizontal();
            if (controller.GetComponent<WindZone>())
                windZoneButtonContent = "Add attached Wind Zone";
            else
                windZoneButtonContent = "Add new Wind Zone";
            if (GUILayout.Button(windZoneButtonContent))
            {
                if (controller.GetComponent<WindZone>())
                    controller.windZone = controller.GetComponent<WindZone>();
                else
                    controller.windZone = controller.gameObject.AddComponent<WindZone>();
            }
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.Space();
        }

        EditorGUI.BeginDisabledGroup(!controller.windZone);
        SynchWindZone.PropertyField("Synch with WindZone", "Synch <Global Controller> with Wind Zone");
        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();

    }
    /// <summary>
    /// Billboard GUI
    /// </summary>
    private void BillboardWindGUI()
    {
        EditorGUILayout.LabelField("Billboard Wind Settings", EditorStyles.boldLabel);

        BillboardEnabled.PropertyField("Enabled Billboard Wind");

        EditorGUI.BeginDisabledGroup(!controller.BillboardEnabled);
        BillboardIntensity.SliderField(0, 1, "Intensity");
        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();

    }
    /// <summary>
    /// Fade Wind GUI
    /// </summary>
    private void FadeWindGUI()
    {
        EditorGUILayout.LabelField("Wind Zone", EditorStyles.boldLabel);
        FadeWindDistanceBias.PropertyField("Fade Wind Bias" ,"Higher values, fade will happen at a greater distance");
        FadeWindDistanceMode.intValue = EditorGUILayout.Popup(new GUIContent("Fade Wind Mode", "Fade wind mode selection."),FadeWindDistanceMode.intValue, new string[] {"Off", "Active Fade Out", "Active Fade In"});
        EditorGUILayout.Space();
    }
    /// <summary>
    /// Cloth GUI
    /// </summary>
    private void ClothEnabledGUI()
    {
        EditorGUILayout.LabelField("Cloth Wind Settings", EditorStyles.boldLabel);

        ClothEnabled.PropertyField("Enabled Cloth Wind");

        EditorGUI.BeginDisabledGroup(!controller.ClothEnabled);
        ClothIntensity.SliderField( 0, 2, "Intensity");
        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();

    }
    /// <summary>
    /// Snow GUI
    /// </summary>
    private void SnowGUI()
    {
        EditorGUILayout.LabelField("Global Snow Settings", EditorStyles.boldLabel);

        SnowEnabled.PropertyField("Enabled Global Snow");

        EditorGUI.BeginDisabledGroup(!controller.SnowEnabled);
        SnowIntensityTopDown.SliderField(0, 10, "Intensity Top Down");
        SnowIntensityBottomUp.SliderField(0, 10, "Intensity Bottom Up");
        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    /// <summary>
    /// Rain GUI
    /// </summary>
    private void RainGUI()
    {
        EditorGUILayout.LabelField("Global Rain Settings", EditorStyles.boldLabel);

        RainEnbaled.PropertyField("Enabled Global Rain");

        EditorGUI.BeginDisabledGroup(!controller.RainEnbaled);
        RainIntensity.SliderField(0, 10, "Intensity");
        RainWetness.SliderField(0, 1, "Wetness");
        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    /// <summary>
    /// Water GUI
    /// </summary>
    private void WaterGUI()
    {
        EditorGUILayout.LabelField("Water Wind Settings", EditorStyles.boldLabel);

        WaterEnabled.PropertyField("Enabled Water Wind");
        EditorGUILayout.Space();
    }
#if VEGETATION_STUDIO_PRO

    private void VSPGUI()
    {
        EditorGUILayout.LabelField("Vegetation Studio Pro Settings", EditorStyles.boldLabel);
        VSPlogo.DisplayLogo();
        GUILayout.BeginVertical("box");
        EditorGUILayout.HelpBox("This wind module is used to control the wind for Vegetation Studio grass patches. You need this for scenes that does not have a VegetationSystem component.", MessageType.Info);
        GUILayout.EndVertical();
        GUILayout.BeginVertical("box");
        EditorGUILayout.LabelField(new GUIContent("Wind Wave Noise Texture2D"));
        EditorGUILayout.PropertyField(WindWavesTexture, GUIContent.none);
        GUILayout.EndVertical();
        EditorGUILayout.Space();
        EditorGUILayout.Slider(WindSpeedFactor, 0, 5, new GUIContent("Wind Speed Factor"));
        EditorGUILayout.Slider(WindWavesSize,0, 30, new GUIContent("Wind Wave Size"));
        EditorGUILayout.Space();
    }
#endif
#if SPACE_PIPELINE
    private void SineSpaceGUI()
    {
        EditorGUILayout.LabelField("SineSpace Settings", EditorStyles.boldLabel);
        EditorGUILayout.PropertyField(scriptingRuntime);
        if (!controller.scriptingRuntime)
        {
            EditorGUILayout.Space();
            EditorGUILayout.BeginHorizontal();
            if (controller.GetComponent<ScriptingRuntime>())
                scriptingRuntimeButtonContent = "Add attached Scripting Runtime";
            else
                scriptingRuntimeButtonContent = "Add new Scripting Runtime";
            if (GUILayout.Button(scriptingRuntimeButtonContent))
            {
                if (controller.GetComponent<ScriptingRuntime>())
                    controller.scriptingRuntime = controller.GetComponent<ScriptingRuntime>();
                else
                    controller.scriptingRuntime = controller.gameObject.AddComponent<ScriptingRuntime>();
                controller.scriptingRuntime.PublicVariablesLocked = true;
            }
            EditorGUILayout.EndHorizontal();
        }
        EditorGUILayout.Space();
    }
#endif

#endregion
    #region [Menu Itemm]
    /// <summary>
    /// Create Global DE Enviroment Wind Controller
    /// </summary>
    [MenuItem("Window/DE Environment/Tools/Add Global Controller...", priority = -21)]
    public static void CreateGlobalDEEnviromentWindController()
    {
        GameObject WindController = new GameObject("DE Environment Global Controller");
        var egc = WindController.AddComponent<DE_EnvironmentGlobalController>();
        var wz = WindController.AddComponent<WindZone>();
        egc.windZone = wz;
        egc.SynchWindZone = true;

        if (SceneView.lastActiveSceneView != null)
        {
            WindController.transform.position = Vector3.zero;
        }
    }
    /// <summary>
    /// Create Global DE Enviroment Wind Controller
    /// </summary>
    [MenuItem("GameObject/3D Object/DE Environment/Add Global Controller...", priority = 9999)]
    public static void CreateGlobalDEEnviromentWindControllerGameObject()
    {
        GameObject WindController = new GameObject("DE Environment Global Controller");
        var egc = WindController.AddComponent<DE_EnvironmentGlobalController>();
        var wz = WindController.AddComponent<WindZone>();
        egc.windZone = wz;
        egc.SynchWindZone = true;

        if (SceneView.lastActiveSceneView != null)
        {
            WindController.transform.position = Vector3.zero;
        }
    }
    #endregion
}
#endif
