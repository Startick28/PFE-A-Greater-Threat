// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Cutout Wind/Cutout Wind Translucency"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Enum(Off,0,On,1)]_AlphatoCoverage("Alpha to Coverage", Float) = 0
		[Toggle(_RECEIVE_SHADOWS_OFF)] _RECEIVE_SHADOWS_OFF("Receive Shadows", Float) = 0
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Enum(Default,0,Flip,1,Mirror,2)]_NormalMode("Normal Mode", Int) = 0
		[Enum(Off,0,Active,1)]_GlancingClipMode("Clip Glancing Angle Mode", Int) = 1
		[Header(MAP MAIN TEXTURE)]_Color("Albedo Tint", Color) = (1,1,1,0)
		[SingleLineTexture]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1
		_AlphaCutoffBias("Alpha Cutoff Bias", Range( 0 , 1)) = 0.5
		_AlphaCutoffBiasShadow("Alpha Cutoff Bias Shadow", Range( 0.01 , 1)) = 0.5
		_TilingX("Tiling X", Float) = 1
		_TilingY("Tiling Y", Float) = 1
		_OffsetX("Offset X", Float) = 0
		_OffsetY("Offset Y", Float) = 0
		[Normal][SingleLineTexture]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Float) = 1
		[SingleLineTexture]_MetallicGlossMap("Metallic Map", 2D) = "white" {}
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[SingleLineTexture]_OcclusionMap("Occlusion Map", 2D) = "white" {}
		[Enum(Texture,0,Baked,1)]_OcclusionSourceMode("Occlusion Source Mode", Int) = 1
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.25
		[SingleLineTexture]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Standard,0,Geometric,1,Geometric Fade,2,Texture,3)]_SmoothnessModeCutout("Smoothness Mode", Int) = 3
		[Enum(Smoothness,0,Roughness,1)]_SmoothnessType("Smoothness Type", Int) = 0
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0.1
		_SmoothnessThreshold("Smoothness Threshold", Range( 0 , 0.5)) = 0
		_SmoothnessVariance("Smoothness Variance", Range( 0 , 1)) = 0.2
		[Header(COLOR SHIFT)][Enum(Off,0,Object Space,1,World Space,2,Vertex Color,3,Vertex Normal,4)]_ColorShift_Mode("Mode", Int) = 0
		_ColorShift_ShiftVariation("Shift Variation", Range( 0 , 1)) = 0.2
		_ColorShift_ShiftVariationRGB("Shift Variation RGB", Range( -0.5 , 0.5)) = 0.2
		_ColorShift_ShiftInfluence("Shift Influence ", Range( 0 , 1)) = 0.75
		_ColorShift_ShiftSaturation("Shift Saturation", Range( 0 , 1)) = 0.85
		_ColorShift_NoiseScale("Noise Scale", Range( 0 , 2)) = 1
		[Header(COLOR SHIFT (World Space Mode))]_ColorShift_WorldSpaceDistance("Distance", Range( 0.01 , 5)) = 5
		_ColorShift_WorldSpaceOffset("Offset", Range( -1 , 1)) = 1
		_ColorShift_WorldSpaceNoiseShift("Noise Shift", Range( 1 , 5)) = 5
		[Header(COLOR SHIFT (Mask))][Enum(Off,0,Active,1,Active Inverted,2)]_ColorShift_MaskMode("Mode", Int) = 0
		[SingleLineTexture]_ColorShift_MaskMap("Mask Map", 2D) = "black" {}
		_ColorShift_MaskFuzziness("Mask Fuzziness", Range( 0 , 1)) = 0.25
		[Enum(Off,0,Active,1)][Header(TRANSLUCENCY)]_EnableTranslucency("Enable Translucency", Int) = 0
		[Enum(Texture,0,Baked UV4,1)]_TranslucencySource("Translucency Source", Int) = 0
		[HDR]_TranslucencyTint("Translucency Tint", Color) = (0.575,0.75,0,1)
		[HDR]_TransmissionTint("Transmission Tint", Color) = (0.3833333,0.5,0,1)
		[NoScaleOffset][SingleLineTexture]_TranslucencyMap("Translucency Map", 2D) = "white" {}
		[Enum(Default,0,Inverted,1)]_MapInverted("Map Inverted", Int) = 0
		_TranslucencyThickness("Translucency Thickness", Range( 0 , 1.5)) = 1.5
		[Header(TRANSMISSION  URP)]_URP_TransmissionShadow("Transmission Shadow", Range( 0 , 1)) = 0.5
		[Header(TRANSLUCENCY URP)]_URP_TranslucencyStrength("Translucency Strength", Range( 1 , 50)) = 1
		_URP_TranslucencyNormalDistortion("Translucency Normal Distortion ", Range( 0 , 1)) = 0.2735869
		_URP_TranslucencyScattering("Translucency Scattering ", Range( 1 , 50)) = 2
		_URP_TranslucencyDirect("Translucency Direct ", Range( 0 , 1)) = 0.9
		_URP_TranslucencyAmbient("Translucency Ambient", Range( 0 , 1)) = 0.8339342
		_URP_TranslucencyShadow("Translucency Shadow ", Range( 0 , 1)) = 0.5
		[Enum(Off,0,Global,1,Local,2)][Header(WIND)]_WindMode("Wind Mode", Int) = 1
		[Enum(Leaf,0,Palm,1,Grass,2,Simple,3,Ivy,4)]_WindType("Wind Type", Int) = 0
		[Header(WIND MODE GLOBAL)]_GlobalWindInfluenceOther("Wind Strength", Float) = 1
		_GlobalTurbulenceInfluence("Wind Turbulence", Float) = 0.35
		[Header(WIND MODE LOCAL)]_LocalWindStrength("Wind Strength", Float) = 1
		_LocalWindPulse("Wind Pulse", Float) = 0.1
		_LocalWindTurbulence("Wind Turbulence", Float) = 0.35
		_LocalWindDirection("Wind Direction", Float) = 1
		[ASEEnd]_LocalRandomWindOffset("Wind Random Offset", Float) = 0.2
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry-10" "NatureRendererInstancing"="True" }
		Cull [_CullMode]
		AlphaToMask [_AlphatoCoverage]
		HLSLINCLUDE
		#pragma target 3.5

		#pragma prefer_hlslcc gles
		

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS

		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" "NatureRendererInstancing"="True" }
			
			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma multi_compile _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS _ADDITIONAL_OFF
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_COLOR
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TranslucencyTint;
			half4 _TransmissionTint;
			float4 _Color;
			float4 _ColorShift_MaskMap_ST;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_ShiftVariation;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMode;
			float _MetallicStrength;
			int _SmoothnessModeCutout;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _GlancingClipMode;
			int _SmoothnessType;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			half _AlphaCutoffBiasShadow;
			int _EnableTranslucency;
			int _MapInverted;
			float _TranslucencyThickness;
			float _ColorShift_WorldSpaceOffset;
			float _ColorShift_WorldSpaceNoiseShift;
			float _ColorShift_NoiseScale;
			int _ColorShift_MaskMode;
			float _URP_TransmissionShadow;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyShadow;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyDirect;
			float _URP_TranslucencyNormalDistortion;
			float _URP_TranslucencyScattering;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _TranslucencySource;
			int _ZWriteMode;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_ColorShift_MaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);
			TEXTURE2D(_TranslucencyMap);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float floatswitch2458_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float floatswitch2326_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float3 float3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3466( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float floatswitch168_g40020( int m_switch, float m_Off, float m_ObjectSpace, float m_WorldSpace, float m_VertexColor, float m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float(0);
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float4 float4switch313_g40020( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch364_g40020( int m_switch, float4 m_Off, float4 m_ObjectSpace, float4 m_WorldSpace, float4 m_VertexColor, float4 m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float4(0,0,0,0);
			}
			
			float3 float3switch56_g40030( int m_switch, float3 m_Default, float3 m_Flip, float3 m_Mirror )
			{
				if(m_switch ==0)
					return m_Default;
				else if(m_switch ==1)
					return m_Flip;
				else if(m_switch ==2)
					return m_Mirror;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch37_g40030( int m_switch, float3 m_Default, float3 m_Flip, float3 m_Mirror )
			{
				if(m_switch ==0)
					return m_Default;
				else if(m_switch ==1)
					return m_Flip;
				else if(m_switch ==2)
					return m_Mirror;
				else
				return float3(0,0,0);
			}
			
			float3 AdditionalLightsFlatMask( float3 WorldPosition, float4 ShadowMask )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				#if ASE_SRP_VERSION >= 100000
					Light light = GetAdditionalLight(i, WorldPosition, ShadowMask);
				#else
					Light light = GetAdditionalLight(i, WorldPosition);
				#endif
					Color += light.color *(light.distanceAttenuation * light.shadowAttenuation);
					
				}
				#endif
				return Color;
			}
			
			float floatswitch1287_g39969( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			float4 float4switch189_g39970( int m_switch, float4 m_Smoothness, float4 m_Roughness )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch188_g39970( int m_switch, float4 m_Standard, float4 m_Geometric, float4 m_GeometricFade, float4 m_Texture )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Geometric;
				else if(m_switch ==2)
					return m_GeometricFade;
				else if(m_switch ==3)
					return m_Texture;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch( int m_switch, float4 m_Default, float4 m_Inverted )
			{
				if(m_switch ==0)
					return m_Default;
				else if(m_switch ==1)
					return m_Inverted;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch72_g40000( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch50_g40000( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int _WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = _WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localfloatswitch2458_g3466 = floatswitch2458_g3466( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localfloatswitch2458_g3466;
				int m_switch2468_g3466 = _WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3466 = floatswitch2468_g3466( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = _WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localfloatswitch2312_g3466 = floatswitch2312_g3466( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = _WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localfloatswitch2456_g3466 = floatswitch2456_g3466( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = _WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localfloatswitch2326_g3466 = floatswitch2326_g3466( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3466 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localfloat3switch2439_g3466 = float3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localfloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localfloat3switch2439_g3466;
				float3 localfloat3switch2453_g3466 = float3switch2453_g3466( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localfloat3switch3050_g3466 = float3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g39969 = localfloat3switch3050_g3466;
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_texcoord8 = v.vertex;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord7.zw = v.ase_texcoord3.xy;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_1234_0_g39969;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord = v.texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag ( VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						, FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				int m_switch364_g40020 = _ColorShift_Mode;
				float2 appendResult168_g39969 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g39969 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g40008 = IN.ase_texcoord7.xy * appendResult168_g39969 + appendResult167_g39969;
				float2 appendResult6_g40008 = (float2(texCoord2_g40008.x , texCoord2_g40008.y));
				float2 OUT_UV213_g39969 = appendResult6_g40008;
				float2 UV40_g40014 = OUT_UV213_g39969;
				float4 tex2DNode63_g40014 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g40014 );
				float4 ALBEDO_RGBA1381_g39969 = tex2DNode63_g40014;
				float3 temp_output_3_0_g39969 = ( (_Color).rgb * (ALBEDO_RGBA1381_g39969).rgb * _Brightness );
				float3 temp_output_134_0_g40020 = temp_output_3_0_g39969;
				float4 m_Off364_g40020 = float4( temp_output_134_0_g40020 , 0.0 );
				int m_switch313_g40020 = _ColorShift_MaskMode;
				int MODE176_g40020 = _ColorShift_Mode;
				int m_switch168_g40020 = MODE176_g40020;
				float m_Off168_g40020 = 0.0;
				float m_ObjectSpace168_g40020 = ( _ColorShift_NoiseScale / 3 );
				float3 p1_g40021 = ( WorldPosition * _ColorShift_WorldSpaceNoiseShift );
				float localSimpleNoise3D1_g40021 = SimpleNoise3D( p1_g40021 );
				float4 transform374_g40020 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord8);
				float m_WorldSpace168_g40020 = ( ( localSimpleNoise3D1_g40021 / _ColorShift_NoiseScale ) - ( ( (transform374_g40020).w - _ColorShift_WorldSpaceOffset ) / _ColorShift_WorldSpaceDistance ) );
				float m_VertexColor168_g40020 = ( IN.ase_color.g - 0.5 );
				float m_VertexNormal168_g40020 = ( IN.ase_normal.y - 0.5 );
				float localfloatswitch168_g40020 = floatswitch168_g40020( m_switch168_g40020 , m_Off168_g40020 , m_ObjectSpace168_g40020 , m_WorldSpace168_g40020 , m_VertexColor168_g40020 , m_VertexNormal168_g40020 );
				float temp_output_112_0_g40020 = sin( ( _ColorShift_NoiseScale * PI ) );
				float3 ALBEDO_IN136_g40020 = temp_output_134_0_g40020;
				float2 appendResult120_g40020 = (float2(( (0.3 + (( 1.0 - temp_output_112_0_g40020 ) - 0.0) * (1.0 - 0.3) / (1.0 - 0.0)) * float4( ALBEDO_IN136_g40020 , 0.0 ).x ) , 0.0));
				float2 RGB146_g40020 = appendResult120_g40020;
				float3 hsvTorgb122_g40020 = RGBToHSV( float3( RGB146_g40020 ,  0.0 ) );
				float VALUE219_g40020 = temp_output_112_0_g40020;
				float3 hsvTorgb126_g40020 = HSVToRGB( float3(( ( saturate( localfloatswitch168_g40020 ) * _ColorShift_ShiftVariation ) + _ColorShift_ShiftVariationRGB + hsvTorgb122_g40020 ).x,( _ColorShift_ShiftSaturation * hsvTorgb122_g40020.y ),( hsvTorgb122_g40020.z + ( VALUE219_g40020 / 40 ) )) );
				float4 m_Off313_g40020 = float4( hsvTorgb126_g40020 , 0.0 );
				float2 uv_ColorShift_MaskMap = IN.ase_texcoord7.xy * _ColorShift_MaskMap_ST.xy + _ColorShift_MaskMap_ST.zw;
				float4 transform376_g40020 = mul(GetObjectToWorldMatrix(),float4( IN.ase_texcoord8.xyz , 0.0 ));
				float4 temp_output_337_0_g40020 = saturate( ( 1.0 - ( ( SAMPLE_TEXTURE2D( _ColorShift_MaskMap, sampler_trilinear_repeat, uv_ColorShift_MaskMap ) * transform376_g40020 ) / max( _ColorShift_MaskFuzziness , 1E-05 ) ) ) );
				float3 lerpResult314_g40020 = lerp( hsvTorgb126_g40020 , ALBEDO_IN136_g40020 , temp_output_337_0_g40020.rgb);
				float4 m_Active313_g40020 = float4( lerpResult314_g40020 , 0.0 );
				float3 lerpResult311_g40020 = lerp( ALBEDO_IN136_g40020 , hsvTorgb126_g40020 , temp_output_337_0_g40020.rgb);
				float4 m_ActiveInverted313_g40020 = float4( lerpResult311_g40020 , 0.0 );
				float4 localfloat4switch313_g40020 = float4switch313_g40020( m_switch313_g40020 , m_Off313_g40020 , m_Active313_g40020 , m_ActiveInverted313_g40020 );
				float4 lerpResult297_g40020 = lerp( float4( temp_output_134_0_g40020 , 0.0 ) , localfloat4switch313_g40020 , _ColorShift_ShiftInfluence);
				float4 m_ObjectSpace364_g40020 = lerpResult297_g40020;
				float4 m_WorldSpace364_g40020 = lerpResult297_g40020;
				float4 m_VertexColor364_g40020 = lerpResult297_g40020;
				float4 m_VertexNormal364_g40020 = lerpResult297_g40020;
				float4 localfloat4switch364_g40020 = float4switch364_g40020( m_switch364_g40020 , m_Off364_g40020 , m_ObjectSpace364_g40020 , m_WorldSpace364_g40020 , m_VertexColor364_g40020 , m_VertexNormal364_g40020 );
				
				float4 NORMAL_RGB1382_g39969 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g40014 );
				float4 temp_output_1_0_g40012 = NORMAL_RGB1382_g39969;
				float temp_output_8_0_g40012 = _NormalStrength;
				float3 unpack52_g40012 = UnpackNormalScale( temp_output_1_0_g40012, temp_output_8_0_g40012 );
				unpack52_g40012.z = lerp( 1, unpack52_g40012.z, saturate(temp_output_8_0_g40012) );
				float3 temp_output_1519_59_g39969 = unpack52_g40012;
				float3 NORMAL_IN42_g40030 = temp_output_1519_59_g39969;
				int m_switch56_g40030 = _NormalMode;
				float3 m_Default56_g40030 = float3(1,1,1);
				float3 m_Flip56_g40030 = float3(-1,-1,-1);
				float3 m_Mirror56_g40030 = float3(1,1,-1);
				float3 localfloat3switch56_g40030 = float3switch56_g40030( m_switch56_g40030 , m_Default56_g40030 , m_Flip56_g40030 , m_Mirror56_g40030 );
				float3 switchResult58_g40030 = (((ase_vface>0)?(NORMAL_IN42_g40030):(( NORMAL_IN42_g40030 * localfloat3switch56_g40030 ))));
				int m_switch37_g40030 = _NormalMode;
				float3 m_Default37_g40030 = NORMAL_IN42_g40030;
				float3 m_Flip37_g40030 = ( NORMAL_IN42_g40030 * ase_vface );
				float3 break33_g40030 = NORMAL_IN42_g40030;
				float3 appendResult41_g40030 = (float3(break33_g40030.x , break33_g40030.y , ( break33_g40030.z * ase_vface )));
				float3 m_Mirror37_g40030 = appendResult41_g40030;
				float3 localfloat3switch37_g40030 = float3switch37_g40030( m_switch37_g40030 , m_Default37_g40030 , m_Flip37_g40030 , m_Mirror37_g40030 );
				float3 temp_output_1610_30_g39969 = localfloat3switch37_g40030;
				float3 NORMAL_OUT1491_g39969 = temp_output_1610_30_g39969;
				float3 temp_output_16_0_g40002 = NORMAL_OUT1491_g39969;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal134_g40002 = temp_output_16_0_g40002;
				float3 worldNormal134_g40002 = float3(dot(tanToWorld0,tanNormal134_g40002), dot(tanToWorld1,tanNormal134_g40002), dot(tanToWorld2,tanNormal134_g40002));
				float3 NORMAL_TANGENTSPACE135_g40002 = worldNormal134_g40002;
				float3 WorldPosition63_g40002 = NORMAL_TANGENTSPACE135_g40002;
				float4 shadowMaskValue77_g40002 = float4(1,1,1,1);
				float4 ShadowMask63_g40002 = shadowMaskValue77_g40002;
				float3 localAdditionalLightsFlatMask63_g40002 = AdditionalLightsFlatMask( WorldPosition63_g40002 , ShadowMask63_g40002 );
				float3 ADDITIONAL_LIGHT1212_g39969 = localAdditionalLightsFlatMask63_g40002;
				
				float4 MASK_B1377_g39969 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g40014 );
				
				int m_switch188_g39970 = _SmoothnessModeCutout;
				float3 tanNormal1608_g39969 = NORMAL_OUT1491_g39969;
				float3 worldNormal1608_g39969 = normalize( float3(dot(tanToWorld0,tanNormal1608_g39969), dot(tanToWorld1,tanNormal1608_g39969), dot(tanToWorld2,tanNormal1608_g39969)) );
				float3 temp_output_4_0_g39970 = worldNormal1608_g39969;
				float3 temp_output_178_0_g39970 = ddx( temp_output_4_0_g39970 );
				float dotResult195_g39970 = dot( temp_output_178_0_g39970 , temp_output_178_0_g39970 );
				float3 temp_output_175_0_g39970 = ddy( temp_output_4_0_g39970 );
				float dotResult201_g39970 = dot( temp_output_175_0_g39970 , temp_output_175_0_g39970 );
				float temp_output_196_0_g39970 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult195_g39970 + dotResult201_g39970 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
				float ALBEDO_R172_g39969 = tex2DNode63_g40014.r;
				float4 temp_cast_15 = (ALBEDO_R172_g39969).xxxx;
				float4 temp_output_9_0_g39970 = temp_cast_15;
				float4 m_Standard188_g39970 = ( min( temp_output_196_0_g39970 , 0.5 ) * ( 1.0 - ( temp_output_9_0_g39970 * float4( 0.79,0,0,0 ) ) ) );
				float4 temp_output_187_0_g39970 = ( 1.0 - temp_output_9_0_g39970 );
				float4 m_Geometric188_g39970 = ( temp_output_196_0_g39970 * temp_output_187_0_g39970 );
				float ALBEDO_A926_g39969 = tex2DNode63_g40014.a;
				int m_switch1287_g39969 = _GlancingClipMode;
				float m_Off1287_g39969 = 1.0;
				float3 normalizeResult1294_g39969 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult1301_g39969 = dot( WorldViewDirection , normalizeResult1294_g39969 );
				float temp_output_1321_0_g39969 = ( 1.0 - abs( dotResult1301_g39969 ) );
				float m_Active1287_g39969 = ( 1.0 - ( temp_output_1321_0_g39969 * temp_output_1321_0_g39969 ) );
				float localfloatswitch1287_g39969 = floatswitch1287_g39969( m_switch1287_g39969 , m_Off1287_g39969 , m_Active1287_g39969 );
				float OPACITY_OUTMASK1277_g39969 = localfloatswitch1287_g39969;
				float CLIP_OPACITY200_g39969 = ( ALBEDO_A926_g39969 * OPACITY_OUTMASK1277_g39969 );
				float4 temp_cast_16 = (CLIP_OPACITY200_g39969).xxxx;
				float4 m_GeometricFade188_g39970 = ( temp_output_196_0_g39970 * temp_output_187_0_g39970 * temp_cast_16 );
				int m_switch189_g39970 = _SmoothnessType;
				float4 MASK_G158_g39969 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g40014 );
				float4 temp_output_83_0_g39970 = MASK_G158_g39969;
				float4 m_Smoothness189_g39970 = temp_output_83_0_g39970;
				float4 m_Roughness189_g39970 = ( 1.0 - temp_output_83_0_g39970 );
				float4 localfloat4switch189_g39970 = float4switch189_g39970( m_switch189_g39970 , m_Smoothness189_g39970 , m_Roughness189_g39970 );
				float4 m_Texture188_g39970 = ( temp_output_196_0_g39970 * localfloat4switch189_g39970 );
				float4 localfloat4switch188_g39970 = float4switch188_g39970( m_switch188_g39970 , m_Standard188_g39970 , m_Geometric188_g39970 , m_GeometricFade188_g39970 , m_Texture188_g39970 );
				float4 temp_output_1324_33_g39969 = localfloat4switch188_g39970;
				float4 color1225_g39969 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 MASK_R1378_g39969 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g40014 );
				float4 temp_cast_18 = (IN.ase_color.a).xxxx;
				float4 lerpResult28_g39969 = lerp( MASK_R1378_g39969 , temp_cast_18 , (float)_OcclusionSourceMode);
				float4 lerpResult7_g39969 = lerp( color1225_g39969 , lerpResult28_g39969 , _OcclusionStrengthAO);
				
				float AlphaCutoffBias1289_g39969 = _AlphaCutoffBias;
				
				int m_switch72_g40000 = _EnableTranslucency;
				float4 m_Off72_g40000 = float4( 0,0,0,0 );
				int m_switch38_g40000 = _MapInverted;
				float4 color71_g40000 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 tex2DNode27_g40000 = SAMPLE_TEXTURE2D( _TranslucencyMap, sampler_trilinear_repeat, OUT_UV213_g39969 );
				float4 lerpResult34_g40000 = lerp( color71_g40000 , tex2DNode27_g40000 , _TranslucencyThickness);
				float4 m_Default38_g40000 = lerpResult34_g40000;
				float temp_output_69_0_g40000 = ( 0.0 - 1.0 );
				float temp_output_22_0_g40000 = ( tex2DNode27_g40000.r - 1.0 );
				float lerpResult66_g40000 = lerp( ( temp_output_69_0_g40000 / temp_output_22_0_g40000 ) , ( temp_output_22_0_g40000 / temp_output_69_0_g40000 ) , ( 0.7 + _TranslucencyThickness ));
				float4 temp_cast_24 = (saturate( lerpResult66_g40000 )).xxxx;
				float4 m_Inverted38_g40000 = temp_cast_24;
				float4 localfloat4switch38_g40000 = float4switch( m_switch38_g40000 , m_Default38_g40000 , m_Inverted38_g40000 );
				float lerpResult30_g40000 = lerp( 0.0 , ( 5.0 - IN.ase_texcoord7.zw.x ) , _TranslucencyThickness);
				float4 temp_cast_25 = (lerpResult30_g40000).xxxx;
				float4 lerpResult46_g40000 = lerp( localfloat4switch38_g40000 , temp_cast_25 , (float)_TranslucencySource);
				float3 temp_output_90_0_g40000 = saturate( ( _MainLightColor.rgb * _MainLightColor.a ) );
				float4 m_Active72_g40000 = ( ( _TransmissionTint * _TransmissionTint.a * lerpResult46_g40000 ) * float4( temp_output_90_0_g40000 , 0.0 ) );
				float4 localfloat4switch72_g40000 = float4switch72_g40000( m_switch72_g40000 , m_Off72_g40000 , m_Active72_g40000 );
				
				int m_switch50_g40000 = _EnableTranslucency;
				float4 m_Off50_g40000 = float4( 0,0,0,0 );
				float4 m_Active50_g40000 = ( ( _TranslucencyTint * _TranslucencyTint.a * lerpResult46_g40000 ) * float4( temp_output_90_0_g40000 , 0.0 ) );
				float4 localfloat4switch50_g40000 = float4switch50_g40000( m_switch50_g40000 , m_Off50_g40000 , m_Active50_g40000 );
				
				float3 Albedo = ( localfloat4switch364_g40020 + float4(0,0,0,0) ).xyz;
				float3 Normal = ( switchResult58_g40030 + ADDITIONAL_LIGHT1212_g39969 );
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( _MetallicStrength * MASK_B1377_g39969 ).r;
				float Smoothness = ( temp_output_1324_33_g39969 * lerpResult7_g39969 ).x;
				float Occlusion = saturate( lerpResult7_g39969 ).r;
				float Alpha = ( ALBEDO_A926_g39969 * OPACITY_OUTMASK1277_g39969 );
				float AlphaClipThreshold = AlphaCutoffBias1289_g39969;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = localfloat4switch72_g40000.xyz;
				float3 Translucency = localfloat4switch50_g40000.xyz;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				
				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _URP_TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _URP_TransmissionShadow;
					float normal = _URP_TranslucencyNormalDistortion;
					float scattering = _URP_TranslucencyScattering;
					float direct = _URP_TranslucencyDirect;
					float ambient = _URP_TranslucencyAmbient;
					float strength = _URP_TranslucencyStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TranslucencyTint;
			half4 _TransmissionTint;
			float4 _Color;
			float4 _ColorShift_MaskMap_ST;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_ShiftVariation;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMode;
			float _MetallicStrength;
			int _SmoothnessModeCutout;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _GlancingClipMode;
			int _SmoothnessType;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			half _AlphaCutoffBiasShadow;
			int _EnableTranslucency;
			int _MapInverted;
			float _TranslucencyThickness;
			float _ColorShift_WorldSpaceOffset;
			float _ColorShift_WorldSpaceNoiseShift;
			float _ColorShift_NoiseScale;
			int _ColorShift_MaskMode;
			float _URP_TransmissionShadow;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyShadow;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyDirect;
			float _URP_TranslucencyNormalDistortion;
			float _URP_TranslucencyScattering;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _TranslucencySource;
			int _ZWriteMode;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float floatswitch2458_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float floatswitch2326_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float3 float3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3466( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1287_g39969( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int _WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = _WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localfloatswitch2458_g3466 = floatswitch2458_g3466( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localfloatswitch2458_g3466;
				int m_switch2468_g3466 = _WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3466 = floatswitch2468_g3466( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = _WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localfloatswitch2312_g3466 = floatswitch2312_g3466( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = _WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localfloatswitch2456_g3466 = floatswitch2456_g3466( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = _WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localfloatswitch2326_g3466 = floatswitch2326_g3466( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3466 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localfloat3switch2439_g3466 = float3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localfloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localfloat3switch2439_g3466;
				float3 localfloat3switch2453_g3466 = float3switch2453_g3466( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localfloat3switch3050_g3466 = float3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g39969 = localfloat3switch3050_g3466;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_1234_0_g39969;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = clipPos;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
				
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 appendResult168_g39969 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g39969 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g40008 = IN.ase_texcoord2.xy * appendResult168_g39969 + appendResult167_g39969;
				float2 appendResult6_g40008 = (float2(texCoord2_g40008.x , texCoord2_g40008.y));
				float2 OUT_UV213_g39969 = appendResult6_g40008;
				float2 UV40_g40014 = OUT_UV213_g39969;
				float4 tex2DNode63_g40014 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g40014 );
				float ALBEDO_A926_g39969 = tex2DNode63_g40014.a;
				int m_switch1287_g39969 = _GlancingClipMode;
				float m_Off1287_g39969 = 1.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult1294_g39969 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult1301_g39969 = dot( ase_worldViewDir , normalizeResult1294_g39969 );
				float temp_output_1321_0_g39969 = ( 1.0 - abs( dotResult1301_g39969 ) );
				float m_Active1287_g39969 = ( 1.0 - ( temp_output_1321_0_g39969 * temp_output_1321_0_g39969 ) );
				float localfloatswitch1287_g39969 = floatswitch1287_g39969( m_switch1287_g39969 , m_Off1287_g39969 , m_Active1287_g39969 );
				float OPACITY_OUTMASK1277_g39969 = localfloatswitch1287_g39969;
				
				float AlphaCutoffBias1289_g39969 = _AlphaCutoffBias;
				
				float Alpha = ( ALBEDO_A926_g39969 * OPACITY_OUTMASK1277_g39969 );
				float AlphaClipThreshold = AlphaCutoffBias1289_g39969;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TranslucencyTint;
			half4 _TransmissionTint;
			float4 _Color;
			float4 _ColorShift_MaskMap_ST;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_ShiftVariation;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMode;
			float _MetallicStrength;
			int _SmoothnessModeCutout;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _GlancingClipMode;
			int _SmoothnessType;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			half _AlphaCutoffBiasShadow;
			int _EnableTranslucency;
			int _MapInverted;
			float _TranslucencyThickness;
			float _ColorShift_WorldSpaceOffset;
			float _ColorShift_WorldSpaceNoiseShift;
			float _ColorShift_NoiseScale;
			int _ColorShift_MaskMode;
			float _URP_TransmissionShadow;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyShadow;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyDirect;
			float _URP_TranslucencyNormalDistortion;
			float _URP_TranslucencyScattering;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _TranslucencySource;
			int _ZWriteMode;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float floatswitch2458_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float floatswitch2326_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float3 float3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3466( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1287_g39969( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int _WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = _WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localfloatswitch2458_g3466 = floatswitch2458_g3466( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localfloatswitch2458_g3466;
				int m_switch2468_g3466 = _WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3466 = floatswitch2468_g3466( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = _WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localfloatswitch2312_g3466 = floatswitch2312_g3466( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = _WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localfloatswitch2456_g3466 = floatswitch2456_g3466( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = _WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localfloatswitch2326_g3466 = floatswitch2326_g3466( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3466 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localfloat3switch2439_g3466 = float3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localfloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localfloat3switch2439_g3466;
				float3 localfloat3switch2453_g3466 = float3switch2453_g3466( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localfloat3switch3050_g3466 = float3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g39969 = localfloat3switch3050_g3466;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_1234_0_g39969;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 appendResult168_g39969 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g39969 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g40008 = IN.ase_texcoord2.xy * appendResult168_g39969 + appendResult167_g39969;
				float2 appendResult6_g40008 = (float2(texCoord2_g40008.x , texCoord2_g40008.y));
				float2 OUT_UV213_g39969 = appendResult6_g40008;
				float2 UV40_g40014 = OUT_UV213_g39969;
				float4 tex2DNode63_g40014 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g40014 );
				float ALBEDO_A926_g39969 = tex2DNode63_g40014.a;
				int m_switch1287_g39969 = _GlancingClipMode;
				float m_Off1287_g39969 = 1.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult1294_g39969 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult1301_g39969 = dot( ase_worldViewDir , normalizeResult1294_g39969 );
				float temp_output_1321_0_g39969 = ( 1.0 - abs( dotResult1301_g39969 ) );
				float m_Active1287_g39969 = ( 1.0 - ( temp_output_1321_0_g39969 * temp_output_1321_0_g39969 ) );
				float localfloatswitch1287_g39969 = floatswitch1287_g39969( m_switch1287_g39969 , m_Off1287_g39969 , m_Active1287_g39969 );
				float OPACITY_OUTMASK1277_g39969 = localfloatswitch1287_g39969;
				
				float AlphaCutoffBias1289_g39969 = _AlphaCutoffBias;
				
				float Alpha = ( ALBEDO_A926_g39969 * OPACITY_OUTMASK1277_g39969 );
				float AlphaClipThreshold = AlphaCutoffBias1289_g39969;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}
		
		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TranslucencyTint;
			half4 _TransmissionTint;
			float4 _Color;
			float4 _ColorShift_MaskMap_ST;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_ShiftVariation;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMode;
			float _MetallicStrength;
			int _SmoothnessModeCutout;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _GlancingClipMode;
			int _SmoothnessType;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			half _AlphaCutoffBiasShadow;
			int _EnableTranslucency;
			int _MapInverted;
			float _TranslucencyThickness;
			float _ColorShift_WorldSpaceOffset;
			float _ColorShift_WorldSpaceNoiseShift;
			float _ColorShift_NoiseScale;
			int _ColorShift_MaskMode;
			float _URP_TransmissionShadow;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyShadow;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyDirect;
			float _URP_TranslucencyNormalDistortion;
			float _URP_TranslucencyScattering;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _TranslucencySource;
			int _ZWriteMode;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_ColorShift_MaskMap);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float floatswitch2458_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float floatswitch2326_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float3 float3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3466( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float floatswitch168_g40020( int m_switch, float m_Off, float m_ObjectSpace, float m_WorldSpace, float m_VertexColor, float m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float(0);
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float4 float4switch313_g40020( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch364_g40020( int m_switch, float4 m_Off, float4 m_ObjectSpace, float4 m_WorldSpace, float4 m_VertexColor, float4 m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float4(0,0,0,0);
			}
			
			float floatswitch1287_g39969( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int _WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = _WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localfloatswitch2458_g3466 = floatswitch2458_g3466( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localfloatswitch2458_g3466;
				int m_switch2468_g3466 = _WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3466 = floatswitch2468_g3466( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = _WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localfloatswitch2312_g3466 = floatswitch2312_g3466( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = _WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localfloatswitch2456_g3466 = floatswitch2456_g3466( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = _WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localfloatswitch2326_g3466 = floatswitch2326_g3466( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3466 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localfloat3switch2439_g3466 = float3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localfloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localfloat3switch2439_g3466;
				float3 localfloat3switch2453_g3466 = float3switch2453_g3466( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localfloat3switch3050_g3466 = float3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g39969 = localfloat3switch3050_g3466;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_texcoord3 = v.vertex;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_1234_0_g39969;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				int m_switch364_g40020 = _ColorShift_Mode;
				float2 appendResult168_g39969 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g39969 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g40008 = IN.ase_texcoord2.xy * appendResult168_g39969 + appendResult167_g39969;
				float2 appendResult6_g40008 = (float2(texCoord2_g40008.x , texCoord2_g40008.y));
				float2 OUT_UV213_g39969 = appendResult6_g40008;
				float2 UV40_g40014 = OUT_UV213_g39969;
				float4 tex2DNode63_g40014 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g40014 );
				float4 ALBEDO_RGBA1381_g39969 = tex2DNode63_g40014;
				float3 temp_output_3_0_g39969 = ( (_Color).rgb * (ALBEDO_RGBA1381_g39969).rgb * _Brightness );
				float3 temp_output_134_0_g40020 = temp_output_3_0_g39969;
				float4 m_Off364_g40020 = float4( temp_output_134_0_g40020 , 0.0 );
				int m_switch313_g40020 = _ColorShift_MaskMode;
				int MODE176_g40020 = _ColorShift_Mode;
				int m_switch168_g40020 = MODE176_g40020;
				float m_Off168_g40020 = 0.0;
				float m_ObjectSpace168_g40020 = ( _ColorShift_NoiseScale / 3 );
				float3 p1_g40021 = ( WorldPosition * _ColorShift_WorldSpaceNoiseShift );
				float localSimpleNoise3D1_g40021 = SimpleNoise3D( p1_g40021 );
				float4 transform374_g40020 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord3);
				float m_WorldSpace168_g40020 = ( ( localSimpleNoise3D1_g40021 / _ColorShift_NoiseScale ) - ( ( (transform374_g40020).w - _ColorShift_WorldSpaceOffset ) / _ColorShift_WorldSpaceDistance ) );
				float m_VertexColor168_g40020 = ( IN.ase_color.g - 0.5 );
				float m_VertexNormal168_g40020 = ( IN.ase_normal.y - 0.5 );
				float localfloatswitch168_g40020 = floatswitch168_g40020( m_switch168_g40020 , m_Off168_g40020 , m_ObjectSpace168_g40020 , m_WorldSpace168_g40020 , m_VertexColor168_g40020 , m_VertexNormal168_g40020 );
				float temp_output_112_0_g40020 = sin( ( _ColorShift_NoiseScale * PI ) );
				float3 ALBEDO_IN136_g40020 = temp_output_134_0_g40020;
				float2 appendResult120_g40020 = (float2(( (0.3 + (( 1.0 - temp_output_112_0_g40020 ) - 0.0) * (1.0 - 0.3) / (1.0 - 0.0)) * float4( ALBEDO_IN136_g40020 , 0.0 ).x ) , 0.0));
				float2 RGB146_g40020 = appendResult120_g40020;
				float3 hsvTorgb122_g40020 = RGBToHSV( float3( RGB146_g40020 ,  0.0 ) );
				float VALUE219_g40020 = temp_output_112_0_g40020;
				float3 hsvTorgb126_g40020 = HSVToRGB( float3(( ( saturate( localfloatswitch168_g40020 ) * _ColorShift_ShiftVariation ) + _ColorShift_ShiftVariationRGB + hsvTorgb122_g40020 ).x,( _ColorShift_ShiftSaturation * hsvTorgb122_g40020.y ),( hsvTorgb122_g40020.z + ( VALUE219_g40020 / 40 ) )) );
				float4 m_Off313_g40020 = float4( hsvTorgb126_g40020 , 0.0 );
				float2 uv_ColorShift_MaskMap = IN.ase_texcoord2.xy * _ColorShift_MaskMap_ST.xy + _ColorShift_MaskMap_ST.zw;
				float4 transform376_g40020 = mul(GetObjectToWorldMatrix(),float4( IN.ase_texcoord3.xyz , 0.0 ));
				float4 temp_output_337_0_g40020 = saturate( ( 1.0 - ( ( SAMPLE_TEXTURE2D( _ColorShift_MaskMap, sampler_trilinear_repeat, uv_ColorShift_MaskMap ) * transform376_g40020 ) / max( _ColorShift_MaskFuzziness , 1E-05 ) ) ) );
				float3 lerpResult314_g40020 = lerp( hsvTorgb126_g40020 , ALBEDO_IN136_g40020 , temp_output_337_0_g40020.rgb);
				float4 m_Active313_g40020 = float4( lerpResult314_g40020 , 0.0 );
				float3 lerpResult311_g40020 = lerp( ALBEDO_IN136_g40020 , hsvTorgb126_g40020 , temp_output_337_0_g40020.rgb);
				float4 m_ActiveInverted313_g40020 = float4( lerpResult311_g40020 , 0.0 );
				float4 localfloat4switch313_g40020 = float4switch313_g40020( m_switch313_g40020 , m_Off313_g40020 , m_Active313_g40020 , m_ActiveInverted313_g40020 );
				float4 lerpResult297_g40020 = lerp( float4( temp_output_134_0_g40020 , 0.0 ) , localfloat4switch313_g40020 , _ColorShift_ShiftInfluence);
				float4 m_ObjectSpace364_g40020 = lerpResult297_g40020;
				float4 m_WorldSpace364_g40020 = lerpResult297_g40020;
				float4 m_VertexColor364_g40020 = lerpResult297_g40020;
				float4 m_VertexNormal364_g40020 = lerpResult297_g40020;
				float4 localfloat4switch364_g40020 = float4switch364_g40020( m_switch364_g40020 , m_Off364_g40020 , m_ObjectSpace364_g40020 , m_WorldSpace364_g40020 , m_VertexColor364_g40020 , m_VertexNormal364_g40020 );
				
				float ALBEDO_A926_g39969 = tex2DNode63_g40014.a;
				int m_switch1287_g39969 = _GlancingClipMode;
				float m_Off1287_g39969 = 1.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult1294_g39969 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult1301_g39969 = dot( ase_worldViewDir , normalizeResult1294_g39969 );
				float temp_output_1321_0_g39969 = ( 1.0 - abs( dotResult1301_g39969 ) );
				float m_Active1287_g39969 = ( 1.0 - ( temp_output_1321_0_g39969 * temp_output_1321_0_g39969 ) );
				float localfloatswitch1287_g39969 = floatswitch1287_g39969( m_switch1287_g39969 , m_Off1287_g39969 , m_Active1287_g39969 );
				float OPACITY_OUTMASK1277_g39969 = localfloatswitch1287_g39969;
				
				float AlphaCutoffBias1289_g39969 = _AlphaCutoffBias;
				
				
				float3 Albedo = ( localfloat4switch364_g40020 + float4(0,0,0,0) ).xyz;
				float3 Emission = 0;
				float Alpha = ( ALBEDO_A926_g39969 * OPACITY_OUTMASK1277_g39969 );
				float AlphaClipThreshold = AlphaCutoffBias1289_g39969;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TranslucencyTint;
			half4 _TransmissionTint;
			float4 _Color;
			float4 _ColorShift_MaskMap_ST;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_ShiftVariation;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMode;
			float _MetallicStrength;
			int _SmoothnessModeCutout;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _GlancingClipMode;
			int _SmoothnessType;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			half _AlphaCutoffBiasShadow;
			int _EnableTranslucency;
			int _MapInverted;
			float _TranslucencyThickness;
			float _ColorShift_WorldSpaceOffset;
			float _ColorShift_WorldSpaceNoiseShift;
			float _ColorShift_NoiseScale;
			int _ColorShift_MaskMode;
			float _URP_TransmissionShadow;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyShadow;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyDirect;
			float _URP_TranslucencyNormalDistortion;
			float _URP_TranslucencyScattering;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _TranslucencySource;
			int _ZWriteMode;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_ColorShift_MaskMap);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float floatswitch2458_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float floatswitch2326_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float3 float3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3466( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float floatswitch168_g40020( int m_switch, float m_Off, float m_ObjectSpace, float m_WorldSpace, float m_VertexColor, float m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float(0);
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float4 float4switch313_g40020( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch364_g40020( int m_switch, float4 m_Off, float4 m_ObjectSpace, float4 m_WorldSpace, float4 m_VertexColor, float4 m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float4(0,0,0,0);
			}
			
			float floatswitch1287_g39969( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int _WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = _WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localfloatswitch2458_g3466 = floatswitch2458_g3466( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localfloatswitch2458_g3466;
				int m_switch2468_g3466 = _WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3466 = floatswitch2468_g3466( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = _WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localfloatswitch2312_g3466 = floatswitch2312_g3466( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = _WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localfloatswitch2456_g3466 = floatswitch2456_g3466( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = _WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localfloatswitch2326_g3466 = floatswitch2326_g3466( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3466 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localfloat3switch2439_g3466 = float3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localfloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localfloat3switch2439_g3466;
				float3 localfloat3switch2453_g3466 = float3switch2453_g3466( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localfloat3switch3050_g3466 = float3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g39969 = localfloat3switch3050_g3466;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_texcoord3 = v.vertex;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_1234_0_g39969;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				int m_switch364_g40020 = _ColorShift_Mode;
				float2 appendResult168_g39969 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g39969 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g40008 = IN.ase_texcoord2.xy * appendResult168_g39969 + appendResult167_g39969;
				float2 appendResult6_g40008 = (float2(texCoord2_g40008.x , texCoord2_g40008.y));
				float2 OUT_UV213_g39969 = appendResult6_g40008;
				float2 UV40_g40014 = OUT_UV213_g39969;
				float4 tex2DNode63_g40014 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g40014 );
				float4 ALBEDO_RGBA1381_g39969 = tex2DNode63_g40014;
				float3 temp_output_3_0_g39969 = ( (_Color).rgb * (ALBEDO_RGBA1381_g39969).rgb * _Brightness );
				float3 temp_output_134_0_g40020 = temp_output_3_0_g39969;
				float4 m_Off364_g40020 = float4( temp_output_134_0_g40020 , 0.0 );
				int m_switch313_g40020 = _ColorShift_MaskMode;
				int MODE176_g40020 = _ColorShift_Mode;
				int m_switch168_g40020 = MODE176_g40020;
				float m_Off168_g40020 = 0.0;
				float m_ObjectSpace168_g40020 = ( _ColorShift_NoiseScale / 3 );
				float3 p1_g40021 = ( WorldPosition * _ColorShift_WorldSpaceNoiseShift );
				float localSimpleNoise3D1_g40021 = SimpleNoise3D( p1_g40021 );
				float4 transform374_g40020 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord3);
				float m_WorldSpace168_g40020 = ( ( localSimpleNoise3D1_g40021 / _ColorShift_NoiseScale ) - ( ( (transform374_g40020).w - _ColorShift_WorldSpaceOffset ) / _ColorShift_WorldSpaceDistance ) );
				float m_VertexColor168_g40020 = ( IN.ase_color.g - 0.5 );
				float m_VertexNormal168_g40020 = ( IN.ase_normal.y - 0.5 );
				float localfloatswitch168_g40020 = floatswitch168_g40020( m_switch168_g40020 , m_Off168_g40020 , m_ObjectSpace168_g40020 , m_WorldSpace168_g40020 , m_VertexColor168_g40020 , m_VertexNormal168_g40020 );
				float temp_output_112_0_g40020 = sin( ( _ColorShift_NoiseScale * PI ) );
				float3 ALBEDO_IN136_g40020 = temp_output_134_0_g40020;
				float2 appendResult120_g40020 = (float2(( (0.3 + (( 1.0 - temp_output_112_0_g40020 ) - 0.0) * (1.0 - 0.3) / (1.0 - 0.0)) * float4( ALBEDO_IN136_g40020 , 0.0 ).x ) , 0.0));
				float2 RGB146_g40020 = appendResult120_g40020;
				float3 hsvTorgb122_g40020 = RGBToHSV( float3( RGB146_g40020 ,  0.0 ) );
				float VALUE219_g40020 = temp_output_112_0_g40020;
				float3 hsvTorgb126_g40020 = HSVToRGB( float3(( ( saturate( localfloatswitch168_g40020 ) * _ColorShift_ShiftVariation ) + _ColorShift_ShiftVariationRGB + hsvTorgb122_g40020 ).x,( _ColorShift_ShiftSaturation * hsvTorgb122_g40020.y ),( hsvTorgb122_g40020.z + ( VALUE219_g40020 / 40 ) )) );
				float4 m_Off313_g40020 = float4( hsvTorgb126_g40020 , 0.0 );
				float2 uv_ColorShift_MaskMap = IN.ase_texcoord2.xy * _ColorShift_MaskMap_ST.xy + _ColorShift_MaskMap_ST.zw;
				float4 transform376_g40020 = mul(GetObjectToWorldMatrix(),float4( IN.ase_texcoord3.xyz , 0.0 ));
				float4 temp_output_337_0_g40020 = saturate( ( 1.0 - ( ( SAMPLE_TEXTURE2D( _ColorShift_MaskMap, sampler_trilinear_repeat, uv_ColorShift_MaskMap ) * transform376_g40020 ) / max( _ColorShift_MaskFuzziness , 1E-05 ) ) ) );
				float3 lerpResult314_g40020 = lerp( hsvTorgb126_g40020 , ALBEDO_IN136_g40020 , temp_output_337_0_g40020.rgb);
				float4 m_Active313_g40020 = float4( lerpResult314_g40020 , 0.0 );
				float3 lerpResult311_g40020 = lerp( ALBEDO_IN136_g40020 , hsvTorgb126_g40020 , temp_output_337_0_g40020.rgb);
				float4 m_ActiveInverted313_g40020 = float4( lerpResult311_g40020 , 0.0 );
				float4 localfloat4switch313_g40020 = float4switch313_g40020( m_switch313_g40020 , m_Off313_g40020 , m_Active313_g40020 , m_ActiveInverted313_g40020 );
				float4 lerpResult297_g40020 = lerp( float4( temp_output_134_0_g40020 , 0.0 ) , localfloat4switch313_g40020 , _ColorShift_ShiftInfluence);
				float4 m_ObjectSpace364_g40020 = lerpResult297_g40020;
				float4 m_WorldSpace364_g40020 = lerpResult297_g40020;
				float4 m_VertexColor364_g40020 = lerpResult297_g40020;
				float4 m_VertexNormal364_g40020 = lerpResult297_g40020;
				float4 localfloat4switch364_g40020 = float4switch364_g40020( m_switch364_g40020 , m_Off364_g40020 , m_ObjectSpace364_g40020 , m_WorldSpace364_g40020 , m_VertexColor364_g40020 , m_VertexNormal364_g40020 );
				
				float ALBEDO_A926_g39969 = tex2DNode63_g40014.a;
				int m_switch1287_g39969 = _GlancingClipMode;
				float m_Off1287_g39969 = 1.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult1294_g39969 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult1301_g39969 = dot( ase_worldViewDir , normalizeResult1294_g39969 );
				float temp_output_1321_0_g39969 = ( 1.0 - abs( dotResult1301_g39969 ) );
				float m_Active1287_g39969 = ( 1.0 - ( temp_output_1321_0_g39969 * temp_output_1321_0_g39969 ) );
				float localfloatswitch1287_g39969 = floatswitch1287_g39969( m_switch1287_g39969 , m_Off1287_g39969 , m_Active1287_g39969 );
				float OPACITY_OUTMASK1277_g39969 = localfloatswitch1287_g39969;
				
				float AlphaCutoffBias1289_g39969 = _AlphaCutoffBias;
				
				
				float3 Albedo = ( localfloat4switch364_g40020 + float4(0,0,0,0) ).xyz;
				float Alpha = ( ALBEDO_A926_g39969 * OPACITY_OUTMASK1277_g39969 );
				float AlphaClipThreshold = AlphaCutoffBias1289_g39969;

				half4 color = half4( Albedo, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
            ZTest LEqual
            ZWrite On

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float3 worldNormal : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TranslucencyTint;
			half4 _TransmissionTint;
			float4 _Color;
			float4 _ColorShift_MaskMap_ST;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_ShiftVariation;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMode;
			float _MetallicStrength;
			int _SmoothnessModeCutout;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _GlancingClipMode;
			int _SmoothnessType;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			half _AlphaCutoffBiasShadow;
			int _EnableTranslucency;
			int _MapInverted;
			float _TranslucencyThickness;
			float _ColorShift_WorldSpaceOffset;
			float _ColorShift_WorldSpaceNoiseShift;
			float _ColorShift_NoiseScale;
			int _ColorShift_MaskMode;
			float _URP_TransmissionShadow;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyShadow;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyDirect;
			float _URP_TranslucencyNormalDistortion;
			float _URP_TranslucencyScattering;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _TranslucencySource;
			int _ZWriteMode;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float floatswitch2458_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float floatswitch2326_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float3 float3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3466( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1287_g39969( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int _WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = _WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localfloatswitch2458_g3466 = floatswitch2458_g3466( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localfloatswitch2458_g3466;
				int m_switch2468_g3466 = _WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3466 = floatswitch2468_g3466( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = _WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localfloatswitch2312_g3466 = floatswitch2312_g3466( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = _WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localfloatswitch2456_g3466 = floatswitch2456_g3466( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = _WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localfloatswitch2326_g3466 = floatswitch2326_g3466( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3466 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localfloat3switch2439_g3466 = float3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localfloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localfloat3switch2439_g3466;
				float3 localfloat3switch2453_g3466 = float3switch2453_g3466( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localfloat3switch3050_g3466 = float3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g39969 = localfloat3switch3050_g3466;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_1234_0_g39969;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal( v.ase_normal );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.worldNormal = normalWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 appendResult168_g39969 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g39969 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g40008 = IN.ase_texcoord3.xy * appendResult168_g39969 + appendResult167_g39969;
				float2 appendResult6_g40008 = (float2(texCoord2_g40008.x , texCoord2_g40008.y));
				float2 OUT_UV213_g39969 = appendResult6_g40008;
				float2 UV40_g40014 = OUT_UV213_g39969;
				float4 tex2DNode63_g40014 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g40014 );
				float ALBEDO_A926_g39969 = tex2DNode63_g40014.a;
				int m_switch1287_g39969 = _GlancingClipMode;
				float m_Off1287_g39969 = 1.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult1294_g39969 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult1301_g39969 = dot( ase_worldViewDir , normalizeResult1294_g39969 );
				float temp_output_1321_0_g39969 = ( 1.0 - abs( dotResult1301_g39969 ) );
				float m_Active1287_g39969 = ( 1.0 - ( temp_output_1321_0_g39969 * temp_output_1321_0_g39969 ) );
				float localfloatswitch1287_g39969 = floatswitch1287_g39969( m_switch1287_g39969 , m_Off1287_g39969 , m_Active1287_g39969 );
				float OPACITY_OUTMASK1277_g39969 = localfloatswitch1287_g39969;
				
				float AlphaCutoffBias1289_g39969 = _AlphaCutoffBias;
				
				float Alpha = ( ALBEDO_A926_g39969 * OPACITY_OUTMASK1277_g39969 );
				float AlphaClipThreshold = AlphaCutoffBias1289_g39969;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif
				
				return float4(PackNormalOctRectEncode(TransformWorldToViewDir(IN.worldNormal, true)), 0.0, 0.0);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }
			
			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _GBUFFER_NORMALS_OCT
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_COLOR
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _TranslucencyTint;
			half4 _TransmissionTint;
			float4 _Color;
			float4 _ColorShift_MaskMap_ST;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_ShiftVariation;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMode;
			float _MetallicStrength;
			int _SmoothnessModeCutout;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _GlancingClipMode;
			int _SmoothnessType;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			half _AlphaCutoffBiasShadow;
			int _EnableTranslucency;
			int _MapInverted;
			float _TranslucencyThickness;
			float _ColorShift_WorldSpaceOffset;
			float _ColorShift_WorldSpaceNoiseShift;
			float _ColorShift_NoiseScale;
			int _ColorShift_MaskMode;
			float _URP_TransmissionShadow;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyShadow;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyDirect;
			float _URP_TranslucencyNormalDistortion;
			float _URP_TranslucencyScattering;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _TranslucencySource;
			int _ZWriteMode;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_ColorShift_MaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);
			TEXTURE2D(_TranslucencyMap);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float floatswitch2458_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float floatswitch2326_g3466( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float3 float3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3466( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float floatswitch168_g40020( int m_switch, float m_Off, float m_ObjectSpace, float m_WorldSpace, float m_VertexColor, float m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float(0);
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float4 float4switch313_g40020( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch364_g40020( int m_switch, float4 m_Off, float4 m_ObjectSpace, float4 m_WorldSpace, float4 m_VertexColor, float4 m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float4(0,0,0,0);
			}
			
			float3 float3switch56_g40030( int m_switch, float3 m_Default, float3 m_Flip, float3 m_Mirror )
			{
				if(m_switch ==0)
					return m_Default;
				else if(m_switch ==1)
					return m_Flip;
				else if(m_switch ==2)
					return m_Mirror;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch37_g40030( int m_switch, float3 m_Default, float3 m_Flip, float3 m_Mirror )
			{
				if(m_switch ==0)
					return m_Default;
				else if(m_switch ==1)
					return m_Flip;
				else if(m_switch ==2)
					return m_Mirror;
				else
				return float3(0,0,0);
			}
			
			float3 AdditionalLightsFlatMask( float3 WorldPosition, float4 ShadowMask )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				#if ASE_SRP_VERSION >= 100000
					Light light = GetAdditionalLight(i, WorldPosition, ShadowMask);
				#else
					Light light = GetAdditionalLight(i, WorldPosition);
				#endif
					Color += light.color *(light.distanceAttenuation * light.shadowAttenuation);
					
				}
				#endif
				return Color;
			}
			
			float floatswitch1287_g39969( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			float4 float4switch189_g39970( int m_switch, float4 m_Smoothness, float4 m_Roughness )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch188_g39970( int m_switch, float4 m_Standard, float4 m_Geometric, float4 m_GeometricFade, float4 m_Texture )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Geometric;
				else if(m_switch ==2)
					return m_GeometricFade;
				else if(m_switch ==3)
					return m_Texture;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch( int m_switch, float4 m_Default, float4 m_Inverted )
			{
				if(m_switch ==0)
					return m_Default;
				else if(m_switch ==1)
					return m_Inverted;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch72_g40000( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch50_g40000( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int _WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = _WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localfloatswitch2458_g3466 = floatswitch2458_g3466( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localfloatswitch2458_g3466;
				int m_switch2468_g3466 = _WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3466 = floatswitch2468_g3466( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = _WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localfloatswitch2312_g3466 = floatswitch2312_g3466( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = _WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localfloatswitch2456_g3466 = floatswitch2456_g3466( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = _WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localfloatswitch2326_g3466 = floatswitch2326_g3466( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * v.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3466 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localfloat3switch2439_g3466 = float3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localfloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localfloat3switch2439_g3466;
				float3 localfloat3switch2453_g3466 = float3switch2453_g3466( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localfloat3switch3050_g3466 = float3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g39969 = localfloat3switch3050_g3466;
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_texcoord8 = v.vertex;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord7.zw = v.ase_texcoord3.xy;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_1234_0_g39969;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord = v.texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			FragmentOutput frag ( VertexOutput IN 
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								, FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				int m_switch364_g40020 = _ColorShift_Mode;
				float2 appendResult168_g39969 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g39969 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g40008 = IN.ase_texcoord7.xy * appendResult168_g39969 + appendResult167_g39969;
				float2 appendResult6_g40008 = (float2(texCoord2_g40008.x , texCoord2_g40008.y));
				float2 OUT_UV213_g39969 = appendResult6_g40008;
				float2 UV40_g40014 = OUT_UV213_g39969;
				float4 tex2DNode63_g40014 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g40014 );
				float4 ALBEDO_RGBA1381_g39969 = tex2DNode63_g40014;
				float3 temp_output_3_0_g39969 = ( (_Color).rgb * (ALBEDO_RGBA1381_g39969).rgb * _Brightness );
				float3 temp_output_134_0_g40020 = temp_output_3_0_g39969;
				float4 m_Off364_g40020 = float4( temp_output_134_0_g40020 , 0.0 );
				int m_switch313_g40020 = _ColorShift_MaskMode;
				int MODE176_g40020 = _ColorShift_Mode;
				int m_switch168_g40020 = MODE176_g40020;
				float m_Off168_g40020 = 0.0;
				float m_ObjectSpace168_g40020 = ( _ColorShift_NoiseScale / 3 );
				float3 p1_g40021 = ( WorldPosition * _ColorShift_WorldSpaceNoiseShift );
				float localSimpleNoise3D1_g40021 = SimpleNoise3D( p1_g40021 );
				float4 transform374_g40020 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord8);
				float m_WorldSpace168_g40020 = ( ( localSimpleNoise3D1_g40021 / _ColorShift_NoiseScale ) - ( ( (transform374_g40020).w - _ColorShift_WorldSpaceOffset ) / _ColorShift_WorldSpaceDistance ) );
				float m_VertexColor168_g40020 = ( IN.ase_color.g - 0.5 );
				float m_VertexNormal168_g40020 = ( IN.ase_normal.y - 0.5 );
				float localfloatswitch168_g40020 = floatswitch168_g40020( m_switch168_g40020 , m_Off168_g40020 , m_ObjectSpace168_g40020 , m_WorldSpace168_g40020 , m_VertexColor168_g40020 , m_VertexNormal168_g40020 );
				float temp_output_112_0_g40020 = sin( ( _ColorShift_NoiseScale * PI ) );
				float3 ALBEDO_IN136_g40020 = temp_output_134_0_g40020;
				float2 appendResult120_g40020 = (float2(( (0.3 + (( 1.0 - temp_output_112_0_g40020 ) - 0.0) * (1.0 - 0.3) / (1.0 - 0.0)) * float4( ALBEDO_IN136_g40020 , 0.0 ).x ) , 0.0));
				float2 RGB146_g40020 = appendResult120_g40020;
				float3 hsvTorgb122_g40020 = RGBToHSV( float3( RGB146_g40020 ,  0.0 ) );
				float VALUE219_g40020 = temp_output_112_0_g40020;
				float3 hsvTorgb126_g40020 = HSVToRGB( float3(( ( saturate( localfloatswitch168_g40020 ) * _ColorShift_ShiftVariation ) + _ColorShift_ShiftVariationRGB + hsvTorgb122_g40020 ).x,( _ColorShift_ShiftSaturation * hsvTorgb122_g40020.y ),( hsvTorgb122_g40020.z + ( VALUE219_g40020 / 40 ) )) );
				float4 m_Off313_g40020 = float4( hsvTorgb126_g40020 , 0.0 );
				float2 uv_ColorShift_MaskMap = IN.ase_texcoord7.xy * _ColorShift_MaskMap_ST.xy + _ColorShift_MaskMap_ST.zw;
				float4 transform376_g40020 = mul(GetObjectToWorldMatrix(),float4( IN.ase_texcoord8.xyz , 0.0 ));
				float4 temp_output_337_0_g40020 = saturate( ( 1.0 - ( ( SAMPLE_TEXTURE2D( _ColorShift_MaskMap, sampler_trilinear_repeat, uv_ColorShift_MaskMap ) * transform376_g40020 ) / max( _ColorShift_MaskFuzziness , 1E-05 ) ) ) );
				float3 lerpResult314_g40020 = lerp( hsvTorgb126_g40020 , ALBEDO_IN136_g40020 , temp_output_337_0_g40020.rgb);
				float4 m_Active313_g40020 = float4( lerpResult314_g40020 , 0.0 );
				float3 lerpResult311_g40020 = lerp( ALBEDO_IN136_g40020 , hsvTorgb126_g40020 , temp_output_337_0_g40020.rgb);
				float4 m_ActiveInverted313_g40020 = float4( lerpResult311_g40020 , 0.0 );
				float4 localfloat4switch313_g40020 = float4switch313_g40020( m_switch313_g40020 , m_Off313_g40020 , m_Active313_g40020 , m_ActiveInverted313_g40020 );
				float4 lerpResult297_g40020 = lerp( float4( temp_output_134_0_g40020 , 0.0 ) , localfloat4switch313_g40020 , _ColorShift_ShiftInfluence);
				float4 m_ObjectSpace364_g40020 = lerpResult297_g40020;
				float4 m_WorldSpace364_g40020 = lerpResult297_g40020;
				float4 m_VertexColor364_g40020 = lerpResult297_g40020;
				float4 m_VertexNormal364_g40020 = lerpResult297_g40020;
				float4 localfloat4switch364_g40020 = float4switch364_g40020( m_switch364_g40020 , m_Off364_g40020 , m_ObjectSpace364_g40020 , m_WorldSpace364_g40020 , m_VertexColor364_g40020 , m_VertexNormal364_g40020 );
				
				float4 NORMAL_RGB1382_g39969 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g40014 );
				float4 temp_output_1_0_g40012 = NORMAL_RGB1382_g39969;
				float temp_output_8_0_g40012 = _NormalStrength;
				float3 unpack52_g40012 = UnpackNormalScale( temp_output_1_0_g40012, temp_output_8_0_g40012 );
				unpack52_g40012.z = lerp( 1, unpack52_g40012.z, saturate(temp_output_8_0_g40012) );
				float3 temp_output_1519_59_g39969 = unpack52_g40012;
				float3 NORMAL_IN42_g40030 = temp_output_1519_59_g39969;
				int m_switch56_g40030 = _NormalMode;
				float3 m_Default56_g40030 = float3(1,1,1);
				float3 m_Flip56_g40030 = float3(-1,-1,-1);
				float3 m_Mirror56_g40030 = float3(1,1,-1);
				float3 localfloat3switch56_g40030 = float3switch56_g40030( m_switch56_g40030 , m_Default56_g40030 , m_Flip56_g40030 , m_Mirror56_g40030 );
				float3 switchResult58_g40030 = (((ase_vface>0)?(NORMAL_IN42_g40030):(( NORMAL_IN42_g40030 * localfloat3switch56_g40030 ))));
				int m_switch37_g40030 = _NormalMode;
				float3 m_Default37_g40030 = NORMAL_IN42_g40030;
				float3 m_Flip37_g40030 = ( NORMAL_IN42_g40030 * ase_vface );
				float3 break33_g40030 = NORMAL_IN42_g40030;
				float3 appendResult41_g40030 = (float3(break33_g40030.x , break33_g40030.y , ( break33_g40030.z * ase_vface )));
				float3 m_Mirror37_g40030 = appendResult41_g40030;
				float3 localfloat3switch37_g40030 = float3switch37_g40030( m_switch37_g40030 , m_Default37_g40030 , m_Flip37_g40030 , m_Mirror37_g40030 );
				float3 temp_output_1610_30_g39969 = localfloat3switch37_g40030;
				float3 NORMAL_OUT1491_g39969 = temp_output_1610_30_g39969;
				float3 temp_output_16_0_g40002 = NORMAL_OUT1491_g39969;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal134_g40002 = temp_output_16_0_g40002;
				float3 worldNormal134_g40002 = float3(dot(tanToWorld0,tanNormal134_g40002), dot(tanToWorld1,tanNormal134_g40002), dot(tanToWorld2,tanNormal134_g40002));
				float3 NORMAL_TANGENTSPACE135_g40002 = worldNormal134_g40002;
				float3 WorldPosition63_g40002 = NORMAL_TANGENTSPACE135_g40002;
				float4 shadowMaskValue77_g40002 = float4(1,1,1,1);
				float4 ShadowMask63_g40002 = shadowMaskValue77_g40002;
				float3 localAdditionalLightsFlatMask63_g40002 = AdditionalLightsFlatMask( WorldPosition63_g40002 , ShadowMask63_g40002 );
				float3 ADDITIONAL_LIGHT1212_g39969 = localAdditionalLightsFlatMask63_g40002;
				
				float4 MASK_B1377_g39969 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g40014 );
				
				int m_switch188_g39970 = _SmoothnessModeCutout;
				float3 tanNormal1608_g39969 = NORMAL_OUT1491_g39969;
				float3 worldNormal1608_g39969 = normalize( float3(dot(tanToWorld0,tanNormal1608_g39969), dot(tanToWorld1,tanNormal1608_g39969), dot(tanToWorld2,tanNormal1608_g39969)) );
				float3 temp_output_4_0_g39970 = worldNormal1608_g39969;
				float3 temp_output_178_0_g39970 = ddx( temp_output_4_0_g39970 );
				float dotResult195_g39970 = dot( temp_output_178_0_g39970 , temp_output_178_0_g39970 );
				float3 temp_output_175_0_g39970 = ddy( temp_output_4_0_g39970 );
				float dotResult201_g39970 = dot( temp_output_175_0_g39970 , temp_output_175_0_g39970 );
				float temp_output_196_0_g39970 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult195_g39970 + dotResult201_g39970 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
				float ALBEDO_R172_g39969 = tex2DNode63_g40014.r;
				float4 temp_cast_15 = (ALBEDO_R172_g39969).xxxx;
				float4 temp_output_9_0_g39970 = temp_cast_15;
				float4 m_Standard188_g39970 = ( min( temp_output_196_0_g39970 , 0.5 ) * ( 1.0 - ( temp_output_9_0_g39970 * float4( 0.79,0,0,0 ) ) ) );
				float4 temp_output_187_0_g39970 = ( 1.0 - temp_output_9_0_g39970 );
				float4 m_Geometric188_g39970 = ( temp_output_196_0_g39970 * temp_output_187_0_g39970 );
				float ALBEDO_A926_g39969 = tex2DNode63_g40014.a;
				int m_switch1287_g39969 = _GlancingClipMode;
				float m_Off1287_g39969 = 1.0;
				float3 normalizeResult1294_g39969 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult1301_g39969 = dot( WorldViewDirection , normalizeResult1294_g39969 );
				float temp_output_1321_0_g39969 = ( 1.0 - abs( dotResult1301_g39969 ) );
				float m_Active1287_g39969 = ( 1.0 - ( temp_output_1321_0_g39969 * temp_output_1321_0_g39969 ) );
				float localfloatswitch1287_g39969 = floatswitch1287_g39969( m_switch1287_g39969 , m_Off1287_g39969 , m_Active1287_g39969 );
				float OPACITY_OUTMASK1277_g39969 = localfloatswitch1287_g39969;
				float CLIP_OPACITY200_g39969 = ( ALBEDO_A926_g39969 * OPACITY_OUTMASK1277_g39969 );
				float4 temp_cast_16 = (CLIP_OPACITY200_g39969).xxxx;
				float4 m_GeometricFade188_g39970 = ( temp_output_196_0_g39970 * temp_output_187_0_g39970 * temp_cast_16 );
				int m_switch189_g39970 = _SmoothnessType;
				float4 MASK_G158_g39969 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g40014 );
				float4 temp_output_83_0_g39970 = MASK_G158_g39969;
				float4 m_Smoothness189_g39970 = temp_output_83_0_g39970;
				float4 m_Roughness189_g39970 = ( 1.0 - temp_output_83_0_g39970 );
				float4 localfloat4switch189_g39970 = float4switch189_g39970( m_switch189_g39970 , m_Smoothness189_g39970 , m_Roughness189_g39970 );
				float4 m_Texture188_g39970 = ( temp_output_196_0_g39970 * localfloat4switch189_g39970 );
				float4 localfloat4switch188_g39970 = float4switch188_g39970( m_switch188_g39970 , m_Standard188_g39970 , m_Geometric188_g39970 , m_GeometricFade188_g39970 , m_Texture188_g39970 );
				float4 temp_output_1324_33_g39969 = localfloat4switch188_g39970;
				float4 color1225_g39969 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 MASK_R1378_g39969 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g40014 );
				float4 temp_cast_18 = (IN.ase_color.a).xxxx;
				float4 lerpResult28_g39969 = lerp( MASK_R1378_g39969 , temp_cast_18 , (float)_OcclusionSourceMode);
				float4 lerpResult7_g39969 = lerp( color1225_g39969 , lerpResult28_g39969 , _OcclusionStrengthAO);
				
				float AlphaCutoffBias1289_g39969 = _AlphaCutoffBias;
				
				int m_switch72_g40000 = _EnableTranslucency;
				float4 m_Off72_g40000 = float4( 0,0,0,0 );
				int m_switch38_g40000 = _MapInverted;
				float4 color71_g40000 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 tex2DNode27_g40000 = SAMPLE_TEXTURE2D( _TranslucencyMap, sampler_trilinear_repeat, OUT_UV213_g39969 );
				float4 lerpResult34_g40000 = lerp( color71_g40000 , tex2DNode27_g40000 , _TranslucencyThickness);
				float4 m_Default38_g40000 = lerpResult34_g40000;
				float temp_output_69_0_g40000 = ( 0.0 - 1.0 );
				float temp_output_22_0_g40000 = ( tex2DNode27_g40000.r - 1.0 );
				float lerpResult66_g40000 = lerp( ( temp_output_69_0_g40000 / temp_output_22_0_g40000 ) , ( temp_output_22_0_g40000 / temp_output_69_0_g40000 ) , ( 0.7 + _TranslucencyThickness ));
				float4 temp_cast_24 = (saturate( lerpResult66_g40000 )).xxxx;
				float4 m_Inverted38_g40000 = temp_cast_24;
				float4 localfloat4switch38_g40000 = float4switch( m_switch38_g40000 , m_Default38_g40000 , m_Inverted38_g40000 );
				float lerpResult30_g40000 = lerp( 0.0 , ( 5.0 - IN.ase_texcoord7.zw.x ) , _TranslucencyThickness);
				float4 temp_cast_25 = (lerpResult30_g40000).xxxx;
				float4 lerpResult46_g40000 = lerp( localfloat4switch38_g40000 , temp_cast_25 , (float)_TranslucencySource);
				float3 temp_output_90_0_g40000 = saturate( ( _MainLightColor.rgb * _MainLightColor.a ) );
				float4 m_Active72_g40000 = ( ( _TransmissionTint * _TransmissionTint.a * lerpResult46_g40000 ) * float4( temp_output_90_0_g40000 , 0.0 ) );
				float4 localfloat4switch72_g40000 = float4switch72_g40000( m_switch72_g40000 , m_Off72_g40000 , m_Active72_g40000 );
				
				int m_switch50_g40000 = _EnableTranslucency;
				float4 m_Off50_g40000 = float4( 0,0,0,0 );
				float4 m_Active50_g40000 = ( ( _TranslucencyTint * _TranslucencyTint.a * lerpResult46_g40000 ) * float4( temp_output_90_0_g40000 , 0.0 ) );
				float4 localfloat4switch50_g40000 = float4switch50_g40000( m_switch50_g40000 , m_Off50_g40000 , m_Active50_g40000 );
				
				float3 Albedo = ( localfloat4switch364_g40020 + float4(0,0,0,0) ).xyz;
				float3 Normal = ( switchResult58_g40030 + ADDITIONAL_LIGHT1212_g39969 );
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( _MetallicStrength * MASK_B1377_g39969 ).r;
				float Smoothness = ( temp_output_1324_33_g39969 * lerpResult7_g39969 ).x;
				float Occlusion = saturate( lerpResult7_g39969 ).r;
				float Alpha = ( ALBEDO_A926_g39969 * OPACITY_OUTMASK1277_g39969 );
				float AlphaClipThreshold = AlphaCutoffBias1289_g39969;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = localfloat4switch72_g40000.xyz;
				float3 Translucency = localfloat4switch50_g40000.xyz;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				BRDFData brdfData;
				InitializeBRDFData( Albedo, Metallic, Specular, Smoothness, Alpha, brdfData);
				half4 color;
				color.rgb = GlobalIllumination( brdfData, inputData.bakedGI, Occlusion, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _URP_TransmissionShadow;
				
					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;
				
					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );
				
							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif
				
				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _URP_TransmissionShadow;
					float normal = _URP_TranslucencyNormalDistortion;
					float scattering = _URP_TranslucencyScattering;
					float direct = _URP_TranslucencyDirect;
					float ambient = _URP_TranslucencyAmbient;
					float strength = _URP_TranslucencyStrength;
				
					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
				
					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;
				
					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );
				
							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif
				
				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal, 0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif
				
				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif
				
				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif
				
				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb);
			}

			ENDHLSL
		}
		
	}
	/*ase_lod*/
	CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	Fallback " "
	
}
/*ASEBEGIN
Version=18913
4;29.33333;1436.667;767.6667;5120.68;4514.451;1.397199;True;False
Node;AmplifyShaderEditor.CommentaryNode;2819;-3948.737,-3967.24;Inherit;False;167.0649;115.3652;GLOBAL SETTINGS ;1;2848;;0.009433985,0.009433985,0.009433985,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2820;-3950.363,-3845.094;Inherit;False;391.3722;194.2895;DEBUG SETTINGS ;4;2760;2849;2758;202;;0,0,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;2871;-4623.426,-3643.646;Inherit;False;DESF Module Wind;127;;3466;b135a554f7e4d0b41bba02c61b34ae74;11,938,0,2881,0,2454,1,2457,1,2432,1,2434,1,2433,1,2371,1,2752,0,2995,0,2878,0;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.CommentaryNode;2861;-4580.668,-4032.225;Inherit;False;579.3186;363.0588;URP TRANSMISSION TRANSLUCENCY ;7;2863;2867;2862;2865;2864;2866;2868;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2875;-3943.481,-3291.7;Inherit;False;321.6667;116;DESF Common ASE Compile Shaders;1;2876;;0,0.2047877,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2883;-3948.144,-4120.95;Inherit;False;271;139;_RECEIVE_SHADOWS_OFF;1;2884;;0,0,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2866;-4288.516,-3824.825;Inherit;False;Property;_URP_TranslucencyScattering;Translucency Scattering ;123;0;Create;False;1;;0;0;True;0;False;2;2;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2879;-4385.805,-3643.014;Inherit;False;DESF Core Cutout;5;;39969;e0cdd7758f4404849b063afff4596424;26,1217,2,1311,2,1296,2,1156,2,1141,2,442,2,1509,1,1556,1,1557,1,1552,1,1309,1,1308,1,1333,0,1348,0,1596,0,1368,0,1569,0,96,2,1229,0,1236,0,830,0,1415,0,1399,0,1564,0,1566,0,1565,0;2;1234;FLOAT3;0,0,0;False;1274;FLOAT4;0,0,0,0;False;14;FLOAT4;38;FLOAT3;35;FLOAT3;1586;COLOR;37;FLOAT4;33;COLOR;34;FLOAT;441;FLOAT;46;FLOAT;814;FLOAT;552;FLOAT4;656;FLOAT4;657;FLOAT4;655;FLOAT3;1235
Node;AmplifyShaderEditor.RangedFloatNode;2865;-4290.048,-3902.427;Inherit;False;Property;_URP_TranslucencyNormalDistortion;Translucency Normal Distortion ;122;0;Create;False;1;;0;0;True;0;False;0.2735869;0.2735869;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2862;-4565.05,-3907.425;Inherit;False;Property;_URP_TranslucencyDirect;Translucency Direct ;124;0;Create;False;1;;0;0;True;0;False;0.9;0.9;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2868;-4563.05,-3829.425;Inherit;False;Property;_URP_TranslucencyAmbient;Translucency Ambient;125;0;Create;False;1;;0;0;True;0;False;0.8339342;0.8339342;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2867;-4563.45,-3753.025;Inherit;False;Property;_URP_TranslucencyShadow;Translucency Shadow ;126;0;Create;False;1;;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2864;-4291.167,-3982.641;Inherit;False;Property;_URP_TranslucencyStrength;Translucency Strength;121;0;Create;False;1;;0;0;True;1;Header(TRANSLUCENCY URP);False;1;1;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;202;-3937.384,-3809.991;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;64;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2876;-3931.481,-3253.7;Inherit;False;DESF Common ASE Compile Shaders;-1;;39968;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;2848;-3934.388,-3930.86;Inherit;False;Property;_CullMode;Cull Mode;4;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;2758;-3936.989,-3734.54;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;2863;-4568.166,-3984.37;Inherit;False;Property;_URP_TransmissionShadow;Transmission Shadow;120;0;Create;False;1;;0;1;UnityEngine.Rendering.CompareFunction;True;1;Header(TRANSMISSION  URP);False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;2760;-3749.529,-3809.533;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StaticSwitch;2884;-3940.144,-4081.949;Inherit;False;Property;_RECEIVE_SHADOWS_OFF;Receive Shadows;3;0;Create;False;0;0;0;True;0;False;0;0;0;True;_RECEIVE_SHADOWS_OFF;Toggle;2;Key0;Key1;Fetch;True;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2849;-3750.638,-3733.546;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2870;-3953.374,-3640.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;2758;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;2760;True;3;False;2757;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2843;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2842;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2844;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2841;-3953.374,-3640.745;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;DEC/Cutout Wind/Cutout Wind Translucency;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;2849;False;True;2;True;2848;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=-10;NatureRendererInstancing=True;True;3;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;2758;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;2760;True;3;False;2757;True;True;0;False;-1;0;False;-1;True;2;LightMode=UniversalForward;NatureRendererInstancing=True;False;False;8;Include;;False;;Native;Pragma;multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS;False;;Custom;Pragma;multi_compile _ _ADDITIONAL_LIGHT_SHADOWS;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;ed9205546b797304ea7576ba0b32877e;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;Pragma;shader_feature_local _RECEIVE_SHADOWS_OFF;False;;Custom; ;0;0;Standard;38;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;1;  Transmission Shadow;0.5,True,2863;Translucency;1;  Translucency Strength;1,True,2864;  Normal Distortion;0.5,True,2865;  Scattering;2,True,2866;  Direct;0.9,True,2862;  Ambient;0.1,True,2868;  Shadow;0.5,True,2863;Cast Shadows;1;  Use Shadow Threshold;1;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Write Depth;0;  Early Z;0;Vertex Position,InvertActionOnDeselection;1;0;8;False;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2869;-3953.374,-3580.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2840;-3601.374,-3640.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2845;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;2758;False;False;False;False;False;False;False;False;False;True;1;True;2760;True;3;False;2757;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;2879;1234;2871;2190
WireConnection;2879;1274;2871;2970
WireConnection;2841;0;2879;38
WireConnection;2841;1;2879;35
WireConnection;2841;3;2879;37
WireConnection;2841;4;2879;33
WireConnection;2841;5;2879;34
WireConnection;2841;6;2879;46
WireConnection;2841;7;2879;814
WireConnection;2841;16;2879;552
WireConnection;2841;14;2879;656
WireConnection;2841;15;2879;657
WireConnection;2841;8;2879;1235
ASEEND*/
//CHKSM=5B3FD135597F371355BF9BF88840AF331EA457C7