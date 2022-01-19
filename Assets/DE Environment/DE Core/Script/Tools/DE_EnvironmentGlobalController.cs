/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/
using UnityEngine;

using System;
using System.Collections.Generic;

using DEShaders.Utils;

/// <summary>
/// DE Environment Wind
/// </summary>
[ExecuteInEditMode, AddComponentMenu("DE Environment/Global Controller")]
public class DE_EnvironmentGlobalController : MonoBehaviour
{
    #region [General]
    public string DEVersion
    {
        get
        {
            return DEShaders.SchematicVersionControl.VERSION;
        }
    }
    /// <summary>
    ///Unity Wind Zone
    /// </summary>
    public WindZone windZone;
    /// <summary>
    /// Synch WindZone
    /// </summary>
    public bool SynchWindZone = false;
    /// <summary>
    /// Wind Strength
    /// </summary>
    public float WindStrength = 0.01f;
    /// <summary>
    /// Wind Fade Distance Mode
    /// </summary>
    public int FadeWindDistanceMode = 0;
    /// <summary>
    /// Wind Fade Distance
    /// </summary>
    public float FadeWindDistanceBias = 0;
    /// <summary>
    /// Wind Pulse
    /// </summary>
    public float WindPulse = 10f;
    /// <summary>
    /// Wind Turbulence
    /// </summary>
    public float WindTurbulence = 0.01f;
    /// <summary>
    /// Wind Randomness
    /// </summary>
    public float WindRandomness = 0;
    #endregion
    #region [Billboard]
    /// <summary>
    /// Billboard Wind
    /// </summary>
    public bool BillboardEnabled = false;
    /// <summary>
    /// Billboard Wind Influence
    /// </summary>
    public float BillboardIntensity = 0;
    #endregion
    #region [Cloth]
    /// <summary>
    /// Cloth Wind Mode
    /// </summary>
    public bool ClothEnabled = false;
    /// <summary>
    /// Cloth Wind Intensity
    /// </summary>
    public float ClothIntensity = 0;
    #endregion
    #region [Snow]
    /// <summary>
    /// Global Snow Enabled
    /// </summary>
    public bool SnowEnabled = false;
    /// <summary>
    /// Snow Intensity
    /// </summary>
    public float SnowIntensityTopDown = 1;
    /// <summary>
    /// Snow Intensity Bottom Up
    /// </summary>
    public float SnowIntensityBottomUp = 1;
    #endregion
    #region [Rain]
    /// <summary>
    /// Global Rain Enabled
    /// </summary>
    public bool RainEnbaled = false;
    /// <summary>
    /// Rain Intensity
    /// </summary>
    public float RainIntensity = 1;
    /// <summary>
    /// Rain Wetness
    /// </summary>
    public float RainWetness = 0;
    #endregion
    #region [Water]
    /// <summary>
    /// Water Surface Wind enabled
    /// </summary>
    public bool WaterEnabled = false;
    #endregion
    #region [Vegetation Studio Pro]
#if VEGETATION_STUDIO_PRO
        public Texture WindWavesTexture;
        public float WindWavesSize = 10;
        public float WindSpeedFactor = 1;
#endif
    #endregion
    #region [SineSpace]
#if SPACE_PIPELINE
        public ScriptingRuntime scriptingRuntime;

        private PublicScriptVariable
            sWindStrength, sFadeWindDistanceMode, sFadeWindDistanceBias, sWindDirection, sWindPulse, sWindTurbulence, sRandomWind,
            sBillboardWind, sBillboardIntensity,
            sClothEnabled, sClothIntensity,
            sSnowEnabled, sSnowIntensityTopDown, sSnowIntensityBottomUp,
            sRainEnbaled, sRainIntensity, sRainWetness,
            sWaterEnabled;
#endif
    #endregion
    #region [GUI]
    /// <summary>
    /// GUI properties
    /// </summary>
    [HideInInspector] public List<bool> foldouts;
    [HideInInspector] public List<Action> actions;
    [HideInInspector] public List<GUIContent> guiContent;


    #endregion

    #region [Private Variables]
    /// <summary>
    /// Call Back Values
    /// </summary>
    private float windStrength, windDirection, windPulse, windTurbulence;

