// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Water/Water Lake Simple"
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
		[HDR][Header (COLOR TINT WATER LAYERS)]_ShorelineTint("Shoreline Tint", Color) = (0.2784314,0.4235294,0.4431373,1)
		_ShorelineDepth("Shoreline Depth", Range( 0 , 100)) = 40
		_ShorelineOffset("Shoreline Offset", Range( -1 , 1)) = 0.1
		[HDR]_MidwaterTint("Midwater Tint", Color) = (0.1490196,0.4235294,0.4705882,1)
		[HDR]_DepthTint("Depth Tint", Color) = (0.1960784,0.4313726,0.509804,1)
		_DepthOffset("Depth Offset", Range( 0 , 10)) = 2
		[Header (OPACITY)]_Opacity("Opacity", Range( 0.001 , 1)) = 0.05
		_OpacityShoreline("Opacity Shoreline", Range( 0 , 25)) = 2
		[Header (REFRACTION)]_RefractionScale("Refraction Scale", Range( 0 , 1)) = 0.2
		[Header(SMOOTHNESS)]_SMOOTHNESS_Strength("Smoothness Strength", Range( 0 , 1)) = 0.1
		_SMOOTHNESS_FresnelBias("Fresnel Bias", Range( 0 , 1)) = 0
		_SMOOTHNESS_FresnelScale("Fresnel Scale", Range( 0 , 1)) = 1
		_SMOOTHNESS_FresnelPower("Fresnel Power", Range( 0 , 10)) = 5
		[Header(SPECULAR)][Enum(Off,0,Active,1,Active Clamped,2)]_Specular_Mode("Specular Mode", Int) = 2
		[HDR]_SpecularColor("Specular Tint", Color) = (0.06666667,0.06666667,0.05882353,0)
		_Shininess("Specular Strength", Range( 0 , 1)) = 0
		_SpecularWrap("Specular Wrap", Range( 0 , 3)) = 0.5
		[HDR][Header(SPECULAR ADDITTIONAL LIGHTS)]_URP_SpecularColor("Specular Tint", Color) = (1,1,1,1)
		_URP_SpecularStrength("Specular Strength", Range( 0 , 1)) = 0.5
		[Header(........................................)][Header(NORMAL MAP (HORIZONTAL))][Enum(Off,0,Swirling,1,Flow Map,2)]_WaterNormal_Horizontal_FlowType("Mode Flow Type", Int) = 1
		[Normal][SingleLineTexture]_WaterNormal_Horizontal_Vertical_NormalMap("Normal Map", 2D) = "bump" {}
		_WaterNormal_Horizontal_NormalStrength("Normal Strength", Float) = 1
		_WaterNormal_Horizontal_TilingX("Tiling X", Float) = 10
		_WaterNormal_Horizontal_TilingY("Tiling Y", Float) = 10
		_WaterNormal_Horizontal_Speed("Speed", Float) = 0.5
		_WaterNormal_Horizontal_FlowStrength("Flow Strength", Float) = 0.5
		_WaterNormal_Horizontal_Timescale("Flow Timescale", Range( 0 , 1)) = 0.6
		[Header(FOAM OFFSHORE (HORIZONTAL))][Enum(Off,0,Swirling,1,Flow Map,2)]_FOAMHORIZONTAL_ModeFlowType("Mode Flow Type", Int) = 0
		[HDR]_FOAMHORIZONTAL_Tint("Tint", Color) = (1,1,1,0)
		_FOAMHORIZONTAL_TintStrength("Tint Strength", Range( 0 , 5)) = 2.297033
		[SingleLineTexture]_FOAMHORIZONTAL_FoamMap("Foam Map", 2D) = "white" {}
		_FOAMHORIZONTAL_Distance("Foam Distance", Range( 0.3 , 100)) = 0.3
		_FOAMHORIZONTAL_NormalStrength("Normal Strength ", Range( 0 , 5)) = 5
		_FOAMHORIZONTAL_TilingX("Tiling X", Float) = 10
		_FOAMHORIZONTAL_TilingY("Tiling Y", Float) = 10
		_FOAMHORIZONTAL_Speed("Speed", Float) = 0.2
		_FOAMHORIZONTAL_FlowStrength("Flow Strength", Float) = 3
		_FOAMHORIZONTAL_Timescale("Flow Timescale", Range( 0 , 1)) = 0.2
		[Header(........................................)][Header(NORMAL MAP (VERTICAL))][Enum(Off,0,Swirling,1,Flow Map,2)]_WaterNormal_Vertical_FlowType("Mode Flow Type", Int) = 1
		[Normal][SingleLineTexture]_WaterNormal_Vertical_NormalMap("Normal Map", 2D) = "bump" {}
		_WaterNormal_Vertical_NormalStrength("Normal Strength", Float) = 1
		_WaterNormal_Vertical_TilingX("Tiling X", Float) = 10
		_WaterNormal_Vertical_TilingY("Tiling Y", Float) = 10
		_WaterNormal_Vertical_Speed("Speed", Float) = 0.5
		_WaterNormal_Vertical_FlowStrength("Flow Strength", Float) = 0.5
		_WaterNormal_Vertical_Timescale("Flow Timescale", Range( 0 , 1)) = 0.6
		[Header(FOAM OFFSHORE (VERTICAL))][Enum(Off,0,Swirling,1,Flow Map,2)]_FOAMVERTICAL_ModeFlowType("Mode Flow Type", Int) = 0
		[HDR]_FOAMVERTICAL_Tint("Tint", Color) = (1,1,1,0)
		_FOAMVERTICAL_TintStrength("Tint Strength", Range( 0 , 5)) = 1
		[SingleLineTexture]_FOAMVERTICAL_FoamMap("Foam Map", 2D) = "white" {}
		_FOAMVERTICAL_Distance("Foam Distance", Range( 0.3 , 100)) = 0.3
		_FOAMVERTICAL_NormalStrength("Normal Strength ", Range( 0 , 5)) = 5
		_FOAMVERTICAL_TilingX("Tiling X", Float) = 10
		_FOAMVERTICAL_TilingY("Tiling Y", Float) = 10
		_FOAMVERTICAL_Speed("Speed", Float) = 0.2
		_FOAMVERTICAL_FlowStrength("Flow Strength", Float) = 3
		_FOAMVERTICAL_Timescale("Flow Timescale", Range( 0 , 1)) = 0.2
		[Header(........................................)][Header(FOAM SHORELINE)][Enum(Off,0,Swirling,1,Flow Map,2)]_FoamShoreline_ModeFlowType("Mode Flow Type", Int) = 1
		[HDR]_FoamShoreline_Tint("Tint", Color) = (1,1,1,0)
		_FoamShoreline_TintStrength("Tint Strength", Range( 0 , 5)) = 0.5
		[SingleLineTexture]_FoamShoreline_FoamMap("Foam Map", 2D) = "white" {}
		_FoamShoreline_Distance("Foam Distance", Range( 0.5 , 100)) = 0.5
		_FoamShoreline_NormalStrength("Normal Strength ", Range( 0 , 5)) = 1
		_TilingX_Shoreline("Tiling X", Float) = 25
		_TilingY_Shoreline("Tiling Y", Float) = 25
		_FoamShoreline_Speed("Speed", Float) = 0.1
		_FoamShoreline_FlowStrength("Flow Strength", Float) = 0.5
		_FoamShoreline_Timescale("Flow Timescale", Range( 0 , 1)) = 0.1
		[Header(........................................)][Header(REFLECTION)][Enum(Off,0,Active CubeMap,1,Active Probe,2)]_Reflection_ModeURP("Reflection Mode", Int) = 0
		[HDR][SingleLineTexture]_Reflection_Cubemap("Reflection Cubemap", CUBE) = "white" {}
		_Reflection_Cloud("Reflection Cloud", Range( 0 , 1)) = 1
		_Reflection_Wobble("Reflection Wobble", Range( 0 , 0.1)) = 0
		_Reflection_Smoothness("Reflection Smoothness", Range( 0 , 2)) = 2
		_Reflection_LOD("Reflection Probe Level of Detail", Float) = 0
		_Reflection_BumpScale("Reflection Bump Scale", Range( 0 , 1)) = 0.5
		_Reflection_BumpClamp("Reflection Bump Clamp", Range( 0 , 0.15)) = 0.15
		[Enum(Off,0,Active,1)]_Reflection_FresnelMode("Fresnel Mode", Int) = 1
		_Reflection_FresnelStrength("Fresnel Strength", Range( 0.001 , 1)) = 0.5
		_Reflection_FresnelBias("Fresnel Bias", Range( 0 , 1)) = 1
		[ASEEnd]_Reflection_FresnelScale("Fresnel Scale", Range( 0 , 1)) = 0.5

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
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

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Transparent" }
		Cull [_CullMode]
		AlphaToMask Off
		HLSLINCLUDE
		#pragma target 3.0

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
			Tags { "LightMode"="UniversalForward" }
			
			Blend SrcAlpha OneMinusSrcAlpha, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			float4 _FOAMVERTICAL_Tint;
			half4 _URP_SpecularColor;
			float _AlphatoCoverage;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			int _Reflection_FresnelMode;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpScale;
			float _Reflection_Smoothness;
			float _Reflection_Wobble;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _Reflection_Cloud;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_BumpClamp;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Vertical_FlowType;
			int _WaterNormal_Horizontal_FlowType;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _CullMode;
			float _DepthOffset;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _FOAMHORIZONTAL_Speed;
			float _SMOOTHNESS_FresnelPower;
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
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_WaterNormal_Horizontal_Vertical_NormalMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_WaterNormal_Vertical_NormalMap);
			TEXTURE2D(_FOAMVERTICAL_FoamMap);
			TEXTURE2D(_FOAMHORIZONTAL_FoamMap);
			TEXTURE2D(_FoamShoreline_FoamMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float3 float3switch238_g39212( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch456_g39193( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g39181( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g39233( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g39222( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch124_g39189( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch91_g39189( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch119_g39189( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			real3 ASESafeNormalize(float3 inVec)
			{
				real dp3 = max(FLT_MIN, dot(inVec, inVec));
				return inVec* rsqrt( dp3);
			}
			
			float3 float3switch1246_g39181( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch1230_g39233( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch1223_g39222( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 AdditionalLightsSpecularMask( float3 WorldPosition, float3 WorldNormal, float3 WorldView, float3 SpecColor, float Smoothness, float4 ShadowMask )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				Smoothness = exp2(10 * Smoothness + 1);
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				#if ASE_SRP_VERSION >= 100000
					Light light = GetAdditionalLight(i, WorldPosition, ShadowMask);
				#else
					Light light = GetAdditionalLight(i, WorldPosition);
				#endif
					half3 AttLightColor = light.color *(light.distanceAttenuation * light.shadowAttenuation);
					Color += LightingSpecular(AttLightColor, light.direction, WorldNormal, WorldView, half4(SpecColor, 0), Smoothness);	
				}
				#endif
				return Color;
			}
			
			float3 float3switch31_g39205( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch11_g39205( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch18_g39205( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord7.w = eyeDepth;
				
				o.ase_texcoord7.xyz = v.texcoord.xyz;
				o.ase_texcoord8 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord9 = v.vertex;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

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
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				int m_switch119_g39189 = _Reflection_ModeURP;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g39180 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g39180 = abs( ( screenDepth2_g39180 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g39180 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g39180*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g39180 = lerp( _DepthTint , lerpResult25_g39180 , saturate( (distanceDepth2_g39180*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g39180 = lerpResult27_g39180;
				int m_switch238_g39212 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g39212 = float3(0,0,0.001);
				float mulTime155_g39212 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g39212 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g39212 = ( FlowSpeed365_g39212 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g39212).xx;
				float2 appendResult235_g39212 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g39212 = IN.ase_texcoord7.xyz.xy * ( appendResult235_g39212 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g39212 = cos( _G_FlowSwirling.x );
				float sin62_g39212 = sin( _G_FlowSwirling.x );
				float2 rotator62_g39212 = mul( texCoord23_g39212 - float2( 0,0 ) , float2x2( cos62_g39212 , -sin62_g39212 , sin62_g39212 , cos62_g39212 )) + float2( 0,0 );
				float2 panner15_g39212 = ( mulTime155_g39212 * temp_cast_0 + rotator62_g39212);
				float2 temp_cast_1 = (temp_output_367_0_g39212).xx;
				float cos8_g39212 = cos( _G_FlowSwirling.y );
				float sin8_g39212 = sin( _G_FlowSwirling.y );
				float2 rotator8_g39212 = mul( texCoord23_g39212 - float2( 0,0 ) , float2x2( cos8_g39212 , -sin8_g39212 , sin8_g39212 , cos8_g39212 )) + float2( 0,0 );
				float2 panner16_g39212 = ( mulTime155_g39212 * temp_cast_1 + rotator8_g39212);
				float2 temp_cast_2 = (temp_output_367_0_g39212).xx;
				float2 panner17_g39212 = ( mulTime155_g39212 * temp_cast_2 + texCoord23_g39212);
				float2 layeredBlendVar666_g39212 = IN.ase_texcoord7.xyz.xy;
				float4 layeredBlend666_g39212 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g39212 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g39212 ) , layeredBlendVar666_g39212.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g39212 ) , layeredBlendVar666_g39212.y ) );
				float4 temp_output_1_0_g39213 = layeredBlend666_g39212;
				float temp_output_8_0_g39213 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g39213 = UnpackNormalScale( temp_output_1_0_g39213, temp_output_8_0_g39213 );
				unpack52_g39213.z = lerp( 1, unpack52_g39213.z, saturate(temp_output_8_0_g39213) );
				float3 temp_output_699_59_g39212 = unpack52_g39213;
				float3 temp_output_372_0_g39212 = abs( WorldNormal );
				float3 break386_g39212 = ( temp_output_372_0_g39212 * temp_output_372_0_g39212 );
				float _MASK_VERTICAL_Z381_g39212 = ( break386_g39212.z + 0.01 );
				float3 lerpResult677_g39212 = lerp( float3( 0,0,0 ) , temp_output_699_59_g39212 , _MASK_VERTICAL_Z381_g39212);
				float _MASK_VERTICAL_X373_g39212 = ( -break386_g39212.x + 0.2 );
				float3 lerpResult681_g39212 = lerp( float3( 0,0,0 ) , temp_output_699_59_g39212 , _MASK_VERTICAL_X373_g39212);
				float _MASK_VERTICAL_Y_NEG413_g39212 = ( ( WorldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g39212 = lerp( float3( 0,0,0 ) , ( lerpResult677_g39212 + lerpResult681_g39212 ) , _MASK_VERTICAL_Y_NEG413_g39212);
				float3 m_Swirling238_g39212 = lerpResult679_g39212;
				float2 texCoord196_g39217 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39217 = IN.ase_texcoord8;
				float2 blendOpSrc197_g39217 = texCoord196_g39217;
				float2 blendOpDest197_g39217 = (_FLOWMAP_Map89_g39217).xy;
				float2 temp_output_197_0_g39217 = ( saturate( (( blendOpDest197_g39217 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39217 ) * ( 1.0 - blendOpSrc197_g39217 ) ) : ( 2.0 * blendOpDest197_g39217 * blendOpSrc197_g39217 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39217 = FlowSpeed365_g39212;
				float temp_output_182_0_g39217 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39217 );
				float temp_output_194_0_g39217 = (0.0 + (( ( temp_output_182_0_g39217 - floor( ( temp_output_182_0_g39217 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g39217 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g39217 = ( -temp_output_194_0_g39217 * _FLOWMAP_FlowStrength146_g39217 );
				float2 lerpResult198_g39217 = lerp( temp_output_197_0_g39217 , texCoord196_g39217 , _TIME_UV_A199_g39217);
				float2 INPUT_MAP_TILLING128_g39212 = appendResult235_g39212;
				float2 texCoord205_g39217 = IN.ase_texcoord7.xyz.xy * INPUT_MAP_TILLING128_g39212 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39217 = texCoord205_g39217;
				float2 FLOW_A201_g39217 = ( lerpResult198_g39217 + TEXTURE_TILLING211_g39217 );
				float temp_output_225_0_g39217 = (temp_output_182_0_g39217*1.0 + 0.5);
				float _TIME_UV_B214_g39217 = ( -(0.0 + (( ( temp_output_225_0_g39217 - floor( ( temp_output_225_0_g39217 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39217 );
				float2 lerpResult229_g39217 = lerp( temp_output_197_0_g39217 , texCoord196_g39217 , _TIME_UV_B214_g39217);
				float2 FLOW_B232_g39217 = ( lerpResult229_g39217 + TEXTURE_TILLING211_g39217 );
				float TIME_BLEND235_g39217 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39217 / 0.5 ) ) ) );
				float4 lerpResult317_g39212 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g39217 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g39217 ) , TIME_BLEND235_g39217);
				float4 temp_output_1_0_g39219 = lerpResult317_g39212;
				float NormalStrength152_g39212 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g39219 = NormalStrength152_g39212;
				float3 unpack52_g39219 = UnpackNormalScale( temp_output_1_0_g39219, temp_output_8_0_g39219 );
				unpack52_g39219.z = lerp( 1, unpack52_g39219.z, saturate(temp_output_8_0_g39219) );
				float3 temp_output_701_59_g39212 = unpack52_g39219;
				float3 lerpResult692_g39212 = lerp( float3( 0,0,0 ) , temp_output_701_59_g39212 , _MASK_VERTICAL_Z381_g39212);
				float3 lerpResult691_g39212 = lerp( float3( 0,0,0 ) , temp_output_701_59_g39212 , _MASK_VERTICAL_X373_g39212);
				float3 lerpResult697_g39212 = lerp( float3( 0,0,0 ) , ( lerpResult692_g39212 + lerpResult691_g39212 ) , _MASK_VERTICAL_Y_NEG413_g39212);
				float3 m_FlowMap238_g39212 = lerpResult697_g39212;
				float3 localfloat3switch238_g39212 = float3switch238_g39212( m_switch238_g39212 , m_Off238_g39212 , m_Swirling238_g39212 , m_FlowMap238_g39212 );
				int m_switch456_g39193 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g39193 = float3(0,0,0.001);
				float mulTime155_g39193 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g39193 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g39193 = ( FlowSpeed365_g39193 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g39193).xx;
				float2 appendResult235_g39193 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g39193 = IN.ase_texcoord7.xyz.xy * ( appendResult235_g39193 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g39193 = cos( _G_FlowSwirling.x );
				float sin62_g39193 = sin( _G_FlowSwirling.x );
				float2 rotator62_g39193 = mul( texCoord23_g39193 - float2( 0,0 ) , float2x2( cos62_g39193 , -sin62_g39193 , sin62_g39193 , cos62_g39193 )) + float2( 0,0 );
				float2 panner15_g39193 = ( mulTime155_g39193 * temp_cast_5 + rotator62_g39193);
				float2 temp_cast_6 = (temp_output_367_0_g39193).xx;
				float cos8_g39193 = cos( _G_FlowSwirling.y );
				float sin8_g39193 = sin( _G_FlowSwirling.y );
				float2 rotator8_g39193 = mul( texCoord23_g39193 - float2( 0,0 ) , float2x2( cos8_g39193 , -sin8_g39193 , sin8_g39193 , cos8_g39193 )) + float2( 0,0 );
				float2 panner16_g39193 = ( mulTime155_g39193 * temp_cast_6 + rotator8_g39193);
				float2 temp_cast_7 = (temp_output_367_0_g39193).xx;
				float2 panner17_g39193 = ( mulTime155_g39193 * temp_cast_7 + texCoord23_g39193);
				float2 layeredBlendVar448_g39193 = IN.ase_texcoord7.xyz.xy;
				float4 layeredBlend448_g39193 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g39193 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g39193 ) , layeredBlendVar448_g39193.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g39193 ) , layeredBlendVar448_g39193.y ) );
				float4 temp_output_1_0_g39197 = layeredBlend448_g39193;
				float temp_output_8_0_g39197 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g39197 = UnpackNormalScale( temp_output_1_0_g39197, temp_output_8_0_g39197 );
				unpack52_g39197.z = lerp( 1, unpack52_g39197.z, saturate(temp_output_8_0_g39197) );
				float3 temp_output_481_59_g39193 = unpack52_g39197;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g39193 = ( abs( WorldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g39193 = ( break386_g39193.z + 0.75 );
				float3 lerpResult465_g39193 = lerp( float3( 0,0,0 ) , temp_output_481_59_g39193 , _MASK_VERTICAL_Z381_g39193);
				float _MASK_VERTICAL_X373_g39193 = ( break386_g39193.x + 0.45 );
				float3 lerpResult457_g39193 = lerp( float3( 0,0,0 ) , temp_output_481_59_g39193 , _MASK_VERTICAL_X373_g39193);
				float _MASK_VERTICAL_Y383_g39193 = ( -break386_g39193.y + 5.0 );
				float3 lerpResult454_g39193 = lerp( lerpResult465_g39193 , ( lerpResult465_g39193 + lerpResult457_g39193 ) , _MASK_VERTICAL_Y383_g39193);
				float _MASK_VERTICAL_Y_NEG413_g39193 = ( ( WorldNormal.y + WorldNormal.y ) - 1.0 );
				float3 lerpResult477_g39193 = lerp( float3( 0,0,0 ) , lerpResult454_g39193 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g39193 ));
				float3 m_Swirling456_g39193 = lerpResult477_g39193;
				float2 texCoord196_g39195 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39195 = IN.ase_texcoord8;
				float2 blendOpSrc197_g39195 = texCoord196_g39195;
				float2 blendOpDest197_g39195 = (_FLOWMAP_Map89_g39195).xy;
				float2 temp_output_197_0_g39195 = ( saturate( (( blendOpDest197_g39195 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39195 ) * ( 1.0 - blendOpSrc197_g39195 ) ) : ( 2.0 * blendOpDest197_g39195 * blendOpSrc197_g39195 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39195 = FlowSpeed365_g39193;
				float temp_output_182_0_g39195 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39195 );
				float temp_output_194_0_g39195 = (0.0 + (( ( temp_output_182_0_g39195 - floor( ( temp_output_182_0_g39195 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g39195 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g39195 = ( -temp_output_194_0_g39195 * _FLOWMAP_FlowStrength146_g39195 );
				float2 lerpResult198_g39195 = lerp( temp_output_197_0_g39195 , texCoord196_g39195 , _TIME_UV_A199_g39195);
				float2 INPUT_MAP_TILLING128_g39193 = appendResult235_g39193;
				float2 texCoord205_g39195 = IN.ase_texcoord7.xyz.xy * INPUT_MAP_TILLING128_g39193 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39195 = texCoord205_g39195;
				float2 FLOW_A201_g39195 = ( lerpResult198_g39195 + TEXTURE_TILLING211_g39195 );
				float temp_output_225_0_g39195 = (temp_output_182_0_g39195*1.0 + 0.5);
				float _TIME_UV_B214_g39195 = ( -(0.0 + (( ( temp_output_225_0_g39195 - floor( ( temp_output_225_0_g39195 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39195 );
				float2 lerpResult229_g39195 = lerp( temp_output_197_0_g39195 , texCoord196_g39195 , _TIME_UV_B214_g39195);
				float2 FLOW_B232_g39195 = ( lerpResult229_g39195 + TEXTURE_TILLING211_g39195 );
				float TIME_BLEND235_g39195 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39195 / 0.5 ) ) ) );
				float4 lerpResult317_g39193 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g39195 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g39195 ) , TIME_BLEND235_g39195);
				float4 temp_output_1_0_g39201 = lerpResult317_g39193;
				float NormalStrength152_g39193 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g39201 = NormalStrength152_g39193;
				float3 unpack52_g39201 = UnpackNormalScale( temp_output_1_0_g39201, temp_output_8_0_g39201 );
				unpack52_g39201.z = lerp( 1, unpack52_g39201.z, saturate(temp_output_8_0_g39201) );
				float3 temp_output_483_59_g39193 = unpack52_g39201;
				float3 lerpResult466_g39193 = lerp( float3( 0,0,0 ) , temp_output_483_59_g39193 , _MASK_VERTICAL_Z381_g39193);
				float3 lerpResult453_g39193 = lerp( float3( 0,0,0 ) , temp_output_483_59_g39193 , _MASK_VERTICAL_X373_g39193);
				float3 lerpResult460_g39193 = lerp( lerpResult466_g39193 , ( lerpResult466_g39193 + lerpResult453_g39193 ) , _MASK_VERTICAL_Y383_g39193);
				float3 lerpResult411_g39193 = lerp( float3( 0,0,0 ) , lerpResult460_g39193 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g39193 ));
				float3 m_FlowMap456_g39193 = lerpResult411_g39193;
				float3 localfloat3switch456_g39193 = float3switch456_g39193( m_switch456_g39193 , m_Off456_g39193 , m_Swirling456_g39193 , m_FlowMap456_g39193 );
				float2 weightedBlendVar1711_g39180 = IN.ase_texcoord7.xyz.xy;
				float3 weightedBlend1711_g39180 = ( weightedBlendVar1711_g39180.x*localfloat3switch238_g39212 + weightedBlendVar1711_g39180.y*localfloat3switch456_g39193 );
				float3 NORMAL_IN84_g39240 = ( weightedBlend1711_g39180 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g39240 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord7.w;
				float eyeDepth7_g39240 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g39240 = ( (NORMAL_IN84_g39240).xy * ( REFACTED_SCALE_FLOAT78_g39240 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g39240 - eyeDepth ) ) );
				float eyeDepth27_g39240 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g39240, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g39240 = (( float4( ( temp_output_21_0_g39240 * saturate( ( eyeDepth27_g39240 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g39240 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g39240 ), 1.0 );
				float4 REFRACTED_DEPTH144_g39180 = fetchOpaqueVal89_g39240;
				float temp_output_20_0_g39180 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g39180 = 0.0;
				#else
				float staticSwitch37_g39180 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g39180*-5.0 + 1.0) ) ) ) * temp_output_20_0_g39180 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g39180 = staticSwitch37_g39180;
				float4 lerpResult105_g39180 = lerp( COLOR_TINT161_g39180 , REFRACTED_DEPTH144_g39180 , DEPTH_TINT_ALPHA93_g39180);
				float4 _MASK_VECTOR1199_g39181 = float4(0.001,0.001,0.001,0);
				int m_switch278_g39181 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g39181 = float4( 0,0,0,0 );
				float mulTime806_g39181 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g39181 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g39181 = ( FlowSpeed1146_g39181 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g39181).xx;
				float2 appendResult219_g39181 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g39181 = ( appendResult219_g39181 * float2( 2,2 ) );
				float2 texCoord487_g39181 = IN.ase_texcoord7.xyz.xy * temp_output_1294_0_g39181 + float2( 0,0 );
				float cos485_g39181 = cos( _G_FlowSwirling.x );
				float sin485_g39181 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39181 = mul( texCoord487_g39181 - float2( 0,0 ) , float2x2( cos485_g39181 , -sin485_g39181 , sin485_g39181 , cos485_g39181 )) + float2( 0,0 );
				float2 panner483_g39181 = ( mulTime806_g39181 * temp_cast_14 + rotator485_g39181);
				float2 temp_cast_15 = (temp_output_1150_0_g39181).xx;
				float cos481_g39181 = cos( _G_FlowSwirling.y );
				float sin481_g39181 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39181 = mul( texCoord487_g39181 - float2( 0,0 ) , float2x2( cos481_g39181 , -sin481_g39181 , sin481_g39181 , cos481_g39181 )) + float2( 0,0 );
				float2 panner480_g39181 = ( mulTime806_g39181 * temp_cast_15 + rotator481_g39181);
				float2 temp_cast_16 = (temp_output_1150_0_g39181).xx;
				float2 panner478_g39181 = ( mulTime806_g39181 * temp_cast_16 + texCoord487_g39181);
				float4 OUT_SWIRLING298_g39181 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner483_g39181 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner480_g39181 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner478_g39181 ) ) );
				float4 m_Swirling278_g39181 = OUT_SWIRLING298_g39181;
				float2 texCoord196_g39186 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39186 = IN.ase_texcoord8;
				float2 blendOpSrc197_g39186 = texCoord196_g39186;
				float2 blendOpDest197_g39186 = (_FLOWMAP_Map89_g39186).xy;
				float2 temp_output_197_0_g39186 = ( saturate( (( blendOpDest197_g39186 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39186 ) * ( 1.0 - blendOpSrc197_g39186 ) ) : ( 2.0 * blendOpDest197_g39186 * blendOpSrc197_g39186 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39186 = FlowSpeed1146_g39181;
				float temp_output_182_0_g39186 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39186 );
				float temp_output_194_0_g39186 = (0.0 + (( ( temp_output_182_0_g39186 - floor( ( temp_output_182_0_g39186 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g39181 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39186 = FlowStrength1147_g39181;
				float _TIME_UV_A199_g39186 = ( -temp_output_194_0_g39186 * _FLOWMAP_FlowStrength146_g39186 );
				float2 lerpResult198_g39186 = lerp( temp_output_197_0_g39186 , texCoord196_g39186 , _TIME_UV_A199_g39186);
				float2 INPUT_MAP_TILLING128_g39181 = temp_output_1294_0_g39181;
				float2 texCoord205_g39186 = IN.ase_texcoord7.xyz.xy * INPUT_MAP_TILLING128_g39181 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39186 = texCoord205_g39186;
				float2 FLOW_A201_g39186 = ( lerpResult198_g39186 + TEXTURE_TILLING211_g39186 );
				float temp_output_225_0_g39186 = (temp_output_182_0_g39186*1.0 + 0.5);
				float _TIME_UV_B214_g39186 = ( -(0.0 + (( ( temp_output_225_0_g39186 - floor( ( temp_output_225_0_g39186 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39186 );
				float2 lerpResult229_g39186 = lerp( temp_output_197_0_g39186 , texCoord196_g39186 , _TIME_UV_B214_g39186);
				float2 FLOW_B232_g39186 = ( lerpResult229_g39186 + TEXTURE_TILLING211_g39186 );
				float TIME_BLEND235_g39186 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39186 / 0.5 ) ) ) );
				float4 lerpResult1117_g39181 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39186 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39186 ) , TIME_BLEND235_g39186);
				float4 OUT_FLOW_FLOWMAP1119_g39181 = lerpResult1117_g39181;
				float4 m_FlowMap278_g39181 = OUT_FLOW_FLOWMAP1119_g39181;
				float4 localfloat4switch278_g39181 = float4switch278_g39181( m_switch278_g39181 , m_Off278_g39181 , m_Swirling278_g39181 , m_FlowMap278_g39181 );
				float clampDepth2_g39207 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g39207 = clampDepth2_g39207;
				float4 localCalculateObliqueFrustumCorrection3_g39231 = CalculateObliqueFrustumCorrection();
				float dotResult4_g39231 = dot( float4( IN.ase_texcoord9.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g39231 );
				float correctionFactor1_g39207 = dotResult4_g39231;
				float localCorrectedLinearEyeDepth1_g39207 = CorrectedLinearEyeDepth( z1_g39207 , correctionFactor1_g39207 );
				float eyeDepth18_g39207 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g39207 = ( eyeDepth18_g39207 - ScreenPos.w );
				float temp_output_13_0_g39207 = ( localCorrectedLinearEyeDepth1_g39207 - abs( temp_output_17_0_g39207 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g39180 = saturate( temp_output_13_0_g39207 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39181 = temp_cast_20;
				float3 unityObjectToViewPos262_g39181 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float GRAB_SCREEN_DEPTH73_g39180 = localCorrectedLinearEyeDepth1_g39207;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39181 = temp_cast_21;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g39180 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39181 = temp_cast_23;
				float4 lerpResult281_g39181 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g39181 * _FOAMVERTICAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39181 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g39181.z + GRAB_SCREEN_DEPTH310_g39181 ) - temp_cast_22 ) * GRAB_SCREEN_CLOSENESS312_g39181 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g39181 ) ) ));
				float4 lerpResult265_g39181 = lerp( float4( 0,0,0,0 ) , lerpResult281_g39181 , FlowStrength1147_g39181);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g39181 = ( abs( WorldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g39181 = ( break1161_g39181.z + 0.45 );
				float4 lerpResult1173_g39181 = lerp( _MASK_VECTOR1199_g39181 , lerpResult265_g39181 , _MASK_VERTICAL_Z1162_g39181);
				float _MASK_VERTICAL_X1170_g39181 = ( break1161_g39181.x + 0.46 );
				float4 lerpResult1176_g39181 = lerp( _MASK_VECTOR1199_g39181 , lerpResult265_g39181 , _MASK_VERTICAL_X1170_g39181);
				float _MASK_VERTICAL_Y1163_g39181 = ( -break1161_g39181.y + 6.5 );
				float4 lerpResult1179_g39181 = lerp( lerpResult1173_g39181 , ( lerpResult1173_g39181 + lerpResult1176_g39181 ) , _MASK_VERTICAL_Y1163_g39181);
				float4 temp_output_1189_0_g39181 = saturate( lerpResult1179_g39181 );
				float4 FOAM_VERTICAL_OFFSHORE655_g39180 = temp_output_1189_0_g39181;
				float4 _MASK_VECTOR1200_g39233 = float4(0.001,0.001,0.001,0);
				int m_switch278_g39233 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g39233 = float4( 0,0,0,0 );
				float mulTime806_g39233 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g39233 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g39233 = ( Speed1146_g39233 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g39233).xx;
				float2 appendResult219_g39233 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g39233 = ( appendResult219_g39233 * float2( 2,2 ) );
				float2 texCoord487_g39233 = IN.ase_texcoord7.xyz.xy * temp_output_1214_0_g39233 + float2( 0,0 );
				float cos485_g39233 = cos( _G_FlowSwirling.x );
				float sin485_g39233 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39233 = mul( texCoord487_g39233 - float2( 0,0 ) , float2x2( cos485_g39233 , -sin485_g39233 , sin485_g39233 , cos485_g39233 )) + float2( 0,0 );
				float2 panner483_g39233 = ( mulTime806_g39233 * temp_cast_27 + rotator485_g39233);
				float2 temp_cast_28 = (temp_output_1150_0_g39233).xx;
				float cos481_g39233 = cos( _G_FlowSwirling.y );
				float sin481_g39233 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39233 = mul( texCoord487_g39233 - float2( 0,0 ) , float2x2( cos481_g39233 , -sin481_g39233 , sin481_g39233 , cos481_g39233 )) + float2( 0,0 );
				float2 panner480_g39233 = ( mulTime806_g39233 * temp_cast_28 + rotator481_g39233);
				float2 temp_cast_29 = (temp_output_1150_0_g39233).xx;
				float2 panner478_g39233 = ( mulTime806_g39233 * temp_cast_29 + texCoord487_g39233);
				float4 OUT_SWIRLING298_g39233 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner483_g39233 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner480_g39233 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner478_g39233 ) ) );
				float4 m_Swirling278_g39233 = OUT_SWIRLING298_g39233;
				float2 texCoord196_g39238 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39238 = IN.ase_texcoord8;
				float2 blendOpSrc197_g39238 = texCoord196_g39238;
				float2 blendOpDest197_g39238 = (_FLOWMAP_Map89_g39238).xy;
				float2 temp_output_197_0_g39238 = ( saturate( (( blendOpDest197_g39238 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39238 ) * ( 1.0 - blendOpSrc197_g39238 ) ) : ( 2.0 * blendOpDest197_g39238 * blendOpSrc197_g39238 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39238 = Speed1146_g39233;
				float temp_output_182_0_g39238 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39238 );
				float temp_output_194_0_g39238 = (0.0 + (( ( temp_output_182_0_g39238 - floor( ( temp_output_182_0_g39238 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g39233 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39238 = FlowStrength1147_g39233;
				float _TIME_UV_A199_g39238 = ( -temp_output_194_0_g39238 * _FLOWMAP_FlowStrength146_g39238 );
				float2 lerpResult198_g39238 = lerp( temp_output_197_0_g39238 , texCoord196_g39238 , _TIME_UV_A199_g39238);
				float2 INPUT_MAP_TILLING128_g39233 = temp_output_1214_0_g39233;
				float2 texCoord205_g39238 = IN.ase_texcoord7.xyz.xy * INPUT_MAP_TILLING128_g39233 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39238 = texCoord205_g39238;
				float2 FLOW_A201_g39238 = ( lerpResult198_g39238 + TEXTURE_TILLING211_g39238 );
				float temp_output_225_0_g39238 = (temp_output_182_0_g39238*1.0 + 0.5);
				float _TIME_UV_B214_g39238 = ( -(0.0 + (( ( temp_output_225_0_g39238 - floor( ( temp_output_225_0_g39238 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39238 );
				float2 lerpResult229_g39238 = lerp( temp_output_197_0_g39238 , texCoord196_g39238 , _TIME_UV_B214_g39238);
				float2 FLOW_B232_g39238 = ( lerpResult229_g39238 + TEXTURE_TILLING211_g39238 );
				float TIME_BLEND235_g39238 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39238 / 0.5 ) ) ) );
				float4 lerpResult1117_g39233 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39238 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39238 ) , TIME_BLEND235_g39238);
				float4 OUT_FLOW_FLOWMAP1119_g39233 = lerpResult1117_g39233;
				float4 m_FlowMap278_g39233 = OUT_FLOW_FLOWMAP1119_g39233;
				float4 localfloat4switch278_g39233 = float4switch278_g39233( m_switch278_g39233 , m_Off278_g39233 , m_Swirling278_g39233 , m_FlowMap278_g39233 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39233 = temp_cast_32;
				float3 unityObjectToViewPos262_g39233 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39233 = temp_cast_33;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39233 = temp_cast_35;
				float4 lerpResult281_g39233 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g39233 * _FOAMHORIZONTAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39233 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g39233.z + GRAB_SCREEN_DEPTH310_g39233 ) - temp_cast_34 ) * GRAB_SCREEN_CLOSENESS312_g39233 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g39233 ) ) ));
				float4 lerpResult265_g39233 = lerp( float4( 0,0,0,0 ) , lerpResult281_g39233 , FlowStrength1147_g39233);
				float _MASK_HORIZONTAL1160_g39233 = ( ( WorldNormal.y + WorldNormal.y ) - 1.7 );
				float4 lerpResult1185_g39233 = lerp( _MASK_VECTOR1200_g39233 , lerpResult265_g39233 , _MASK_HORIZONTAL1160_g39233);
				float4 temp_output_1188_0_g39233 = saturate( lerpResult1185_g39233 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g39180 = temp_output_1188_0_g39233;
				int m_switch278_g39222 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g39222 = float4( 0,0,0,0 );
				float mulTime806_g39222 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g39222 = _FoamShoreline_Speed;
				float temp_output_1185_0_g39222 = ( FlowSpeed1179_g39222 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g39222).xx;
				float2 appendResult219_g39222 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g39222 = ( appendResult219_g39222 * float2( 2,2 ) );
				float2 texCoord487_g39222 = IN.ase_texcoord7.xyz.xy * temp_output_1196_0_g39222 + float2( 0,0 );
				float cos485_g39222 = cos( _G_FlowSwirling.x );
				float sin485_g39222 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39222 = mul( texCoord487_g39222 - float2( 0,0 ) , float2x2( cos485_g39222 , -sin485_g39222 , sin485_g39222 , cos485_g39222 )) + float2( 0,0 );
				float2 panner483_g39222 = ( mulTime806_g39222 * temp_cast_38 + rotator485_g39222);
				float2 temp_cast_39 = (temp_output_1185_0_g39222).xx;
				float cos481_g39222 = cos( _G_FlowSwirling.y );
				float sin481_g39222 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39222 = mul( texCoord487_g39222 - float2( 0,0 ) , float2x2( cos481_g39222 , -sin481_g39222 , sin481_g39222 , cos481_g39222 )) + float2( 0,0 );
				float2 panner480_g39222 = ( mulTime806_g39222 * temp_cast_39 + rotator481_g39222);
				float2 temp_cast_40 = (temp_output_1185_0_g39222).xx;
				float2 panner478_g39222 = ( mulTime806_g39222 * temp_cast_40 + texCoord487_g39222);
				float4 OUT_SWIRLING298_g39222 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner483_g39222 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner480_g39222 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner478_g39222 ) ) );
				float4 m_Swirling278_g39222 = OUT_SWIRLING298_g39222;
				float2 texCoord196_g39227 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39227 = IN.ase_texcoord8;
				float2 blendOpSrc197_g39227 = texCoord196_g39227;
				float2 blendOpDest197_g39227 = (_FLOWMAP_Map89_g39227).xy;
				float2 temp_output_197_0_g39227 = ( saturate( (( blendOpDest197_g39227 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39227 ) * ( 1.0 - blendOpSrc197_g39227 ) ) : ( 2.0 * blendOpDest197_g39227 * blendOpSrc197_g39227 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39227 = FlowSpeed1179_g39222;
				float temp_output_182_0_g39227 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39227 );
				float temp_output_194_0_g39227 = (0.0 + (( ( temp_output_182_0_g39227 - floor( ( temp_output_182_0_g39227 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1182_g39222 = _FoamShoreline_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39227 = FlowStrength1182_g39222;
				float _TIME_UV_A199_g39227 = ( -temp_output_194_0_g39227 * _FLOWMAP_FlowStrength146_g39227 );
				float2 lerpResult198_g39227 = lerp( temp_output_197_0_g39227 , texCoord196_g39227 , _TIME_UV_A199_g39227);
				float2 INPUT_MAP_TILLING128_g39222 = temp_output_1196_0_g39222;
				float2 texCoord205_g39227 = IN.ase_texcoord7.xyz.xy * INPUT_MAP_TILLING128_g39222 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39227 = texCoord205_g39227;
				float2 FLOW_A201_g39227 = ( lerpResult198_g39227 + TEXTURE_TILLING211_g39227 );
				float temp_output_225_0_g39227 = (temp_output_182_0_g39227*1.0 + 0.5);
				float _TIME_UV_B214_g39227 = ( -(0.0 + (( ( temp_output_225_0_g39227 - floor( ( temp_output_225_0_g39227 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39227 );
				float2 lerpResult229_g39227 = lerp( temp_output_197_0_g39227 , texCoord196_g39227 , _TIME_UV_B214_g39227);
				float2 FLOW_B232_g39227 = ( lerpResult229_g39227 + TEXTURE_TILLING211_g39227 );
				float TIME_BLEND235_g39227 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39227 / 0.5 ) ) ) );
				float4 lerpResult1153_g39222 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39227 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39227 ) , TIME_BLEND235_g39227);
				float4 OUT_FLOW_FLOWMAP1156_g39222 = lerpResult1153_g39222;
				float4 m_FlowMap278_g39222 = OUT_FLOW_FLOWMAP1156_g39222;
				float4 localfloat4switch278_g39222 = float4switch278_g39222( m_switch278_g39222 , m_Off278_g39222 , m_Swirling278_g39222 , m_FlowMap278_g39222 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39222 = temp_cast_43;
				float3 unityObjectToViewPos731_g39222 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39222 = temp_cast_44;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39222 = temp_cast_46;
				float4 lerpResult769_g39222 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g39222 * _FoamShoreline_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39222 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g39222.z + GRAB_SCREEN_DEPTH310_g39222 ) - temp_cast_45 ) * GRAB_SCREEN_CLOSENESS312_g39222 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * GRAB_SCREEN_CLOSENESS312_g39222 ) ) ));
				float4 lerpResult761_g39222 = lerp( float4( 0,0,0,0 ) , lerpResult769_g39222 , FlowStrength1182_g39222);
				float4 FOAM_SHORELINE654_g39180 = lerpResult761_g39222;
				float4 temp_output_1492_0_g39180 = ( ( ( lerpResult105_g39180 + FOAM_VERTICAL_OFFSHORE655_g39180 ) + FOAM_HORIZONTAL_OFFSHORE1565_g39180 ) + FOAM_SHORELINE654_g39180 );
				float4 ALBEDO_IN60_g39189 = temp_output_1492_0_g39180;
				float4 m_Off119_g39189 = ALBEDO_IN60_g39189;
				int m_switch91_g39189 = _Reflection_FresnelMode;
				int REFLECTION_MODE_URP123_g39189 = _Reflection_ModeURP;
				int m_switch124_g39189 = REFLECTION_MODE_URP123_g39189;
				float4 m_Off124_g39189 = float4( 0,0,0,0 );
				float3 NORMAL_OUT_Z505_g39180 = weightedBlend1711_g39180;
				float3 temp_output_53_0_g39189 = NORMAL_OUT_Z505_g39180;
				float3 NORMAL_IN106_g39189 = temp_output_53_0_g39189;
				float2 temp_cast_49 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_50 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g39189 = clamp( ( (( NORMAL_IN106_g39189 * 50.0 )).xy * _Reflection_BumpScale ) , temp_cast_49 , temp_cast_50 );
				float2 REFLECTION_BUMP9_g39189 = clampResult29_g39189;
				float4 appendResult103_g39189 = (float4(1.0 , 0.0 , 1.0 , temp_output_53_0_g39189.x));
				float3 unpack104_g39189 = UnpackNormalScale( appendResult103_g39189, 0.15 );
				unpack104_g39189.z = lerp( 1, unpack104_g39189.z, saturate(0.15) );
				float3 NORMAL_IN_Z54_g39189 = unpack104_g39189;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 worldRefl24_g39189 = reflect( -WorldViewDirection, float3( dot( tanToWorld0, NORMAL_IN_Z54_g39189 ), dot( tanToWorld1, NORMAL_IN_Z54_g39189 ), dot( tanToWorld2, NORMAL_IN_Z54_g39189 ) ) );
				float REFLECTION_WOBBLE13_g39189 = _Reflection_Wobble;
				float4 texCUBENode31_g39189 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat, ( float3( REFLECTION_BUMP9_g39189 ,  0.0 ) + worldRefl24_g39189 + REFLECTION_WOBBLE13_g39189 ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_52 = (texCUBENode31_g39189.r).xxxx;
				float REFLECTION_CLOUD12_g39189 = _Reflection_Cloud;
				float4 lerpResult49_g39189 = lerp( texCUBENode31_g39189 , temp_cast_52 , REFLECTION_CLOUD12_g39189);
				float4 m_ActiveCubeMap124_g39189 = lerpResult49_g39189;
				float3 temp_output_109_0_g39189 = SHADERGRAPH_REFLECTION_PROBE(WorldViewDirection,float3( ( REFLECTION_BUMP9_g39189 + REFLECTION_WOBBLE13_g39189 ) ,  0.0 ),_Reflection_LOD);
				float3 temp_cast_55 = (temp_output_109_0_g39189.x).xxx;
				float3 lerpResult115_g39189 = lerp( temp_output_109_0_g39189 , temp_cast_55 , REFLECTION_CLOUD12_g39189);
				float4 appendResult127_g39189 = (float4(lerpResult115_g39189 , 0.0));
				float4 m_ActiveProbe124_g39189 = appendResult127_g39189;
				float4 localfloat4switch124_g39189 = float4switch124_g39189( m_switch124_g39189 , m_Off124_g39189 , m_ActiveCubeMap124_g39189 , m_ActiveProbe124_g39189 );
				float4 m_Off91_g39189 = localfloat4switch124_g39189;
				float fresnelNdotV23_g39189 = dot( WorldNormal, WorldViewDirection );
				float fresnelNode23_g39189 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g39189 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g39189 = ( _Reflection_FresnelStrength * fresnelNode23_g39189 );
				float4 lerpResult73_g39189 = lerp( float4( 0,0,0,0 ) , localfloat4switch124_g39189 , REFLECTION_FRESNEL11_g39189);
				float4 m_Active91_g39189 = lerpResult73_g39189;
				float4 localfloat4switch91_g39189 = float4switch91_g39189( m_switch91_g39189 , m_Off91_g39189 , m_Active91_g39189 );
				float4 switchResult85_g39189 = (((ase_vface>0)?(localfloat4switch91_g39189):(float4( 0,0,0,0 ))));
				float4 temp_cast_58 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch95_g39189 = temp_cast_58;
				#else
				float4 staticSwitch95_g39189 = ( ( ( 1.0 - 0.5 ) * switchResult85_g39189 ) + ( ALBEDO_IN60_g39189 * 0.5 ) );
				#endif
				float4 m_ActiveCubeMap119_g39189 = staticSwitch95_g39189;
				float4 m_ActiveProbe119_g39189 = staticSwitch95_g39189;
				float4 localfloat4switch119_g39189 = float4switch119_g39189( m_switch119_g39189 , m_Off119_g39189 , m_ActiveCubeMap119_g39189 , m_ActiveProbe119_g39189 );
				
				int ModeFlowType1245_g39181 = _FOAMVERTICAL_ModeFlowType;
				int m_switch1246_g39181 = ModeFlowType1245_g39181;
				float3 m_Off1246_g39181 = float3( 0,0,1 );
				float3 temp_output_21_0_g39185 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g39185 = cross( WorldNormal , ddy( temp_output_21_0_g39185 ) );
				float3 temp_output_6_0_g39185 = ddx( temp_output_21_0_g39185 );
				float dotResult27_g39185 = dot( temp_output_15_0_g39185 , temp_output_6_0_g39185 );
				float temp_output_14_0_g39185 = abs( dotResult27_g39185 );
				float4 temp_output_8_0_g39185 = ( _FOAMVERTICAL_NormalStrength * temp_output_1189_0_g39181 );
				float4 break18_g39185 = ( sign( temp_output_14_0_g39185 ) * ( ( ddx( temp_output_8_0_g39185 ) * float4( temp_output_15_0_g39185 , 0.0 ) ) + ( ddy( temp_output_8_0_g39185 ) * float4( cross( WorldNormal , temp_output_6_0_g39185 ) , 0.0 ) ) ) );
				float3 appendResult7_g39185 = (float3(break18_g39185.x , -break18_g39185.y , break18_g39185.z));
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 worldToTangentDir5_g39185 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g39185 * WorldNormal ) - appendResult7_g39185 )) );
				float3 temp_output_1249_32_g39181 = worldToTangentDir5_g39185;
				float3 m_Swirling1246_g39181 = temp_output_1249_32_g39181;
				float3 m_FlowMap1246_g39181 = temp_output_1249_32_g39181;
				float3 localfloat3switch1246_g39181 = float3switch1246_g39181( m_switch1246_g39181 , m_Off1246_g39181 , m_Swirling1246_g39181 , m_FlowMap1246_g39181 );
				float3 FOAM_VERTICAL_OFFSHORE_NORMAL1192_g39180 = localfloat3switch1246_g39181;
				int ModeFlowType1232_g39233 = _FOAMHORIZONTAL_ModeFlowType;
				int m_switch1230_g39233 = ModeFlowType1232_g39233;
				float3 m_Off1230_g39233 = float3( 0,0,1 );
				float3 temp_output_21_0_g39237 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g39237 = cross( WorldNormal , ddy( temp_output_21_0_g39237 ) );
				float3 temp_output_6_0_g39237 = ddx( temp_output_21_0_g39237 );
				float dotResult27_g39237 = dot( temp_output_15_0_g39237 , temp_output_6_0_g39237 );
				float temp_output_14_0_g39237 = abs( dotResult27_g39237 );
				float4 temp_output_8_0_g39237 = ( _FOAMHORIZONTAL_NormalStrength * temp_output_1188_0_g39233 );
				float4 break18_g39237 = ( sign( temp_output_14_0_g39237 ) * ( ( ddx( temp_output_8_0_g39237 ) * float4( temp_output_15_0_g39237 , 0.0 ) ) + ( ddy( temp_output_8_0_g39237 ) * float4( cross( WorldNormal , temp_output_6_0_g39237 ) , 0.0 ) ) ) );
				float3 appendResult7_g39237 = (float3(break18_g39237.x , -break18_g39237.y , break18_g39237.z));
				float3 worldToTangentDir5_g39237 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g39237 * WorldNormal ) - appendResult7_g39237 )) );
				float3 temp_output_1233_32_g39233 = worldToTangentDir5_g39237;
				float3 m_Swirling1230_g39233 = temp_output_1233_32_g39233;
				float3 m_FlowMap1230_g39233 = temp_output_1233_32_g39233;
				float3 localfloat3switch1230_g39233 = float3switch1230_g39233( m_switch1230_g39233 , m_Off1230_g39233 , m_Swirling1230_g39233 , m_FlowMap1230_g39233 );
				float3 FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g39180 = localfloat3switch1230_g39233;
				int ModeFlowType1225_g39222 = _FoamShoreline_ModeFlowType;
				int m_switch1223_g39222 = ModeFlowType1225_g39222;
				float3 m_Off1223_g39222 = float3( 0,0,1 );
				float3 temp_output_21_0_g39226 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g39226 = cross( WorldNormal , ddy( temp_output_21_0_g39226 ) );
				float3 temp_output_6_0_g39226 = ddx( temp_output_21_0_g39226 );
				float dotResult27_g39226 = dot( temp_output_15_0_g39226 , temp_output_6_0_g39226 );
				float temp_output_14_0_g39226 = abs( dotResult27_g39226 );
				float4 temp_output_8_0_g39226 = ( _FoamShoreline_NormalStrength * lerpResult761_g39222 );
				float4 break18_g39226 = ( sign( temp_output_14_0_g39226 ) * ( ( ddx( temp_output_8_0_g39226 ) * float4( temp_output_15_0_g39226 , 0.0 ) ) + ( ddy( temp_output_8_0_g39226 ) * float4( cross( WorldNormal , temp_output_6_0_g39226 ) , 0.0 ) ) ) );
				float3 appendResult7_g39226 = (float3(break18_g39226.x , -break18_g39226.y , break18_g39226.z));
				float3 worldToTangentDir5_g39226 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g39226 * WorldNormal ) - appendResult7_g39226 )) );
				float3 temp_output_1222_32_g39222 = worldToTangentDir5_g39226;
				float3 m_Swirling1223_g39222 = temp_output_1222_32_g39222;
				float3 m_FlowMap1223_g39222 = temp_output_1222_32_g39222;
				float3 localfloat3switch1223_g39222 = float3switch1223_g39222( m_switch1223_g39222 , m_Off1223_g39222 , m_Swirling1223_g39222 , m_FlowMap1223_g39222 );
				float3 FOAM_NORMALShorline1208_g39180 = localfloat3switch1223_g39222;
				float3 temp_output_1715_0_g39180 = BlendNormal( BlendNormal( BlendNormal( weightedBlend1711_g39180 , FOAM_VERTICAL_OFFSHORE_NORMAL1192_g39180 ) , FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g39180 ) , FOAM_NORMALShorline1208_g39180 );
				float3 worldPosValue71_g39229 = WorldPosition;
				float3 WorldPosition66_g39229 = worldPosValue71_g39229;
				float3 NORMAL_OUT1731_g39180 = temp_output_1715_0_g39180;
				float3 temp_output_16_0_g39229 = NORMAL_OUT1731_g39180;
				float3 lerpResult163_g39229 = lerp( ( WorldTangent * temp_output_16_0_g39229.x ) , ( WorldBiTangent * temp_output_16_0_g39229.y ) , ( WorldNormal * temp_output_16_0_g39229.z ));
				float3 NORMAL_PERPIXEL136_g39229 = lerpResult163_g39229;
				float3 WorldNormal66_g39229 = NORMAL_PERPIXEL136_g39229;
				float3 WorldView66_g39229 = WorldViewDirection;
				float3 temp_output_1_0_g39229 = _URP_SpecularColor.rgb;
				float3 SpecColor66_g39229 = (temp_output_1_0_g39229).xyz;
				float temp_output_173_0_g39229 = ( 1.0 - _URP_SpecularStrength );
				float Smoothness66_g39229 = temp_output_173_0_g39229;
				float4 shadowMaskValue77_g39229 = float4(1,1,1,1);
				float4 ShadowMask66_g39229 = shadowMaskValue77_g39229;
				float3 localAdditionalLightsSpecularMask66_g39229 = AdditionalLightsSpecularMask( WorldPosition66_g39229 , WorldNormal66_g39229 , WorldView66_g39229 , SpecColor66_g39229 , Smoothness66_g39229 , ShadowMask66_g39229 );
				float3 ADDITIONAL_LIGHT1730_g39180 = localAdditionalLightsSpecularMask66_g39229;
				float3 temp_output_1732_0_g39180 = ( temp_output_1715_0_g39180 + ADDITIONAL_LIGHT1730_g39180 );
				
				int temp_output_43_0_g39205 = _Specular_Mode;
				int m_switch18_g39205 = temp_output_43_0_g39205;
				float3 m_Off18_g39205 = float3( 0,0,0 );
				float3 tanNormal37_g39205 = temp_output_1732_0_g39180;
				float3 worldNormal37_g39205 = float3(dot(tanToWorld0,tanNormal37_g39205), dot(tanToWorld1,tanNormal37_g39205), dot(tanToWorld2,tanNormal37_g39205));
				float3 normalizeResult20_g39205 = normalize( worldNormal37_g39205 );
				float3 normalizeResult27_g39205 = normalize( ( WorldViewDirection + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult19_g39205 = dot( normalizeResult20_g39205 , normalizeResult27_g39205 );
				float temp_output_48_0_g39205 = _SpecularWrap;
				float temp_output_46_0_g39205 = (dotResult19_g39205*temp_output_48_0_g39205 + temp_output_48_0_g39205);
				float saferPower25_g39205 = max( ( temp_output_46_0_g39205 * temp_output_46_0_g39205 * temp_output_46_0_g39205 ) , 0.0001 );
				int _SPECULAR_Mode22_g39205 = temp_output_43_0_g39205;
				int m_switch31_g39205 = _SPECULAR_Mode22_g39205;
				float3 m_Off31_g39205 = float3( 0,0,0 );
				float3 temp_output_16_0_g39205 = (_SpecularColor).rgb;
				float3 m_Active31_g39205 = temp_output_16_0_g39205;
				float3 clampResult5_g39205 = clamp( temp_output_16_0_g39205 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp31_g39205 = clampResult5_g39205;
				float3 localfloat3switch31_g39205 = float3switch31_g39205( m_switch31_g39205 , m_Off31_g39205 , m_Active31_g39205 , m_ActiveClamp31_g39205 );
				int m_switch11_g39205 = _SPECULAR_Mode22_g39205;
				float3 m_Off11_g39205 = float3( 0,0,0 );
				float3 temp_output_4_0_g39205 = (_MainLightColor).rgb;
				float3 m_Active11_g39205 = temp_output_4_0_g39205;
				float3 clampResult9_g39205 = clamp( temp_output_4_0_g39205 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp11_g39205 = clampResult9_g39205;
				float3 localfloat3switch11_g39205 = float3switch11_g39205( m_switch11_g39205 , m_Off11_g39205 , m_Active11_g39205 , m_ActiveClamp11_g39205 );
				float3 temp_output_24_0_g39205 = saturate( ( pow( saferPower25_g39205 , ( 1.0 - _Shininess ) ) * saturate( ( localfloat3switch31_g39205 * localfloat3switch11_g39205 ) ) ) );
				float3 m_Active18_g39205 = temp_output_24_0_g39205;
				float3 m_ActiveClamp18_g39205 = temp_output_24_0_g39205;
				float3 localfloat3switch18_g39205 = float3switch18_g39205( m_switch18_g39205 , m_Off18_g39205 , m_Active18_g39205 , m_ActiveClamp18_g39205 );
				
				float temp_output_1454_0_g39180 = ( _SMOOTHNESS_Strength * _SMOOTHNESS_Strength );
				float3 temp_cast_67 = (temp_output_1454_0_g39180).xxx;
				float3 tanNormal1601_g39180 = NORMAL_OUT_Z505_g39180;
				float3 worldNormal1601_g39180 = float3(dot(tanToWorld0,tanNormal1601_g39180), dot(tanToWorld1,tanNormal1601_g39180), dot(tanToWorld2,tanNormal1601_g39180));
				float fresnelNdotV1412_g39180 = dot( worldNormal1601_g39180, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode1412_g39180 = ( _SMOOTHNESS_FresnelBias + _SMOOTHNESS_FresnelScale * pow( max( 1.0 - fresnelNdotV1412_g39180 , 0.0001 ), _SMOOTHNESS_FresnelPower ) );
				float3 lerpResult1403_g39180 = lerp( temp_cast_67 , ( temp_output_1454_0_g39180 * worldNormal1601_g39180 ) , ( fresnelNode1412_g39180 * ( 1.0 - fresnelNode1412_g39180 ) ));
				float3 clampResult1740_g39180 = clamp( lerpResult1403_g39180 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				
				float3 Albedo = localfloat4switch119_g39189.xyz;
				float3 Normal = temp_output_1732_0_g39180;
				float3 Emission = 0;
				float3 Specular = localfloat3switch18_g39205;
				float Metallic = 0;
				float Smoothness = clampResult1740_g39180.x;
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;
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
					float shadow = _TransmissionShadow;

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
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

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
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
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

			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			float4 _FOAMVERTICAL_Tint;
			half4 _URP_SpecularColor;
			float _AlphatoCoverage;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			int _Reflection_FresnelMode;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpScale;
			float _Reflection_Smoothness;
			float _Reflection_Wobble;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _Reflection_Cloud;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_BumpClamp;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Vertical_FlowType;
			int _WaterNormal_Horizontal_FlowType;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _CullMode;
			float _DepthOffset;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _FOAMHORIZONTAL_Speed;
			float _SMOOTHNESS_FresnelPower;
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
			

			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			

			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
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
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
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

			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			float4 _FOAMVERTICAL_Tint;
			half4 _URP_SpecularColor;
			float _AlphatoCoverage;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			int _Reflection_FresnelMode;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpScale;
			float _Reflection_Smoothness;
			float _Reflection_Wobble;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _Reflection_Cloud;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_BumpClamp;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Vertical_FlowType;
			int _WaterNormal_Horizontal_FlowType;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _CullMode;
			float _DepthOffset;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _FOAMHORIZONTAL_Speed;
			float _SMOOTHNESS_FresnelPower;
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
			

			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			float4 _FOAMVERTICAL_Tint;
			half4 _URP_SpecularColor;
			float _AlphatoCoverage;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			int _Reflection_FresnelMode;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpScale;
			float _Reflection_Smoothness;
			float _Reflection_Wobble;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _Reflection_Cloud;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_BumpClamp;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Vertical_FlowType;
			int _WaterNormal_Horizontal_FlowType;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _CullMode;
			float _DepthOffset;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _FOAMHORIZONTAL_Speed;
			float _SMOOTHNESS_FresnelPower;
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
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_WaterNormal_Horizontal_Vertical_NormalMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_WaterNormal_Vertical_NormalMap);
			TEXTURE2D(_FOAMVERTICAL_FoamMap);
			TEXTURE2D(_FOAMHORIZONTAL_FoamMap);
			TEXTURE2D(_FoamShoreline_FoamMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float3 float3switch238_g39212( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch456_g39193( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g39181( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g39233( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g39222( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch124_g39189( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch91_g39189( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch119_g39189( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord3.w = eyeDepth;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord7.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				
				o.ase_texcoord3.xyz = v.ase_texcoord.xyz;
				o.ase_texcoord5 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord6 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

			half4 frag(VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC ) : SV_TARGET
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

				int m_switch119_g39189 = _Reflection_ModeURP;
				float4 screenPos = IN.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g39180 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g39180 = abs( ( screenDepth2_g39180 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g39180 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g39180*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g39180 = lerp( _DepthTint , lerpResult25_g39180 , saturate( (distanceDepth2_g39180*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g39180 = lerpResult27_g39180;
				int m_switch238_g39212 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g39212 = float3(0,0,0.001);
				float mulTime155_g39212 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g39212 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g39212 = ( FlowSpeed365_g39212 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g39212).xx;
				float2 appendResult235_g39212 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g39212 = IN.ase_texcoord3.xyz.xy * ( appendResult235_g39212 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g39212 = cos( _G_FlowSwirling.x );
				float sin62_g39212 = sin( _G_FlowSwirling.x );
				float2 rotator62_g39212 = mul( texCoord23_g39212 - float2( 0,0 ) , float2x2( cos62_g39212 , -sin62_g39212 , sin62_g39212 , cos62_g39212 )) + float2( 0,0 );
				float2 panner15_g39212 = ( mulTime155_g39212 * temp_cast_0 + rotator62_g39212);
				float2 temp_cast_1 = (temp_output_367_0_g39212).xx;
				float cos8_g39212 = cos( _G_FlowSwirling.y );
				float sin8_g39212 = sin( _G_FlowSwirling.y );
				float2 rotator8_g39212 = mul( texCoord23_g39212 - float2( 0,0 ) , float2x2( cos8_g39212 , -sin8_g39212 , sin8_g39212 , cos8_g39212 )) + float2( 0,0 );
				float2 panner16_g39212 = ( mulTime155_g39212 * temp_cast_1 + rotator8_g39212);
				float2 temp_cast_2 = (temp_output_367_0_g39212).xx;
				float2 panner17_g39212 = ( mulTime155_g39212 * temp_cast_2 + texCoord23_g39212);
				float2 layeredBlendVar666_g39212 = IN.ase_texcoord3.xyz.xy;
				float4 layeredBlend666_g39212 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g39212 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g39212 ) , layeredBlendVar666_g39212.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g39212 ) , layeredBlendVar666_g39212.y ) );
				float4 temp_output_1_0_g39213 = layeredBlend666_g39212;
				float temp_output_8_0_g39213 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g39213 = UnpackNormalScale( temp_output_1_0_g39213, temp_output_8_0_g39213 );
				unpack52_g39213.z = lerp( 1, unpack52_g39213.z, saturate(temp_output_8_0_g39213) );
				float3 temp_output_699_59_g39212 = unpack52_g39213;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 temp_output_372_0_g39212 = abs( ase_worldNormal );
				float3 break386_g39212 = ( temp_output_372_0_g39212 * temp_output_372_0_g39212 );
				float _MASK_VERTICAL_Z381_g39212 = ( break386_g39212.z + 0.01 );
				float3 lerpResult677_g39212 = lerp( float3( 0,0,0 ) , temp_output_699_59_g39212 , _MASK_VERTICAL_Z381_g39212);
				float _MASK_VERTICAL_X373_g39212 = ( -break386_g39212.x + 0.2 );
				float3 lerpResult681_g39212 = lerp( float3( 0,0,0 ) , temp_output_699_59_g39212 , _MASK_VERTICAL_X373_g39212);
				float _MASK_VERTICAL_Y_NEG413_g39212 = ( ( ase_worldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g39212 = lerp( float3( 0,0,0 ) , ( lerpResult677_g39212 + lerpResult681_g39212 ) , _MASK_VERTICAL_Y_NEG413_g39212);
				float3 m_Swirling238_g39212 = lerpResult679_g39212;
				float2 texCoord196_g39217 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39217 = IN.ase_texcoord5;
				float2 blendOpSrc197_g39217 = texCoord196_g39217;
				float2 blendOpDest197_g39217 = (_FLOWMAP_Map89_g39217).xy;
				float2 temp_output_197_0_g39217 = ( saturate( (( blendOpDest197_g39217 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39217 ) * ( 1.0 - blendOpSrc197_g39217 ) ) : ( 2.0 * blendOpDest197_g39217 * blendOpSrc197_g39217 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39217 = FlowSpeed365_g39212;
				float temp_output_182_0_g39217 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39217 );
				float temp_output_194_0_g39217 = (0.0 + (( ( temp_output_182_0_g39217 - floor( ( temp_output_182_0_g39217 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g39217 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g39217 = ( -temp_output_194_0_g39217 * _FLOWMAP_FlowStrength146_g39217 );
				float2 lerpResult198_g39217 = lerp( temp_output_197_0_g39217 , texCoord196_g39217 , _TIME_UV_A199_g39217);
				float2 INPUT_MAP_TILLING128_g39212 = appendResult235_g39212;
				float2 texCoord205_g39217 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g39212 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39217 = texCoord205_g39217;
				float2 FLOW_A201_g39217 = ( lerpResult198_g39217 + TEXTURE_TILLING211_g39217 );
				float temp_output_225_0_g39217 = (temp_output_182_0_g39217*1.0 + 0.5);
				float _TIME_UV_B214_g39217 = ( -(0.0 + (( ( temp_output_225_0_g39217 - floor( ( temp_output_225_0_g39217 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39217 );
				float2 lerpResult229_g39217 = lerp( temp_output_197_0_g39217 , texCoord196_g39217 , _TIME_UV_B214_g39217);
				float2 FLOW_B232_g39217 = ( lerpResult229_g39217 + TEXTURE_TILLING211_g39217 );
				float TIME_BLEND235_g39217 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39217 / 0.5 ) ) ) );
				float4 lerpResult317_g39212 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g39217 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g39217 ) , TIME_BLEND235_g39217);
				float4 temp_output_1_0_g39219 = lerpResult317_g39212;
				float NormalStrength152_g39212 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g39219 = NormalStrength152_g39212;
				float3 unpack52_g39219 = UnpackNormalScale( temp_output_1_0_g39219, temp_output_8_0_g39219 );
				unpack52_g39219.z = lerp( 1, unpack52_g39219.z, saturate(temp_output_8_0_g39219) );
				float3 temp_output_701_59_g39212 = unpack52_g39219;
				float3 lerpResult692_g39212 = lerp( float3( 0,0,0 ) , temp_output_701_59_g39212 , _MASK_VERTICAL_Z381_g39212);
				float3 lerpResult691_g39212 = lerp( float3( 0,0,0 ) , temp_output_701_59_g39212 , _MASK_VERTICAL_X373_g39212);
				float3 lerpResult697_g39212 = lerp( float3( 0,0,0 ) , ( lerpResult692_g39212 + lerpResult691_g39212 ) , _MASK_VERTICAL_Y_NEG413_g39212);
				float3 m_FlowMap238_g39212 = lerpResult697_g39212;
				float3 localfloat3switch238_g39212 = float3switch238_g39212( m_switch238_g39212 , m_Off238_g39212 , m_Swirling238_g39212 , m_FlowMap238_g39212 );
				int m_switch456_g39193 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g39193 = float3(0,0,0.001);
				float mulTime155_g39193 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g39193 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g39193 = ( FlowSpeed365_g39193 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g39193).xx;
				float2 appendResult235_g39193 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g39193 = IN.ase_texcoord3.xyz.xy * ( appendResult235_g39193 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g39193 = cos( _G_FlowSwirling.x );
				float sin62_g39193 = sin( _G_FlowSwirling.x );
				float2 rotator62_g39193 = mul( texCoord23_g39193 - float2( 0,0 ) , float2x2( cos62_g39193 , -sin62_g39193 , sin62_g39193 , cos62_g39193 )) + float2( 0,0 );
				float2 panner15_g39193 = ( mulTime155_g39193 * temp_cast_5 + rotator62_g39193);
				float2 temp_cast_6 = (temp_output_367_0_g39193).xx;
				float cos8_g39193 = cos( _G_FlowSwirling.y );
				float sin8_g39193 = sin( _G_FlowSwirling.y );
				float2 rotator8_g39193 = mul( texCoord23_g39193 - float2( 0,0 ) , float2x2( cos8_g39193 , -sin8_g39193 , sin8_g39193 , cos8_g39193 )) + float2( 0,0 );
				float2 panner16_g39193 = ( mulTime155_g39193 * temp_cast_6 + rotator8_g39193);
				float2 temp_cast_7 = (temp_output_367_0_g39193).xx;
				float2 panner17_g39193 = ( mulTime155_g39193 * temp_cast_7 + texCoord23_g39193);
				float2 layeredBlendVar448_g39193 = IN.ase_texcoord3.xyz.xy;
				float4 layeredBlend448_g39193 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g39193 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g39193 ) , layeredBlendVar448_g39193.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g39193 ) , layeredBlendVar448_g39193.y ) );
				float4 temp_output_1_0_g39197 = layeredBlend448_g39193;
				float temp_output_8_0_g39197 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g39197 = UnpackNormalScale( temp_output_1_0_g39197, temp_output_8_0_g39197 );
				unpack52_g39197.z = lerp( 1, unpack52_g39197.z, saturate(temp_output_8_0_g39197) );
				float3 temp_output_481_59_g39193 = unpack52_g39197;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g39193 = ( abs( ase_worldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g39193 = ( break386_g39193.z + 0.75 );
				float3 lerpResult465_g39193 = lerp( float3( 0,0,0 ) , temp_output_481_59_g39193 , _MASK_VERTICAL_Z381_g39193);
				float _MASK_VERTICAL_X373_g39193 = ( break386_g39193.x + 0.45 );
				float3 lerpResult457_g39193 = lerp( float3( 0,0,0 ) , temp_output_481_59_g39193 , _MASK_VERTICAL_X373_g39193);
				float _MASK_VERTICAL_Y383_g39193 = ( -break386_g39193.y + 5.0 );
				float3 lerpResult454_g39193 = lerp( lerpResult465_g39193 , ( lerpResult465_g39193 + lerpResult457_g39193 ) , _MASK_VERTICAL_Y383_g39193);
				float _MASK_VERTICAL_Y_NEG413_g39193 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.0 );
				float3 lerpResult477_g39193 = lerp( float3( 0,0,0 ) , lerpResult454_g39193 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g39193 ));
				float3 m_Swirling456_g39193 = lerpResult477_g39193;
				float2 texCoord196_g39195 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39195 = IN.ase_texcoord5;
				float2 blendOpSrc197_g39195 = texCoord196_g39195;
				float2 blendOpDest197_g39195 = (_FLOWMAP_Map89_g39195).xy;
				float2 temp_output_197_0_g39195 = ( saturate( (( blendOpDest197_g39195 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39195 ) * ( 1.0 - blendOpSrc197_g39195 ) ) : ( 2.0 * blendOpDest197_g39195 * blendOpSrc197_g39195 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39195 = FlowSpeed365_g39193;
				float temp_output_182_0_g39195 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39195 );
				float temp_output_194_0_g39195 = (0.0 + (( ( temp_output_182_0_g39195 - floor( ( temp_output_182_0_g39195 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g39195 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g39195 = ( -temp_output_194_0_g39195 * _FLOWMAP_FlowStrength146_g39195 );
				float2 lerpResult198_g39195 = lerp( temp_output_197_0_g39195 , texCoord196_g39195 , _TIME_UV_A199_g39195);
				float2 INPUT_MAP_TILLING128_g39193 = appendResult235_g39193;
				float2 texCoord205_g39195 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g39193 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39195 = texCoord205_g39195;
				float2 FLOW_A201_g39195 = ( lerpResult198_g39195 + TEXTURE_TILLING211_g39195 );
				float temp_output_225_0_g39195 = (temp_output_182_0_g39195*1.0 + 0.5);
				float _TIME_UV_B214_g39195 = ( -(0.0 + (( ( temp_output_225_0_g39195 - floor( ( temp_output_225_0_g39195 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39195 );
				float2 lerpResult229_g39195 = lerp( temp_output_197_0_g39195 , texCoord196_g39195 , _TIME_UV_B214_g39195);
				float2 FLOW_B232_g39195 = ( lerpResult229_g39195 + TEXTURE_TILLING211_g39195 );
				float TIME_BLEND235_g39195 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39195 / 0.5 ) ) ) );
				float4 lerpResult317_g39193 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g39195 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g39195 ) , TIME_BLEND235_g39195);
				float4 temp_output_1_0_g39201 = lerpResult317_g39193;
				float NormalStrength152_g39193 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g39201 = NormalStrength152_g39193;
				float3 unpack52_g39201 = UnpackNormalScale( temp_output_1_0_g39201, temp_output_8_0_g39201 );
				unpack52_g39201.z = lerp( 1, unpack52_g39201.z, saturate(temp_output_8_0_g39201) );
				float3 temp_output_483_59_g39193 = unpack52_g39201;
				float3 lerpResult466_g39193 = lerp( float3( 0,0,0 ) , temp_output_483_59_g39193 , _MASK_VERTICAL_Z381_g39193);
				float3 lerpResult453_g39193 = lerp( float3( 0,0,0 ) , temp_output_483_59_g39193 , _MASK_VERTICAL_X373_g39193);
				float3 lerpResult460_g39193 = lerp( lerpResult466_g39193 , ( lerpResult466_g39193 + lerpResult453_g39193 ) , _MASK_VERTICAL_Y383_g39193);
				float3 lerpResult411_g39193 = lerp( float3( 0,0,0 ) , lerpResult460_g39193 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g39193 ));
				float3 m_FlowMap456_g39193 = lerpResult411_g39193;
				float3 localfloat3switch456_g39193 = float3switch456_g39193( m_switch456_g39193 , m_Off456_g39193 , m_Swirling456_g39193 , m_FlowMap456_g39193 );
				float2 weightedBlendVar1711_g39180 = IN.ase_texcoord3.xyz.xy;
				float3 weightedBlend1711_g39180 = ( weightedBlendVar1711_g39180.x*localfloat3switch238_g39212 + weightedBlendVar1711_g39180.y*localfloat3switch456_g39193 );
				float3 NORMAL_IN84_g39240 = ( weightedBlend1711_g39180 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g39240 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord3.w;
				float eyeDepth7_g39240 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g39240 = ( (NORMAL_IN84_g39240).xy * ( REFACTED_SCALE_FLOAT78_g39240 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g39240 - eyeDepth ) ) );
				float eyeDepth27_g39240 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g39240, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g39240 = (( float4( ( temp_output_21_0_g39240 * saturate( ( eyeDepth27_g39240 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g39240 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g39240 ), 1.0 );
				float4 REFRACTED_DEPTH144_g39180 = fetchOpaqueVal89_g39240;
				float temp_output_20_0_g39180 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g39180 = 0.0;
				#else
				float staticSwitch37_g39180 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g39180*-5.0 + 1.0) ) ) ) * temp_output_20_0_g39180 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g39180 = staticSwitch37_g39180;
				float4 lerpResult105_g39180 = lerp( COLOR_TINT161_g39180 , REFRACTED_DEPTH144_g39180 , DEPTH_TINT_ALPHA93_g39180);
				float4 _MASK_VECTOR1199_g39181 = float4(0.001,0.001,0.001,0);
				int m_switch278_g39181 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g39181 = float4( 0,0,0,0 );
				float mulTime806_g39181 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g39181 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g39181 = ( FlowSpeed1146_g39181 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g39181).xx;
				float2 appendResult219_g39181 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g39181 = ( appendResult219_g39181 * float2( 2,2 ) );
				float2 texCoord487_g39181 = IN.ase_texcoord3.xyz.xy * temp_output_1294_0_g39181 + float2( 0,0 );
				float cos485_g39181 = cos( _G_FlowSwirling.x );
				float sin485_g39181 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39181 = mul( texCoord487_g39181 - float2( 0,0 ) , float2x2( cos485_g39181 , -sin485_g39181 , sin485_g39181 , cos485_g39181 )) + float2( 0,0 );
				float2 panner483_g39181 = ( mulTime806_g39181 * temp_cast_14 + rotator485_g39181);
				float2 temp_cast_15 = (temp_output_1150_0_g39181).xx;
				float cos481_g39181 = cos( _G_FlowSwirling.y );
				float sin481_g39181 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39181 = mul( texCoord487_g39181 - float2( 0,0 ) , float2x2( cos481_g39181 , -sin481_g39181 , sin481_g39181 , cos481_g39181 )) + float2( 0,0 );
				float2 panner480_g39181 = ( mulTime806_g39181 * temp_cast_15 + rotator481_g39181);
				float2 temp_cast_16 = (temp_output_1150_0_g39181).xx;
				float2 panner478_g39181 = ( mulTime806_g39181 * temp_cast_16 + texCoord487_g39181);
				float4 OUT_SWIRLING298_g39181 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner483_g39181 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner480_g39181 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner478_g39181 ) ) );
				float4 m_Swirling278_g39181 = OUT_SWIRLING298_g39181;
				float2 texCoord196_g39186 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39186 = IN.ase_texcoord5;
				float2 blendOpSrc197_g39186 = texCoord196_g39186;
				float2 blendOpDest197_g39186 = (_FLOWMAP_Map89_g39186).xy;
				float2 temp_output_197_0_g39186 = ( saturate( (( blendOpDest197_g39186 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39186 ) * ( 1.0 - blendOpSrc197_g39186 ) ) : ( 2.0 * blendOpDest197_g39186 * blendOpSrc197_g39186 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39186 = FlowSpeed1146_g39181;
				float temp_output_182_0_g39186 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39186 );
				float temp_output_194_0_g39186 = (0.0 + (( ( temp_output_182_0_g39186 - floor( ( temp_output_182_0_g39186 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g39181 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39186 = FlowStrength1147_g39181;
				float _TIME_UV_A199_g39186 = ( -temp_output_194_0_g39186 * _FLOWMAP_FlowStrength146_g39186 );
				float2 lerpResult198_g39186 = lerp( temp_output_197_0_g39186 , texCoord196_g39186 , _TIME_UV_A199_g39186);
				float2 INPUT_MAP_TILLING128_g39181 = temp_output_1294_0_g39181;
				float2 texCoord205_g39186 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g39181 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39186 = texCoord205_g39186;
				float2 FLOW_A201_g39186 = ( lerpResult198_g39186 + TEXTURE_TILLING211_g39186 );
				float temp_output_225_0_g39186 = (temp_output_182_0_g39186*1.0 + 0.5);
				float _TIME_UV_B214_g39186 = ( -(0.0 + (( ( temp_output_225_0_g39186 - floor( ( temp_output_225_0_g39186 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39186 );
				float2 lerpResult229_g39186 = lerp( temp_output_197_0_g39186 , texCoord196_g39186 , _TIME_UV_B214_g39186);
				float2 FLOW_B232_g39186 = ( lerpResult229_g39186 + TEXTURE_TILLING211_g39186 );
				float TIME_BLEND235_g39186 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39186 / 0.5 ) ) ) );
				float4 lerpResult1117_g39181 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39186 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39186 ) , TIME_BLEND235_g39186);
				float4 OUT_FLOW_FLOWMAP1119_g39181 = lerpResult1117_g39181;
				float4 m_FlowMap278_g39181 = OUT_FLOW_FLOWMAP1119_g39181;
				float4 localfloat4switch278_g39181 = float4switch278_g39181( m_switch278_g39181 , m_Off278_g39181 , m_Swirling278_g39181 , m_FlowMap278_g39181 );
				float clampDepth2_g39207 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g39207 = clampDepth2_g39207;
				float4 localCalculateObliqueFrustumCorrection3_g39231 = CalculateObliqueFrustumCorrection();
				float dotResult4_g39231 = dot( float4( IN.ase_texcoord6.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g39231 );
				float correctionFactor1_g39207 = dotResult4_g39231;
				float localCorrectedLinearEyeDepth1_g39207 = CorrectedLinearEyeDepth( z1_g39207 , correctionFactor1_g39207 );
				float eyeDepth18_g39207 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g39207 = ( eyeDepth18_g39207 - screenPos.w );
				float temp_output_13_0_g39207 = ( localCorrectedLinearEyeDepth1_g39207 - abs( temp_output_17_0_g39207 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g39180 = saturate( temp_output_13_0_g39207 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39181 = temp_cast_20;
				float3 unityObjectToViewPos262_g39181 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float GRAB_SCREEN_DEPTH73_g39180 = localCorrectedLinearEyeDepth1_g39207;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39181 = temp_cast_21;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g39180 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39181 = temp_cast_23;
				float4 lerpResult281_g39181 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g39181 * _FOAMVERTICAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39181 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g39181.z + GRAB_SCREEN_DEPTH310_g39181 ) - temp_cast_22 ) * GRAB_SCREEN_CLOSENESS312_g39181 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g39181 ) ) ));
				float4 lerpResult265_g39181 = lerp( float4( 0,0,0,0 ) , lerpResult281_g39181 , FlowStrength1147_g39181);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g39181 = ( abs( ase_worldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g39181 = ( break1161_g39181.z + 0.45 );
				float4 lerpResult1173_g39181 = lerp( _MASK_VECTOR1199_g39181 , lerpResult265_g39181 , _MASK_VERTICAL_Z1162_g39181);
				float _MASK_VERTICAL_X1170_g39181 = ( break1161_g39181.x + 0.46 );
				float4 lerpResult1176_g39181 = lerp( _MASK_VECTOR1199_g39181 , lerpResult265_g39181 , _MASK_VERTICAL_X1170_g39181);
				float _MASK_VERTICAL_Y1163_g39181 = ( -break1161_g39181.y + 6.5 );
				float4 lerpResult1179_g39181 = lerp( lerpResult1173_g39181 , ( lerpResult1173_g39181 + lerpResult1176_g39181 ) , _MASK_VERTICAL_Y1163_g39181);
				float4 temp_output_1189_0_g39181 = saturate( lerpResult1179_g39181 );
				float4 FOAM_VERTICAL_OFFSHORE655_g39180 = temp_output_1189_0_g39181;
				float4 _MASK_VECTOR1200_g39233 = float4(0.001,0.001,0.001,0);
				int m_switch278_g39233 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g39233 = float4( 0,0,0,0 );
				float mulTime806_g39233 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g39233 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g39233 = ( Speed1146_g39233 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g39233).xx;
				float2 appendResult219_g39233 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g39233 = ( appendResult219_g39233 * float2( 2,2 ) );
				float2 texCoord487_g39233 = IN.ase_texcoord3.xyz.xy * temp_output_1214_0_g39233 + float2( 0,0 );
				float cos485_g39233 = cos( _G_FlowSwirling.x );
				float sin485_g39233 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39233 = mul( texCoord487_g39233 - float2( 0,0 ) , float2x2( cos485_g39233 , -sin485_g39233 , sin485_g39233 , cos485_g39233 )) + float2( 0,0 );
				float2 panner483_g39233 = ( mulTime806_g39233 * temp_cast_27 + rotator485_g39233);
				float2 temp_cast_28 = (temp_output_1150_0_g39233).xx;
				float cos481_g39233 = cos( _G_FlowSwirling.y );
				float sin481_g39233 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39233 = mul( texCoord487_g39233 - float2( 0,0 ) , float2x2( cos481_g39233 , -sin481_g39233 , sin481_g39233 , cos481_g39233 )) + float2( 0,0 );
				float2 panner480_g39233 = ( mulTime806_g39233 * temp_cast_28 + rotator481_g39233);
				float2 temp_cast_29 = (temp_output_1150_0_g39233).xx;
				float2 panner478_g39233 = ( mulTime806_g39233 * temp_cast_29 + texCoord487_g39233);
				float4 OUT_SWIRLING298_g39233 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner483_g39233 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner480_g39233 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner478_g39233 ) ) );
				float4 m_Swirling278_g39233 = OUT_SWIRLING298_g39233;
				float2 texCoord196_g39238 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39238 = IN.ase_texcoord5;
				float2 blendOpSrc197_g39238 = texCoord196_g39238;
				float2 blendOpDest197_g39238 = (_FLOWMAP_Map89_g39238).xy;
				float2 temp_output_197_0_g39238 = ( saturate( (( blendOpDest197_g39238 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39238 ) * ( 1.0 - blendOpSrc197_g39238 ) ) : ( 2.0 * blendOpDest197_g39238 * blendOpSrc197_g39238 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39238 = Speed1146_g39233;
				float temp_output_182_0_g39238 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39238 );
				float temp_output_194_0_g39238 = (0.0 + (( ( temp_output_182_0_g39238 - floor( ( temp_output_182_0_g39238 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g39233 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39238 = FlowStrength1147_g39233;
				float _TIME_UV_A199_g39238 = ( -temp_output_194_0_g39238 * _FLOWMAP_FlowStrength146_g39238 );
				float2 lerpResult198_g39238 = lerp( temp_output_197_0_g39238 , texCoord196_g39238 , _TIME_UV_A199_g39238);
				float2 INPUT_MAP_TILLING128_g39233 = temp_output_1214_0_g39233;
				float2 texCoord205_g39238 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g39233 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39238 = texCoord205_g39238;
				float2 FLOW_A201_g39238 = ( lerpResult198_g39238 + TEXTURE_TILLING211_g39238 );
				float temp_output_225_0_g39238 = (temp_output_182_0_g39238*1.0 + 0.5);
				float _TIME_UV_B214_g39238 = ( -(0.0 + (( ( temp_output_225_0_g39238 - floor( ( temp_output_225_0_g39238 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39238 );
				float2 lerpResult229_g39238 = lerp( temp_output_197_0_g39238 , texCoord196_g39238 , _TIME_UV_B214_g39238);
				float2 FLOW_B232_g39238 = ( lerpResult229_g39238 + TEXTURE_TILLING211_g39238 );
				float TIME_BLEND235_g39238 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39238 / 0.5 ) ) ) );
				float4 lerpResult1117_g39233 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39238 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39238 ) , TIME_BLEND235_g39238);
				float4 OUT_FLOW_FLOWMAP1119_g39233 = lerpResult1117_g39233;
				float4 m_FlowMap278_g39233 = OUT_FLOW_FLOWMAP1119_g39233;
				float4 localfloat4switch278_g39233 = float4switch278_g39233( m_switch278_g39233 , m_Off278_g39233 , m_Swirling278_g39233 , m_FlowMap278_g39233 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39233 = temp_cast_32;
				float3 unityObjectToViewPos262_g39233 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39233 = temp_cast_33;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39233 = temp_cast_35;
				float4 lerpResult281_g39233 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g39233 * _FOAMHORIZONTAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39233 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g39233.z + GRAB_SCREEN_DEPTH310_g39233 ) - temp_cast_34 ) * GRAB_SCREEN_CLOSENESS312_g39233 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g39233 ) ) ));
				float4 lerpResult265_g39233 = lerp( float4( 0,0,0,0 ) , lerpResult281_g39233 , FlowStrength1147_g39233);
				float _MASK_HORIZONTAL1160_g39233 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.7 );
				float4 lerpResult1185_g39233 = lerp( _MASK_VECTOR1200_g39233 , lerpResult265_g39233 , _MASK_HORIZONTAL1160_g39233);
				float4 temp_output_1188_0_g39233 = saturate( lerpResult1185_g39233 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g39180 = temp_output_1188_0_g39233;
				int m_switch278_g39222 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g39222 = float4( 0,0,0,0 );
				float mulTime806_g39222 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g39222 = _FoamShoreline_Speed;
				float temp_output_1185_0_g39222 = ( FlowSpeed1179_g39222 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g39222).xx;
				float2 appendResult219_g39222 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g39222 = ( appendResult219_g39222 * float2( 2,2 ) );
				float2 texCoord487_g39222 = IN.ase_texcoord3.xyz.xy * temp_output_1196_0_g39222 + float2( 0,0 );
				float cos485_g39222 = cos( _G_FlowSwirling.x );
				float sin485_g39222 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39222 = mul( texCoord487_g39222 - float2( 0,0 ) , float2x2( cos485_g39222 , -sin485_g39222 , sin485_g39222 , cos485_g39222 )) + float2( 0,0 );
				float2 panner483_g39222 = ( mulTime806_g39222 * temp_cast_38 + rotator485_g39222);
				float2 temp_cast_39 = (temp_output_1185_0_g39222).xx;
				float cos481_g39222 = cos( _G_FlowSwirling.y );
				float sin481_g39222 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39222 = mul( texCoord487_g39222 - float2( 0,0 ) , float2x2( cos481_g39222 , -sin481_g39222 , sin481_g39222 , cos481_g39222 )) + float2( 0,0 );
				float2 panner480_g39222 = ( mulTime806_g39222 * temp_cast_39 + rotator481_g39222);
				float2 temp_cast_40 = (temp_output_1185_0_g39222).xx;
				float2 panner478_g39222 = ( mulTime806_g39222 * temp_cast_40 + texCoord487_g39222);
				float4 OUT_SWIRLING298_g39222 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner483_g39222 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner480_g39222 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner478_g39222 ) ) );
				float4 m_Swirling278_g39222 = OUT_SWIRLING298_g39222;
				float2 texCoord196_g39227 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39227 = IN.ase_texcoord5;
				float2 blendOpSrc197_g39227 = texCoord196_g39227;
				float2 blendOpDest197_g39227 = (_FLOWMAP_Map89_g39227).xy;
				float2 temp_output_197_0_g39227 = ( saturate( (( blendOpDest197_g39227 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39227 ) * ( 1.0 - blendOpSrc197_g39227 ) ) : ( 2.0 * blendOpDest197_g39227 * blendOpSrc197_g39227 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39227 = FlowSpeed1179_g39222;
				float temp_output_182_0_g39227 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39227 );
				float temp_output_194_0_g39227 = (0.0 + (( ( temp_output_182_0_g39227 - floor( ( temp_output_182_0_g39227 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1182_g39222 = _FoamShoreline_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39227 = FlowStrength1182_g39222;
				float _TIME_UV_A199_g39227 = ( -temp_output_194_0_g39227 * _FLOWMAP_FlowStrength146_g39227 );
				float2 lerpResult198_g39227 = lerp( temp_output_197_0_g39227 , texCoord196_g39227 , _TIME_UV_A199_g39227);
				float2 INPUT_MAP_TILLING128_g39222 = temp_output_1196_0_g39222;
				float2 texCoord205_g39227 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g39222 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39227 = texCoord205_g39227;
				float2 FLOW_A201_g39227 = ( lerpResult198_g39227 + TEXTURE_TILLING211_g39227 );
				float temp_output_225_0_g39227 = (temp_output_182_0_g39227*1.0 + 0.5);
				float _TIME_UV_B214_g39227 = ( -(0.0 + (( ( temp_output_225_0_g39227 - floor( ( temp_output_225_0_g39227 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39227 );
				float2 lerpResult229_g39227 = lerp( temp_output_197_0_g39227 , texCoord196_g39227 , _TIME_UV_B214_g39227);
				float2 FLOW_B232_g39227 = ( lerpResult229_g39227 + TEXTURE_TILLING211_g39227 );
				float TIME_BLEND235_g39227 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39227 / 0.5 ) ) ) );
				float4 lerpResult1153_g39222 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39227 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39227 ) , TIME_BLEND235_g39227);
				float4 OUT_FLOW_FLOWMAP1156_g39222 = lerpResult1153_g39222;
				float4 m_FlowMap278_g39222 = OUT_FLOW_FLOWMAP1156_g39222;
				float4 localfloat4switch278_g39222 = float4switch278_g39222( m_switch278_g39222 , m_Off278_g39222 , m_Swirling278_g39222 , m_FlowMap278_g39222 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39222 = temp_cast_43;
				float3 unityObjectToViewPos731_g39222 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39222 = temp_cast_44;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39222 = temp_cast_46;
				float4 lerpResult769_g39222 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g39222 * _FoamShoreline_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39222 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g39222.z + GRAB_SCREEN_DEPTH310_g39222 ) - temp_cast_45 ) * GRAB_SCREEN_CLOSENESS312_g39222 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * GRAB_SCREEN_CLOSENESS312_g39222 ) ) ));
				float4 lerpResult761_g39222 = lerp( float4( 0,0,0,0 ) , lerpResult769_g39222 , FlowStrength1182_g39222);
				float4 FOAM_SHORELINE654_g39180 = lerpResult761_g39222;
				float4 temp_output_1492_0_g39180 = ( ( ( lerpResult105_g39180 + FOAM_VERTICAL_OFFSHORE655_g39180 ) + FOAM_HORIZONTAL_OFFSHORE1565_g39180 ) + FOAM_SHORELINE654_g39180 );
				float4 ALBEDO_IN60_g39189 = temp_output_1492_0_g39180;
				float4 m_Off119_g39189 = ALBEDO_IN60_g39189;
				int m_switch91_g39189 = _Reflection_FresnelMode;
				int REFLECTION_MODE_URP123_g39189 = _Reflection_ModeURP;
				int m_switch124_g39189 = REFLECTION_MODE_URP123_g39189;
				float4 m_Off124_g39189 = float4( 0,0,0,0 );
				float3 NORMAL_OUT_Z505_g39180 = weightedBlend1711_g39180;
				float3 temp_output_53_0_g39189 = NORMAL_OUT_Z505_g39180;
				float3 NORMAL_IN106_g39189 = temp_output_53_0_g39189;
				float2 temp_cast_49 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_50 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g39189 = clamp( ( (( NORMAL_IN106_g39189 * 50.0 )).xy * _Reflection_BumpScale ) , temp_cast_49 , temp_cast_50 );
				float2 REFLECTION_BUMP9_g39189 = clampResult29_g39189;
				float4 appendResult103_g39189 = (float4(1.0 , 0.0 , 1.0 , temp_output_53_0_g39189.x));
				float3 unpack104_g39189 = UnpackNormalScale( appendResult103_g39189, 0.15 );
				unpack104_g39189.z = lerp( 1, unpack104_g39189.z, saturate(0.15) );
				float3 NORMAL_IN_Z54_g39189 = unpack104_g39189;
				float3 ase_worldTangent = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl24_g39189 = reflect( -ase_worldViewDir, float3( dot( tanToWorld0, NORMAL_IN_Z54_g39189 ), dot( tanToWorld1, NORMAL_IN_Z54_g39189 ), dot( tanToWorld2, NORMAL_IN_Z54_g39189 ) ) );
				float REFLECTION_WOBBLE13_g39189 = _Reflection_Wobble;
				float4 texCUBENode31_g39189 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat, ( float3( REFLECTION_BUMP9_g39189 ,  0.0 ) + worldRefl24_g39189 + REFLECTION_WOBBLE13_g39189 ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_52 = (texCUBENode31_g39189.r).xxxx;
				float REFLECTION_CLOUD12_g39189 = _Reflection_Cloud;
				float4 lerpResult49_g39189 = lerp( texCUBENode31_g39189 , temp_cast_52 , REFLECTION_CLOUD12_g39189);
				float4 m_ActiveCubeMap124_g39189 = lerpResult49_g39189;
				float3 temp_output_109_0_g39189 = SHADERGRAPH_REFLECTION_PROBE(ase_worldViewDir,float3( ( REFLECTION_BUMP9_g39189 + REFLECTION_WOBBLE13_g39189 ) ,  0.0 ),_Reflection_LOD);
				float3 temp_cast_55 = (temp_output_109_0_g39189.x).xxx;
				float3 lerpResult115_g39189 = lerp( temp_output_109_0_g39189 , temp_cast_55 , REFLECTION_CLOUD12_g39189);
				float4 appendResult127_g39189 = (float4(lerpResult115_g39189 , 0.0));
				float4 m_ActiveProbe124_g39189 = appendResult127_g39189;
				float4 localfloat4switch124_g39189 = float4switch124_g39189( m_switch124_g39189 , m_Off124_g39189 , m_ActiveCubeMap124_g39189 , m_ActiveProbe124_g39189 );
				float4 m_Off91_g39189 = localfloat4switch124_g39189;
				float fresnelNdotV23_g39189 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode23_g39189 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g39189 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g39189 = ( _Reflection_FresnelStrength * fresnelNode23_g39189 );
				float4 lerpResult73_g39189 = lerp( float4( 0,0,0,0 ) , localfloat4switch124_g39189 , REFLECTION_FRESNEL11_g39189);
				float4 m_Active91_g39189 = lerpResult73_g39189;
				float4 localfloat4switch91_g39189 = float4switch91_g39189( m_switch91_g39189 , m_Off91_g39189 , m_Active91_g39189 );
				float4 switchResult85_g39189 = (((ase_vface>0)?(localfloat4switch91_g39189):(float4( 0,0,0,0 ))));
				float4 temp_cast_58 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch95_g39189 = temp_cast_58;
				#else
				float4 staticSwitch95_g39189 = ( ( ( 1.0 - 0.5 ) * switchResult85_g39189 ) + ( ALBEDO_IN60_g39189 * 0.5 ) );
				#endif
				float4 m_ActiveCubeMap119_g39189 = staticSwitch95_g39189;
				float4 m_ActiveProbe119_g39189 = staticSwitch95_g39189;
				float4 localfloat4switch119_g39189 = float4switch119_g39189( m_switch119_g39189 , m_Off119_g39189 , m_ActiveCubeMap119_g39189 , m_ActiveProbe119_g39189 );
				
				
				float3 Albedo = localfloat4switch119_g39189.xyz;
				float3 Emission = 0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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

			Blend SrcAlpha OneMinusSrcAlpha, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]

			HLSLPROGRAM
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			float4 _FOAMVERTICAL_Tint;
			half4 _URP_SpecularColor;
			float _AlphatoCoverage;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			int _Reflection_FresnelMode;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpScale;
			float _Reflection_Smoothness;
			float _Reflection_Wobble;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _Reflection_Cloud;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_BumpClamp;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Vertical_FlowType;
			int _WaterNormal_Horizontal_FlowType;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _CullMode;
			float _DepthOffset;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _FOAMHORIZONTAL_Speed;
			float _SMOOTHNESS_FresnelPower;
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
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_WaterNormal_Horizontal_Vertical_NormalMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_WaterNormal_Vertical_NormalMap);
			TEXTURE2D(_FOAMVERTICAL_FoamMap);
			TEXTURE2D(_FOAMHORIZONTAL_FoamMap);
			TEXTURE2D(_FoamShoreline_FoamMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float3 float3switch238_g39212( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch456_g39193( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g39181( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g39233( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g39222( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch124_g39189( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch91_g39189( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch119_g39189( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord3.w = eyeDepth;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord7.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				
				o.ase_texcoord3.xyz = v.ase_texcoord.xyz;
				o.ase_texcoord5 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord6 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

			half4 frag(VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC ) : SV_TARGET
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

				int m_switch119_g39189 = _Reflection_ModeURP;
				float4 screenPos = IN.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g39180 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g39180 = abs( ( screenDepth2_g39180 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g39180 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g39180*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g39180 = lerp( _DepthTint , lerpResult25_g39180 , saturate( (distanceDepth2_g39180*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g39180 = lerpResult27_g39180;
				int m_switch238_g39212 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g39212 = float3(0,0,0.001);
				float mulTime155_g39212 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g39212 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g39212 = ( FlowSpeed365_g39212 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g39212).xx;
				float2 appendResult235_g39212 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g39212 = IN.ase_texcoord3.xyz.xy * ( appendResult235_g39212 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g39212 = cos( _G_FlowSwirling.x );
				float sin62_g39212 = sin( _G_FlowSwirling.x );
				float2 rotator62_g39212 = mul( texCoord23_g39212 - float2( 0,0 ) , float2x2( cos62_g39212 , -sin62_g39212 , sin62_g39212 , cos62_g39212 )) + float2( 0,0 );
				float2 panner15_g39212 = ( mulTime155_g39212 * temp_cast_0 + rotator62_g39212);
				float2 temp_cast_1 = (temp_output_367_0_g39212).xx;
				float cos8_g39212 = cos( _G_FlowSwirling.y );
				float sin8_g39212 = sin( _G_FlowSwirling.y );
				float2 rotator8_g39212 = mul( texCoord23_g39212 - float2( 0,0 ) , float2x2( cos8_g39212 , -sin8_g39212 , sin8_g39212 , cos8_g39212 )) + float2( 0,0 );
				float2 panner16_g39212 = ( mulTime155_g39212 * temp_cast_1 + rotator8_g39212);
				float2 temp_cast_2 = (temp_output_367_0_g39212).xx;
				float2 panner17_g39212 = ( mulTime155_g39212 * temp_cast_2 + texCoord23_g39212);
				float2 layeredBlendVar666_g39212 = IN.ase_texcoord3.xyz.xy;
				float4 layeredBlend666_g39212 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g39212 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g39212 ) , layeredBlendVar666_g39212.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g39212 ) , layeredBlendVar666_g39212.y ) );
				float4 temp_output_1_0_g39213 = layeredBlend666_g39212;
				float temp_output_8_0_g39213 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g39213 = UnpackNormalScale( temp_output_1_0_g39213, temp_output_8_0_g39213 );
				unpack52_g39213.z = lerp( 1, unpack52_g39213.z, saturate(temp_output_8_0_g39213) );
				float3 temp_output_699_59_g39212 = unpack52_g39213;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 temp_output_372_0_g39212 = abs( ase_worldNormal );
				float3 break386_g39212 = ( temp_output_372_0_g39212 * temp_output_372_0_g39212 );
				float _MASK_VERTICAL_Z381_g39212 = ( break386_g39212.z + 0.01 );
				float3 lerpResult677_g39212 = lerp( float3( 0,0,0 ) , temp_output_699_59_g39212 , _MASK_VERTICAL_Z381_g39212);
				float _MASK_VERTICAL_X373_g39212 = ( -break386_g39212.x + 0.2 );
				float3 lerpResult681_g39212 = lerp( float3( 0,0,0 ) , temp_output_699_59_g39212 , _MASK_VERTICAL_X373_g39212);
				float _MASK_VERTICAL_Y_NEG413_g39212 = ( ( ase_worldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g39212 = lerp( float3( 0,0,0 ) , ( lerpResult677_g39212 + lerpResult681_g39212 ) , _MASK_VERTICAL_Y_NEG413_g39212);
				float3 m_Swirling238_g39212 = lerpResult679_g39212;
				float2 texCoord196_g39217 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39217 = IN.ase_texcoord5;
				float2 blendOpSrc197_g39217 = texCoord196_g39217;
				float2 blendOpDest197_g39217 = (_FLOWMAP_Map89_g39217).xy;
				float2 temp_output_197_0_g39217 = ( saturate( (( blendOpDest197_g39217 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39217 ) * ( 1.0 - blendOpSrc197_g39217 ) ) : ( 2.0 * blendOpDest197_g39217 * blendOpSrc197_g39217 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39217 = FlowSpeed365_g39212;
				float temp_output_182_0_g39217 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39217 );
				float temp_output_194_0_g39217 = (0.0 + (( ( temp_output_182_0_g39217 - floor( ( temp_output_182_0_g39217 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g39217 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g39217 = ( -temp_output_194_0_g39217 * _FLOWMAP_FlowStrength146_g39217 );
				float2 lerpResult198_g39217 = lerp( temp_output_197_0_g39217 , texCoord196_g39217 , _TIME_UV_A199_g39217);
				float2 INPUT_MAP_TILLING128_g39212 = appendResult235_g39212;
				float2 texCoord205_g39217 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g39212 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39217 = texCoord205_g39217;
				float2 FLOW_A201_g39217 = ( lerpResult198_g39217 + TEXTURE_TILLING211_g39217 );
				float temp_output_225_0_g39217 = (temp_output_182_0_g39217*1.0 + 0.5);
				float _TIME_UV_B214_g39217 = ( -(0.0 + (( ( temp_output_225_0_g39217 - floor( ( temp_output_225_0_g39217 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39217 );
				float2 lerpResult229_g39217 = lerp( temp_output_197_0_g39217 , texCoord196_g39217 , _TIME_UV_B214_g39217);
				float2 FLOW_B232_g39217 = ( lerpResult229_g39217 + TEXTURE_TILLING211_g39217 );
				float TIME_BLEND235_g39217 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39217 / 0.5 ) ) ) );
				float4 lerpResult317_g39212 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g39217 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g39217 ) , TIME_BLEND235_g39217);
				float4 temp_output_1_0_g39219 = lerpResult317_g39212;
				float NormalStrength152_g39212 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g39219 = NormalStrength152_g39212;
				float3 unpack52_g39219 = UnpackNormalScale( temp_output_1_0_g39219, temp_output_8_0_g39219 );
				unpack52_g39219.z = lerp( 1, unpack52_g39219.z, saturate(temp_output_8_0_g39219) );
				float3 temp_output_701_59_g39212 = unpack52_g39219;
				float3 lerpResult692_g39212 = lerp( float3( 0,0,0 ) , temp_output_701_59_g39212 , _MASK_VERTICAL_Z381_g39212);
				float3 lerpResult691_g39212 = lerp( float3( 0,0,0 ) , temp_output_701_59_g39212 , _MASK_VERTICAL_X373_g39212);
				float3 lerpResult697_g39212 = lerp( float3( 0,0,0 ) , ( lerpResult692_g39212 + lerpResult691_g39212 ) , _MASK_VERTICAL_Y_NEG413_g39212);
				float3 m_FlowMap238_g39212 = lerpResult697_g39212;
				float3 localfloat3switch238_g39212 = float3switch238_g39212( m_switch238_g39212 , m_Off238_g39212 , m_Swirling238_g39212 , m_FlowMap238_g39212 );
				int m_switch456_g39193 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g39193 = float3(0,0,0.001);
				float mulTime155_g39193 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g39193 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g39193 = ( FlowSpeed365_g39193 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g39193).xx;
				float2 appendResult235_g39193 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g39193 = IN.ase_texcoord3.xyz.xy * ( appendResult235_g39193 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g39193 = cos( _G_FlowSwirling.x );
				float sin62_g39193 = sin( _G_FlowSwirling.x );
				float2 rotator62_g39193 = mul( texCoord23_g39193 - float2( 0,0 ) , float2x2( cos62_g39193 , -sin62_g39193 , sin62_g39193 , cos62_g39193 )) + float2( 0,0 );
				float2 panner15_g39193 = ( mulTime155_g39193 * temp_cast_5 + rotator62_g39193);
				float2 temp_cast_6 = (temp_output_367_0_g39193).xx;
				float cos8_g39193 = cos( _G_FlowSwirling.y );
				float sin8_g39193 = sin( _G_FlowSwirling.y );
				float2 rotator8_g39193 = mul( texCoord23_g39193 - float2( 0,0 ) , float2x2( cos8_g39193 , -sin8_g39193 , sin8_g39193 , cos8_g39193 )) + float2( 0,0 );
				float2 panner16_g39193 = ( mulTime155_g39193 * temp_cast_6 + rotator8_g39193);
				float2 temp_cast_7 = (temp_output_367_0_g39193).xx;
				float2 panner17_g39193 = ( mulTime155_g39193 * temp_cast_7 + texCoord23_g39193);
				float2 layeredBlendVar448_g39193 = IN.ase_texcoord3.xyz.xy;
				float4 layeredBlend448_g39193 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g39193 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g39193 ) , layeredBlendVar448_g39193.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g39193 ) , layeredBlendVar448_g39193.y ) );
				float4 temp_output_1_0_g39197 = layeredBlend448_g39193;
				float temp_output_8_0_g39197 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g39197 = UnpackNormalScale( temp_output_1_0_g39197, temp_output_8_0_g39197 );
				unpack52_g39197.z = lerp( 1, unpack52_g39197.z, saturate(temp_output_8_0_g39197) );
				float3 temp_output_481_59_g39193 = unpack52_g39197;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g39193 = ( abs( ase_worldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g39193 = ( break386_g39193.z + 0.75 );
				float3 lerpResult465_g39193 = lerp( float3( 0,0,0 ) , temp_output_481_59_g39193 , _MASK_VERTICAL_Z381_g39193);
				float _MASK_VERTICAL_X373_g39193 = ( break386_g39193.x + 0.45 );
				float3 lerpResult457_g39193 = lerp( float3( 0,0,0 ) , temp_output_481_59_g39193 , _MASK_VERTICAL_X373_g39193);
				float _MASK_VERTICAL_Y383_g39193 = ( -break386_g39193.y + 5.0 );
				float3 lerpResult454_g39193 = lerp( lerpResult465_g39193 , ( lerpResult465_g39193 + lerpResult457_g39193 ) , _MASK_VERTICAL_Y383_g39193);
				float _MASK_VERTICAL_Y_NEG413_g39193 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.0 );
				float3 lerpResult477_g39193 = lerp( float3( 0,0,0 ) , lerpResult454_g39193 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g39193 ));
				float3 m_Swirling456_g39193 = lerpResult477_g39193;
				float2 texCoord196_g39195 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39195 = IN.ase_texcoord5;
				float2 blendOpSrc197_g39195 = texCoord196_g39195;
				float2 blendOpDest197_g39195 = (_FLOWMAP_Map89_g39195).xy;
				float2 temp_output_197_0_g39195 = ( saturate( (( blendOpDest197_g39195 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39195 ) * ( 1.0 - blendOpSrc197_g39195 ) ) : ( 2.0 * blendOpDest197_g39195 * blendOpSrc197_g39195 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39195 = FlowSpeed365_g39193;
				float temp_output_182_0_g39195 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39195 );
				float temp_output_194_0_g39195 = (0.0 + (( ( temp_output_182_0_g39195 - floor( ( temp_output_182_0_g39195 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g39195 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g39195 = ( -temp_output_194_0_g39195 * _FLOWMAP_FlowStrength146_g39195 );
				float2 lerpResult198_g39195 = lerp( temp_output_197_0_g39195 , texCoord196_g39195 , _TIME_UV_A199_g39195);
				float2 INPUT_MAP_TILLING128_g39193 = appendResult235_g39193;
				float2 texCoord205_g39195 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g39193 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39195 = texCoord205_g39195;
				float2 FLOW_A201_g39195 = ( lerpResult198_g39195 + TEXTURE_TILLING211_g39195 );
				float temp_output_225_0_g39195 = (temp_output_182_0_g39195*1.0 + 0.5);
				float _TIME_UV_B214_g39195 = ( -(0.0 + (( ( temp_output_225_0_g39195 - floor( ( temp_output_225_0_g39195 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39195 );
				float2 lerpResult229_g39195 = lerp( temp_output_197_0_g39195 , texCoord196_g39195 , _TIME_UV_B214_g39195);
				float2 FLOW_B232_g39195 = ( lerpResult229_g39195 + TEXTURE_TILLING211_g39195 );
				float TIME_BLEND235_g39195 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39195 / 0.5 ) ) ) );
				float4 lerpResult317_g39193 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g39195 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g39195 ) , TIME_BLEND235_g39195);
				float4 temp_output_1_0_g39201 = lerpResult317_g39193;
				float NormalStrength152_g39193 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g39201 = NormalStrength152_g39193;
				float3 unpack52_g39201 = UnpackNormalScale( temp_output_1_0_g39201, temp_output_8_0_g39201 );
				unpack52_g39201.z = lerp( 1, unpack52_g39201.z, saturate(temp_output_8_0_g39201) );
				float3 temp_output_483_59_g39193 = unpack52_g39201;
				float3 lerpResult466_g39193 = lerp( float3( 0,0,0 ) , temp_output_483_59_g39193 , _MASK_VERTICAL_Z381_g39193);
				float3 lerpResult453_g39193 = lerp( float3( 0,0,0 ) , temp_output_483_59_g39193 , _MASK_VERTICAL_X373_g39193);
				float3 lerpResult460_g39193 = lerp( lerpResult466_g39193 , ( lerpResult466_g39193 + lerpResult453_g39193 ) , _MASK_VERTICAL_Y383_g39193);
				float3 lerpResult411_g39193 = lerp( float3( 0,0,0 ) , lerpResult460_g39193 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g39193 ));
				float3 m_FlowMap456_g39193 = lerpResult411_g39193;
				float3 localfloat3switch456_g39193 = float3switch456_g39193( m_switch456_g39193 , m_Off456_g39193 , m_Swirling456_g39193 , m_FlowMap456_g39193 );
				float2 weightedBlendVar1711_g39180 = IN.ase_texcoord3.xyz.xy;
				float3 weightedBlend1711_g39180 = ( weightedBlendVar1711_g39180.x*localfloat3switch238_g39212 + weightedBlendVar1711_g39180.y*localfloat3switch456_g39193 );
				float3 NORMAL_IN84_g39240 = ( weightedBlend1711_g39180 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g39240 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord3.w;
				float eyeDepth7_g39240 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g39240 = ( (NORMAL_IN84_g39240).xy * ( REFACTED_SCALE_FLOAT78_g39240 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g39240 - eyeDepth ) ) );
				float eyeDepth27_g39240 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g39240, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g39240 = (( float4( ( temp_output_21_0_g39240 * saturate( ( eyeDepth27_g39240 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g39240 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g39240 ), 1.0 );
				float4 REFRACTED_DEPTH144_g39180 = fetchOpaqueVal89_g39240;
				float temp_output_20_0_g39180 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g39180 = 0.0;
				#else
				float staticSwitch37_g39180 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g39180*-5.0 + 1.0) ) ) ) * temp_output_20_0_g39180 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g39180 = staticSwitch37_g39180;
				float4 lerpResult105_g39180 = lerp( COLOR_TINT161_g39180 , REFRACTED_DEPTH144_g39180 , DEPTH_TINT_ALPHA93_g39180);
				float4 _MASK_VECTOR1199_g39181 = float4(0.001,0.001,0.001,0);
				int m_switch278_g39181 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g39181 = float4( 0,0,0,0 );
				float mulTime806_g39181 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g39181 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g39181 = ( FlowSpeed1146_g39181 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g39181).xx;
				float2 appendResult219_g39181 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g39181 = ( appendResult219_g39181 * float2( 2,2 ) );
				float2 texCoord487_g39181 = IN.ase_texcoord3.xyz.xy * temp_output_1294_0_g39181 + float2( 0,0 );
				float cos485_g39181 = cos( _G_FlowSwirling.x );
				float sin485_g39181 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39181 = mul( texCoord487_g39181 - float2( 0,0 ) , float2x2( cos485_g39181 , -sin485_g39181 , sin485_g39181 , cos485_g39181 )) + float2( 0,0 );
				float2 panner483_g39181 = ( mulTime806_g39181 * temp_cast_14 + rotator485_g39181);
				float2 temp_cast_15 = (temp_output_1150_0_g39181).xx;
				float cos481_g39181 = cos( _G_FlowSwirling.y );
				float sin481_g39181 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39181 = mul( texCoord487_g39181 - float2( 0,0 ) , float2x2( cos481_g39181 , -sin481_g39181 , sin481_g39181 , cos481_g39181 )) + float2( 0,0 );
				float2 panner480_g39181 = ( mulTime806_g39181 * temp_cast_15 + rotator481_g39181);
				float2 temp_cast_16 = (temp_output_1150_0_g39181).xx;
				float2 panner478_g39181 = ( mulTime806_g39181 * temp_cast_16 + texCoord487_g39181);
				float4 OUT_SWIRLING298_g39181 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner483_g39181 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner480_g39181 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner478_g39181 ) ) );
				float4 m_Swirling278_g39181 = OUT_SWIRLING298_g39181;
				float2 texCoord196_g39186 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39186 = IN.ase_texcoord5;
				float2 blendOpSrc197_g39186 = texCoord196_g39186;
				float2 blendOpDest197_g39186 = (_FLOWMAP_Map89_g39186).xy;
				float2 temp_output_197_0_g39186 = ( saturate( (( blendOpDest197_g39186 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39186 ) * ( 1.0 - blendOpSrc197_g39186 ) ) : ( 2.0 * blendOpDest197_g39186 * blendOpSrc197_g39186 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39186 = FlowSpeed1146_g39181;
				float temp_output_182_0_g39186 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39186 );
				float temp_output_194_0_g39186 = (0.0 + (( ( temp_output_182_0_g39186 - floor( ( temp_output_182_0_g39186 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g39181 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39186 = FlowStrength1147_g39181;
				float _TIME_UV_A199_g39186 = ( -temp_output_194_0_g39186 * _FLOWMAP_FlowStrength146_g39186 );
				float2 lerpResult198_g39186 = lerp( temp_output_197_0_g39186 , texCoord196_g39186 , _TIME_UV_A199_g39186);
				float2 INPUT_MAP_TILLING128_g39181 = temp_output_1294_0_g39181;
				float2 texCoord205_g39186 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g39181 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39186 = texCoord205_g39186;
				float2 FLOW_A201_g39186 = ( lerpResult198_g39186 + TEXTURE_TILLING211_g39186 );
				float temp_output_225_0_g39186 = (temp_output_182_0_g39186*1.0 + 0.5);
				float _TIME_UV_B214_g39186 = ( -(0.0 + (( ( temp_output_225_0_g39186 - floor( ( temp_output_225_0_g39186 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39186 );
				float2 lerpResult229_g39186 = lerp( temp_output_197_0_g39186 , texCoord196_g39186 , _TIME_UV_B214_g39186);
				float2 FLOW_B232_g39186 = ( lerpResult229_g39186 + TEXTURE_TILLING211_g39186 );
				float TIME_BLEND235_g39186 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39186 / 0.5 ) ) ) );
				float4 lerpResult1117_g39181 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39186 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39186 ) , TIME_BLEND235_g39186);
				float4 OUT_FLOW_FLOWMAP1119_g39181 = lerpResult1117_g39181;
				float4 m_FlowMap278_g39181 = OUT_FLOW_FLOWMAP1119_g39181;
				float4 localfloat4switch278_g39181 = float4switch278_g39181( m_switch278_g39181 , m_Off278_g39181 , m_Swirling278_g39181 , m_FlowMap278_g39181 );
				float clampDepth2_g39207 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g39207 = clampDepth2_g39207;
				float4 localCalculateObliqueFrustumCorrection3_g39231 = CalculateObliqueFrustumCorrection();
				float dotResult4_g39231 = dot( float4( IN.ase_texcoord6.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g39231 );
				float correctionFactor1_g39207 = dotResult4_g39231;
				float localCorrectedLinearEyeDepth1_g39207 = CorrectedLinearEyeDepth( z1_g39207 , correctionFactor1_g39207 );
				float eyeDepth18_g39207 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g39207 = ( eyeDepth18_g39207 - screenPos.w );
				float temp_output_13_0_g39207 = ( localCorrectedLinearEyeDepth1_g39207 - abs( temp_output_17_0_g39207 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g39180 = saturate( temp_output_13_0_g39207 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39181 = temp_cast_20;
				float3 unityObjectToViewPos262_g39181 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float GRAB_SCREEN_DEPTH73_g39180 = localCorrectedLinearEyeDepth1_g39207;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39181 = temp_cast_21;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g39180 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39181 = temp_cast_23;
				float4 lerpResult281_g39181 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g39181 * _FOAMVERTICAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39181 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g39181.z + GRAB_SCREEN_DEPTH310_g39181 ) - temp_cast_22 ) * GRAB_SCREEN_CLOSENESS312_g39181 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g39181 ) ) ));
				float4 lerpResult265_g39181 = lerp( float4( 0,0,0,0 ) , lerpResult281_g39181 , FlowStrength1147_g39181);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g39181 = ( abs( ase_worldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g39181 = ( break1161_g39181.z + 0.45 );
				float4 lerpResult1173_g39181 = lerp( _MASK_VECTOR1199_g39181 , lerpResult265_g39181 , _MASK_VERTICAL_Z1162_g39181);
				float _MASK_VERTICAL_X1170_g39181 = ( break1161_g39181.x + 0.46 );
				float4 lerpResult1176_g39181 = lerp( _MASK_VECTOR1199_g39181 , lerpResult265_g39181 , _MASK_VERTICAL_X1170_g39181);
				float _MASK_VERTICAL_Y1163_g39181 = ( -break1161_g39181.y + 6.5 );
				float4 lerpResult1179_g39181 = lerp( lerpResult1173_g39181 , ( lerpResult1173_g39181 + lerpResult1176_g39181 ) , _MASK_VERTICAL_Y1163_g39181);
				float4 temp_output_1189_0_g39181 = saturate( lerpResult1179_g39181 );
				float4 FOAM_VERTICAL_OFFSHORE655_g39180 = temp_output_1189_0_g39181;
				float4 _MASK_VECTOR1200_g39233 = float4(0.001,0.001,0.001,0);
				int m_switch278_g39233 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g39233 = float4( 0,0,0,0 );
				float mulTime806_g39233 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g39233 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g39233 = ( Speed1146_g39233 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g39233).xx;
				float2 appendResult219_g39233 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g39233 = ( appendResult219_g39233 * float2( 2,2 ) );
				float2 texCoord487_g39233 = IN.ase_texcoord3.xyz.xy * temp_output_1214_0_g39233 + float2( 0,0 );
				float cos485_g39233 = cos( _G_FlowSwirling.x );
				float sin485_g39233 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39233 = mul( texCoord487_g39233 - float2( 0,0 ) , float2x2( cos485_g39233 , -sin485_g39233 , sin485_g39233 , cos485_g39233 )) + float2( 0,0 );
				float2 panner483_g39233 = ( mulTime806_g39233 * temp_cast_27 + rotator485_g39233);
				float2 temp_cast_28 = (temp_output_1150_0_g39233).xx;
				float cos481_g39233 = cos( _G_FlowSwirling.y );
				float sin481_g39233 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39233 = mul( texCoord487_g39233 - float2( 0,0 ) , float2x2( cos481_g39233 , -sin481_g39233 , sin481_g39233 , cos481_g39233 )) + float2( 0,0 );
				float2 panner480_g39233 = ( mulTime806_g39233 * temp_cast_28 + rotator481_g39233);
				float2 temp_cast_29 = (temp_output_1150_0_g39233).xx;
				float2 panner478_g39233 = ( mulTime806_g39233 * temp_cast_29 + texCoord487_g39233);
				float4 OUT_SWIRLING298_g39233 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner483_g39233 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner480_g39233 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner478_g39233 ) ) );
				float4 m_Swirling278_g39233 = OUT_SWIRLING298_g39233;
				float2 texCoord196_g39238 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39238 = IN.ase_texcoord5;
				float2 blendOpSrc197_g39238 = texCoord196_g39238;
				float2 blendOpDest197_g39238 = (_FLOWMAP_Map89_g39238).xy;
				float2 temp_output_197_0_g39238 = ( saturate( (( blendOpDest197_g39238 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39238 ) * ( 1.0 - blendOpSrc197_g39238 ) ) : ( 2.0 * blendOpDest197_g39238 * blendOpSrc197_g39238 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39238 = Speed1146_g39233;
				float temp_output_182_0_g39238 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39238 );
				float temp_output_194_0_g39238 = (0.0 + (( ( temp_output_182_0_g39238 - floor( ( temp_output_182_0_g39238 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g39233 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39238 = FlowStrength1147_g39233;
				float _TIME_UV_A199_g39238 = ( -temp_output_194_0_g39238 * _FLOWMAP_FlowStrength146_g39238 );
				float2 lerpResult198_g39238 = lerp( temp_output_197_0_g39238 , texCoord196_g39238 , _TIME_UV_A199_g39238);
				float2 INPUT_MAP_TILLING128_g39233 = temp_output_1214_0_g39233;
				float2 texCoord205_g39238 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g39233 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39238 = texCoord205_g39238;
				float2 FLOW_A201_g39238 = ( lerpResult198_g39238 + TEXTURE_TILLING211_g39238 );
				float temp_output_225_0_g39238 = (temp_output_182_0_g39238*1.0 + 0.5);
				float _TIME_UV_B214_g39238 = ( -(0.0 + (( ( temp_output_225_0_g39238 - floor( ( temp_output_225_0_g39238 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39238 );
				float2 lerpResult229_g39238 = lerp( temp_output_197_0_g39238 , texCoord196_g39238 , _TIME_UV_B214_g39238);
				float2 FLOW_B232_g39238 = ( lerpResult229_g39238 + TEXTURE_TILLING211_g39238 );
				float TIME_BLEND235_g39238 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39238 / 0.5 ) ) ) );
				float4 lerpResult1117_g39233 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39238 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39238 ) , TIME_BLEND235_g39238);
				float4 OUT_FLOW_FLOWMAP1119_g39233 = lerpResult1117_g39233;
				float4 m_FlowMap278_g39233 = OUT_FLOW_FLOWMAP1119_g39233;
				float4 localfloat4switch278_g39233 = float4switch278_g39233( m_switch278_g39233 , m_Off278_g39233 , m_Swirling278_g39233 , m_FlowMap278_g39233 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39233 = temp_cast_32;
				float3 unityObjectToViewPos262_g39233 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39233 = temp_cast_33;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39233 = temp_cast_35;
				float4 lerpResult281_g39233 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g39233 * _FOAMHORIZONTAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39233 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g39233.z + GRAB_SCREEN_DEPTH310_g39233 ) - temp_cast_34 ) * GRAB_SCREEN_CLOSENESS312_g39233 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g39233 ) ) ));
				float4 lerpResult265_g39233 = lerp( float4( 0,0,0,0 ) , lerpResult281_g39233 , FlowStrength1147_g39233);
				float _MASK_HORIZONTAL1160_g39233 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.7 );
				float4 lerpResult1185_g39233 = lerp( _MASK_VECTOR1200_g39233 , lerpResult265_g39233 , _MASK_HORIZONTAL1160_g39233);
				float4 temp_output_1188_0_g39233 = saturate( lerpResult1185_g39233 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g39180 = temp_output_1188_0_g39233;
				int m_switch278_g39222 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g39222 = float4( 0,0,0,0 );
				float mulTime806_g39222 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g39222 = _FoamShoreline_Speed;
				float temp_output_1185_0_g39222 = ( FlowSpeed1179_g39222 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g39222).xx;
				float2 appendResult219_g39222 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g39222 = ( appendResult219_g39222 * float2( 2,2 ) );
				float2 texCoord487_g39222 = IN.ase_texcoord3.xyz.xy * temp_output_1196_0_g39222 + float2( 0,0 );
				float cos485_g39222 = cos( _G_FlowSwirling.x );
				float sin485_g39222 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39222 = mul( texCoord487_g39222 - float2( 0,0 ) , float2x2( cos485_g39222 , -sin485_g39222 , sin485_g39222 , cos485_g39222 )) + float2( 0,0 );
				float2 panner483_g39222 = ( mulTime806_g39222 * temp_cast_38 + rotator485_g39222);
				float2 temp_cast_39 = (temp_output_1185_0_g39222).xx;
				float cos481_g39222 = cos( _G_FlowSwirling.y );
				float sin481_g39222 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39222 = mul( texCoord487_g39222 - float2( 0,0 ) , float2x2( cos481_g39222 , -sin481_g39222 , sin481_g39222 , cos481_g39222 )) + float2( 0,0 );
				float2 panner480_g39222 = ( mulTime806_g39222 * temp_cast_39 + rotator481_g39222);
				float2 temp_cast_40 = (temp_output_1185_0_g39222).xx;
				float2 panner478_g39222 = ( mulTime806_g39222 * temp_cast_40 + texCoord487_g39222);
				float4 OUT_SWIRLING298_g39222 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner483_g39222 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner480_g39222 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner478_g39222 ) ) );
				float4 m_Swirling278_g39222 = OUT_SWIRLING298_g39222;
				float2 texCoord196_g39227 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39227 = IN.ase_texcoord5;
				float2 blendOpSrc197_g39227 = texCoord196_g39227;
				float2 blendOpDest197_g39227 = (_FLOWMAP_Map89_g39227).xy;
				float2 temp_output_197_0_g39227 = ( saturate( (( blendOpDest197_g39227 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39227 ) * ( 1.0 - blendOpSrc197_g39227 ) ) : ( 2.0 * blendOpDest197_g39227 * blendOpSrc197_g39227 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39227 = FlowSpeed1179_g39222;
				float temp_output_182_0_g39227 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39227 );
				float temp_output_194_0_g39227 = (0.0 + (( ( temp_output_182_0_g39227 - floor( ( temp_output_182_0_g39227 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1182_g39222 = _FoamShoreline_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39227 = FlowStrength1182_g39222;
				float _TIME_UV_A199_g39227 = ( -temp_output_194_0_g39227 * _FLOWMAP_FlowStrength146_g39227 );
				float2 lerpResult198_g39227 = lerp( temp_output_197_0_g39227 , texCoord196_g39227 , _TIME_UV_A199_g39227);
				float2 INPUT_MAP_TILLING128_g39222 = temp_output_1196_0_g39222;
				float2 texCoord205_g39227 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g39222 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39227 = texCoord205_g39227;
				float2 FLOW_A201_g39227 = ( lerpResult198_g39227 + TEXTURE_TILLING211_g39227 );
				float temp_output_225_0_g39227 = (temp_output_182_0_g39227*1.0 + 0.5);
				float _TIME_UV_B214_g39227 = ( -(0.0 + (( ( temp_output_225_0_g39227 - floor( ( temp_output_225_0_g39227 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39227 );
				float2 lerpResult229_g39227 = lerp( temp_output_197_0_g39227 , texCoord196_g39227 , _TIME_UV_B214_g39227);
				float2 FLOW_B232_g39227 = ( lerpResult229_g39227 + TEXTURE_TILLING211_g39227 );
				float TIME_BLEND235_g39227 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39227 / 0.5 ) ) ) );
				float4 lerpResult1153_g39222 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39227 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39227 ) , TIME_BLEND235_g39227);
				float4 OUT_FLOW_FLOWMAP1156_g39222 = lerpResult1153_g39222;
				float4 m_FlowMap278_g39222 = OUT_FLOW_FLOWMAP1156_g39222;
				float4 localfloat4switch278_g39222 = float4switch278_g39222( m_switch278_g39222 , m_Off278_g39222 , m_Swirling278_g39222 , m_FlowMap278_g39222 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39222 = temp_cast_43;
				float3 unityObjectToViewPos731_g39222 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39222 = temp_cast_44;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39222 = temp_cast_46;
				float4 lerpResult769_g39222 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g39222 * _FoamShoreline_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39222 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g39222.z + GRAB_SCREEN_DEPTH310_g39222 ) - temp_cast_45 ) * GRAB_SCREEN_CLOSENESS312_g39222 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * GRAB_SCREEN_CLOSENESS312_g39222 ) ) ));
				float4 lerpResult761_g39222 = lerp( float4( 0,0,0,0 ) , lerpResult769_g39222 , FlowStrength1182_g39222);
				float4 FOAM_SHORELINE654_g39180 = lerpResult761_g39222;
				float4 temp_output_1492_0_g39180 = ( ( ( lerpResult105_g39180 + FOAM_VERTICAL_OFFSHORE655_g39180 ) + FOAM_HORIZONTAL_OFFSHORE1565_g39180 ) + FOAM_SHORELINE654_g39180 );
				float4 ALBEDO_IN60_g39189 = temp_output_1492_0_g39180;
				float4 m_Off119_g39189 = ALBEDO_IN60_g39189;
				int m_switch91_g39189 = _Reflection_FresnelMode;
				int REFLECTION_MODE_URP123_g39189 = _Reflection_ModeURP;
				int m_switch124_g39189 = REFLECTION_MODE_URP123_g39189;
				float4 m_Off124_g39189 = float4( 0,0,0,0 );
				float3 NORMAL_OUT_Z505_g39180 = weightedBlend1711_g39180;
				float3 temp_output_53_0_g39189 = NORMAL_OUT_Z505_g39180;
				float3 NORMAL_IN106_g39189 = temp_output_53_0_g39189;
				float2 temp_cast_49 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_50 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g39189 = clamp( ( (( NORMAL_IN106_g39189 * 50.0 )).xy * _Reflection_BumpScale ) , temp_cast_49 , temp_cast_50 );
				float2 REFLECTION_BUMP9_g39189 = clampResult29_g39189;
				float4 appendResult103_g39189 = (float4(1.0 , 0.0 , 1.0 , temp_output_53_0_g39189.x));
				float3 unpack104_g39189 = UnpackNormalScale( appendResult103_g39189, 0.15 );
				unpack104_g39189.z = lerp( 1, unpack104_g39189.z, saturate(0.15) );
				float3 NORMAL_IN_Z54_g39189 = unpack104_g39189;
				float3 ase_worldTangent = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl24_g39189 = reflect( -ase_worldViewDir, float3( dot( tanToWorld0, NORMAL_IN_Z54_g39189 ), dot( tanToWorld1, NORMAL_IN_Z54_g39189 ), dot( tanToWorld2, NORMAL_IN_Z54_g39189 ) ) );
				float REFLECTION_WOBBLE13_g39189 = _Reflection_Wobble;
				float4 texCUBENode31_g39189 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat, ( float3( REFLECTION_BUMP9_g39189 ,  0.0 ) + worldRefl24_g39189 + REFLECTION_WOBBLE13_g39189 ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_52 = (texCUBENode31_g39189.r).xxxx;
				float REFLECTION_CLOUD12_g39189 = _Reflection_Cloud;
				float4 lerpResult49_g39189 = lerp( texCUBENode31_g39189 , temp_cast_52 , REFLECTION_CLOUD12_g39189);
				float4 m_ActiveCubeMap124_g39189 = lerpResult49_g39189;
				float3 temp_output_109_0_g39189 = SHADERGRAPH_REFLECTION_PROBE(ase_worldViewDir,float3( ( REFLECTION_BUMP9_g39189 + REFLECTION_WOBBLE13_g39189 ) ,  0.0 ),_Reflection_LOD);
				float3 temp_cast_55 = (temp_output_109_0_g39189.x).xxx;
				float3 lerpResult115_g39189 = lerp( temp_output_109_0_g39189 , temp_cast_55 , REFLECTION_CLOUD12_g39189);
				float4 appendResult127_g39189 = (float4(lerpResult115_g39189 , 0.0));
				float4 m_ActiveProbe124_g39189 = appendResult127_g39189;
				float4 localfloat4switch124_g39189 = float4switch124_g39189( m_switch124_g39189 , m_Off124_g39189 , m_ActiveCubeMap124_g39189 , m_ActiveProbe124_g39189 );
				float4 m_Off91_g39189 = localfloat4switch124_g39189;
				float fresnelNdotV23_g39189 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode23_g39189 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g39189 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g39189 = ( _Reflection_FresnelStrength * fresnelNode23_g39189 );
				float4 lerpResult73_g39189 = lerp( float4( 0,0,0,0 ) , localfloat4switch124_g39189 , REFLECTION_FRESNEL11_g39189);
				float4 m_Active91_g39189 = lerpResult73_g39189;
				float4 localfloat4switch91_g39189 = float4switch91_g39189( m_switch91_g39189 , m_Off91_g39189 , m_Active91_g39189 );
				float4 switchResult85_g39189 = (((ase_vface>0)?(localfloat4switch91_g39189):(float4( 0,0,0,0 ))));
				float4 temp_cast_58 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch95_g39189 = temp_cast_58;
				#else
				float4 staticSwitch95_g39189 = ( ( ( 1.0 - 0.5 ) * switchResult85_g39189 ) + ( ALBEDO_IN60_g39189 * 0.5 ) );
				#endif
				float4 m_ActiveCubeMap119_g39189 = staticSwitch95_g39189;
				float4 m_ActiveProbe119_g39189 = staticSwitch95_g39189;
				float4 localfloat4switch119_g39189 = float4switch119_g39189( m_switch119_g39189 , m_Off119_g39189 , m_ActiveCubeMap119_g39189 , m_ActiveProbe119_g39189 );
				
				
				float3 Albedo = localfloat4switch119_g39189.xyz;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
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

			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			float4 _FOAMVERTICAL_Tint;
			half4 _URP_SpecularColor;
			float _AlphatoCoverage;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			int _Reflection_FresnelMode;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpScale;
			float _Reflection_Smoothness;
			float _Reflection_Wobble;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _Reflection_Cloud;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_BumpClamp;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Vertical_FlowType;
			int _WaterNormal_Horizontal_FlowType;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _CullMode;
			float _DepthOffset;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _FOAMHORIZONTAL_Speed;
			float _SMOOTHNESS_FresnelPower;
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
			

			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
			
			Blend SrcAlpha OneMinusSrcAlpha, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			float4 _FOAMVERTICAL_Tint;
			half4 _URP_SpecularColor;
			float _AlphatoCoverage;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			int _Reflection_FresnelMode;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpScale;
			float _Reflection_Smoothness;
			float _Reflection_Wobble;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _Reflection_Cloud;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_BumpClamp;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Vertical_FlowType;
			int _WaterNormal_Horizontal_FlowType;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _CullMode;
			float _DepthOffset;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _FOAMHORIZONTAL_Speed;
			float _SMOOTHNESS_FresnelPower;
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
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_WaterNormal_Horizontal_Vertical_NormalMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_WaterNormal_Vertical_NormalMap);
			TEXTURE2D(_FOAMVERTICAL_FoamMap);
			TEXTURE2D(_FOAMHORIZONTAL_FoamMap);
			TEXTURE2D(_FoamShoreline_FoamMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float3 float3switch238_g39212( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch456_g39193( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g39181( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g39233( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g39222( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch124_g39189( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch91_g39189( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch119_g39189( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			real3 ASESafeNormalize(float3 inVec)
			{
				real dp3 = max(FLT_MIN, dot(inVec, inVec));
				return inVec* rsqrt( dp3);
			}
			
			float3 float3switch1246_g39181( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch1230_g39233( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch1223_g39222( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 AdditionalLightsSpecularMask( float3 WorldPosition, float3 WorldNormal, float3 WorldView, float3 SpecColor, float Smoothness, float4 ShadowMask )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				Smoothness = exp2(10 * Smoothness + 1);
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				#if ASE_SRP_VERSION >= 100000
					Light light = GetAdditionalLight(i, WorldPosition, ShadowMask);
				#else
					Light light = GetAdditionalLight(i, WorldPosition);
				#endif
					half3 AttLightColor = light.color *(light.distanceAttenuation * light.shadowAttenuation);
					Color += LightingSpecular(AttLightColor, light.direction, WorldNormal, WorldView, half4(SpecColor, 0), Smoothness);	
				}
				#endif
				return Color;
			}
			
			float3 float3switch31_g39205( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch11_g39205( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch18_g39205( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord7.w = eyeDepth;
				
				o.ase_texcoord7.xyz = v.texcoord.xyz;
				o.ase_texcoord8 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord9 = v.vertex;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

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
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				int m_switch119_g39189 = _Reflection_ModeURP;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g39180 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g39180 = abs( ( screenDepth2_g39180 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g39180 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g39180*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g39180 = lerp( _DepthTint , lerpResult25_g39180 , saturate( (distanceDepth2_g39180*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g39180 = lerpResult27_g39180;
				int m_switch238_g39212 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g39212 = float3(0,0,0.001);
				float mulTime155_g39212 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g39212 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g39212 = ( FlowSpeed365_g39212 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g39212).xx;
				float2 appendResult235_g39212 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g39212 = IN.ase_texcoord7.xyz.xy * ( appendResult235_g39212 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g39212 = cos( _G_FlowSwirling.x );
				float sin62_g39212 = sin( _G_FlowSwirling.x );
				float2 rotator62_g39212 = mul( texCoord23_g39212 - float2( 0,0 ) , float2x2( cos62_g39212 , -sin62_g39212 , sin62_g39212 , cos62_g39212 )) + float2( 0,0 );
				float2 panner15_g39212 = ( mulTime155_g39212 * temp_cast_0 + rotator62_g39212);
				float2 temp_cast_1 = (temp_output_367_0_g39212).xx;
				float cos8_g39212 = cos( _G_FlowSwirling.y );
				float sin8_g39212 = sin( _G_FlowSwirling.y );
				float2 rotator8_g39212 = mul( texCoord23_g39212 - float2( 0,0 ) , float2x2( cos8_g39212 , -sin8_g39212 , sin8_g39212 , cos8_g39212 )) + float2( 0,0 );
				float2 panner16_g39212 = ( mulTime155_g39212 * temp_cast_1 + rotator8_g39212);
				float2 temp_cast_2 = (temp_output_367_0_g39212).xx;
				float2 panner17_g39212 = ( mulTime155_g39212 * temp_cast_2 + texCoord23_g39212);
				float2 layeredBlendVar666_g39212 = IN.ase_texcoord7.xyz.xy;
				float4 layeredBlend666_g39212 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g39212 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g39212 ) , layeredBlendVar666_g39212.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g39212 ) , layeredBlendVar666_g39212.y ) );
				float4 temp_output_1_0_g39213 = layeredBlend666_g39212;
				float temp_output_8_0_g39213 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g39213 = UnpackNormalScale( temp_output_1_0_g39213, temp_output_8_0_g39213 );
				unpack52_g39213.z = lerp( 1, unpack52_g39213.z, saturate(temp_output_8_0_g39213) );
				float3 temp_output_699_59_g39212 = unpack52_g39213;
				float3 temp_output_372_0_g39212 = abs( WorldNormal );
				float3 break386_g39212 = ( temp_output_372_0_g39212 * temp_output_372_0_g39212 );
				float _MASK_VERTICAL_Z381_g39212 = ( break386_g39212.z + 0.01 );
				float3 lerpResult677_g39212 = lerp( float3( 0,0,0 ) , temp_output_699_59_g39212 , _MASK_VERTICAL_Z381_g39212);
				float _MASK_VERTICAL_X373_g39212 = ( -break386_g39212.x + 0.2 );
				float3 lerpResult681_g39212 = lerp( float3( 0,0,0 ) , temp_output_699_59_g39212 , _MASK_VERTICAL_X373_g39212);
				float _MASK_VERTICAL_Y_NEG413_g39212 = ( ( WorldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g39212 = lerp( float3( 0,0,0 ) , ( lerpResult677_g39212 + lerpResult681_g39212 ) , _MASK_VERTICAL_Y_NEG413_g39212);
				float3 m_Swirling238_g39212 = lerpResult679_g39212;
				float2 texCoord196_g39217 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39217 = IN.ase_texcoord8;
				float2 blendOpSrc197_g39217 = texCoord196_g39217;
				float2 blendOpDest197_g39217 = (_FLOWMAP_Map89_g39217).xy;
				float2 temp_output_197_0_g39217 = ( saturate( (( blendOpDest197_g39217 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39217 ) * ( 1.0 - blendOpSrc197_g39217 ) ) : ( 2.0 * blendOpDest197_g39217 * blendOpSrc197_g39217 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39217 = FlowSpeed365_g39212;
				float temp_output_182_0_g39217 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39217 );
				float temp_output_194_0_g39217 = (0.0 + (( ( temp_output_182_0_g39217 - floor( ( temp_output_182_0_g39217 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g39217 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g39217 = ( -temp_output_194_0_g39217 * _FLOWMAP_FlowStrength146_g39217 );
				float2 lerpResult198_g39217 = lerp( temp_output_197_0_g39217 , texCoord196_g39217 , _TIME_UV_A199_g39217);
				float2 INPUT_MAP_TILLING128_g39212 = appendResult235_g39212;
				float2 texCoord205_g39217 = IN.ase_texcoord7.xyz.xy * INPUT_MAP_TILLING128_g39212 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39217 = texCoord205_g39217;
				float2 FLOW_A201_g39217 = ( lerpResult198_g39217 + TEXTURE_TILLING211_g39217 );
				float temp_output_225_0_g39217 = (temp_output_182_0_g39217*1.0 + 0.5);
				float _TIME_UV_B214_g39217 = ( -(0.0 + (( ( temp_output_225_0_g39217 - floor( ( temp_output_225_0_g39217 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39217 );
				float2 lerpResult229_g39217 = lerp( temp_output_197_0_g39217 , texCoord196_g39217 , _TIME_UV_B214_g39217);
				float2 FLOW_B232_g39217 = ( lerpResult229_g39217 + TEXTURE_TILLING211_g39217 );
				float TIME_BLEND235_g39217 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39217 / 0.5 ) ) ) );
				float4 lerpResult317_g39212 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g39217 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g39217 ) , TIME_BLEND235_g39217);
				float4 temp_output_1_0_g39219 = lerpResult317_g39212;
				float NormalStrength152_g39212 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g39219 = NormalStrength152_g39212;
				float3 unpack52_g39219 = UnpackNormalScale( temp_output_1_0_g39219, temp_output_8_0_g39219 );
				unpack52_g39219.z = lerp( 1, unpack52_g39219.z, saturate(temp_output_8_0_g39219) );
				float3 temp_output_701_59_g39212 = unpack52_g39219;
				float3 lerpResult692_g39212 = lerp( float3( 0,0,0 ) , temp_output_701_59_g39212 , _MASK_VERTICAL_Z381_g39212);
				float3 lerpResult691_g39212 = lerp( float3( 0,0,0 ) , temp_output_701_59_g39212 , _MASK_VERTICAL_X373_g39212);
				float3 lerpResult697_g39212 = lerp( float3( 0,0,0 ) , ( lerpResult692_g39212 + lerpResult691_g39212 ) , _MASK_VERTICAL_Y_NEG413_g39212);
				float3 m_FlowMap238_g39212 = lerpResult697_g39212;
				float3 localfloat3switch238_g39212 = float3switch238_g39212( m_switch238_g39212 , m_Off238_g39212 , m_Swirling238_g39212 , m_FlowMap238_g39212 );
				int m_switch456_g39193 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g39193 = float3(0,0,0.001);
				float mulTime155_g39193 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g39193 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g39193 = ( FlowSpeed365_g39193 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g39193).xx;
				float2 appendResult235_g39193 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g39193 = IN.ase_texcoord7.xyz.xy * ( appendResult235_g39193 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g39193 = cos( _G_FlowSwirling.x );
				float sin62_g39193 = sin( _G_FlowSwirling.x );
				float2 rotator62_g39193 = mul( texCoord23_g39193 - float2( 0,0 ) , float2x2( cos62_g39193 , -sin62_g39193 , sin62_g39193 , cos62_g39193 )) + float2( 0,0 );
				float2 panner15_g39193 = ( mulTime155_g39193 * temp_cast_5 + rotator62_g39193);
				float2 temp_cast_6 = (temp_output_367_0_g39193).xx;
				float cos8_g39193 = cos( _G_FlowSwirling.y );
				float sin8_g39193 = sin( _G_FlowSwirling.y );
				float2 rotator8_g39193 = mul( texCoord23_g39193 - float2( 0,0 ) , float2x2( cos8_g39193 , -sin8_g39193 , sin8_g39193 , cos8_g39193 )) + float2( 0,0 );
				float2 panner16_g39193 = ( mulTime155_g39193 * temp_cast_6 + rotator8_g39193);
				float2 temp_cast_7 = (temp_output_367_0_g39193).xx;
				float2 panner17_g39193 = ( mulTime155_g39193 * temp_cast_7 + texCoord23_g39193);
				float2 layeredBlendVar448_g39193 = IN.ase_texcoord7.xyz.xy;
				float4 layeredBlend448_g39193 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g39193 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g39193 ) , layeredBlendVar448_g39193.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g39193 ) , layeredBlendVar448_g39193.y ) );
				float4 temp_output_1_0_g39197 = layeredBlend448_g39193;
				float temp_output_8_0_g39197 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g39197 = UnpackNormalScale( temp_output_1_0_g39197, temp_output_8_0_g39197 );
				unpack52_g39197.z = lerp( 1, unpack52_g39197.z, saturate(temp_output_8_0_g39197) );
				float3 temp_output_481_59_g39193 = unpack52_g39197;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g39193 = ( abs( WorldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g39193 = ( break386_g39193.z + 0.75 );
				float3 lerpResult465_g39193 = lerp( float3( 0,0,0 ) , temp_output_481_59_g39193 , _MASK_VERTICAL_Z381_g39193);
				float _MASK_VERTICAL_X373_g39193 = ( break386_g39193.x + 0.45 );
				float3 lerpResult457_g39193 = lerp( float3( 0,0,0 ) , temp_output_481_59_g39193 , _MASK_VERTICAL_X373_g39193);
				float _MASK_VERTICAL_Y383_g39193 = ( -break386_g39193.y + 5.0 );
				float3 lerpResult454_g39193 = lerp( lerpResult465_g39193 , ( lerpResult465_g39193 + lerpResult457_g39193 ) , _MASK_VERTICAL_Y383_g39193);
				float _MASK_VERTICAL_Y_NEG413_g39193 = ( ( WorldNormal.y + WorldNormal.y ) - 1.0 );
				float3 lerpResult477_g39193 = lerp( float3( 0,0,0 ) , lerpResult454_g39193 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g39193 ));
				float3 m_Swirling456_g39193 = lerpResult477_g39193;
				float2 texCoord196_g39195 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39195 = IN.ase_texcoord8;
				float2 blendOpSrc197_g39195 = texCoord196_g39195;
				float2 blendOpDest197_g39195 = (_FLOWMAP_Map89_g39195).xy;
				float2 temp_output_197_0_g39195 = ( saturate( (( blendOpDest197_g39195 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39195 ) * ( 1.0 - blendOpSrc197_g39195 ) ) : ( 2.0 * blendOpDest197_g39195 * blendOpSrc197_g39195 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39195 = FlowSpeed365_g39193;
				float temp_output_182_0_g39195 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39195 );
				float temp_output_194_0_g39195 = (0.0 + (( ( temp_output_182_0_g39195 - floor( ( temp_output_182_0_g39195 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g39195 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g39195 = ( -temp_output_194_0_g39195 * _FLOWMAP_FlowStrength146_g39195 );
				float2 lerpResult198_g39195 = lerp( temp_output_197_0_g39195 , texCoord196_g39195 , _TIME_UV_A199_g39195);
				float2 INPUT_MAP_TILLING128_g39193 = appendResult235_g39193;
				float2 texCoord205_g39195 = IN.ase_texcoord7.xyz.xy * INPUT_MAP_TILLING128_g39193 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39195 = texCoord205_g39195;
				float2 FLOW_A201_g39195 = ( lerpResult198_g39195 + TEXTURE_TILLING211_g39195 );
				float temp_output_225_0_g39195 = (temp_output_182_0_g39195*1.0 + 0.5);
				float _TIME_UV_B214_g39195 = ( -(0.0 + (( ( temp_output_225_0_g39195 - floor( ( temp_output_225_0_g39195 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39195 );
				float2 lerpResult229_g39195 = lerp( temp_output_197_0_g39195 , texCoord196_g39195 , _TIME_UV_B214_g39195);
				float2 FLOW_B232_g39195 = ( lerpResult229_g39195 + TEXTURE_TILLING211_g39195 );
				float TIME_BLEND235_g39195 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39195 / 0.5 ) ) ) );
				float4 lerpResult317_g39193 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g39195 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g39195 ) , TIME_BLEND235_g39195);
				float4 temp_output_1_0_g39201 = lerpResult317_g39193;
				float NormalStrength152_g39193 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g39201 = NormalStrength152_g39193;
				float3 unpack52_g39201 = UnpackNormalScale( temp_output_1_0_g39201, temp_output_8_0_g39201 );
				unpack52_g39201.z = lerp( 1, unpack52_g39201.z, saturate(temp_output_8_0_g39201) );
				float3 temp_output_483_59_g39193 = unpack52_g39201;
				float3 lerpResult466_g39193 = lerp( float3( 0,0,0 ) , temp_output_483_59_g39193 , _MASK_VERTICAL_Z381_g39193);
				float3 lerpResult453_g39193 = lerp( float3( 0,0,0 ) , temp_output_483_59_g39193 , _MASK_VERTICAL_X373_g39193);
				float3 lerpResult460_g39193 = lerp( lerpResult466_g39193 , ( lerpResult466_g39193 + lerpResult453_g39193 ) , _MASK_VERTICAL_Y383_g39193);
				float3 lerpResult411_g39193 = lerp( float3( 0,0,0 ) , lerpResult460_g39193 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g39193 ));
				float3 m_FlowMap456_g39193 = lerpResult411_g39193;
				float3 localfloat3switch456_g39193 = float3switch456_g39193( m_switch456_g39193 , m_Off456_g39193 , m_Swirling456_g39193 , m_FlowMap456_g39193 );
				float2 weightedBlendVar1711_g39180 = IN.ase_texcoord7.xyz.xy;
				float3 weightedBlend1711_g39180 = ( weightedBlendVar1711_g39180.x*localfloat3switch238_g39212 + weightedBlendVar1711_g39180.y*localfloat3switch456_g39193 );
				float3 NORMAL_IN84_g39240 = ( weightedBlend1711_g39180 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g39240 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord7.w;
				float eyeDepth7_g39240 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g39240 = ( (NORMAL_IN84_g39240).xy * ( REFACTED_SCALE_FLOAT78_g39240 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g39240 - eyeDepth ) ) );
				float eyeDepth27_g39240 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g39240, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g39240 = (( float4( ( temp_output_21_0_g39240 * saturate( ( eyeDepth27_g39240 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g39240 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g39240 ), 1.0 );
				float4 REFRACTED_DEPTH144_g39180 = fetchOpaqueVal89_g39240;
				float temp_output_20_0_g39180 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g39180 = 0.0;
				#else
				float staticSwitch37_g39180 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g39180*-5.0 + 1.0) ) ) ) * temp_output_20_0_g39180 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g39180 = staticSwitch37_g39180;
				float4 lerpResult105_g39180 = lerp( COLOR_TINT161_g39180 , REFRACTED_DEPTH144_g39180 , DEPTH_TINT_ALPHA93_g39180);
				float4 _MASK_VECTOR1199_g39181 = float4(0.001,0.001,0.001,0);
				int m_switch278_g39181 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g39181 = float4( 0,0,0,0 );
				float mulTime806_g39181 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g39181 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g39181 = ( FlowSpeed1146_g39181 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g39181).xx;
				float2 appendResult219_g39181 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g39181 = ( appendResult219_g39181 * float2( 2,2 ) );
				float2 texCoord487_g39181 = IN.ase_texcoord7.xyz.xy * temp_output_1294_0_g39181 + float2( 0,0 );
				float cos485_g39181 = cos( _G_FlowSwirling.x );
				float sin485_g39181 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39181 = mul( texCoord487_g39181 - float2( 0,0 ) , float2x2( cos485_g39181 , -sin485_g39181 , sin485_g39181 , cos485_g39181 )) + float2( 0,0 );
				float2 panner483_g39181 = ( mulTime806_g39181 * temp_cast_14 + rotator485_g39181);
				float2 temp_cast_15 = (temp_output_1150_0_g39181).xx;
				float cos481_g39181 = cos( _G_FlowSwirling.y );
				float sin481_g39181 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39181 = mul( texCoord487_g39181 - float2( 0,0 ) , float2x2( cos481_g39181 , -sin481_g39181 , sin481_g39181 , cos481_g39181 )) + float2( 0,0 );
				float2 panner480_g39181 = ( mulTime806_g39181 * temp_cast_15 + rotator481_g39181);
				float2 temp_cast_16 = (temp_output_1150_0_g39181).xx;
				float2 panner478_g39181 = ( mulTime806_g39181 * temp_cast_16 + texCoord487_g39181);
				float4 OUT_SWIRLING298_g39181 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner483_g39181 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner480_g39181 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner478_g39181 ) ) );
				float4 m_Swirling278_g39181 = OUT_SWIRLING298_g39181;
				float2 texCoord196_g39186 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39186 = IN.ase_texcoord8;
				float2 blendOpSrc197_g39186 = texCoord196_g39186;
				float2 blendOpDest197_g39186 = (_FLOWMAP_Map89_g39186).xy;
				float2 temp_output_197_0_g39186 = ( saturate( (( blendOpDest197_g39186 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39186 ) * ( 1.0 - blendOpSrc197_g39186 ) ) : ( 2.0 * blendOpDest197_g39186 * blendOpSrc197_g39186 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39186 = FlowSpeed1146_g39181;
				float temp_output_182_0_g39186 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39186 );
				float temp_output_194_0_g39186 = (0.0 + (( ( temp_output_182_0_g39186 - floor( ( temp_output_182_0_g39186 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g39181 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39186 = FlowStrength1147_g39181;
				float _TIME_UV_A199_g39186 = ( -temp_output_194_0_g39186 * _FLOWMAP_FlowStrength146_g39186 );
				float2 lerpResult198_g39186 = lerp( temp_output_197_0_g39186 , texCoord196_g39186 , _TIME_UV_A199_g39186);
				float2 INPUT_MAP_TILLING128_g39181 = temp_output_1294_0_g39181;
				float2 texCoord205_g39186 = IN.ase_texcoord7.xyz.xy * INPUT_MAP_TILLING128_g39181 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39186 = texCoord205_g39186;
				float2 FLOW_A201_g39186 = ( lerpResult198_g39186 + TEXTURE_TILLING211_g39186 );
				float temp_output_225_0_g39186 = (temp_output_182_0_g39186*1.0 + 0.5);
				float _TIME_UV_B214_g39186 = ( -(0.0 + (( ( temp_output_225_0_g39186 - floor( ( temp_output_225_0_g39186 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39186 );
				float2 lerpResult229_g39186 = lerp( temp_output_197_0_g39186 , texCoord196_g39186 , _TIME_UV_B214_g39186);
				float2 FLOW_B232_g39186 = ( lerpResult229_g39186 + TEXTURE_TILLING211_g39186 );
				float TIME_BLEND235_g39186 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39186 / 0.5 ) ) ) );
				float4 lerpResult1117_g39181 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39186 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39186 ) , TIME_BLEND235_g39186);
				float4 OUT_FLOW_FLOWMAP1119_g39181 = lerpResult1117_g39181;
				float4 m_FlowMap278_g39181 = OUT_FLOW_FLOWMAP1119_g39181;
				float4 localfloat4switch278_g39181 = float4switch278_g39181( m_switch278_g39181 , m_Off278_g39181 , m_Swirling278_g39181 , m_FlowMap278_g39181 );
				float clampDepth2_g39207 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g39207 = clampDepth2_g39207;
				float4 localCalculateObliqueFrustumCorrection3_g39231 = CalculateObliqueFrustumCorrection();
				float dotResult4_g39231 = dot( float4( IN.ase_texcoord9.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g39231 );
				float correctionFactor1_g39207 = dotResult4_g39231;
				float localCorrectedLinearEyeDepth1_g39207 = CorrectedLinearEyeDepth( z1_g39207 , correctionFactor1_g39207 );
				float eyeDepth18_g39207 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g39207 = ( eyeDepth18_g39207 - ScreenPos.w );
				float temp_output_13_0_g39207 = ( localCorrectedLinearEyeDepth1_g39207 - abs( temp_output_17_0_g39207 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g39180 = saturate( temp_output_13_0_g39207 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39181 = temp_cast_20;
				float3 unityObjectToViewPos262_g39181 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float GRAB_SCREEN_DEPTH73_g39180 = localCorrectedLinearEyeDepth1_g39207;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39181 = temp_cast_21;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g39180 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39181 = temp_cast_23;
				float4 lerpResult281_g39181 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g39181 * _FOAMVERTICAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39181 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g39181.z + GRAB_SCREEN_DEPTH310_g39181 ) - temp_cast_22 ) * GRAB_SCREEN_CLOSENESS312_g39181 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g39181 ) ) ));
				float4 lerpResult265_g39181 = lerp( float4( 0,0,0,0 ) , lerpResult281_g39181 , FlowStrength1147_g39181);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g39181 = ( abs( WorldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g39181 = ( break1161_g39181.z + 0.45 );
				float4 lerpResult1173_g39181 = lerp( _MASK_VECTOR1199_g39181 , lerpResult265_g39181 , _MASK_VERTICAL_Z1162_g39181);
				float _MASK_VERTICAL_X1170_g39181 = ( break1161_g39181.x + 0.46 );
				float4 lerpResult1176_g39181 = lerp( _MASK_VECTOR1199_g39181 , lerpResult265_g39181 , _MASK_VERTICAL_X1170_g39181);
				float _MASK_VERTICAL_Y1163_g39181 = ( -break1161_g39181.y + 6.5 );
				float4 lerpResult1179_g39181 = lerp( lerpResult1173_g39181 , ( lerpResult1173_g39181 + lerpResult1176_g39181 ) , _MASK_VERTICAL_Y1163_g39181);
				float4 temp_output_1189_0_g39181 = saturate( lerpResult1179_g39181 );
				float4 FOAM_VERTICAL_OFFSHORE655_g39180 = temp_output_1189_0_g39181;
				float4 _MASK_VECTOR1200_g39233 = float4(0.001,0.001,0.001,0);
				int m_switch278_g39233 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g39233 = float4( 0,0,0,0 );
				float mulTime806_g39233 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g39233 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g39233 = ( Speed1146_g39233 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g39233).xx;
				float2 appendResult219_g39233 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g39233 = ( appendResult219_g39233 * float2( 2,2 ) );
				float2 texCoord487_g39233 = IN.ase_texcoord7.xyz.xy * temp_output_1214_0_g39233 + float2( 0,0 );
				float cos485_g39233 = cos( _G_FlowSwirling.x );
				float sin485_g39233 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39233 = mul( texCoord487_g39233 - float2( 0,0 ) , float2x2( cos485_g39233 , -sin485_g39233 , sin485_g39233 , cos485_g39233 )) + float2( 0,0 );
				float2 panner483_g39233 = ( mulTime806_g39233 * temp_cast_27 + rotator485_g39233);
				float2 temp_cast_28 = (temp_output_1150_0_g39233).xx;
				float cos481_g39233 = cos( _G_FlowSwirling.y );
				float sin481_g39233 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39233 = mul( texCoord487_g39233 - float2( 0,0 ) , float2x2( cos481_g39233 , -sin481_g39233 , sin481_g39233 , cos481_g39233 )) + float2( 0,0 );
				float2 panner480_g39233 = ( mulTime806_g39233 * temp_cast_28 + rotator481_g39233);
				float2 temp_cast_29 = (temp_output_1150_0_g39233).xx;
				float2 panner478_g39233 = ( mulTime806_g39233 * temp_cast_29 + texCoord487_g39233);
				float4 OUT_SWIRLING298_g39233 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner483_g39233 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner480_g39233 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner478_g39233 ) ) );
				float4 m_Swirling278_g39233 = OUT_SWIRLING298_g39233;
				float2 texCoord196_g39238 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39238 = IN.ase_texcoord8;
				float2 blendOpSrc197_g39238 = texCoord196_g39238;
				float2 blendOpDest197_g39238 = (_FLOWMAP_Map89_g39238).xy;
				float2 temp_output_197_0_g39238 = ( saturate( (( blendOpDest197_g39238 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39238 ) * ( 1.0 - blendOpSrc197_g39238 ) ) : ( 2.0 * blendOpDest197_g39238 * blendOpSrc197_g39238 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39238 = Speed1146_g39233;
				float temp_output_182_0_g39238 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39238 );
				float temp_output_194_0_g39238 = (0.0 + (( ( temp_output_182_0_g39238 - floor( ( temp_output_182_0_g39238 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g39233 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39238 = FlowStrength1147_g39233;
				float _TIME_UV_A199_g39238 = ( -temp_output_194_0_g39238 * _FLOWMAP_FlowStrength146_g39238 );
				float2 lerpResult198_g39238 = lerp( temp_output_197_0_g39238 , texCoord196_g39238 , _TIME_UV_A199_g39238);
				float2 INPUT_MAP_TILLING128_g39233 = temp_output_1214_0_g39233;
				float2 texCoord205_g39238 = IN.ase_texcoord7.xyz.xy * INPUT_MAP_TILLING128_g39233 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39238 = texCoord205_g39238;
				float2 FLOW_A201_g39238 = ( lerpResult198_g39238 + TEXTURE_TILLING211_g39238 );
				float temp_output_225_0_g39238 = (temp_output_182_0_g39238*1.0 + 0.5);
				float _TIME_UV_B214_g39238 = ( -(0.0 + (( ( temp_output_225_0_g39238 - floor( ( temp_output_225_0_g39238 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39238 );
				float2 lerpResult229_g39238 = lerp( temp_output_197_0_g39238 , texCoord196_g39238 , _TIME_UV_B214_g39238);
				float2 FLOW_B232_g39238 = ( lerpResult229_g39238 + TEXTURE_TILLING211_g39238 );
				float TIME_BLEND235_g39238 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39238 / 0.5 ) ) ) );
				float4 lerpResult1117_g39233 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39238 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39238 ) , TIME_BLEND235_g39238);
				float4 OUT_FLOW_FLOWMAP1119_g39233 = lerpResult1117_g39233;
				float4 m_FlowMap278_g39233 = OUT_FLOW_FLOWMAP1119_g39233;
				float4 localfloat4switch278_g39233 = float4switch278_g39233( m_switch278_g39233 , m_Off278_g39233 , m_Swirling278_g39233 , m_FlowMap278_g39233 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39233 = temp_cast_32;
				float3 unityObjectToViewPos262_g39233 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39233 = temp_cast_33;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39233 = temp_cast_35;
				float4 lerpResult281_g39233 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g39233 * _FOAMHORIZONTAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39233 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g39233.z + GRAB_SCREEN_DEPTH310_g39233 ) - temp_cast_34 ) * GRAB_SCREEN_CLOSENESS312_g39233 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g39233 ) ) ));
				float4 lerpResult265_g39233 = lerp( float4( 0,0,0,0 ) , lerpResult281_g39233 , FlowStrength1147_g39233);
				float _MASK_HORIZONTAL1160_g39233 = ( ( WorldNormal.y + WorldNormal.y ) - 1.7 );
				float4 lerpResult1185_g39233 = lerp( _MASK_VECTOR1200_g39233 , lerpResult265_g39233 , _MASK_HORIZONTAL1160_g39233);
				float4 temp_output_1188_0_g39233 = saturate( lerpResult1185_g39233 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g39180 = temp_output_1188_0_g39233;
				int m_switch278_g39222 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g39222 = float4( 0,0,0,0 );
				float mulTime806_g39222 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g39222 = _FoamShoreline_Speed;
				float temp_output_1185_0_g39222 = ( FlowSpeed1179_g39222 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g39222).xx;
				float2 appendResult219_g39222 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g39222 = ( appendResult219_g39222 * float2( 2,2 ) );
				float2 texCoord487_g39222 = IN.ase_texcoord7.xyz.xy * temp_output_1196_0_g39222 + float2( 0,0 );
				float cos485_g39222 = cos( _G_FlowSwirling.x );
				float sin485_g39222 = sin( _G_FlowSwirling.x );
				float2 rotator485_g39222 = mul( texCoord487_g39222 - float2( 0,0 ) , float2x2( cos485_g39222 , -sin485_g39222 , sin485_g39222 , cos485_g39222 )) + float2( 0,0 );
				float2 panner483_g39222 = ( mulTime806_g39222 * temp_cast_38 + rotator485_g39222);
				float2 temp_cast_39 = (temp_output_1185_0_g39222).xx;
				float cos481_g39222 = cos( _G_FlowSwirling.y );
				float sin481_g39222 = sin( _G_FlowSwirling.y );
				float2 rotator481_g39222 = mul( texCoord487_g39222 - float2( 0,0 ) , float2x2( cos481_g39222 , -sin481_g39222 , sin481_g39222 , cos481_g39222 )) + float2( 0,0 );
				float2 panner480_g39222 = ( mulTime806_g39222 * temp_cast_39 + rotator481_g39222);
				float2 temp_cast_40 = (temp_output_1185_0_g39222).xx;
				float2 panner478_g39222 = ( mulTime806_g39222 * temp_cast_40 + texCoord487_g39222);
				float4 OUT_SWIRLING298_g39222 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner483_g39222 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner480_g39222 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner478_g39222 ) ) );
				float4 m_Swirling278_g39222 = OUT_SWIRLING298_g39222;
				float2 texCoord196_g39227 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g39227 = IN.ase_texcoord8;
				float2 blendOpSrc197_g39227 = texCoord196_g39227;
				float2 blendOpDest197_g39227 = (_FLOWMAP_Map89_g39227).xy;
				float2 temp_output_197_0_g39227 = ( saturate( (( blendOpDest197_g39227 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g39227 ) * ( 1.0 - blendOpSrc197_g39227 ) ) : ( 2.0 * blendOpDest197_g39227 * blendOpSrc197_g39227 ) ) ));
				float _FLOWMAP_FlowSpeed148_g39227 = FlowSpeed1179_g39222;
				float temp_output_182_0_g39227 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g39227 );
				float temp_output_194_0_g39227 = (0.0 + (( ( temp_output_182_0_g39227 - floor( ( temp_output_182_0_g39227 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1182_g39222 = _FoamShoreline_FlowStrength;
				float _FLOWMAP_FlowStrength146_g39227 = FlowStrength1182_g39222;
				float _TIME_UV_A199_g39227 = ( -temp_output_194_0_g39227 * _FLOWMAP_FlowStrength146_g39227 );
				float2 lerpResult198_g39227 = lerp( temp_output_197_0_g39227 , texCoord196_g39227 , _TIME_UV_A199_g39227);
				float2 INPUT_MAP_TILLING128_g39222 = temp_output_1196_0_g39222;
				float2 texCoord205_g39227 = IN.ase_texcoord7.xyz.xy * INPUT_MAP_TILLING128_g39222 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g39227 = texCoord205_g39227;
				float2 FLOW_A201_g39227 = ( lerpResult198_g39227 + TEXTURE_TILLING211_g39227 );
				float temp_output_225_0_g39227 = (temp_output_182_0_g39227*1.0 + 0.5);
				float _TIME_UV_B214_g39227 = ( -(0.0 + (( ( temp_output_225_0_g39227 - floor( ( temp_output_225_0_g39227 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g39227 );
				float2 lerpResult229_g39227 = lerp( temp_output_197_0_g39227 , texCoord196_g39227 , _TIME_UV_B214_g39227);
				float2 FLOW_B232_g39227 = ( lerpResult229_g39227 + TEXTURE_TILLING211_g39227 );
				float TIME_BLEND235_g39227 = saturate( abs( ( 1.0 - ( temp_output_194_0_g39227 / 0.5 ) ) ) );
				float4 lerpResult1153_g39222 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_A201_g39227 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_B232_g39227 ) , TIME_BLEND235_g39227);
				float4 OUT_FLOW_FLOWMAP1156_g39222 = lerpResult1153_g39222;
				float4 m_FlowMap278_g39222 = OUT_FLOW_FLOWMAP1156_g39222;
				float4 localfloat4switch278_g39222 = float4switch278_g39222( m_switch278_g39222 , m_Off278_g39222 , m_Swirling278_g39222 , m_FlowMap278_g39222 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g39222 = temp_cast_43;
				float3 unityObjectToViewPos731_g39222 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g39180).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g39222 = temp_cast_44;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g39180).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g39222 = temp_cast_46;
				float4 lerpResult769_g39222 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g39222 * _FoamShoreline_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g39222 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g39222.z + GRAB_SCREEN_DEPTH310_g39222 ) - temp_cast_45 ) * GRAB_SCREEN_CLOSENESS312_g39222 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * GRAB_SCREEN_CLOSENESS312_g39222 ) ) ));
				float4 lerpResult761_g39222 = lerp( float4( 0,0,0,0 ) , lerpResult769_g39222 , FlowStrength1182_g39222);
				float4 FOAM_SHORELINE654_g39180 = lerpResult761_g39222;
				float4 temp_output_1492_0_g39180 = ( ( ( lerpResult105_g39180 + FOAM_VERTICAL_OFFSHORE655_g39180 ) + FOAM_HORIZONTAL_OFFSHORE1565_g39180 ) + FOAM_SHORELINE654_g39180 );
				float4 ALBEDO_IN60_g39189 = temp_output_1492_0_g39180;
				float4 m_Off119_g39189 = ALBEDO_IN60_g39189;
				int m_switch91_g39189 = _Reflection_FresnelMode;
				int REFLECTION_MODE_URP123_g39189 = _Reflection_ModeURP;
				int m_switch124_g39189 = REFLECTION_MODE_URP123_g39189;
				float4 m_Off124_g39189 = float4( 0,0,0,0 );
				float3 NORMAL_OUT_Z505_g39180 = weightedBlend1711_g39180;
				float3 temp_output_53_0_g39189 = NORMAL_OUT_Z505_g39180;
				float3 NORMAL_IN106_g39189 = temp_output_53_0_g39189;
				float2 temp_cast_49 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_50 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g39189 = clamp( ( (( NORMAL_IN106_g39189 * 50.0 )).xy * _Reflection_BumpScale ) , temp_cast_49 , temp_cast_50 );
				float2 REFLECTION_BUMP9_g39189 = clampResult29_g39189;
				float4 appendResult103_g39189 = (float4(1.0 , 0.0 , 1.0 , temp_output_53_0_g39189.x));
				float3 unpack104_g39189 = UnpackNormalScale( appendResult103_g39189, 0.15 );
				unpack104_g39189.z = lerp( 1, unpack104_g39189.z, saturate(0.15) );
				float3 NORMAL_IN_Z54_g39189 = unpack104_g39189;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 worldRefl24_g39189 = reflect( -WorldViewDirection, float3( dot( tanToWorld0, NORMAL_IN_Z54_g39189 ), dot( tanToWorld1, NORMAL_IN_Z54_g39189 ), dot( tanToWorld2, NORMAL_IN_Z54_g39189 ) ) );
				float REFLECTION_WOBBLE13_g39189 = _Reflection_Wobble;
				float4 texCUBENode31_g39189 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat, ( float3( REFLECTION_BUMP9_g39189 ,  0.0 ) + worldRefl24_g39189 + REFLECTION_WOBBLE13_g39189 ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_52 = (texCUBENode31_g39189.r).xxxx;
				float REFLECTION_CLOUD12_g39189 = _Reflection_Cloud;
				float4 lerpResult49_g39189 = lerp( texCUBENode31_g39189 , temp_cast_52 , REFLECTION_CLOUD12_g39189);
				float4 m_ActiveCubeMap124_g39189 = lerpResult49_g39189;
				float3 temp_output_109_0_g39189 = SHADERGRAPH_REFLECTION_PROBE(WorldViewDirection,float3( ( REFLECTION_BUMP9_g39189 + REFLECTION_WOBBLE13_g39189 ) ,  0.0 ),_Reflection_LOD);
				float3 temp_cast_55 = (temp_output_109_0_g39189.x).xxx;
				float3 lerpResult115_g39189 = lerp( temp_output_109_0_g39189 , temp_cast_55 , REFLECTION_CLOUD12_g39189);
				float4 appendResult127_g39189 = (float4(lerpResult115_g39189 , 0.0));
				float4 m_ActiveProbe124_g39189 = appendResult127_g39189;
				float4 localfloat4switch124_g39189 = float4switch124_g39189( m_switch124_g39189 , m_Off124_g39189 , m_ActiveCubeMap124_g39189 , m_ActiveProbe124_g39189 );
				float4 m_Off91_g39189 = localfloat4switch124_g39189;
				float fresnelNdotV23_g39189 = dot( WorldNormal, WorldViewDirection );
				float fresnelNode23_g39189 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g39189 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g39189 = ( _Reflection_FresnelStrength * fresnelNode23_g39189 );
				float4 lerpResult73_g39189 = lerp( float4( 0,0,0,0 ) , localfloat4switch124_g39189 , REFLECTION_FRESNEL11_g39189);
				float4 m_Active91_g39189 = lerpResult73_g39189;
				float4 localfloat4switch91_g39189 = float4switch91_g39189( m_switch91_g39189 , m_Off91_g39189 , m_Active91_g39189 );
				float4 switchResult85_g39189 = (((ase_vface>0)?(localfloat4switch91_g39189):(float4( 0,0,0,0 ))));
				float4 temp_cast_58 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch95_g39189 = temp_cast_58;
				#else
				float4 staticSwitch95_g39189 = ( ( ( 1.0 - 0.5 ) * switchResult85_g39189 ) + ( ALBEDO_IN60_g39189 * 0.5 ) );
				#endif
				float4 m_ActiveCubeMap119_g39189 = staticSwitch95_g39189;
				float4 m_ActiveProbe119_g39189 = staticSwitch95_g39189;
				float4 localfloat4switch119_g39189 = float4switch119_g39189( m_switch119_g39189 , m_Off119_g39189 , m_ActiveCubeMap119_g39189 , m_ActiveProbe119_g39189 );
				
				int ModeFlowType1245_g39181 = _FOAMVERTICAL_ModeFlowType;
				int m_switch1246_g39181 = ModeFlowType1245_g39181;
				float3 m_Off1246_g39181 = float3( 0,0,1 );
				float3 temp_output_21_0_g39185 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g39185 = cross( WorldNormal , ddy( temp_output_21_0_g39185 ) );
				float3 temp_output_6_0_g39185 = ddx( temp_output_21_0_g39185 );
				float dotResult27_g39185 = dot( temp_output_15_0_g39185 , temp_output_6_0_g39185 );
				float temp_output_14_0_g39185 = abs( dotResult27_g39185 );
				float4 temp_output_8_0_g39185 = ( _FOAMVERTICAL_NormalStrength * temp_output_1189_0_g39181 );
				float4 break18_g39185 = ( sign( temp_output_14_0_g39185 ) * ( ( ddx( temp_output_8_0_g39185 ) * float4( temp_output_15_0_g39185 , 0.0 ) ) + ( ddy( temp_output_8_0_g39185 ) * float4( cross( WorldNormal , temp_output_6_0_g39185 ) , 0.0 ) ) ) );
				float3 appendResult7_g39185 = (float3(break18_g39185.x , -break18_g39185.y , break18_g39185.z));
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 worldToTangentDir5_g39185 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g39185 * WorldNormal ) - appendResult7_g39185 )) );
				float3 temp_output_1249_32_g39181 = worldToTangentDir5_g39185;
				float3 m_Swirling1246_g39181 = temp_output_1249_32_g39181;
				float3 m_FlowMap1246_g39181 = temp_output_1249_32_g39181;
				float3 localfloat3switch1246_g39181 = float3switch1246_g39181( m_switch1246_g39181 , m_Off1246_g39181 , m_Swirling1246_g39181 , m_FlowMap1246_g39181 );
				float3 FOAM_VERTICAL_OFFSHORE_NORMAL1192_g39180 = localfloat3switch1246_g39181;
				int ModeFlowType1232_g39233 = _FOAMHORIZONTAL_ModeFlowType;
				int m_switch1230_g39233 = ModeFlowType1232_g39233;
				float3 m_Off1230_g39233 = float3( 0,0,1 );
				float3 temp_output_21_0_g39237 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g39237 = cross( WorldNormal , ddy( temp_output_21_0_g39237 ) );
				float3 temp_output_6_0_g39237 = ddx( temp_output_21_0_g39237 );
				float dotResult27_g39237 = dot( temp_output_15_0_g39237 , temp_output_6_0_g39237 );
				float temp_output_14_0_g39237 = abs( dotResult27_g39237 );
				float4 temp_output_8_0_g39237 = ( _FOAMHORIZONTAL_NormalStrength * temp_output_1188_0_g39233 );
				float4 break18_g39237 = ( sign( temp_output_14_0_g39237 ) * ( ( ddx( temp_output_8_0_g39237 ) * float4( temp_output_15_0_g39237 , 0.0 ) ) + ( ddy( temp_output_8_0_g39237 ) * float4( cross( WorldNormal , temp_output_6_0_g39237 ) , 0.0 ) ) ) );
				float3 appendResult7_g39237 = (float3(break18_g39237.x , -break18_g39237.y , break18_g39237.z));
				float3 worldToTangentDir5_g39237 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g39237 * WorldNormal ) - appendResult7_g39237 )) );
				float3 temp_output_1233_32_g39233 = worldToTangentDir5_g39237;
				float3 m_Swirling1230_g39233 = temp_output_1233_32_g39233;
				float3 m_FlowMap1230_g39233 = temp_output_1233_32_g39233;
				float3 localfloat3switch1230_g39233 = float3switch1230_g39233( m_switch1230_g39233 , m_Off1230_g39233 , m_Swirling1230_g39233 , m_FlowMap1230_g39233 );
				float3 FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g39180 = localfloat3switch1230_g39233;
				int ModeFlowType1225_g39222 = _FoamShoreline_ModeFlowType;
				int m_switch1223_g39222 = ModeFlowType1225_g39222;
				float3 m_Off1223_g39222 = float3( 0,0,1 );
				float3 temp_output_21_0_g39226 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g39226 = cross( WorldNormal , ddy( temp_output_21_0_g39226 ) );
				float3 temp_output_6_0_g39226 = ddx( temp_output_21_0_g39226 );
				float dotResult27_g39226 = dot( temp_output_15_0_g39226 , temp_output_6_0_g39226 );
				float temp_output_14_0_g39226 = abs( dotResult27_g39226 );
				float4 temp_output_8_0_g39226 = ( _FoamShoreline_NormalStrength * lerpResult761_g39222 );
				float4 break18_g39226 = ( sign( temp_output_14_0_g39226 ) * ( ( ddx( temp_output_8_0_g39226 ) * float4( temp_output_15_0_g39226 , 0.0 ) ) + ( ddy( temp_output_8_0_g39226 ) * float4( cross( WorldNormal , temp_output_6_0_g39226 ) , 0.0 ) ) ) );
				float3 appendResult7_g39226 = (float3(break18_g39226.x , -break18_g39226.y , break18_g39226.z));
				float3 worldToTangentDir5_g39226 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g39226 * WorldNormal ) - appendResult7_g39226 )) );
				float3 temp_output_1222_32_g39222 = worldToTangentDir5_g39226;
				float3 m_Swirling1223_g39222 = temp_output_1222_32_g39222;
				float3 m_FlowMap1223_g39222 = temp_output_1222_32_g39222;
				float3 localfloat3switch1223_g39222 = float3switch1223_g39222( m_switch1223_g39222 , m_Off1223_g39222 , m_Swirling1223_g39222 , m_FlowMap1223_g39222 );
				float3 FOAM_NORMALShorline1208_g39180 = localfloat3switch1223_g39222;
				float3 temp_output_1715_0_g39180 = BlendNormal( BlendNormal( BlendNormal( weightedBlend1711_g39180 , FOAM_VERTICAL_OFFSHORE_NORMAL1192_g39180 ) , FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g39180 ) , FOAM_NORMALShorline1208_g39180 );
				float3 worldPosValue71_g39229 = WorldPosition;
				float3 WorldPosition66_g39229 = worldPosValue71_g39229;
				float3 NORMAL_OUT1731_g39180 = temp_output_1715_0_g39180;
				float3 temp_output_16_0_g39229 = NORMAL_OUT1731_g39180;
				float3 lerpResult163_g39229 = lerp( ( WorldTangent * temp_output_16_0_g39229.x ) , ( WorldBiTangent * temp_output_16_0_g39229.y ) , ( WorldNormal * temp_output_16_0_g39229.z ));
				float3 NORMAL_PERPIXEL136_g39229 = lerpResult163_g39229;
				float3 WorldNormal66_g39229 = NORMAL_PERPIXEL136_g39229;
				float3 WorldView66_g39229 = WorldViewDirection;
				float3 temp_output_1_0_g39229 = _URP_SpecularColor.rgb;
				float3 SpecColor66_g39229 = (temp_output_1_0_g39229).xyz;
				float temp_output_173_0_g39229 = ( 1.0 - _URP_SpecularStrength );
				float Smoothness66_g39229 = temp_output_173_0_g39229;
				float4 shadowMaskValue77_g39229 = float4(1,1,1,1);
				float4 ShadowMask66_g39229 = shadowMaskValue77_g39229;
				float3 localAdditionalLightsSpecularMask66_g39229 = AdditionalLightsSpecularMask( WorldPosition66_g39229 , WorldNormal66_g39229 , WorldView66_g39229 , SpecColor66_g39229 , Smoothness66_g39229 , ShadowMask66_g39229 );
				float3 ADDITIONAL_LIGHT1730_g39180 = localAdditionalLightsSpecularMask66_g39229;
				float3 temp_output_1732_0_g39180 = ( temp_output_1715_0_g39180 + ADDITIONAL_LIGHT1730_g39180 );
				
				int temp_output_43_0_g39205 = _Specular_Mode;
				int m_switch18_g39205 = temp_output_43_0_g39205;
				float3 m_Off18_g39205 = float3( 0,0,0 );
				float3 tanNormal37_g39205 = temp_output_1732_0_g39180;
				float3 worldNormal37_g39205 = float3(dot(tanToWorld0,tanNormal37_g39205), dot(tanToWorld1,tanNormal37_g39205), dot(tanToWorld2,tanNormal37_g39205));
				float3 normalizeResult20_g39205 = normalize( worldNormal37_g39205 );
				float3 normalizeResult27_g39205 = normalize( ( WorldViewDirection + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult19_g39205 = dot( normalizeResult20_g39205 , normalizeResult27_g39205 );
				float temp_output_48_0_g39205 = _SpecularWrap;
				float temp_output_46_0_g39205 = (dotResult19_g39205*temp_output_48_0_g39205 + temp_output_48_0_g39205);
				float saferPower25_g39205 = max( ( temp_output_46_0_g39205 * temp_output_46_0_g39205 * temp_output_46_0_g39205 ) , 0.0001 );
				int _SPECULAR_Mode22_g39205 = temp_output_43_0_g39205;
				int m_switch31_g39205 = _SPECULAR_Mode22_g39205;
				float3 m_Off31_g39205 = float3( 0,0,0 );
				float3 temp_output_16_0_g39205 = (_SpecularColor).rgb;
				float3 m_Active31_g39205 = temp_output_16_0_g39205;
				float3 clampResult5_g39205 = clamp( temp_output_16_0_g39205 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp31_g39205 = clampResult5_g39205;
				float3 localfloat3switch31_g39205 = float3switch31_g39205( m_switch31_g39205 , m_Off31_g39205 , m_Active31_g39205 , m_ActiveClamp31_g39205 );
				int m_switch11_g39205 = _SPECULAR_Mode22_g39205;
				float3 m_Off11_g39205 = float3( 0,0,0 );
				float3 temp_output_4_0_g39205 = (_MainLightColor).rgb;
				float3 m_Active11_g39205 = temp_output_4_0_g39205;
				float3 clampResult9_g39205 = clamp( temp_output_4_0_g39205 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp11_g39205 = clampResult9_g39205;
				float3 localfloat3switch11_g39205 = float3switch11_g39205( m_switch11_g39205 , m_Off11_g39205 , m_Active11_g39205 , m_ActiveClamp11_g39205 );
				float3 temp_output_24_0_g39205 = saturate( ( pow( saferPower25_g39205 , ( 1.0 - _Shininess ) ) * saturate( ( localfloat3switch31_g39205 * localfloat3switch11_g39205 ) ) ) );
				float3 m_Active18_g39205 = temp_output_24_0_g39205;
				float3 m_ActiveClamp18_g39205 = temp_output_24_0_g39205;
				float3 localfloat3switch18_g39205 = float3switch18_g39205( m_switch18_g39205 , m_Off18_g39205 , m_Active18_g39205 , m_ActiveClamp18_g39205 );
				
				float temp_output_1454_0_g39180 = ( _SMOOTHNESS_Strength * _SMOOTHNESS_Strength );
				float3 temp_cast_67 = (temp_output_1454_0_g39180).xxx;
				float3 tanNormal1601_g39180 = NORMAL_OUT_Z505_g39180;
				float3 worldNormal1601_g39180 = float3(dot(tanToWorld0,tanNormal1601_g39180), dot(tanToWorld1,tanNormal1601_g39180), dot(tanToWorld2,tanNormal1601_g39180));
				float fresnelNdotV1412_g39180 = dot( worldNormal1601_g39180, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode1412_g39180 = ( _SMOOTHNESS_FresnelBias + _SMOOTHNESS_FresnelScale * pow( max( 1.0 - fresnelNdotV1412_g39180 , 0.0001 ), _SMOOTHNESS_FresnelPower ) );
				float3 lerpResult1403_g39180 = lerp( temp_cast_67 , ( temp_output_1454_0_g39180 * worldNormal1601_g39180 ) , ( fresnelNode1412_g39180 * ( 1.0 - fresnelNode1412_g39180 ) ));
				float3 clampResult1740_g39180 = clamp( lerpResult1403_g39180 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				
				float3 Albedo = localfloat4switch119_g39189.xyz;
				float3 Normal = temp_output_1732_0_g39180;
				float3 Emission = 0;
				float3 Specular = localfloat3switch18_g39205;
				float Metallic = 0;
				float Smoothness = clampResult1740_g39180.x;
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;
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
					float shadow = _TransmissionShadow;
				
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
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;
				
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
	
	
}
/*ASEBEGIN
Version=18913
4;29.33333;1436.667;767.6667;672.1357;3331.87;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;844;199.208,-3064.666;Inherit;False;377.5028;188.4201;DEBUG SETTINGS ;4;993;700;698;964;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;843;201.0305,-3187.07;Inherit;False;166;115;GLOBAL SETTINGS ;1;207;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1011;200.1968,-2582.621;Inherit;False;320.6667;112;DESF Common ASE Compile Shaders;1;1012;;0,0.2047877,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1015;-84.05237,-3181.537;Inherit;False;271;139;_RECEIVE_SHADOWS_OFF;7;1016;989;991;990;992;1007;987;;0,0,0,1;0;0
Node;AmplifyShaderEditor.StaticSwitch;1016;-76.05237,-3142.537;Inherit;False;Property;_RECEIVE_SHADOWS_OFF;Receive Shadows;3;0;Create;False;0;0;0;True;0;False;0;0;0;True;_RECEIVE_SHADOWS_OFF;Toggle;2;Key0;Key1;Fetch;True;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1010;-181.4706,-2872.287;Inherit;False;DESF Core Water URP;5;;39180;2ce30b88128d2f64bb175b3da03ff631;9,1745,7,169,1,212,1,1081,0,440,0,438,0,1078,0,310,0,1079,0;0;7;FLOAT4;0;FLOAT3;123;FLOAT3;1651;FLOAT3;122;FLOAT;419;FLOAT;417;FLOAT;1080
Node;AmplifyShaderEditor.IntNode;700;403.1788,-3025.381;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;698;211.3818,-3025.394;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;207;212.0131,-3149.746;Float;False;Property;_CullMode;Cull Mode;4;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;964;209.8078,-2953.154;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1012;211.1968,-2544.621;Inherit;False;DESF Common ASE Compile Shaders;-1;;39179;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;993;403.1951,-2954.371;Inherit;False;Constant;_MaskClipValue1;Mask Clip Value;64;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;991;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;988;198.1309,-2867.459;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;DEC/Water/Water Lake Simple;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;True;207;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;2;True;18;all;0;True;True;2;5;False;-1;10;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;700;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;False;2;Include;;False;;Native;Pragma;shader_feature_local _RECEIVE_SHADOWS_OFF;False;;Custom;;0;0;Standard;38;Workflow;0;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;1;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,False,-1;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;0;  Phong;0;  Strength;0.5,True,388;  Type;0;  Tess;16,True,386;  Min;10,True,387;  Max;25,True,385;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Write Depth;0;  Early Z;0;Vertex Position,InvertActionOnDeselection;1;0;8;False;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;987;98.13091,-3050.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1007;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;2;5;False;-1;10;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;700;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;992;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;2;5;False;-1;10;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;False;False;False;False;False;False;True;1;False;700;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;990;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1006;198.1309,-2807.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;989;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;988;0;1010;0
WireConnection;988;1;1010;123
WireConnection;988;9;1010;1651
WireConnection;988;4;1010;122
ASEEND*/
//CHKSM=EA1B8A7F0ECCC28FFBB7191EF3AB62D4E06C21AB