    /// <summary>
    /// Global Wind Shader Properties
    /// </summary>
    private readonly string _WindStrength = "_Global_Wind_Main_Intensity", _WindFadeDistanceMode = "_Global_Wind_Main_DistanceFade_Enabled", _WindFadeDistanceBias = "_Global_Wind_Main_DistanceFade_Bias" , _WindDirection = "_Global_Wind_Main_Direction", _WindPulse = "_Global_Wind_Main_Pulse", _WindTurbulence = "_Global_Wind_Main_Turbulence", _RandomWind = "_Global_Wind_Main_RandomOffset";
    /// <summary>
    /// Global Wind Billboard Properties
    /// </summary>
    private readonly string _BillboardEnabled = "_Global_Wind_Billboard_Enabled", _BillboardIntensity = "_Global_Wind_Billboard_Intensity";
    /// <summary>
    /// Global Wind Cloth Properties
    /// </summary>
    private readonly string _ClothEnabled = "_Global_Wind_Cloth_Enabled", _Cloth_WindIntensity = "_Global_Wind_Cloth_Intensity";
    /// <summary>
    /// Global Snow Properties
    /// </summary>
    private readonly string _SnowEnabled = "_Global_Snow_Enabled", _SnowIntensity_TopDown = "_Global_Snow_Intensity_TopDown", _SnowIntensity_BottomUp = "_Global_Snow_Intensity_BottomUp";
    /// <summary>
    /// Global Rain Properties
    /// </summary>
    private readonly string _RainEnabled = "_Global_Rain_Enabled", _RainIntensity = "_Global_Rain_Intensity", _RainWetness = "_Global_Rain_Wetness";
    /// <summary>
    /// Global Water Properties
    /// </summary>
    private readonly string _WaterEnabled = "_Global_Wind_Water_Enabled";
    #endregion
    #region [UnityCalls]
    /// <summary>
    /// Resets Global Wind to no Movement when disabled
    /// </summary>
    void OnDisable()
    {
        ResetShaders();
    }
    /// <summary>
    /// Resets Global Wind when component is removed
    /// </summary>
    void OnDestroy()
    {
        ResetShaders();
    }
    /// <summary>
    /// Initialize Windzone when component is enabled
    /// </summary>
    void OnEnable()
    {
        SetShaders();
    }
    /// <summary>
    /// Updates Windzone every Frame
    /// </summary>
    void Update()
    {
        SetUpdateValues();
    }
    /// <summary>
    /// Reset Component
    /// </summary>
    void Reset()
    {
        WindStrength = 0.01f;
        FadeWindDistanceMode = 0;
        FadeWindDistanceBias = 0f;
        WindRandomness = 0f;
        WindPulse = 10f;
        WindTurbulence = 0.01f;

        BillboardEnabled = false;
        BillboardIntensity = 0f;

        ClothEnabled = false;
        ClothIntensity = 1f;

        SnowEnabled = false;
        SnowIntensityTopDown = 1;
        SnowIntensityBottomUp = 1;

        RainEnbaled = false;
        RainIntensity = 1;

        WaterEnabled = false;
        ResetVSPProperties();
        SetShaders();

    }
    #endregion
    #region [Public Voids]
    /// <summary>
    /// Set Updated Values
    /// </summary>
    public void SetUpdateValues()
    {
        GetDefaultValues();
        GetWindZoneValues();
    }
    /// <summary>
    /// Get Shader Values
    /// </summary>
    private void GetDefaultValues()
    {
        if (!SynchWindZone && (windStrength != _WindStrength.GetGlobalFloat() || transform.rotation.eulerAngles.y != _WindDirection.GetGlobalFloat() || windPulse != _WindPulse.GetGlobalFloat() || windTurbulence != _WindTurbulence.GetGlobalFloat() || windDirection != _WindDirection.GetGlobalFloat()))
        {
            SetShaders();
            windStrength = _WindStrength.GetGlobalFloat();
            windDirection = _WindDirection.GetGlobalFloat();
            windPulse = _WindPulse.GetGlobalFloat();
            windTurbulence = _WindTurbulence.GetGlobalFloat();
        }
    }
    /// <summary>
    /// Get Wind Zone Values
    /// </summary>
    private void GetWindZoneValues()
    {
        if (windZone && SynchWindZone && (windZone.windMain != WindStrength || windZone.windPulseFrequency != WindPulse || windZone.windTurbulence != windTurbulence))
        {
            WindStrength = windZone.windMain;
            WindPulse = windZone.windPulseFrequency;
            WindTurbulence = windZone.windTurbulence;
            SetShaders();
        }
    }

    /// <summary>
    /// Update Wind
    /// </summary>
    public void SetShaders()
    {
        // General
        _WindStrength.SetGlobalFloat(WindStrength);
        _WindFadeDistanceMode.SetGlobalInt(FadeWindDistanceMode);
        _WindFadeDistanceBias.SetGlobalFloat(FadeWindDistanceBias);
        _WindDirection.SetGlobalFloat(transform.rotation.eulerAngles.y);
        _WindPulse.SetGlobalFloat(WindPulse);
        _WindTurbulence.SetGlobalFloat(WindTurbulence);
        _RandomWind.SetGlobalFloat(WindRandomness);

        // Billboard
        if (BillboardEnabled)
        {
            _BillboardEnabled.SetGlobalInt(1);
            _BillboardIntensity.SetGlobalFloat(BillboardIntensity);
        }
        else
            _BillboardEnabled.SetGlobalInt(0);

        // Cloth
        if (ClothEnabled)
        {
            _ClothEnabled.SetGlobalInt(1);
            _Cloth_WindIntensity.SetGlobalFloat(ClothIntensity);
        }
        else
            _ClothEnabled.SetGlobalInt(0);

        // Snow
        if (SnowEnabled)
        {
            _SnowEnabled.SetGlobalInt(1);
            _SnowIntensity_TopDown.SetGlobalFloat(SnowIntensityTopDown);
            _SnowIntensity_BottomUp.SetGlobalFloat(SnowIntensityBottomUp);
        }
        else
            _SnowEnabled.SetGlobalInt(0);

        // Rain
        if (RainEnbaled)
        {
            _RainEnabled.SetGlobalInt(1);
            _RainIntensity.SetGlobalFloat(RainIntensity);
            _RainWetness.SetGlobalFloat(RainWetness);
        }
        else
            _RainEnabled.SetGlobalInt(0);

        /// Water
        if (WaterEnabled)
            _WaterEnabled.SetGlobalInt(1);
        else
            _WaterEnabled.SetGlobalInt(0);
        UpdateSineSpace();
    }
    /// <summary>
    /// Reset To Zero
    /// </summary>
    private void ResetShaders()
    {
        _WindStrength.SetGlobalFloat(0);
        _WindFadeDistanceMode.SetGlobalInt(0);
        _WindFadeDistanceBias.SetGlobalFloat(0);
        _WindPulse.SetGlobalFloat(0);
        _WindTurbulence.SetGlobalFloat(0);

        _RandomWind.SetGlobalFloat(0);

        _BillboardEnabled.SetGlobalInt(0);
        _BillboardIntensity.SetGlobalFloat(0);

        _ClothEnabled.SetGlobalInt(0);
        _SnowEnabled.SetGlobalInt(0);
        _RainEnabled.SetGlobalInt(0);
        _RainIntensity.SetGlobalFloat(0);
        _RainWetness.SetGlobalFloat(0);
    }
    #endregion
    #region [Vegetation Studio Pro]
    private void OnRenderObject()
    {
#if VEGETATION_STUDIO_PRO
            if (windZone)
            {
                var dir = windZone.transform.forward;
                var dir4 = new Vector4(dir.x, Mathf.Abs(windZone.windMain) * WindSpeedFactor * 10, dir.z,
                    WindWavesSize);
                Shader.SetGlobalVector("_AW_DIR", dir4);
                if (WindWavesTexture)
                {
                    Shader.SetGlobalTexture("_AW_WavesTex", WindWavesTexture);
                }
            }
#endif
    }
    private void ResetVSPProperties()
    {
#if VEGETATION_STUDIO_PRO
            if (!WindWavesTexture)
                WindWavesTexture = (Texture2D)Resources.Load("PerlinSeamless", typeof(Texture2D));
            WindWavesSize = 10;
            WindSpeedFactor = 1;
        
#endif
    }
    #endregion
    #region [SineSpace]
    private void UpdateSineSpace()
    {
#if SPACE_PIPELINE
            if (!scriptingRuntime)
                return;
            scriptingRuntime.ComponentName = "DE Environment v" + DEVersion; 
            var PublicScriptVariables = new List<PublicScriptVariable>()
            {
                WindStrength.SetPublicScriptVariable(_WindStrength, scriptingRuntime),
                FadeWindDistanceMode.SetPublicScriptVariable(_WindFadeDistanceMode, scriptingRuntime),
                FadeWindDistanceBias.SetPublicScriptVariable(_WindFadeDistanceBias, scriptingRuntime),
                transform.rotation.y.SetPublicScriptVariable(_WindDirection, scriptingRuntime),
                WindPulse.SetPublicScriptVariable(_WindPulse, scriptingRuntime), 
                WindTurbulence.SetPublicScriptVariable(_WindTurbulence, scriptingRuntime),
                WindRandomness.SetPublicScriptVariable(_RandomWind, scriptingRuntime),

                BillboardEnabled.SetPublicScriptVariable(_BillboardEnabled, scriptingRuntime),
                BillboardIntensity.SetPublicScriptVariable(_BillboardIntensity, scriptingRuntime),

                ClothEnabled.SetPublicScriptVariable(_ClothEnabled, scriptingRuntime), 
                ClothIntensity.SetPublicScriptVariable(_Cloth_WindIntensity, scriptingRuntime),

                SnowEnabled.SetPublicScriptVariable(_SnowEnabled, scriptingRuntime), 
                SnowIntensityTopDown.SetPublicScriptVariable(_SnowIntensity_TopDown, scriptingRuntime), 
                SnowIntensityBottomUp.SetPublicScriptVariable(_SnowIntensity_BottomUp, scriptingRuntime),

                RainEnbaled.SetPublicScriptVariable(_RainEnabled, scriptingRuntime),
                RainIntensity.SetPublicScriptVariable(_RainIntensity, scriptingRuntime),
                RainWetness.SetPublicScriptVariable(_RainWetness, scriptingRuntime),

                WaterEnabled.SetPublicScriptVariable(_WaterEnabled, scriptingRuntime)
            };
            scriptingRuntime.PublicVariables = PublicScriptVariables;
            string ScriptContent = "local obj = Space.Host.ExecutingObject\n";
            for (int i = 0; i < PublicScriptVariables.Count; i++)
            {
                ScriptContent += PublicScriptVariables[i].SetGlobalShaderValue();
            }
            ScriptContent += "Space.Log('DE Environment " + DEVersion + "')";
            scriptingRuntime.ScriptContents = ScriptContent;
#endif
    }
    #endregion
}
    #region [SineSpace]
#if SPACE_PIPELINE
    public static class SineSpaceController
    {
        /// <summary>
        /// Set Public float variable
        /// </summary>
        /// <param name="variable">incomming float</param>
        /// <param name="property">shader property => removing Global and "_" for name</param>
        /// <param name="reference">Scripting Runtime Reference</param>
        /// <returns></returns>
        public static PublicScriptVariable SetPublicScriptVariable (this float variable, string property, ScriptingRuntime reference)
        {
            return new PublicScriptVariable()
            {
                Name = property.Replace("Global_","").Replace("_",""),
                FloatVal = variable,
                Type = PublicScriptVariableType.Float,
                ObjectRef = reference
            };
        }
        /// <summary>
        /// Set Public int variable
        /// </summary>
        /// <param name="variable">incomming int</param>
        /// <param name="property">shader property => removing Global and "_" for name</param>
        /// <param name="reference">Scripting Runtime Reference</param>
        /// <returns></returns>
        public static PublicScriptVariable SetPublicScriptVariable(this int variable, string property, ScriptingRuntime reference)
        {
            return new PublicScriptVariable()
            {
                Name = property.Replace("Global_", "").Replace("_", ""),
                IntVal = variable,
                Type = PublicScriptVariableType.Integer,
                ObjectRef = reference
            };
        }
        /// <summary>
        /// Set Public bool variable
        /// </summary>
        /// <param name="variable">incomming bool</param>
        /// <param name="property">shader property => removing Global and "_" for name</param>
        /// <param name="reference">Scripting Runtime Reference</param>
        /// <returns></returns>
        public static PublicScriptVariable SetPublicScriptVariable(this bool variable, string property, ScriptingRuntime reference)
        {
            if(variable)
                return new PublicScriptVariable()
                {
                    Name = property.Replace("Global_", "").Replace("_", ""),
                    IntVal = 1,
                    Type = PublicScriptVariableType.Integer,
                    ObjectRef = reference
                };
            else
                return new PublicScriptVariable()
                {
                    Name = property.Replace("Global_", "").Replace("_", ""),
                    IntVal = 0,
                    Type = PublicScriptVariableType.Integer,
                    ObjectRef = reference
                };
        }
        /// <summary>
        /// Set Global Shader Float in LUA
        /// </summary>
        /// <param name="variable">Public Script Variable</param>
        /// <returns></returns>
        public static string SetGlobalShaderValue(this PublicScriptVariable variable)
        {
            return "Space.RenderSettings.SetGlobalShaderFloat('_" + variable.Name + "', " + variable.Name + ")\n";
        }
    }
#endif
        #endregion
