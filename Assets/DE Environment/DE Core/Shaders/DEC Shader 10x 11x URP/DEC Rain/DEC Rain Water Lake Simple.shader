// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Rain/Rain Water Lake Simple"
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
		[Header(RAIN)]_Rain_WetnessDarken("Rain Wetness Darken", Range( 0 , 1)) = 0.025
		[Enum(Off,0,Active,1)]_Rain_GlobalWetnessMode("Rain Global Wetness", Int) = 1
		[Enum(Off,0,Active,1)][Header (RAIN HORIZONTAL)]_Horizontal_RainMode("Rain Mode", Int) = 0
		[Normal][SingleLineTexture]_Horizontal_RainMap("Rain Map Horizontal", 2D) = "bump" {}
		_Horizontal_Intensity("Intensity", Range( 0 , 10)) = 9
		_Horizontal_Speed("Speed", Range( 0 , 50)) = 15
		_Horizontal_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.001
		_Horizontal_Columns("Columns", Float) = 8
		_Horizontal_Rows("Rows", Float) = 8
		[Enum(Standard,0,Stochastic,1)]_Horizontal_ModeUV("Mode UV", Int) = 0
		_Horizontal_TilingX("Tiling X", Float) = 5
		_Horizontal_TilingY("Tiling Y", Float) = 5
		_Horizontal_OffsetX("Offset X", Float) = 0
		_Horizontal_OffsetY("Offset Y", Float) = 0
		[Enum(Off,0,Active,1)][Header (RAIN VERTICAL)]_Vertical_RainMode("Rain Mode", Int) = 0
		[Normal][SingleLineTexture]_Vertical_RainMap("Rain Map Vertical", 2D) = "bump" {}
		_Vertical_Intensity("Intensity", Range( 0 , 10)) = 6
		_Vertical_SmoothEdge("Smooth Edge", Range( -0.1 , 0.1)) = 0
		_Vertical_Speed("Speed", Range( 0 , 50)) = 22
		_Vertical_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.001
		_Vertical_Columns("Columns", Float) = 5
		_Vertical_Rows("Rows", Float) = 5
		[Enum(Standard,0,Stochastic,1)]_Vertical_ModeUV("Mode UV", Int) = 1
		_Vertical_TilingX("Tiling X", Float) = 9
		_Vertical_TilingY("Tiling Y", Float) = 9
		[Enum(Off,0,Active,1)][Header (RAIN STATIC)]_Static_RainMode("Rain Mode", Int) = 0
		[Normal][SingleLineTexture]_Static_RainMap("Rain Map Static", 2D) = "bump" {}
		_Static_Intensity("Intensity", Range( 0 , 10)) = 9
		_Static_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.001
		[Enum(Standard,0,Stochastic,1)]_Static_ModeUV("Mode UV", Int) = 0
		_Static_TilingX("Tiling X", Float) = 1
		_Static_TilingY("Tiling Y", Float) = 1
		_Static_OffsetX("Offset X", Float) = 0
		[ASEEnd]_Static_OffsetY("Offset Y", Float) = 0

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
		AlphaToMask [_AlphatoCoverage]
		HLSLINCLUDE
		#pragma target 4.5

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
			
			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite [_ZWriteMode]
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
			#define ASE_NEEDS_FRAG_COLOR
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
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half4 _SpecularColor;
			float4 _FoamShoreline_Tint;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FOAMHORIZONTAL_Tint;
			float _Vertical_SmoothEdge;
			float _Vertical_Speed;
			float _Vertical_Rows;
			float _Vertical_Columns;
			float _Vertical_ScreenContribution;
			float _Vertical_TilingY;
			float _Vertical_TilingX;
			int _Vertical_ModeUV;
			int _ZWriteMode;
			float _SMOOTHNESS_Strength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			int _Vertical_RainMode;
			float _Rain_WetnessDarken;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _URP_SpecularStrength;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_FresnelPower;
			float _FoamShoreline_FlowStrength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _Horizontal_Speed;
			float _Horizontal_Rows;
			float _Horizontal_Columns;
			float _Horizontal_ScreenContribution;
			float _Horizontal_OffsetY;
			float _Horizontal_OffsetX;
			float _Horizontal_TilingY;
			float _Horizontal_TilingX;
			int _Horizontal_ModeUV;
			int _Horizontal_RainMode;
			float _Static_Intensity;
			float _Static_ScreenContribution;
			float _Static_OffsetY;
			float _Static_OffsetX;
			float _Static_TilingY;
			float _Static_TilingX;
			int _Static_ModeUV;
			int _Static_RainMode;
			float _SMOOTHNESS_FresnelScale;
			float _TilingY_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_Timescale;
			int _WaterNormal_Vertical_FlowType;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			float _WaterNormal_Vertical_TilingY;
			float _TilingX_Shoreline;
			float _WaterNormal_Vertical_NormalStrength;
			float _RefractionScale;
			float _FoamShoreline_Timescale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FOAMHORIZONTAL_TilingY;
			float _FOAMHORIZONTAL_TilingX;
			float _FOAMHORIZONTAL_Speed;
			float _FOAMHORIZONTAL_Timescale;
			int _FOAMHORIZONTAL_ModeFlowType;
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
			float _WaterNormal_Vertical_FlowStrength;
			int _Rain_GlobalWetnessMode;
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
			TEXTURE2D(_Vertical_RainMap);
			int _Global_Rain_Enabled;
			half _Global_Rain_Intensity;
			TEXTURE2D(_Static_RainMap);
			TEXTURE2D(_Horizontal_RainMap);
			int _Global_Wetness_Enabled;
			half _Global_Wetness_Intensity;


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
			
			float3 float3switch238_g38135( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float3 float3switch456_g38116( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float4 float4switch278_g38104( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
			
			float4 float4switch278_g38156( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
			
			float4 float4switch278_g38145( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
			
			real3 ASESafeNormalize(float3 inVec)
			{
				real dp3 = max(FLT_MIN, dot(inVec, inVec));
				return inVec* rsqrt( dp3);
			}
			
			float3 float3switch1246_g38104( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float3 float3switch1230_g38156( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float3 float3switch1223_g38145( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float floatswitch1190_g39462( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			void StochasticTiling( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				float2 vertex1, vertex2, vertex3;
				// Scaling of the input
				float2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				float2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				float3 temp = float3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			float3 float3switch914_g39462( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1186_g39462( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			float3 float3switch992_g39462( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1179_g39462( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			float3 float3switch1505_g39462( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch31_g38128( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
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
			
			float3 float3switch11_g38128( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
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
			
			float3 float3switch18_g38128( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
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
			
			float4 float4switch12_g39467( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch23_g39467( int m_switch, float4 m_Off, float4 m_Active )
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

				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord7.z = eyeDepth;
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_texcoord8 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord9 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.w = 0;
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
						 ) : SV_Target
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

				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g3661 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g3661 = abs( ( screenDepth2_g3661 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g3661 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g3661*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g3661 = lerp( _DepthTint , lerpResult25_g3661 , saturate( (distanceDepth2_g3661*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g3661 = lerpResult27_g3661;
				int m_switch238_g38135 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g38135 = float3(0,0,0.001);
				float mulTime155_g38135 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g38135 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g38135 = ( FlowSpeed365_g38135 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g38135).xx;
				float2 appendResult235_g38135 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g38135 = IN.ase_texcoord7.xy * ( appendResult235_g38135 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g38135 = cos( _G_FlowSwirling.x );
				float sin62_g38135 = sin( _G_FlowSwirling.x );
				float2 rotator62_g38135 = mul( texCoord23_g38135 - float2( 0,0 ) , float2x2( cos62_g38135 , -sin62_g38135 , sin62_g38135 , cos62_g38135 )) + float2( 0,0 );
				float2 panner15_g38135 = ( mulTime155_g38135 * temp_cast_0 + rotator62_g38135);
				float2 temp_cast_1 = (temp_output_367_0_g38135).xx;
				float cos8_g38135 = cos( _G_FlowSwirling.y );
				float sin8_g38135 = sin( _G_FlowSwirling.y );
				float2 rotator8_g38135 = mul( texCoord23_g38135 - float2( 0,0 ) , float2x2( cos8_g38135 , -sin8_g38135 , sin8_g38135 , cos8_g38135 )) + float2( 0,0 );
				float2 panner16_g38135 = ( mulTime155_g38135 * temp_cast_1 + rotator8_g38135);
				float2 temp_cast_2 = (temp_output_367_0_g38135).xx;
				float2 panner17_g38135 = ( mulTime155_g38135 * temp_cast_2 + texCoord23_g38135);
				float2 layeredBlendVar666_g38135 = IN.ase_texcoord7.xy;
				float4 layeredBlend666_g38135 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g38135 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g38135 ) , layeredBlendVar666_g38135.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g38135 ) , layeredBlendVar666_g38135.y ) );
				float4 temp_output_1_0_g38136 = layeredBlend666_g38135;
				float temp_output_8_0_g38136 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g38136 = UnpackNormalScale( temp_output_1_0_g38136, temp_output_8_0_g38136 );
				unpack52_g38136.z = lerp( 1, unpack52_g38136.z, saturate(temp_output_8_0_g38136) );
				float3 temp_output_699_59_g38135 = unpack52_g38136;
				float3 temp_output_372_0_g38135 = abs( WorldNormal );
				float3 break386_g38135 = ( temp_output_372_0_g38135 * temp_output_372_0_g38135 );
				float _MASK_VERTICAL_Z381_g38135 = ( break386_g38135.z + 0.01 );
				float3 lerpResult677_g38135 = lerp( float3( 0,0,0 ) , temp_output_699_59_g38135 , _MASK_VERTICAL_Z381_g38135);
				float _MASK_VERTICAL_X373_g38135 = ( -break386_g38135.x + 0.2 );
				float3 lerpResult681_g38135 = lerp( float3( 0,0,0 ) , temp_output_699_59_g38135 , _MASK_VERTICAL_X373_g38135);
				float _MASK_VERTICAL_Y_NEG413_g38135 = ( ( WorldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g38135 = lerp( float3( 0,0,0 ) , ( lerpResult677_g38135 + lerpResult681_g38135 ) , _MASK_VERTICAL_Y_NEG413_g38135);
				float3 m_Swirling238_g38135 = lerpResult679_g38135;
				float2 texCoord196_g38140 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38140 = IN.ase_texcoord8;
				float2 blendOpSrc197_g38140 = texCoord196_g38140;
				float2 blendOpDest197_g38140 = (_FLOWMAP_Map89_g38140).xy;
				float2 temp_output_197_0_g38140 = ( saturate( (( blendOpDest197_g38140 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38140 ) * ( 1.0 - blendOpSrc197_g38140 ) ) : ( 2.0 * blendOpDest197_g38140 * blendOpSrc197_g38140 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38140 = FlowSpeed365_g38135;
				float temp_output_182_0_g38140 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38140 );
				float temp_output_194_0_g38140 = (0.0 + (( ( temp_output_182_0_g38140 - floor( ( temp_output_182_0_g38140 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g38140 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g38140 = ( -temp_output_194_0_g38140 * _FLOWMAP_FlowStrength146_g38140 );
				float2 lerpResult198_g38140 = lerp( temp_output_197_0_g38140 , texCoord196_g38140 , _TIME_UV_A199_g38140);
				float2 INPUT_MAP_TILLING128_g38135 = appendResult235_g38135;
				float2 texCoord205_g38140 = IN.ase_texcoord7.xy * INPUT_MAP_TILLING128_g38135 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38140 = texCoord205_g38140;
				float2 FLOW_A201_g38140 = ( lerpResult198_g38140 + TEXTURE_TILLING211_g38140 );
				float temp_output_225_0_g38140 = (temp_output_182_0_g38140*1.0 + 0.5);
				float _TIME_UV_B214_g38140 = ( -(0.0 + (( ( temp_output_225_0_g38140 - floor( ( temp_output_225_0_g38140 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38140 );
				float2 lerpResult229_g38140 = lerp( temp_output_197_0_g38140 , texCoord196_g38140 , _TIME_UV_B214_g38140);
				float2 FLOW_B232_g38140 = ( lerpResult229_g38140 + TEXTURE_TILLING211_g38140 );
				float TIME_BLEND235_g38140 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38140 / 0.5 ) ) ) );
				float4 lerpResult317_g38135 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g38140 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g38140 ) , TIME_BLEND235_g38140);
				float4 temp_output_1_0_g38142 = lerpResult317_g38135;
				float NormalStrength152_g38135 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g38142 = NormalStrength152_g38135;
				float3 unpack52_g38142 = UnpackNormalScale( temp_output_1_0_g38142, temp_output_8_0_g38142 );
				unpack52_g38142.z = lerp( 1, unpack52_g38142.z, saturate(temp_output_8_0_g38142) );
				float3 temp_output_701_59_g38135 = unpack52_g38142;
				float3 lerpResult692_g38135 = lerp( float3( 0,0,0 ) , temp_output_701_59_g38135 , _MASK_VERTICAL_Z381_g38135);
				float3 lerpResult691_g38135 = lerp( float3( 0,0,0 ) , temp_output_701_59_g38135 , _MASK_VERTICAL_X373_g38135);
				float3 lerpResult697_g38135 = lerp( float3( 0,0,0 ) , ( lerpResult692_g38135 + lerpResult691_g38135 ) , _MASK_VERTICAL_Y_NEG413_g38135);
				float3 m_FlowMap238_g38135 = lerpResult697_g38135;
				float3 localfloat3switch238_g38135 = float3switch238_g38135( m_switch238_g38135 , m_Off238_g38135 , m_Swirling238_g38135 , m_FlowMap238_g38135 );
				int m_switch456_g38116 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g38116 = float3(0,0,0.001);
				float mulTime155_g38116 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g38116 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g38116 = ( FlowSpeed365_g38116 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g38116).xx;
				float2 appendResult235_g38116 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g38116 = IN.ase_texcoord7.xy * ( appendResult235_g38116 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g38116 = cos( _G_FlowSwirling.x );
				float sin62_g38116 = sin( _G_FlowSwirling.x );
				float2 rotator62_g38116 = mul( texCoord23_g38116 - float2( 0,0 ) , float2x2( cos62_g38116 , -sin62_g38116 , sin62_g38116 , cos62_g38116 )) + float2( 0,0 );
				float2 panner15_g38116 = ( mulTime155_g38116 * temp_cast_5 + rotator62_g38116);
				float2 temp_cast_6 = (temp_output_367_0_g38116).xx;
				float cos8_g38116 = cos( _G_FlowSwirling.y );
				float sin8_g38116 = sin( _G_FlowSwirling.y );
				float2 rotator8_g38116 = mul( texCoord23_g38116 - float2( 0,0 ) , float2x2( cos8_g38116 , -sin8_g38116 , sin8_g38116 , cos8_g38116 )) + float2( 0,0 );
				float2 panner16_g38116 = ( mulTime155_g38116 * temp_cast_6 + rotator8_g38116);
				float2 temp_cast_7 = (temp_output_367_0_g38116).xx;
				float2 panner17_g38116 = ( mulTime155_g38116 * temp_cast_7 + texCoord23_g38116);
				float2 layeredBlendVar448_g38116 = IN.ase_texcoord7.xy;
				float4 layeredBlend448_g38116 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g38116 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g38116 ) , layeredBlendVar448_g38116.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g38116 ) , layeredBlendVar448_g38116.y ) );
				float4 temp_output_1_0_g38120 = layeredBlend448_g38116;
				float temp_output_8_0_g38120 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g38120 = UnpackNormalScale( temp_output_1_0_g38120, temp_output_8_0_g38120 );
				unpack52_g38120.z = lerp( 1, unpack52_g38120.z, saturate(temp_output_8_0_g38120) );
				float3 temp_output_481_59_g38116 = unpack52_g38120;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g38116 = ( abs( WorldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g38116 = ( break386_g38116.z + 0.75 );
				float3 lerpResult465_g38116 = lerp( float3( 0,0,0 ) , temp_output_481_59_g38116 , _MASK_VERTICAL_Z381_g38116);
				float _MASK_VERTICAL_X373_g38116 = ( break386_g38116.x + 0.45 );
				float3 lerpResult457_g38116 = lerp( float3( 0,0,0 ) , temp_output_481_59_g38116 , _MASK_VERTICAL_X373_g38116);
				float _MASK_VERTICAL_Y383_g38116 = ( -break386_g38116.y + 5.0 );
				float3 lerpResult454_g38116 = lerp( lerpResult465_g38116 , ( lerpResult465_g38116 + lerpResult457_g38116 ) , _MASK_VERTICAL_Y383_g38116);
				float _MASK_VERTICAL_Y_NEG413_g38116 = ( ( WorldNormal.y + WorldNormal.y ) - 1.0 );
				float3 lerpResult477_g38116 = lerp( float3( 0,0,0 ) , lerpResult454_g38116 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g38116 ));
				float3 m_Swirling456_g38116 = lerpResult477_g38116;
				float2 texCoord196_g38118 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38118 = IN.ase_texcoord8;
				float2 blendOpSrc197_g38118 = texCoord196_g38118;
				float2 blendOpDest197_g38118 = (_FLOWMAP_Map89_g38118).xy;
				float2 temp_output_197_0_g38118 = ( saturate( (( blendOpDest197_g38118 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38118 ) * ( 1.0 - blendOpSrc197_g38118 ) ) : ( 2.0 * blendOpDest197_g38118 * blendOpSrc197_g38118 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38118 = FlowSpeed365_g38116;
				float temp_output_182_0_g38118 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38118 );
				float temp_output_194_0_g38118 = (0.0 + (( ( temp_output_182_0_g38118 - floor( ( temp_output_182_0_g38118 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g38118 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g38118 = ( -temp_output_194_0_g38118 * _FLOWMAP_FlowStrength146_g38118 );
				float2 lerpResult198_g38118 = lerp( temp_output_197_0_g38118 , texCoord196_g38118 , _TIME_UV_A199_g38118);
				float2 INPUT_MAP_TILLING128_g38116 = appendResult235_g38116;
				float2 texCoord205_g38118 = IN.ase_texcoord7.xy * INPUT_MAP_TILLING128_g38116 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38118 = texCoord205_g38118;
				float2 FLOW_A201_g38118 = ( lerpResult198_g38118 + TEXTURE_TILLING211_g38118 );
				float temp_output_225_0_g38118 = (temp_output_182_0_g38118*1.0 + 0.5);
				float _TIME_UV_B214_g38118 = ( -(0.0 + (( ( temp_output_225_0_g38118 - floor( ( temp_output_225_0_g38118 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38118 );
				float2 lerpResult229_g38118 = lerp( temp_output_197_0_g38118 , texCoord196_g38118 , _TIME_UV_B214_g38118);
				float2 FLOW_B232_g38118 = ( lerpResult229_g38118 + TEXTURE_TILLING211_g38118 );
				float TIME_BLEND235_g38118 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38118 / 0.5 ) ) ) );
				float4 lerpResult317_g38116 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g38118 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g38118 ) , TIME_BLEND235_g38118);
				float4 temp_output_1_0_g38124 = lerpResult317_g38116;
				float NormalStrength152_g38116 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g38124 = NormalStrength152_g38116;
				float3 unpack52_g38124 = UnpackNormalScale( temp_output_1_0_g38124, temp_output_8_0_g38124 );
				unpack52_g38124.z = lerp( 1, unpack52_g38124.z, saturate(temp_output_8_0_g38124) );
				float3 temp_output_483_59_g38116 = unpack52_g38124;
				float3 lerpResult466_g38116 = lerp( float3( 0,0,0 ) , temp_output_483_59_g38116 , _MASK_VERTICAL_Z381_g38116);
				float3 lerpResult453_g38116 = lerp( float3( 0,0,0 ) , temp_output_483_59_g38116 , _MASK_VERTICAL_X373_g38116);
				float3 lerpResult460_g38116 = lerp( lerpResult466_g38116 , ( lerpResult466_g38116 + lerpResult453_g38116 ) , _MASK_VERTICAL_Y383_g38116);
				float3 lerpResult411_g38116 = lerp( float3( 0,0,0 ) , lerpResult460_g38116 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g38116 ));
				float3 m_FlowMap456_g38116 = lerpResult411_g38116;
				float3 localfloat3switch456_g38116 = float3switch456_g38116( m_switch456_g38116 , m_Off456_g38116 , m_Swirling456_g38116 , m_FlowMap456_g38116 );
				float2 weightedBlendVar1711_g3661 = IN.ase_texcoord7.xy;
				float3 weightedBlend1711_g3661 = ( weightedBlendVar1711_g3661.x*localfloat3switch238_g38135 + weightedBlendVar1711_g3661.y*localfloat3switch456_g38116 );
				float3 NORMAL_IN84_g38163 = ( weightedBlend1711_g3661 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g38163 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord7.z;
				float eyeDepth7_g38163 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g38163 = ( (NORMAL_IN84_g38163).xy * ( REFACTED_SCALE_FLOAT78_g38163 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g38163 - eyeDepth ) ) );
				float eyeDepth27_g38163 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g38163, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g38163 = (( float4( ( temp_output_21_0_g38163 * saturate( ( eyeDepth27_g38163 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g38163 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g38163 ), 1.0 );
				float4 REFRACTED_DEPTH144_g3661 = fetchOpaqueVal89_g38163;
				float temp_output_20_0_g3661 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g3661 = 0.0;
				#else
				float staticSwitch37_g3661 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g3661*-5.0 + 1.0) ) ) ) * temp_output_20_0_g3661 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g3661 = staticSwitch37_g3661;
				float4 lerpResult105_g3661 = lerp( COLOR_TINT161_g3661 , REFRACTED_DEPTH144_g3661 , DEPTH_TINT_ALPHA93_g3661);
				float4 _MASK_VECTOR1199_g38104 = float4(0.001,0.001,0.001,0);
				int m_switch278_g38104 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g38104 = float4( 0,0,0,0 );
				float mulTime806_g38104 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g38104 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g38104 = ( FlowSpeed1146_g38104 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g38104).xx;
				float2 appendResult219_g38104 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g38104 = ( appendResult219_g38104 * float2( 2,2 ) );
				float2 texCoord487_g38104 = IN.ase_texcoord7.xy * temp_output_1294_0_g38104 + float2( 0,0 );
				float cos485_g38104 = cos( _G_FlowSwirling.x );
				float sin485_g38104 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38104 = mul( texCoord487_g38104 - float2( 0,0 ) , float2x2( cos485_g38104 , -sin485_g38104 , sin485_g38104 , cos485_g38104 )) + float2( 0,0 );
				float2 panner483_g38104 = ( mulTime806_g38104 * temp_cast_14 + rotator485_g38104);
				float2 temp_cast_15 = (temp_output_1150_0_g38104).xx;
				float cos481_g38104 = cos( _G_FlowSwirling.y );
				float sin481_g38104 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38104 = mul( texCoord487_g38104 - float2( 0,0 ) , float2x2( cos481_g38104 , -sin481_g38104 , sin481_g38104 , cos481_g38104 )) + float2( 0,0 );
				float2 panner480_g38104 = ( mulTime806_g38104 * temp_cast_15 + rotator481_g38104);
				float2 temp_cast_16 = (temp_output_1150_0_g38104).xx;
				float2 panner478_g38104 = ( mulTime806_g38104 * temp_cast_16 + texCoord487_g38104);
				float4 OUT_SWIRLING298_g38104 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner483_g38104 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner480_g38104 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner478_g38104 ) ) );
				float4 m_Swirling278_g38104 = OUT_SWIRLING298_g38104;
				float2 texCoord196_g38109 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38109 = IN.ase_texcoord8;
				float2 blendOpSrc197_g38109 = texCoord196_g38109;
				float2 blendOpDest197_g38109 = (_FLOWMAP_Map89_g38109).xy;
				float2 temp_output_197_0_g38109 = ( saturate( (( blendOpDest197_g38109 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38109 ) * ( 1.0 - blendOpSrc197_g38109 ) ) : ( 2.0 * blendOpDest197_g38109 * blendOpSrc197_g38109 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38109 = FlowSpeed1146_g38104;
				float temp_output_182_0_g38109 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38109 );
				float temp_output_194_0_g38109 = (0.0 + (( ( temp_output_182_0_g38109 - floor( ( temp_output_182_0_g38109 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g38104 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38109 = FlowStrength1147_g38104;
				float _TIME_UV_A199_g38109 = ( -temp_output_194_0_g38109 * _FLOWMAP_FlowStrength146_g38109 );
				float2 lerpResult198_g38109 = lerp( temp_output_197_0_g38109 , texCoord196_g38109 , _TIME_UV_A199_g38109);
				float2 INPUT_MAP_TILLING128_g38104 = temp_output_1294_0_g38104;
				float2 texCoord205_g38109 = IN.ase_texcoord7.xy * INPUT_MAP_TILLING128_g38104 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38109 = texCoord205_g38109;
				float2 FLOW_A201_g38109 = ( lerpResult198_g38109 + TEXTURE_TILLING211_g38109 );
				float temp_output_225_0_g38109 = (temp_output_182_0_g38109*1.0 + 0.5);
				float _TIME_UV_B214_g38109 = ( -(0.0 + (( ( temp_output_225_0_g38109 - floor( ( temp_output_225_0_g38109 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38109 );
				float2 lerpResult229_g38109 = lerp( temp_output_197_0_g38109 , texCoord196_g38109 , _TIME_UV_B214_g38109);
				float2 FLOW_B232_g38109 = ( lerpResult229_g38109 + TEXTURE_TILLING211_g38109 );
				float TIME_BLEND235_g38109 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38109 / 0.5 ) ) ) );
				float4 lerpResult1117_g38104 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38109 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38109 ) , TIME_BLEND235_g38109);
				float4 OUT_FLOW_FLOWMAP1119_g38104 = lerpResult1117_g38104;
				float4 m_FlowMap278_g38104 = OUT_FLOW_FLOWMAP1119_g38104;
				float4 localfloat4switch278_g38104 = float4switch278_g38104( m_switch278_g38104 , m_Off278_g38104 , m_Swirling278_g38104 , m_FlowMap278_g38104 );
				float clampDepth2_g38130 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g38130 = clampDepth2_g38130;
				float4 localCalculateObliqueFrustumCorrection3_g38154 = CalculateObliqueFrustumCorrection();
				float dotResult4_g38154 = dot( float4( IN.ase_texcoord9.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g38154 );
				float correctionFactor1_g38130 = dotResult4_g38154;
				float localCorrectedLinearEyeDepth1_g38130 = CorrectedLinearEyeDepth( z1_g38130 , correctionFactor1_g38130 );
				float eyeDepth18_g38130 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g38130 = ( eyeDepth18_g38130 - ScreenPos.w );
				float temp_output_13_0_g38130 = ( localCorrectedLinearEyeDepth1_g38130 - abs( temp_output_17_0_g38130 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g3661 = saturate( temp_output_13_0_g38130 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38104 = temp_cast_20;
				float3 unityObjectToViewPos262_g38104 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float GRAB_SCREEN_DEPTH73_g3661 = localCorrectedLinearEyeDepth1_g38130;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38104 = temp_cast_21;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g3661 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38104 = temp_cast_23;
				float4 lerpResult281_g38104 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g38104 * _FOAMVERTICAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38104 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g38104.z + GRAB_SCREEN_DEPTH310_g38104 ) - temp_cast_22 ) * GRAB_SCREEN_CLOSENESS312_g38104 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g38104 ) ) ));
				float4 lerpResult265_g38104 = lerp( float4( 0,0,0,0 ) , lerpResult281_g38104 , FlowStrength1147_g38104);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g38104 = ( abs( WorldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g38104 = ( break1161_g38104.z + 0.45 );
				float4 lerpResult1173_g38104 = lerp( _MASK_VECTOR1199_g38104 , lerpResult265_g38104 , _MASK_VERTICAL_Z1162_g38104);
				float _MASK_VERTICAL_X1170_g38104 = ( break1161_g38104.x + 0.46 );
				float4 lerpResult1176_g38104 = lerp( _MASK_VECTOR1199_g38104 , lerpResult265_g38104 , _MASK_VERTICAL_X1170_g38104);
				float _MASK_VERTICAL_Y1163_g38104 = ( -break1161_g38104.y + 6.5 );
				float4 lerpResult1179_g38104 = lerp( lerpResult1173_g38104 , ( lerpResult1173_g38104 + lerpResult1176_g38104 ) , _MASK_VERTICAL_Y1163_g38104);
				float4 temp_output_1189_0_g38104 = saturate( lerpResult1179_g38104 );
				float4 FOAM_VERTICAL_OFFSHORE655_g3661 = temp_output_1189_0_g38104;
				float4 _MASK_VECTOR1200_g38156 = float4(0.001,0.001,0.001,0);
				int m_switch278_g38156 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g38156 = float4( 0,0,0,0 );
				float mulTime806_g38156 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g38156 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g38156 = ( Speed1146_g38156 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g38156).xx;
				float2 appendResult219_g38156 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g38156 = ( appendResult219_g38156 * float2( 2,2 ) );
				float2 texCoord487_g38156 = IN.ase_texcoord7.xy * temp_output_1214_0_g38156 + float2( 0,0 );
				float cos485_g38156 = cos( _G_FlowSwirling.x );
				float sin485_g38156 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38156 = mul( texCoord487_g38156 - float2( 0,0 ) , float2x2( cos485_g38156 , -sin485_g38156 , sin485_g38156 , cos485_g38156 )) + float2( 0,0 );
				float2 panner483_g38156 = ( mulTime806_g38156 * temp_cast_27 + rotator485_g38156);
				float2 temp_cast_28 = (temp_output_1150_0_g38156).xx;
				float cos481_g38156 = cos( _G_FlowSwirling.y );
				float sin481_g38156 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38156 = mul( texCoord487_g38156 - float2( 0,0 ) , float2x2( cos481_g38156 , -sin481_g38156 , sin481_g38156 , cos481_g38156 )) + float2( 0,0 );
				float2 panner480_g38156 = ( mulTime806_g38156 * temp_cast_28 + rotator481_g38156);
				float2 temp_cast_29 = (temp_output_1150_0_g38156).xx;
				float2 panner478_g38156 = ( mulTime806_g38156 * temp_cast_29 + texCoord487_g38156);
				float4 OUT_SWIRLING298_g38156 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner483_g38156 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner480_g38156 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner478_g38156 ) ) );
				float4 m_Swirling278_g38156 = OUT_SWIRLING298_g38156;
				float2 texCoord196_g38161 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38161 = IN.ase_texcoord8;
				float2 blendOpSrc197_g38161 = texCoord196_g38161;
				float2 blendOpDest197_g38161 = (_FLOWMAP_Map89_g38161).xy;
				float2 temp_output_197_0_g38161 = ( saturate( (( blendOpDest197_g38161 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38161 ) * ( 1.0 - blendOpSrc197_g38161 ) ) : ( 2.0 * blendOpDest197_g38161 * blendOpSrc197_g38161 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38161 = Speed1146_g38156;
				float temp_output_182_0_g38161 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38161 );
				float temp_output_194_0_g38161 = (0.0 + (( ( temp_output_182_0_g38161 - floor( ( temp_output_182_0_g38161 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g38156 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38161 = FlowStrength1147_g38156;
				float _TIME_UV_A199_g38161 = ( -temp_output_194_0_g38161 * _FLOWMAP_FlowStrength146_g38161 );
				float2 lerpResult198_g38161 = lerp( temp_output_197_0_g38161 , texCoord196_g38161 , _TIME_UV_A199_g38161);
				float2 INPUT_MAP_TILLING128_g38156 = temp_output_1214_0_g38156;
				float2 texCoord205_g38161 = IN.ase_texcoord7.xy * INPUT_MAP_TILLING128_g38156 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38161 = texCoord205_g38161;
				float2 FLOW_A201_g38161 = ( lerpResult198_g38161 + TEXTURE_TILLING211_g38161 );
				float temp_output_225_0_g38161 = (temp_output_182_0_g38161*1.0 + 0.5);
				float _TIME_UV_B214_g38161 = ( -(0.0 + (( ( temp_output_225_0_g38161 - floor( ( temp_output_225_0_g38161 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38161 );
				float2 lerpResult229_g38161 = lerp( temp_output_197_0_g38161 , texCoord196_g38161 , _TIME_UV_B214_g38161);
				float2 FLOW_B232_g38161 = ( lerpResult229_g38161 + TEXTURE_TILLING211_g38161 );
				float TIME_BLEND235_g38161 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38161 / 0.5 ) ) ) );
				float4 lerpResult1117_g38156 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38161 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38161 ) , TIME_BLEND235_g38161);
				float4 OUT_FLOW_FLOWMAP1119_g38156 = lerpResult1117_g38156;
				float4 m_FlowMap278_g38156 = OUT_FLOW_FLOWMAP1119_g38156;
				float4 localfloat4switch278_g38156 = float4switch278_g38156( m_switch278_g38156 , m_Off278_g38156 , m_Swirling278_g38156 , m_FlowMap278_g38156 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38156 = temp_cast_32;
				float3 unityObjectToViewPos262_g38156 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38156 = temp_cast_33;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38156 = temp_cast_35;
				float4 lerpResult281_g38156 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g38156 * _FOAMHORIZONTAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38156 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g38156.z + GRAB_SCREEN_DEPTH310_g38156 ) - temp_cast_34 ) * GRAB_SCREEN_CLOSENESS312_g38156 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g38156 ) ) ));
				float4 lerpResult265_g38156 = lerp( float4( 0,0,0,0 ) , lerpResult281_g38156 , FlowStrength1147_g38156);
				float _MASK_HORIZONTAL1160_g38156 = ( ( WorldNormal.y + WorldNormal.y ) - 1.7 );
				float4 lerpResult1185_g38156 = lerp( _MASK_VECTOR1200_g38156 , lerpResult265_g38156 , _MASK_HORIZONTAL1160_g38156);
				float4 temp_output_1188_0_g38156 = saturate( lerpResult1185_g38156 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g3661 = temp_output_1188_0_g38156;
				int m_switch278_g38145 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g38145 = float4( 0,0,0,0 );
				float mulTime806_g38145 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g38145 = _FoamShoreline_Speed;
				float temp_output_1185_0_g38145 = ( FlowSpeed1179_g38145 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g38145).xx;
				float2 appendResult219_g38145 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g38145 = ( appendResult219_g38145 * float2( 2,2 ) );
				float2 texCoord487_g38145 = IN.ase_texcoord7.xy * temp_output_1196_0_g38145 + float2( 0,0 );
				float cos485_g38145 = cos( _G_FlowSwirling.x );
				float sin485_g38145 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38145 = mul( texCoord487_g38145 - float2( 0,0 ) , float2x2( cos485_g38145 , -sin485_g38145 , sin485_g38145 , cos485_g38145 )) + float2( 0,0 );
				float2 panner483_g38145 = ( mulTime806_g38145 * temp_cast_38 + rotator485_g38145);
				float2 temp_cast_39 = (temp_output_1185_0_g38145).xx;
				float cos481_g38145 = cos( _G_FlowSwirling.y );
				float sin481_g38145 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38145 = mul( texCoord487_g38145 - float2( 0,0 ) , float2x2( cos481_g38145 , -sin481_g38145 , sin481_g38145 , cos481_g38145 )) + float2( 0,0 );
				float2 panner480_g38145 = ( mulTime806_g38145 * temp_cast_39 + rotator481_g38145);
				float2 temp_cast_40 = (temp_output_1185_0_g38145).xx;
				float2 panner478_g38145 = ( mulTime806_g38145 * temp_cast_40 + texCoord487_g38145);
				float4 OUT_SWIRLING298_g38145 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner483_g38145 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner480_g38145 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner478_g38145 ) ) );
				float4 m_Swirling278_g38145 = OUT_SWIRLING298_g38145;
				float2 texCoord196_g38150 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38150 = IN.ase_texcoord8;
				float2 blendOpSrc197_g38150 = texCoord196_g38150;
				float2 blendOpDest197_g38150 = (_FLOWMAP_Map89_g38150).xy;
				float2 temp_output_197_0_g38150 = ( saturate( (( blendOpDest197_g38150 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38150 ) * ( 1.0 - blendOpSrc197_g38150 ) ) : ( 2.0 * blendOpDest197_g38150 * blendOpSrc197_g38150 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38150 = FlowSpeed1179_g38145;
				float temp_output_182_0_g38150 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38150 );
				float temp_output_194_0_g38150 = (0.0 + (( ( temp_output_182_0_g38150 - floor( ( temp_output_182_0_g38150 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1182_g38145 = _FoamShoreline_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38150 = FlowStrength1182_g38145;
				float _TIME_UV_A199_g38150 = ( -temp_output_194_0_g38150 * _FLOWMAP_FlowStrength146_g38150 );
				float2 lerpResult198_g38150 = lerp( temp_output_197_0_g38150 , texCoord196_g38150 , _TIME_UV_A199_g38150);
				float2 INPUT_MAP_TILLING128_g38145 = temp_output_1196_0_g38145;
				float2 texCoord205_g38150 = IN.ase_texcoord7.xy * INPUT_MAP_TILLING128_g38145 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38150 = texCoord205_g38150;
				float2 FLOW_A201_g38150 = ( lerpResult198_g38150 + TEXTURE_TILLING211_g38150 );
				float temp_output_225_0_g38150 = (temp_output_182_0_g38150*1.0 + 0.5);
				float _TIME_UV_B214_g38150 = ( -(0.0 + (( ( temp_output_225_0_g38150 - floor( ( temp_output_225_0_g38150 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38150 );
				float2 lerpResult229_g38150 = lerp( temp_output_197_0_g38150 , texCoord196_g38150 , _TIME_UV_B214_g38150);
				float2 FLOW_B232_g38150 = ( lerpResult229_g38150 + TEXTURE_TILLING211_g38150 );
				float TIME_BLEND235_g38150 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38150 / 0.5 ) ) ) );
				float4 lerpResult1153_g38145 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38150 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38150 ) , TIME_BLEND235_g38150);
				float4 OUT_FLOW_FLOWMAP1156_g38145 = lerpResult1153_g38145;
				float4 m_FlowMap278_g38145 = OUT_FLOW_FLOWMAP1156_g38145;
				float4 localfloat4switch278_g38145 = float4switch278_g38145( m_switch278_g38145 , m_Off278_g38145 , m_Swirling278_g38145 , m_FlowMap278_g38145 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38145 = temp_cast_43;
				float3 unityObjectToViewPos731_g38145 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38145 = temp_cast_44;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38145 = temp_cast_46;
				float4 lerpResult769_g38145 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g38145 * _FoamShoreline_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38145 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g38145.z + GRAB_SCREEN_DEPTH310_g38145 ) - temp_cast_45 ) * GRAB_SCREEN_CLOSENESS312_g38145 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * GRAB_SCREEN_CLOSENESS312_g38145 ) ) ));
				float4 lerpResult761_g38145 = lerp( float4( 0,0,0,0 ) , lerpResult769_g38145 , FlowStrength1182_g38145);
				float4 FOAM_SHORELINE654_g3661 = lerpResult761_g38145;
				float4 temp_output_1492_0_g3661 = ( ( ( lerpResult105_g3661 + FOAM_VERTICAL_OFFSHORE655_g3661 ) + FOAM_HORIZONTAL_OFFSHORE1565_g3661 ) + FOAM_SHORELINE654_g3661 );
				float4 temp_output_746_0_g39462 = temp_output_1492_0_g3661;
				
				int m_switch103_g39462 = _Vertical_RainMode;
				int ModeFlowType1245_g38104 = _FOAMVERTICAL_ModeFlowType;
				int m_switch1246_g38104 = ModeFlowType1245_g38104;
				float3 m_Off1246_g38104 = float3( 0,0,1 );
				float3 temp_output_21_0_g38108 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g38108 = cross( WorldNormal , ddy( temp_output_21_0_g38108 ) );
				float3 temp_output_6_0_g38108 = ddx( temp_output_21_0_g38108 );
				float dotResult27_g38108 = dot( temp_output_15_0_g38108 , temp_output_6_0_g38108 );
				float temp_output_14_0_g38108 = abs( dotResult27_g38108 );
				float4 temp_output_8_0_g38108 = ( _FOAMVERTICAL_NormalStrength * temp_output_1189_0_g38104 );
				float4 break18_g38108 = ( sign( temp_output_14_0_g38108 ) * ( ( ddx( temp_output_8_0_g38108 ) * float4( temp_output_15_0_g38108 , 0.0 ) ) + ( ddy( temp_output_8_0_g38108 ) * float4( cross( WorldNormal , temp_output_6_0_g38108 ) , 0.0 ) ) ) );
				float3 appendResult7_g38108 = (float3(break18_g38108.x , -break18_g38108.y , break18_g38108.z));
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 worldToTangentDir5_g38108 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g38108 * WorldNormal ) - appendResult7_g38108 )) );
				float3 temp_output_1249_32_g38104 = worldToTangentDir5_g38108;
				float3 m_Swirling1246_g38104 = temp_output_1249_32_g38104;
				float3 m_FlowMap1246_g38104 = temp_output_1249_32_g38104;
				float3 localfloat3switch1246_g38104 = float3switch1246_g38104( m_switch1246_g38104 , m_Off1246_g38104 , m_Swirling1246_g38104 , m_FlowMap1246_g38104 );
				float3 FOAM_VERTICAL_OFFSHORE_NORMAL1192_g3661 = localfloat3switch1246_g38104;
				int ModeFlowType1232_g38156 = _FOAMHORIZONTAL_ModeFlowType;
				int m_switch1230_g38156 = ModeFlowType1232_g38156;
				float3 m_Off1230_g38156 = float3( 0,0,1 );
				float3 temp_output_21_0_g38160 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g38160 = cross( WorldNormal , ddy( temp_output_21_0_g38160 ) );
				float3 temp_output_6_0_g38160 = ddx( temp_output_21_0_g38160 );
				float dotResult27_g38160 = dot( temp_output_15_0_g38160 , temp_output_6_0_g38160 );
				float temp_output_14_0_g38160 = abs( dotResult27_g38160 );
				float4 temp_output_8_0_g38160 = ( _FOAMHORIZONTAL_NormalStrength * temp_output_1188_0_g38156 );
				float4 break18_g38160 = ( sign( temp_output_14_0_g38160 ) * ( ( ddx( temp_output_8_0_g38160 ) * float4( temp_output_15_0_g38160 , 0.0 ) ) + ( ddy( temp_output_8_0_g38160 ) * float4( cross( WorldNormal , temp_output_6_0_g38160 ) , 0.0 ) ) ) );
				float3 appendResult7_g38160 = (float3(break18_g38160.x , -break18_g38160.y , break18_g38160.z));
				float3 worldToTangentDir5_g38160 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g38160 * WorldNormal ) - appendResult7_g38160 )) );
				float3 temp_output_1233_32_g38156 = worldToTangentDir5_g38160;
				float3 m_Swirling1230_g38156 = temp_output_1233_32_g38156;
				float3 m_FlowMap1230_g38156 = temp_output_1233_32_g38156;
				float3 localfloat3switch1230_g38156 = float3switch1230_g38156( m_switch1230_g38156 , m_Off1230_g38156 , m_Swirling1230_g38156 , m_FlowMap1230_g38156 );
				float3 FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g3661 = localfloat3switch1230_g38156;
				int ModeFlowType1225_g38145 = _FoamShoreline_ModeFlowType;
				int m_switch1223_g38145 = ModeFlowType1225_g38145;
				float3 m_Off1223_g38145 = float3( 0,0,1 );
				float3 temp_output_21_0_g38149 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g38149 = cross( WorldNormal , ddy( temp_output_21_0_g38149 ) );
				float3 temp_output_6_0_g38149 = ddx( temp_output_21_0_g38149 );
				float dotResult27_g38149 = dot( temp_output_15_0_g38149 , temp_output_6_0_g38149 );
				float temp_output_14_0_g38149 = abs( dotResult27_g38149 );
				float4 temp_output_8_0_g38149 = ( _FoamShoreline_NormalStrength * lerpResult761_g38145 );
				float4 break18_g38149 = ( sign( temp_output_14_0_g38149 ) * ( ( ddx( temp_output_8_0_g38149 ) * float4( temp_output_15_0_g38149 , 0.0 ) ) + ( ddy( temp_output_8_0_g38149 ) * float4( cross( WorldNormal , temp_output_6_0_g38149 ) , 0.0 ) ) ) );
				float3 appendResult7_g38149 = (float3(break18_g38149.x , -break18_g38149.y , break18_g38149.z));
				float3 worldToTangentDir5_g38149 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g38149 * WorldNormal ) - appendResult7_g38149 )) );
				float3 temp_output_1222_32_g38145 = worldToTangentDir5_g38149;
				float3 m_Swirling1223_g38145 = temp_output_1222_32_g38145;
				float3 m_FlowMap1223_g38145 = temp_output_1222_32_g38145;
				float3 localfloat3switch1223_g38145 = float3switch1223_g38145( m_switch1223_g38145 , m_Off1223_g38145 , m_Swirling1223_g38145 , m_FlowMap1223_g38145 );
				float3 FOAM_NORMALShorline1208_g3661 = localfloat3switch1223_g38145;
				float3 temp_output_1715_0_g3661 = BlendNormal( BlendNormal( BlendNormal( weightedBlend1711_g3661 , FOAM_VERTICAL_OFFSHORE_NORMAL1192_g3661 ) , FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g3661 ) , FOAM_NORMALShorline1208_g3661 );
				float3 worldPosValue71_g38152 = WorldPosition;
				float3 WorldPosition66_g38152 = worldPosValue71_g38152;
				float3 NORMAL_OUT1731_g3661 = temp_output_1715_0_g3661;
				float3 temp_output_16_0_g38152 = NORMAL_OUT1731_g3661;
				float3 lerpResult163_g38152 = lerp( ( WorldTangent * temp_output_16_0_g38152.x ) , ( WorldBiTangent * temp_output_16_0_g38152.y ) , ( WorldNormal * temp_output_16_0_g38152.z ));
				float3 NORMAL_PERPIXEL136_g38152 = lerpResult163_g38152;
				float3 WorldNormal66_g38152 = NORMAL_PERPIXEL136_g38152;
				float3 WorldView66_g38152 = WorldViewDirection;
				float3 temp_output_1_0_g38152 = _URP_SpecularColor.rgb;
				float3 SpecColor66_g38152 = (temp_output_1_0_g38152).xyz;
				float temp_output_173_0_g38152 = ( 1.0 - _URP_SpecularStrength );
				float Smoothness66_g38152 = temp_output_173_0_g38152;
				float4 shadowMaskValue77_g38152 = float4(1,1,1,1);
				float4 ShadowMask66_g38152 = shadowMaskValue77_g38152;
				float3 localAdditionalLightsSpecularMask66_g38152 = AdditionalLightsSpecularMask( WorldPosition66_g38152 , WorldNormal66_g38152 , WorldView66_g38152 , SpecColor66_g38152 , Smoothness66_g38152 , ShadowMask66_g38152 );
				float3 ADDITIONAL_LIGHT1730_g3661 = localAdditionalLightsSpecularMask66_g38152;
				float3 temp_output_1732_0_g3661 = ( temp_output_1715_0_g3661 + ADDITIONAL_LIGHT1730_g3661 );
				float3 temp_output_19_0_g39462 = temp_output_1732_0_g3661;
				float3 NORMAL_IN105_g39462 = temp_output_19_0_g39462;
				float3 m_Off103_g39462 = NORMAL_IN105_g39462;
				int m_switch914_g39462 = _Vertical_ModeUV;
				float3 _MASK_VECTOR1485_g39462 = float3(0.001,0.001,0.001);
				float2 appendResult259_g39462 = (float2(_Vertical_TilingX , _Vertical_TilingY));
				float2 VERTICAL_UV_TILING377_g39462 = appendResult259_g39462;
				float2 UV_TILING88_g39473 = VERTICAL_UV_TILING377_g39462;
				float3 objToWorld137_g39473 = mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord9.xyz, 1 ) ).xyz;
				float2 appendResult129_g39473 = (float2(-objToWorld137_g39473.x , objToWorld137_g39473.y));
				float temp_output_52_0_g39473 = _Vertical_Columns;
				float temp_output_53_0_g39473 = _Vertical_Rows;
				float2 appendResult1_g39473 = (float2(temp_output_52_0_g39473 , temp_output_53_0_g39473));
				float VERTICAL_FRAMES15_g39473 = ( temp_output_52_0_g39473 * temp_output_53_0_g39473 );
				float2 appendResult49_g39473 = (float2(VERTICAL_FRAMES15_g39473 , temp_output_53_0_g39473));
				float clampResult37_g39473 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39473 - 1.0 ) );
				float temp_output_36_0_g39473 = frac( ( ( ( _TimeParameters.x * _Vertical_Speed ) + clampResult37_g39473 ) / VERTICAL_FRAMES15_g39473 ) );
				float2 appendResult31_g39473 = (float2(temp_output_36_0_g39473 , ( 1.0 - temp_output_36_0_g39473 )));
				float2 _UV_VERTICAL_X_DOWN863_g39462 = ( ( ( ( UV_TILING88_g39473 * appendResult129_g39473 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g39473 ) + ( floor( ( appendResult49_g39473 * appendResult31_g39473 ) ) / appendResult1_g39473 ) );
				int _Global_Rain_Enabled1178_g39462 = _Global_Rain_Enabled;
				int m_switch1190_g39462 = _Global_Rain_Enabled1178_g39462;
				float m_Off1190_g39462 = _Vertical_Intensity;
				float _Global_Rain_Intensity1174_g39462 = _Global_Rain_Intensity;
				float m_Active1190_g39462 = ( _Vertical_Intensity * _Global_Rain_Intensity1174_g39462 );
				float localfloatswitch1190_g39462 = floatswitch1190_g39462( m_switch1190_g39462 , m_Off1190_g39462 , m_Active1190_g39462 );
				float _VERTICAL_INTENSITY861_g39462 = saturate( localfloatswitch1190_g39462 );
				float3 unpack908_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_X_DOWN863_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack908_g39462.z = lerp( 1, unpack908_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float3 temp_cast_57 = (0.5).xxx;
				float3 break149_g39462 = ( abs( WorldNormal ) - temp_cast_57 );
				float smoothstepResult1521_g39462 = smoothstep( _Vertical_SmoothEdge , 1.0 , ( break149_g39462.z + 0.5 ));
				float _MASK_VERTICAL_Z1241_g39462 = smoothstepResult1521_g39462;
				float3 lerpResult1138_g39462 = lerp( _MASK_VECTOR1485_g39462 , unpack908_g39462 , _MASK_VERTICAL_Z1241_g39462);
				float2 UV_TILING88_g39463 = VERTICAL_UV_TILING377_g39462;
				float3 objToWorld137_g39463 = mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord9.xyz, 1 ) ).xyz;
				float2 appendResult115_g39463 = (float2(objToWorld137_g39463.z , objToWorld137_g39463.y));
				float temp_output_52_0_g39463 = _Vertical_Columns;
				float temp_output_53_0_g39463 = _Vertical_Rows;
				float2 appendResult1_g39463 = (float2(temp_output_52_0_g39463 , temp_output_53_0_g39463));
				float VERTICAL_FRAMES15_g39463 = ( temp_output_52_0_g39463 * temp_output_53_0_g39463 );
				float2 appendResult49_g39463 = (float2(VERTICAL_FRAMES15_g39463 , temp_output_53_0_g39463));
				float clampResult37_g39463 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39463 - 1.0 ) );
				float temp_output_36_0_g39463 = frac( ( ( ( _TimeParameters.x * _Vertical_Speed ) + clampResult37_g39463 ) / VERTICAL_FRAMES15_g39463 ) );
				float2 appendResult31_g39463 = (float2(temp_output_36_0_g39463 , ( 1.0 - temp_output_36_0_g39463 )));
				float2 _UV_VERTICAL_Y_DOWN870_g39462 = ( ( ( ( UV_TILING88_g39463 * appendResult115_g39463 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g39463 ) + ( floor( ( appendResult49_g39463 * appendResult31_g39463 ) ) / appendResult1_g39463 ) );
				float3 unpack925_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_Y_DOWN870_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack925_g39462.z = lerp( 1, unpack925_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float2 _SmoothX = float2(0,1);
				float smoothstepResult1523_g39462 = smoothstep( _SmoothX.x , _SmoothX.y , ( break149_g39462.x + 0.45 ));
				float _MASK_VERTICAL_X151_g39462 = smoothstepResult1523_g39462;
				float3 lerpResult1261_g39462 = lerp( _MASK_VECTOR1485_g39462 , unpack925_g39462 , _MASK_VERTICAL_X151_g39462);
				float2 _SmoothY = float2(0,1);
				float smoothstepResult1519_g39462 = smoothstep( _SmoothY.x , _SmoothY.y , ( -break149_g39462.y + 0.45 ));
				float _MASK_VERTICAL_Y1216_g39462 = smoothstepResult1519_g39462;
				float3 lerpResult1390_g39462 = lerp( lerpResult1138_g39462 , BlendNormal( lerpResult1138_g39462 , lerpResult1261_g39462 ) , _MASK_VERTICAL_Y1216_g39462);
				float3 m_Standard914_g39462 = lerpResult1390_g39462;
				float localStochasticTiling895_g39462 = ( 0.0 );
				float2 UV895_g39462 = _UV_VERTICAL_X_DOWN863_g39462;
				float2 UV1895_g39462 = float2( 0,0 );
				float2 UV2895_g39462 = float2( 0,0 );
				float2 UV3895_g39462 = float2( 0,0 );
				float W1895_g39462 = 0.0;
				float W2895_g39462 = 0.0;
				float W3895_g39462 = 0.0;
				StochasticTiling( UV895_g39462 , UV1895_g39462 , UV2895_g39462 , UV3895_g39462 , W1895_g39462 , W2895_g39462 , W3895_g39462 );
				float2 temp_output_906_0_g39462 = ddx( _UV_VERTICAL_X_DOWN863_g39462 );
				float2 temp_output_886_0_g39462 = ddy( _UV_VERTICAL_X_DOWN863_g39462 );
				float3 unpack913_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1895_g39462, temp_output_906_0_g39462, temp_output_886_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack913_g39462.z = lerp( 1, unpack913_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V1_W1887_g39462 = W1895_g39462;
				float3 unpack920_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2895_g39462, temp_output_906_0_g39462, temp_output_886_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack920_g39462.z = lerp( 1, unpack920_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V1_W2897_g39462 = W2895_g39462;
				float3 unpack892_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3895_g39462, temp_output_906_0_g39462, temp_output_886_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack892_g39462.z = lerp( 1, unpack892_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V1_W3926_g39462 = W3895_g39462;
				float3 lerpResult950_g39462 = lerp( _MASK_VECTOR1485_g39462 , ( ( unpack913_g39462 * UV1_V1_W1887_g39462 ) + ( ( unpack920_g39462 * UV1_V1_W2897_g39462 ) + ( unpack892_g39462 * UV1_V1_W3926_g39462 ) ) ) , _MASK_VERTICAL_Z1241_g39462);
				float localStochasticTiling865_g39462 = ( 0.0 );
				float2 UV865_g39462 = _UV_VERTICAL_Y_DOWN870_g39462;
				float2 UV1865_g39462 = float2( 0,0 );
				float2 UV2865_g39462 = float2( 0,0 );
				float2 UV3865_g39462 = float2( 0,0 );
				float W1865_g39462 = 0.0;
				float W2865_g39462 = 0.0;
				float W3865_g39462 = 0.0;
				StochasticTiling( UV865_g39462 , UV1865_g39462 , UV2865_g39462 , UV3865_g39462 , W1865_g39462 , W2865_g39462 , W3865_g39462 );
				float2 temp_output_883_0_g39462 = ddx( _UV_VERTICAL_Y_DOWN870_g39462 );
				float2 temp_output_894_0_g39462 = ddy( _UV_VERTICAL_Y_DOWN870_g39462 );
				float3 unpack904_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1865_g39462, temp_output_883_0_g39462, temp_output_894_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack904_g39462.z = lerp( 1, unpack904_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V2_W1866_g39462 = W1865_g39462;
				float3 unpack922_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2865_g39462, temp_output_883_0_g39462, temp_output_894_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack922_g39462.z = lerp( 1, unpack922_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V2_W2884_g39462 = W2865_g39462;
				float3 unpack910_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3865_g39462, temp_output_883_0_g39462, temp_output_894_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack910_g39462.z = lerp( 1, unpack910_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V2_W3871_g39462 = W3865_g39462;
				float3 lerpResult946_g39462 = lerp( _MASK_VECTOR1485_g39462 , ( ( unpack904_g39462 * UV1_V2_W1866_g39462 ) + ( ( unpack922_g39462 * UV1_V2_W2884_g39462 ) + ( unpack910_g39462 * UV1_V2_W3871_g39462 ) ) ) , _MASK_VERTICAL_X151_g39462);
				float3 lerpResult1400_g39462 = lerp( lerpResult950_g39462 , BlendNormal( lerpResult950_g39462 , lerpResult946_g39462 ) , _MASK_VERTICAL_Y1216_g39462);
				float3 m_Stochastic914_g39462 = lerpResult1400_g39462;
				float3 localfloat3switch914_g39462 = float3switch914_g39462( m_switch914_g39462 , m_Standard914_g39462 , m_Stochastic914_g39462 );
				float3 RAIN_VERTICAL127_g39462 = localfloat3switch914_g39462;
				float temp_output_1454_0_g3661 = ( _SMOOTHNESS_Strength * _SMOOTHNESS_Strength );
				float3 temp_cast_58 = (temp_output_1454_0_g3661).xxx;
				float3 NORMAL_OUT_Z505_g3661 = weightedBlend1711_g3661;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal1601_g3661 = NORMAL_OUT_Z505_g3661;
				float3 worldNormal1601_g3661 = float3(dot(tanToWorld0,tanNormal1601_g3661), dot(tanToWorld1,tanNormal1601_g3661), dot(tanToWorld2,tanNormal1601_g3661));
				float fresnelNdotV1412_g3661 = dot( worldNormal1601_g3661, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode1412_g3661 = ( _SMOOTHNESS_FresnelBias + _SMOOTHNESS_FresnelScale * pow( max( 1.0 - fresnelNdotV1412_g3661 , 0.0001 ), _SMOOTHNESS_FresnelPower ) );
				float3 lerpResult1403_g3661 = lerp( temp_cast_58 , ( temp_output_1454_0_g3661 * worldNormal1601_g3661 ) , ( fresnelNode1412_g3661 * ( 1.0 - fresnelNode1412_g3661 ) ));
				float3 clampResult1740_g3661 = clamp( lerpResult1403_g3661 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float4 temp_output_23_0_g39462 = float4( clampResult1740_g3661 , 0.0 );
				float4 lerpResult144_g39462 = lerp( temp_output_23_0_g39462 , ( temp_output_23_0_g39462 * 0.05 ) , IN.ase_color.r);
				float4 temp_cast_60 = (0.7).xxxx;
				float4 SMOOTHNESS94_g39462 = step( step( lerpResult144_g39462 , temp_cast_60 ) , float4( 0,0,0,0 ) );
				float3 lerpResult42_g39462 = lerp( RAIN_VERTICAL127_g39462 , float3( 0,0,0 ) , SMOOTHNESS94_g39462.xyz);
				float3 temp_output_26_0_g39468 = float3( 0,0,0 );
				float3 m_Active103_g39462 = BlendNormal( temp_output_19_0_g39462 , ( ( lerpResult42_g39462 - temp_output_26_0_g39468 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39468 ) ) );
				float3 localfloat3switch103_g39462 = float3switch( m_switch103_g39462 , m_Off103_g39462 , m_Active103_g39462 );
				int m_switch1010_g39462 = _Static_RainMode;
				float3 m_Off1010_g39462 = NORMAL_IN105_g39462;
				int m_switch992_g39462 = _Static_ModeUV;
				float2 appendResult737_g39462 = (float2(_Static_TilingX , _Static_TilingY));
				float2 appendResult738_g39462 = (float2(_Static_OffsetX , _Static_OffsetY));
				float2 texCoord736_g39462 = IN.ase_texcoord7.xy * appendResult737_g39462 + appendResult738_g39462;
				float2 appendResult731_g39462 = (float2(frac( texCoord736_g39462.x ) , frac( texCoord736_g39462.y )));
				float2 _STATIC_UV01_OUT990_g39462 = ( appendResult731_g39462 + ( (ase_screenPosNorm).xy * _Static_ScreenContribution ) );
				int m_switch1186_g39462 = _Global_Rain_Enabled1178_g39462;
				float m_Off1186_g39462 = _Static_Intensity;
				float m_Active1186_g39462 = ( _Static_Intensity * _Global_Rain_Intensity1174_g39462 );
				float localfloatswitch1186_g39462 = floatswitch1186_g39462( m_switch1186_g39462 , m_Off1186_g39462 , m_Active1186_g39462 );
				float _STATIC_INTENSITY991_g39462 = saturate( localfloatswitch1186_g39462 );
				float3 unpack727_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Static_RainMap, sampler_trilinear_repeat, _STATIC_UV01_OUT990_g39462 ), _STATIC_INTENSITY991_g39462 );
				unpack727_g39462.z = lerp( 1, unpack727_g39462.z, saturate(_STATIC_INTENSITY991_g39462) );
				float3 m_Standard992_g39462 = unpack727_g39462;
				float localStochasticTiling973_g39462 = ( 0.0 );
				float2 UV973_g39462 = _STATIC_UV01_OUT990_g39462;
				float2 UV1973_g39462 = float2( 0,0 );
				float2 UV2973_g39462 = float2( 0,0 );
				float2 UV3973_g39462 = float2( 0,0 );
				float W1973_g39462 = 0.0;
				float W2973_g39462 = 0.0;
				float W3973_g39462 = 0.0;
				StochasticTiling( UV973_g39462 , UV1973_g39462 , UV2973_g39462 , UV3973_g39462 , W1973_g39462 , W2973_g39462 , W3973_g39462 );
				float2 temp_output_977_0_g39462 = ddx( _STATIC_UV01_OUT990_g39462 );
				float2 temp_output_978_0_g39462 = ddy( _STATIC_UV01_OUT990_g39462 );
				float3 unpack974_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV1973_g39462, temp_output_977_0_g39462, temp_output_978_0_g39462 ), _STATIC_INTENSITY991_g39462 );
				unpack974_g39462.z = lerp( 1, unpack974_g39462.z, saturate(_STATIC_INTENSITY991_g39462) );
				float UV1_S1_W1975_g39462 = W1973_g39462;
				float3 unpack970_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV2973_g39462, temp_output_977_0_g39462, temp_output_978_0_g39462 ), _STATIC_INTENSITY991_g39462 );
				unpack970_g39462.z = lerp( 1, unpack970_g39462.z, saturate(_STATIC_INTENSITY991_g39462) );
				float UV1_S1_W2972_g39462 = W2973_g39462;
				float3 unpack971_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV3973_g39462, temp_output_977_0_g39462, temp_output_978_0_g39462 ), _STATIC_INTENSITY991_g39462 );
				unpack971_g39462.z = lerp( 1, unpack971_g39462.z, saturate(_STATIC_INTENSITY991_g39462) );
				float UV1_S1_W3976_g39462 = W3973_g39462;
				float3 m_Stochastic992_g39462 = ( ( unpack974_g39462 * UV1_S1_W1975_g39462 ) + ( ( unpack970_g39462 * UV1_S1_W2972_g39462 ) + ( unpack971_g39462 * UV1_S1_W3976_g39462 ) ) );
				float3 localfloat3switch992_g39462 = float3switch992_g39462( m_switch992_g39462 , m_Standard992_g39462 , m_Stochastic992_g39462 );
				float3 RAIN_STATIC743_g39462 = localfloat3switch992_g39462;
				float3 lerpResult1005_g39462 = lerp( RAIN_STATIC743_g39462 , float3( 0,0,0 ) , SMOOTHNESS94_g39462.xyz);
				float3 temp_output_26_0_g39479 = float3( 0,0,0 );
				float3 m_Active1010_g39462 = BlendNormal( temp_output_19_0_g39462 , ( ( lerpResult1005_g39462 - temp_output_26_0_g39479 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39479 ) ) );
				float3 localfloat3switch1010_g39462 = float3switch( m_switch1010_g39462 , m_Off1010_g39462 , m_Active1010_g39462 );
				int m_switch1009_g39462 = _Horizontal_RainMode;
				float3 m_Off1009_g39462 = NORMAL_IN105_g39462;
				int m_switch1505_g39462 = _Horizontal_ModeUV;
				float2 appendResult269_g39462 = (float2(_Horizontal_TilingX , _Horizontal_TilingY));
				float2 HORIZONTAL_UV_TILING158_g39462 = appendResult269_g39462;
				float2 UV_TILING88_g39477 = HORIZONTAL_UV_TILING158_g39462;
				float2 appendResult271_g39462 = (float2(_Horizontal_OffsetX , _Horizontal_OffsetY));
				float2 HORIZONTAL_UV_OFFSET159_g39462 = appendResult271_g39462;
				float2 UV_OFFSET94_g39477 = HORIZONTAL_UV_OFFSET159_g39462;
				float2 texCoord87_g39477 = IN.ase_texcoord7.xy * UV_TILING88_g39477 + UV_OFFSET94_g39477;
				float2 appendResult86_g39477 = (float2(frac( texCoord87_g39477.x ) , frac( texCoord87_g39477.y )));
				float temp_output_52_0_g39477 = _Horizontal_Columns;
				float temp_output_53_0_g39477 = _Horizontal_Rows;
				float2 appendResult1_g39477 = (float2(temp_output_52_0_g39477 , temp_output_53_0_g39477));
				float VERTICAL_FRAMES15_g39477 = ( temp_output_52_0_g39477 * temp_output_53_0_g39477 );
				float2 appendResult49_g39477 = (float2(VERTICAL_FRAMES15_g39477 , temp_output_53_0_g39477));
				float clampResult37_g39477 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39477 - 1.0 ) );
				float temp_output_36_0_g39477 = frac( ( ( ( _TimeParameters.x * _Horizontal_Speed ) + clampResult37_g39477 ) / VERTICAL_FRAMES15_g39477 ) );
				float2 appendResult31_g39477 = (float2(temp_output_36_0_g39477 , ( 1.0 - temp_output_36_0_g39477 )));
				float2 UV_HORIZONTAL_DEFAULT_01817_g39462 = ( ( ( appendResult86_g39477 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g39477 ) + ( floor( ( appendResult49_g39477 * appendResult31_g39477 ) ) / appendResult1_g39477 ) );
				int m_switch1179_g39462 = _Global_Rain_Enabled1178_g39462;
				float m_Off1179_g39462 = _Horizontal_Intensity;
				float m_Active1179_g39462 = ( _Horizontal_Intensity * _Global_Rain_Intensity1174_g39462 );
				float localfloatswitch1179_g39462 = floatswitch1179_g39462( m_switch1179_g39462 , m_Off1179_g39462 , m_Active1179_g39462 );
				float _HORIZONTAL_INTENSITY814_g39462 = saturate( localfloatswitch1179_g39462 );
				float3 unpack9_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_01817_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack9_g39462.z = lerp( 1, unpack9_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float2 UV_TILING88_g39465 = ( HORIZONTAL_UV_TILING158_g39462 / float2( 0.6,0.6 ) );
				float2 UV_OFFSET94_g39465 = ( HORIZONTAL_UV_OFFSET159_g39462 + float2( 0.3,0.3 ) );
				float2 texCoord87_g39465 = IN.ase_texcoord7.xy * UV_TILING88_g39465 + UV_OFFSET94_g39465;
				float2 appendResult86_g39465 = (float2(frac( texCoord87_g39465.x ) , frac( texCoord87_g39465.y )));
				float temp_output_52_0_g39465 = _Horizontal_Columns;
				float temp_output_53_0_g39465 = _Horizontal_Rows;
				float2 appendResult1_g39465 = (float2(temp_output_52_0_g39465 , temp_output_53_0_g39465));
				float VERTICAL_FRAMES15_g39465 = ( temp_output_52_0_g39465 * temp_output_53_0_g39465 );
				float2 appendResult49_g39465 = (float2(VERTICAL_FRAMES15_g39465 , temp_output_53_0_g39465));
				float clampResult37_g39465 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39465 - 1.0 ) );
				float temp_output_36_0_g39465 = frac( ( ( ( _TimeParameters.x * _Horizontal_Speed ) + clampResult37_g39465 ) / VERTICAL_FRAMES15_g39465 ) );
				float2 appendResult31_g39465 = (float2(temp_output_36_0_g39465 , ( 1.0 - temp_output_36_0_g39465 )));
				float2 UV_HORIZONTAL_DEFAULT_02818_g39462 = ( ( ( appendResult86_g39465 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g39465 ) + ( floor( ( appendResult49_g39465 * appendResult31_g39465 ) ) / appendResult1_g39465 ) );
				float3 unpack339_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_02818_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack339_g39462.z = lerp( 1, unpack339_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float3 m_Standard1505_g39462 = BlendNormal( unpack9_g39462 , unpack339_g39462 );
				float localStochasticTiling800_g39462 = ( 0.0 );
				float2 UV800_g39462 = UV_HORIZONTAL_DEFAULT_01817_g39462;
				float2 UV1800_g39462 = float2( 0,0 );
				float2 UV2800_g39462 = float2( 0,0 );
				float2 UV3800_g39462 = float2( 0,0 );
				float W1800_g39462 = 0.0;
				float W2800_g39462 = 0.0;
				float W3800_g39462 = 0.0;
				StochasticTiling( UV800_g39462 , UV1800_g39462 , UV2800_g39462 , UV3800_g39462 , W1800_g39462 , W2800_g39462 , W3800_g39462 );
				float2 temp_output_804_0_g39462 = ddx( UV_HORIZONTAL_DEFAULT_01817_g39462 );
				float2 temp_output_797_0_g39462 = ddy( UV_HORIZONTAL_DEFAULT_01817_g39462 );
				float3 unpack809_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1800_g39462, temp_output_804_0_g39462, temp_output_797_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack809_g39462.z = lerp( 1, unpack809_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H1_W1805_g39462 = W1800_g39462;
				float3 unpack810_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2800_g39462, temp_output_804_0_g39462, temp_output_797_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack810_g39462.z = lerp( 1, unpack810_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H1_W2803_g39462 = W2800_g39462;
				float3 unpack811_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3800_g39462, temp_output_804_0_g39462, temp_output_797_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack811_g39462.z = lerp( 1, unpack811_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H1_W3812_g39462 = W3800_g39462;
				float localStochasticTiling781_g39462 = ( 0.0 );
				float2 UV781_g39462 = UV_HORIZONTAL_DEFAULT_02818_g39462;
				float2 UV1781_g39462 = float2( 0,0 );
				float2 UV2781_g39462 = float2( 0,0 );
				float2 UV3781_g39462 = float2( 0,0 );
				float W1781_g39462 = 0.0;
				float W2781_g39462 = 0.0;
				float W3781_g39462 = 0.0;
				StochasticTiling( UV781_g39462 , UV1781_g39462 , UV2781_g39462 , UV3781_g39462 , W1781_g39462 , W2781_g39462 , W3781_g39462 );
				float2 temp_output_788_0_g39462 = ddx( UV_HORIZONTAL_DEFAULT_02818_g39462 );
				float2 temp_output_777_0_g39462 = ddy( UV_HORIZONTAL_DEFAULT_02818_g39462 );
				float3 unpack782_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1781_g39462, temp_output_788_0_g39462, temp_output_777_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack782_g39462.z = lerp( 1, unpack782_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H2_W1789_g39462 = W1781_g39462;
				float3 unpack783_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2781_g39462, temp_output_788_0_g39462, temp_output_777_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack783_g39462.z = lerp( 1, unpack783_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H2_W2787_g39462 = W2781_g39462;
				float3 unpack779_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3781_g39462, temp_output_788_0_g39462, temp_output_777_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack779_g39462.z = lerp( 1, unpack779_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H2_W3785_g39462 = W3781_g39462;
				float3 m_Stochastic1505_g39462 = BlendNormal( ( ( unpack809_g39462 * UV1_H1_W1805_g39462 ) + ( ( unpack810_g39462 * UV1_H1_W2803_g39462 ) + ( unpack811_g39462 * UV1_H1_W3812_g39462 ) ) ) , ( ( unpack782_g39462 * UV1_H2_W1789_g39462 ) + ( ( unpack783_g39462 * UV1_H2_W2787_g39462 ) + ( unpack779_g39462 * UV1_H2_W3785_g39462 ) ) ) );
				float3 localfloat3switch1505_g39462 = float3switch1505_g39462( m_switch1505_g39462 , m_Standard1505_g39462 , m_Stochastic1505_g39462 );
				float2 _SmoothH = float2(0,1);
				float smoothstepResult1517_g39462 = smoothstep( _SmoothH.x , _SmoothH.y , ( WorldNormal.y + 0.02 ));
				float _MASK_HORIZONTAL152_g39462 = smoothstepResult1517_g39462;
				float3 lerpResult279_g39462 = lerp( _MASK_VECTOR1485_g39462 , localfloat3switch1505_g39462 , _MASK_HORIZONTAL152_g39462);
				float3 RAIN_HORIZONTAL123_g39462 = lerpResult279_g39462;
				float3 lerpResult1002_g39462 = lerp( RAIN_HORIZONTAL123_g39462 , float3( 0,0,0 ) , SMOOTHNESS94_g39462.xyz);
				float3 temp_output_26_0_g39470 = float3( 0,0,0 );
				float3 m_Active1009_g39462 = BlendNormal( temp_output_19_0_g39462 , ( ( lerpResult1002_g39462 - temp_output_26_0_g39470 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39470 ) ) );
				float3 localfloat3switch1009_g39462 = float3switch( m_switch1009_g39462 , m_Off1009_g39462 , m_Active1009_g39462 );
				
				int temp_output_43_0_g38128 = _Specular_Mode;
				int m_switch18_g38128 = temp_output_43_0_g38128;
				float3 m_Off18_g38128 = float3( 0,0,0 );
				float3 tanNormal37_g38128 = temp_output_1732_0_g3661;
				float3 worldNormal37_g38128 = float3(dot(tanToWorld0,tanNormal37_g38128), dot(tanToWorld1,tanNormal37_g38128), dot(tanToWorld2,tanNormal37_g38128));
				float3 normalizeResult20_g38128 = normalize( worldNormal37_g38128 );
				float3 normalizeResult27_g38128 = normalize( ( WorldViewDirection + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult19_g38128 = dot( normalizeResult20_g38128 , normalizeResult27_g38128 );
				float temp_output_48_0_g38128 = _SpecularWrap;
				float temp_output_46_0_g38128 = (dotResult19_g38128*temp_output_48_0_g38128 + temp_output_48_0_g38128);
				float saferPower25_g38128 = max( ( temp_output_46_0_g38128 * temp_output_46_0_g38128 * temp_output_46_0_g38128 ) , 0.0001 );
				int _SPECULAR_Mode22_g38128 = temp_output_43_0_g38128;
				int m_switch31_g38128 = _SPECULAR_Mode22_g38128;
				float3 m_Off31_g38128 = float3( 0,0,0 );
				float3 temp_output_16_0_g38128 = (_SpecularColor).rgb;
				float3 m_Active31_g38128 = temp_output_16_0_g38128;
				float3 clampResult5_g38128 = clamp( temp_output_16_0_g38128 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp31_g38128 = clampResult5_g38128;
				float3 localfloat3switch31_g38128 = float3switch31_g38128( m_switch31_g38128 , m_Off31_g38128 , m_Active31_g38128 , m_ActiveClamp31_g38128 );
				int m_switch11_g38128 = _SPECULAR_Mode22_g38128;
				float3 m_Off11_g38128 = float3( 0,0,0 );
				float3 temp_output_4_0_g38128 = (_MainLightColor).rgb;
				float3 m_Active11_g38128 = temp_output_4_0_g38128;
				float3 clampResult9_g38128 = clamp( temp_output_4_0_g38128 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp11_g38128 = clampResult9_g38128;
				float3 localfloat3switch11_g38128 = float3switch11_g38128( m_switch11_g38128 , m_Off11_g38128 , m_Active11_g38128 , m_ActiveClamp11_g38128 );
				float3 temp_output_24_0_g38128 = saturate( ( pow( saferPower25_g38128 , ( 1.0 - _Shininess ) ) * saturate( ( localfloat3switch31_g38128 * localfloat3switch11_g38128 ) ) ) );
				float3 m_Active18_g38128 = temp_output_24_0_g38128;
				float3 m_ActiveClamp18_g38128 = temp_output_24_0_g38128;
				float3 localfloat3switch18_g38128 = float3switch18_g38128( m_switch18_g38128 , m_Off18_g38128 , m_Active18_g38128 , m_ActiveClamp18_g38128 );
				
				int m_switch23_g39467 = _Rain_GlobalWetnessMode;
				float4 temp_output_17_0_g39467 = temp_output_23_0_g39462;
				float4 m_Off23_g39467 = temp_output_17_0_g39467;
				int m_switch12_g39467 = _Global_Wetness_Enabled;
				float4 m_Off12_g39467 = temp_output_17_0_g39467;
				float4 m_Active12_g39467 = saturate( ( temp_output_17_0_g39467 + _Global_Wetness_Intensity ) );
				float4 localfloat4switch12_g39467 = float4switch12_g39467( m_switch12_g39467 , m_Off12_g39467 , m_Active12_g39467 );
				float4 m_Active23_g39467 = localfloat4switch12_g39467;
				float4 localfloat4switch23_g39467 = float4switch23_g39467( m_switch23_g39467 , m_Off23_g39467 , m_Active23_g39467 );
				
				float3 Albedo = ( temp_output_746_0_g39462 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
				float3 Normal = ( localfloat3switch103_g39462 + localfloat3switch1010_g39462 + localfloat3switch1009_g39462 );
				float3 Emission = 0;
				float3 Specular = localfloat3switch18_g38128;
				float Metallic = 0;
				float Smoothness = localfloat4switch23_g39467.x;
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
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half4 _SpecularColor;
			float4 _FoamShoreline_Tint;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FOAMHORIZONTAL_Tint;
			float _Vertical_SmoothEdge;
			float _Vertical_Speed;
			float _Vertical_Rows;
			float _Vertical_Columns;
			float _Vertical_ScreenContribution;
			float _Vertical_TilingY;
			float _Vertical_TilingX;
			int _Vertical_ModeUV;
			int _ZWriteMode;
			float _SMOOTHNESS_Strength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			int _Vertical_RainMode;
			float _Rain_WetnessDarken;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _URP_SpecularStrength;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_FresnelPower;
			float _FoamShoreline_FlowStrength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _Horizontal_Speed;
			float _Horizontal_Rows;
			float _Horizontal_Columns;
			float _Horizontal_ScreenContribution;
			float _Horizontal_OffsetY;
			float _Horizontal_OffsetX;
			float _Horizontal_TilingY;
			float _Horizontal_TilingX;
			int _Horizontal_ModeUV;
			int _Horizontal_RainMode;
			float _Static_Intensity;
			float _Static_ScreenContribution;
			float _Static_OffsetY;
			float _Static_OffsetX;
			float _Static_TilingY;
			float _Static_TilingX;
			int _Static_ModeUV;
			int _Static_RainMode;
			float _SMOOTHNESS_FresnelScale;
			float _TilingY_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_Timescale;
			int _WaterNormal_Vertical_FlowType;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			float _WaterNormal_Vertical_TilingY;
			float _TilingX_Shoreline;
			float _WaterNormal_Vertical_NormalStrength;
			float _RefractionScale;
			float _FoamShoreline_Timescale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FOAMHORIZONTAL_TilingY;
			float _FOAMHORIZONTAL_TilingX;
			float _FOAMHORIZONTAL_Speed;
			float _FOAMHORIZONTAL_Timescale;
			int _FOAMHORIZONTAL_ModeFlowType;
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
			float _WaterNormal_Vertical_FlowStrength;
			int _Rain_GlobalWetnessMode;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half4 _SpecularColor;
			float4 _FoamShoreline_Tint;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FOAMHORIZONTAL_Tint;
			float _Vertical_SmoothEdge;
			float _Vertical_Speed;
			float _Vertical_Rows;
			float _Vertical_Columns;
			float _Vertical_ScreenContribution;
			float _Vertical_TilingY;
			float _Vertical_TilingX;
			int _Vertical_ModeUV;
			int _ZWriteMode;
			float _SMOOTHNESS_Strength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			int _Vertical_RainMode;
			float _Rain_WetnessDarken;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _URP_SpecularStrength;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_FresnelPower;
			float _FoamShoreline_FlowStrength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _Horizontal_Speed;
			float _Horizontal_Rows;
			float _Horizontal_Columns;
			float _Horizontal_ScreenContribution;
			float _Horizontal_OffsetY;
			float _Horizontal_OffsetX;
			float _Horizontal_TilingY;
			float _Horizontal_TilingX;
			int _Horizontal_ModeUV;
			int _Horizontal_RainMode;
			float _Static_Intensity;
			float _Static_ScreenContribution;
			float _Static_OffsetY;
			float _Static_OffsetX;
			float _Static_TilingY;
			float _Static_TilingX;
			int _Static_ModeUV;
			int _Static_RainMode;
			float _SMOOTHNESS_FresnelScale;
			float _TilingY_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_Timescale;
			int _WaterNormal_Vertical_FlowType;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			float _WaterNormal_Vertical_TilingY;
			float _TilingX_Shoreline;
			float _WaterNormal_Vertical_NormalStrength;
			float _RefractionScale;
			float _FoamShoreline_Timescale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FOAMHORIZONTAL_TilingY;
			float _FOAMHORIZONTAL_TilingX;
			float _FOAMHORIZONTAL_Speed;
			float _FOAMHORIZONTAL_Timescale;
			int _FOAMHORIZONTAL_ModeFlowType;
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
			float _WaterNormal_Vertical_FlowStrength;
			int _Rain_GlobalWetnessMode;
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
			
			float3 float3switch238_g38135( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float3 float3switch456_g38116( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float4 float4switch278_g38104( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
			
			float4 float4switch278_g38156( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
			
			float4 float4switch278_g38145( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
				o.ase_texcoord3.z = eyeDepth;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_texcoord5 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord6 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				
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

				float4 screenPos = IN.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g3661 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g3661 = abs( ( screenDepth2_g3661 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g3661 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g3661*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g3661 = lerp( _DepthTint , lerpResult25_g3661 , saturate( (distanceDepth2_g3661*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g3661 = lerpResult27_g3661;
				int m_switch238_g38135 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g38135 = float3(0,0,0.001);
				float mulTime155_g38135 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g38135 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g38135 = ( FlowSpeed365_g38135 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g38135).xx;
				float2 appendResult235_g38135 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g38135 = IN.ase_texcoord3.xy * ( appendResult235_g38135 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g38135 = cos( _G_FlowSwirling.x );
				float sin62_g38135 = sin( _G_FlowSwirling.x );
				float2 rotator62_g38135 = mul( texCoord23_g38135 - float2( 0,0 ) , float2x2( cos62_g38135 , -sin62_g38135 , sin62_g38135 , cos62_g38135 )) + float2( 0,0 );
				float2 panner15_g38135 = ( mulTime155_g38135 * temp_cast_0 + rotator62_g38135);
				float2 temp_cast_1 = (temp_output_367_0_g38135).xx;
				float cos8_g38135 = cos( _G_FlowSwirling.y );
				float sin8_g38135 = sin( _G_FlowSwirling.y );
				float2 rotator8_g38135 = mul( texCoord23_g38135 - float2( 0,0 ) , float2x2( cos8_g38135 , -sin8_g38135 , sin8_g38135 , cos8_g38135 )) + float2( 0,0 );
				float2 panner16_g38135 = ( mulTime155_g38135 * temp_cast_1 + rotator8_g38135);
				float2 temp_cast_2 = (temp_output_367_0_g38135).xx;
				float2 panner17_g38135 = ( mulTime155_g38135 * temp_cast_2 + texCoord23_g38135);
				float2 layeredBlendVar666_g38135 = IN.ase_texcoord3.xy;
				float4 layeredBlend666_g38135 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g38135 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g38135 ) , layeredBlendVar666_g38135.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g38135 ) , layeredBlendVar666_g38135.y ) );
				float4 temp_output_1_0_g38136 = layeredBlend666_g38135;
				float temp_output_8_0_g38136 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g38136 = UnpackNormalScale( temp_output_1_0_g38136, temp_output_8_0_g38136 );
				unpack52_g38136.z = lerp( 1, unpack52_g38136.z, saturate(temp_output_8_0_g38136) );
				float3 temp_output_699_59_g38135 = unpack52_g38136;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 temp_output_372_0_g38135 = abs( ase_worldNormal );
				float3 break386_g38135 = ( temp_output_372_0_g38135 * temp_output_372_0_g38135 );
				float _MASK_VERTICAL_Z381_g38135 = ( break386_g38135.z + 0.01 );
				float3 lerpResult677_g38135 = lerp( float3( 0,0,0 ) , temp_output_699_59_g38135 , _MASK_VERTICAL_Z381_g38135);
				float _MASK_VERTICAL_X373_g38135 = ( -break386_g38135.x + 0.2 );
				float3 lerpResult681_g38135 = lerp( float3( 0,0,0 ) , temp_output_699_59_g38135 , _MASK_VERTICAL_X373_g38135);
				float _MASK_VERTICAL_Y_NEG413_g38135 = ( ( ase_worldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g38135 = lerp( float3( 0,0,0 ) , ( lerpResult677_g38135 + lerpResult681_g38135 ) , _MASK_VERTICAL_Y_NEG413_g38135);
				float3 m_Swirling238_g38135 = lerpResult679_g38135;
				float2 texCoord196_g38140 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38140 = IN.ase_texcoord5;
				float2 blendOpSrc197_g38140 = texCoord196_g38140;
				float2 blendOpDest197_g38140 = (_FLOWMAP_Map89_g38140).xy;
				float2 temp_output_197_0_g38140 = ( saturate( (( blendOpDest197_g38140 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38140 ) * ( 1.0 - blendOpSrc197_g38140 ) ) : ( 2.0 * blendOpDest197_g38140 * blendOpSrc197_g38140 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38140 = FlowSpeed365_g38135;
				float temp_output_182_0_g38140 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38140 );
				float temp_output_194_0_g38140 = (0.0 + (( ( temp_output_182_0_g38140 - floor( ( temp_output_182_0_g38140 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g38140 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g38140 = ( -temp_output_194_0_g38140 * _FLOWMAP_FlowStrength146_g38140 );
				float2 lerpResult198_g38140 = lerp( temp_output_197_0_g38140 , texCoord196_g38140 , _TIME_UV_A199_g38140);
				float2 INPUT_MAP_TILLING128_g38135 = appendResult235_g38135;
				float2 texCoord205_g38140 = IN.ase_texcoord3.xy * INPUT_MAP_TILLING128_g38135 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38140 = texCoord205_g38140;
				float2 FLOW_A201_g38140 = ( lerpResult198_g38140 + TEXTURE_TILLING211_g38140 );
				float temp_output_225_0_g38140 = (temp_output_182_0_g38140*1.0 + 0.5);
				float _TIME_UV_B214_g38140 = ( -(0.0 + (( ( temp_output_225_0_g38140 - floor( ( temp_output_225_0_g38140 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38140 );
				float2 lerpResult229_g38140 = lerp( temp_output_197_0_g38140 , texCoord196_g38140 , _TIME_UV_B214_g38140);
				float2 FLOW_B232_g38140 = ( lerpResult229_g38140 + TEXTURE_TILLING211_g38140 );
				float TIME_BLEND235_g38140 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38140 / 0.5 ) ) ) );
				float4 lerpResult317_g38135 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g38140 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g38140 ) , TIME_BLEND235_g38140);
				float4 temp_output_1_0_g38142 = lerpResult317_g38135;
				float NormalStrength152_g38135 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g38142 = NormalStrength152_g38135;
				float3 unpack52_g38142 = UnpackNormalScale( temp_output_1_0_g38142, temp_output_8_0_g38142 );
				unpack52_g38142.z = lerp( 1, unpack52_g38142.z, saturate(temp_output_8_0_g38142) );
				float3 temp_output_701_59_g38135 = unpack52_g38142;
				float3 lerpResult692_g38135 = lerp( float3( 0,0,0 ) , temp_output_701_59_g38135 , _MASK_VERTICAL_Z381_g38135);
				float3 lerpResult691_g38135 = lerp( float3( 0,0,0 ) , temp_output_701_59_g38135 , _MASK_VERTICAL_X373_g38135);
				float3 lerpResult697_g38135 = lerp( float3( 0,0,0 ) , ( lerpResult692_g38135 + lerpResult691_g38135 ) , _MASK_VERTICAL_Y_NEG413_g38135);
				float3 m_FlowMap238_g38135 = lerpResult697_g38135;
				float3 localfloat3switch238_g38135 = float3switch238_g38135( m_switch238_g38135 , m_Off238_g38135 , m_Swirling238_g38135 , m_FlowMap238_g38135 );
				int m_switch456_g38116 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g38116 = float3(0,0,0.001);
				float mulTime155_g38116 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g38116 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g38116 = ( FlowSpeed365_g38116 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g38116).xx;
				float2 appendResult235_g38116 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g38116 = IN.ase_texcoord3.xy * ( appendResult235_g38116 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g38116 = cos( _G_FlowSwirling.x );
				float sin62_g38116 = sin( _G_FlowSwirling.x );
				float2 rotator62_g38116 = mul( texCoord23_g38116 - float2( 0,0 ) , float2x2( cos62_g38116 , -sin62_g38116 , sin62_g38116 , cos62_g38116 )) + float2( 0,0 );
				float2 panner15_g38116 = ( mulTime155_g38116 * temp_cast_5 + rotator62_g38116);
				float2 temp_cast_6 = (temp_output_367_0_g38116).xx;
				float cos8_g38116 = cos( _G_FlowSwirling.y );
				float sin8_g38116 = sin( _G_FlowSwirling.y );
				float2 rotator8_g38116 = mul( texCoord23_g38116 - float2( 0,0 ) , float2x2( cos8_g38116 , -sin8_g38116 , sin8_g38116 , cos8_g38116 )) + float2( 0,0 );
				float2 panner16_g38116 = ( mulTime155_g38116 * temp_cast_6 + rotator8_g38116);
				float2 temp_cast_7 = (temp_output_367_0_g38116).xx;
				float2 panner17_g38116 = ( mulTime155_g38116 * temp_cast_7 + texCoord23_g38116);
				float2 layeredBlendVar448_g38116 = IN.ase_texcoord3.xy;
				float4 layeredBlend448_g38116 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g38116 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g38116 ) , layeredBlendVar448_g38116.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g38116 ) , layeredBlendVar448_g38116.y ) );
				float4 temp_output_1_0_g38120 = layeredBlend448_g38116;
				float temp_output_8_0_g38120 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g38120 = UnpackNormalScale( temp_output_1_0_g38120, temp_output_8_0_g38120 );
				unpack52_g38120.z = lerp( 1, unpack52_g38120.z, saturate(temp_output_8_0_g38120) );
				float3 temp_output_481_59_g38116 = unpack52_g38120;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g38116 = ( abs( ase_worldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g38116 = ( break386_g38116.z + 0.75 );
				float3 lerpResult465_g38116 = lerp( float3( 0,0,0 ) , temp_output_481_59_g38116 , _MASK_VERTICAL_Z381_g38116);
				float _MASK_VERTICAL_X373_g38116 = ( break386_g38116.x + 0.45 );
				float3 lerpResult457_g38116 = lerp( float3( 0,0,0 ) , temp_output_481_59_g38116 , _MASK_VERTICAL_X373_g38116);
				float _MASK_VERTICAL_Y383_g38116 = ( -break386_g38116.y + 5.0 );
				float3 lerpResult454_g38116 = lerp( lerpResult465_g38116 , ( lerpResult465_g38116 + lerpResult457_g38116 ) , _MASK_VERTICAL_Y383_g38116);
				float _MASK_VERTICAL_Y_NEG413_g38116 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.0 );
				float3 lerpResult477_g38116 = lerp( float3( 0,0,0 ) , lerpResult454_g38116 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g38116 ));
				float3 m_Swirling456_g38116 = lerpResult477_g38116;
				float2 texCoord196_g38118 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38118 = IN.ase_texcoord5;
				float2 blendOpSrc197_g38118 = texCoord196_g38118;
				float2 blendOpDest197_g38118 = (_FLOWMAP_Map89_g38118).xy;
				float2 temp_output_197_0_g38118 = ( saturate( (( blendOpDest197_g38118 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38118 ) * ( 1.0 - blendOpSrc197_g38118 ) ) : ( 2.0 * blendOpDest197_g38118 * blendOpSrc197_g38118 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38118 = FlowSpeed365_g38116;
				float temp_output_182_0_g38118 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38118 );
				float temp_output_194_0_g38118 = (0.0 + (( ( temp_output_182_0_g38118 - floor( ( temp_output_182_0_g38118 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g38118 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g38118 = ( -temp_output_194_0_g38118 * _FLOWMAP_FlowStrength146_g38118 );
				float2 lerpResult198_g38118 = lerp( temp_output_197_0_g38118 , texCoord196_g38118 , _TIME_UV_A199_g38118);
				float2 INPUT_MAP_TILLING128_g38116 = appendResult235_g38116;
				float2 texCoord205_g38118 = IN.ase_texcoord3.xy * INPUT_MAP_TILLING128_g38116 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38118 = texCoord205_g38118;
				float2 FLOW_A201_g38118 = ( lerpResult198_g38118 + TEXTURE_TILLING211_g38118 );
				float temp_output_225_0_g38118 = (temp_output_182_0_g38118*1.0 + 0.5);
				float _TIME_UV_B214_g38118 = ( -(0.0 + (( ( temp_output_225_0_g38118 - floor( ( temp_output_225_0_g38118 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38118 );
				float2 lerpResult229_g38118 = lerp( temp_output_197_0_g38118 , texCoord196_g38118 , _TIME_UV_B214_g38118);
				float2 FLOW_B232_g38118 = ( lerpResult229_g38118 + TEXTURE_TILLING211_g38118 );
				float TIME_BLEND235_g38118 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38118 / 0.5 ) ) ) );
				float4 lerpResult317_g38116 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g38118 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g38118 ) , TIME_BLEND235_g38118);
				float4 temp_output_1_0_g38124 = lerpResult317_g38116;
				float NormalStrength152_g38116 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g38124 = NormalStrength152_g38116;
				float3 unpack52_g38124 = UnpackNormalScale( temp_output_1_0_g38124, temp_output_8_0_g38124 );
				unpack52_g38124.z = lerp( 1, unpack52_g38124.z, saturate(temp_output_8_0_g38124) );
				float3 temp_output_483_59_g38116 = unpack52_g38124;
				float3 lerpResult466_g38116 = lerp( float3( 0,0,0 ) , temp_output_483_59_g38116 , _MASK_VERTICAL_Z381_g38116);
				float3 lerpResult453_g38116 = lerp( float3( 0,0,0 ) , temp_output_483_59_g38116 , _MASK_VERTICAL_X373_g38116);
				float3 lerpResult460_g38116 = lerp( lerpResult466_g38116 , ( lerpResult466_g38116 + lerpResult453_g38116 ) , _MASK_VERTICAL_Y383_g38116);
				float3 lerpResult411_g38116 = lerp( float3( 0,0,0 ) , lerpResult460_g38116 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g38116 ));
				float3 m_FlowMap456_g38116 = lerpResult411_g38116;
				float3 localfloat3switch456_g38116 = float3switch456_g38116( m_switch456_g38116 , m_Off456_g38116 , m_Swirling456_g38116 , m_FlowMap456_g38116 );
				float2 weightedBlendVar1711_g3661 = IN.ase_texcoord3.xy;
				float3 weightedBlend1711_g3661 = ( weightedBlendVar1711_g3661.x*localfloat3switch238_g38135 + weightedBlendVar1711_g3661.y*localfloat3switch456_g38116 );
				float3 NORMAL_IN84_g38163 = ( weightedBlend1711_g3661 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g38163 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord3.z;
				float eyeDepth7_g38163 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g38163 = ( (NORMAL_IN84_g38163).xy * ( REFACTED_SCALE_FLOAT78_g38163 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g38163 - eyeDepth ) ) );
				float eyeDepth27_g38163 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g38163, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g38163 = (( float4( ( temp_output_21_0_g38163 * saturate( ( eyeDepth27_g38163 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g38163 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g38163 ), 1.0 );
				float4 REFRACTED_DEPTH144_g3661 = fetchOpaqueVal89_g38163;
				float temp_output_20_0_g3661 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g3661 = 0.0;
				#else
				float staticSwitch37_g3661 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g3661*-5.0 + 1.0) ) ) ) * temp_output_20_0_g3661 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g3661 = staticSwitch37_g3661;
				float4 lerpResult105_g3661 = lerp( COLOR_TINT161_g3661 , REFRACTED_DEPTH144_g3661 , DEPTH_TINT_ALPHA93_g3661);
				float4 _MASK_VECTOR1199_g38104 = float4(0.001,0.001,0.001,0);
				int m_switch278_g38104 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g38104 = float4( 0,0,0,0 );
				float mulTime806_g38104 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g38104 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g38104 = ( FlowSpeed1146_g38104 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g38104).xx;
				float2 appendResult219_g38104 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g38104 = ( appendResult219_g38104 * float2( 2,2 ) );
				float2 texCoord487_g38104 = IN.ase_texcoord3.xy * temp_output_1294_0_g38104 + float2( 0,0 );
				float cos485_g38104 = cos( _G_FlowSwirling.x );
				float sin485_g38104 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38104 = mul( texCoord487_g38104 - float2( 0,0 ) , float2x2( cos485_g38104 , -sin485_g38104 , sin485_g38104 , cos485_g38104 )) + float2( 0,0 );
				float2 panner483_g38104 = ( mulTime806_g38104 * temp_cast_14 + rotator485_g38104);
				float2 temp_cast_15 = (temp_output_1150_0_g38104).xx;
				float cos481_g38104 = cos( _G_FlowSwirling.y );
				float sin481_g38104 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38104 = mul( texCoord487_g38104 - float2( 0,0 ) , float2x2( cos481_g38104 , -sin481_g38104 , sin481_g38104 , cos481_g38104 )) + float2( 0,0 );
				float2 panner480_g38104 = ( mulTime806_g38104 * temp_cast_15 + rotator481_g38104);
				float2 temp_cast_16 = (temp_output_1150_0_g38104).xx;
				float2 panner478_g38104 = ( mulTime806_g38104 * temp_cast_16 + texCoord487_g38104);
				float4 OUT_SWIRLING298_g38104 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner483_g38104 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner480_g38104 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner478_g38104 ) ) );
				float4 m_Swirling278_g38104 = OUT_SWIRLING298_g38104;
				float2 texCoord196_g38109 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38109 = IN.ase_texcoord5;
				float2 blendOpSrc197_g38109 = texCoord196_g38109;
				float2 blendOpDest197_g38109 = (_FLOWMAP_Map89_g38109).xy;
				float2 temp_output_197_0_g38109 = ( saturate( (( blendOpDest197_g38109 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38109 ) * ( 1.0 - blendOpSrc197_g38109 ) ) : ( 2.0 * blendOpDest197_g38109 * blendOpSrc197_g38109 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38109 = FlowSpeed1146_g38104;
				float temp_output_182_0_g38109 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38109 );
				float temp_output_194_0_g38109 = (0.0 + (( ( temp_output_182_0_g38109 - floor( ( temp_output_182_0_g38109 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g38104 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38109 = FlowStrength1147_g38104;
				float _TIME_UV_A199_g38109 = ( -temp_output_194_0_g38109 * _FLOWMAP_FlowStrength146_g38109 );
				float2 lerpResult198_g38109 = lerp( temp_output_197_0_g38109 , texCoord196_g38109 , _TIME_UV_A199_g38109);
				float2 INPUT_MAP_TILLING128_g38104 = temp_output_1294_0_g38104;
				float2 texCoord205_g38109 = IN.ase_texcoord3.xy * INPUT_MAP_TILLING128_g38104 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38109 = texCoord205_g38109;
				float2 FLOW_A201_g38109 = ( lerpResult198_g38109 + TEXTURE_TILLING211_g38109 );
				float temp_output_225_0_g38109 = (temp_output_182_0_g38109*1.0 + 0.5);
				float _TIME_UV_B214_g38109 = ( -(0.0 + (( ( temp_output_225_0_g38109 - floor( ( temp_output_225_0_g38109 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38109 );
				float2 lerpResult229_g38109 = lerp( temp_output_197_0_g38109 , texCoord196_g38109 , _TIME_UV_B214_g38109);
				float2 FLOW_B232_g38109 = ( lerpResult229_g38109 + TEXTURE_TILLING211_g38109 );
				float TIME_BLEND235_g38109 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38109 / 0.5 ) ) ) );
				float4 lerpResult1117_g38104 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38109 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38109 ) , TIME_BLEND235_g38109);
				float4 OUT_FLOW_FLOWMAP1119_g38104 = lerpResult1117_g38104;
				float4 m_FlowMap278_g38104 = OUT_FLOW_FLOWMAP1119_g38104;
				float4 localfloat4switch278_g38104 = float4switch278_g38104( m_switch278_g38104 , m_Off278_g38104 , m_Swirling278_g38104 , m_FlowMap278_g38104 );
				float clampDepth2_g38130 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g38130 = clampDepth2_g38130;
				float4 localCalculateObliqueFrustumCorrection3_g38154 = CalculateObliqueFrustumCorrection();
				float dotResult4_g38154 = dot( float4( IN.ase_texcoord6.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g38154 );
				float correctionFactor1_g38130 = dotResult4_g38154;
				float localCorrectedLinearEyeDepth1_g38130 = CorrectedLinearEyeDepth( z1_g38130 , correctionFactor1_g38130 );
				float eyeDepth18_g38130 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g38130 = ( eyeDepth18_g38130 - screenPos.w );
				float temp_output_13_0_g38130 = ( localCorrectedLinearEyeDepth1_g38130 - abs( temp_output_17_0_g38130 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g3661 = saturate( temp_output_13_0_g38130 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38104 = temp_cast_20;
				float3 unityObjectToViewPos262_g38104 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float GRAB_SCREEN_DEPTH73_g3661 = localCorrectedLinearEyeDepth1_g38130;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38104 = temp_cast_21;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g3661 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38104 = temp_cast_23;
				float4 lerpResult281_g38104 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g38104 * _FOAMVERTICAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38104 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g38104.z + GRAB_SCREEN_DEPTH310_g38104 ) - temp_cast_22 ) * GRAB_SCREEN_CLOSENESS312_g38104 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g38104 ) ) ));
				float4 lerpResult265_g38104 = lerp( float4( 0,0,0,0 ) , lerpResult281_g38104 , FlowStrength1147_g38104);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g38104 = ( abs( ase_worldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g38104 = ( break1161_g38104.z + 0.45 );
				float4 lerpResult1173_g38104 = lerp( _MASK_VECTOR1199_g38104 , lerpResult265_g38104 , _MASK_VERTICAL_Z1162_g38104);
				float _MASK_VERTICAL_X1170_g38104 = ( break1161_g38104.x + 0.46 );
				float4 lerpResult1176_g38104 = lerp( _MASK_VECTOR1199_g38104 , lerpResult265_g38104 , _MASK_VERTICAL_X1170_g38104);
				float _MASK_VERTICAL_Y1163_g38104 = ( -break1161_g38104.y + 6.5 );
				float4 lerpResult1179_g38104 = lerp( lerpResult1173_g38104 , ( lerpResult1173_g38104 + lerpResult1176_g38104 ) , _MASK_VERTICAL_Y1163_g38104);
				float4 temp_output_1189_0_g38104 = saturate( lerpResult1179_g38104 );
				float4 FOAM_VERTICAL_OFFSHORE655_g3661 = temp_output_1189_0_g38104;
				float4 _MASK_VECTOR1200_g38156 = float4(0.001,0.001,0.001,0);
				int m_switch278_g38156 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g38156 = float4( 0,0,0,0 );
				float mulTime806_g38156 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g38156 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g38156 = ( Speed1146_g38156 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g38156).xx;
				float2 appendResult219_g38156 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g38156 = ( appendResult219_g38156 * float2( 2,2 ) );
				float2 texCoord487_g38156 = IN.ase_texcoord3.xy * temp_output_1214_0_g38156 + float2( 0,0 );
				float cos485_g38156 = cos( _G_FlowSwirling.x );
				float sin485_g38156 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38156 = mul( texCoord487_g38156 - float2( 0,0 ) , float2x2( cos485_g38156 , -sin485_g38156 , sin485_g38156 , cos485_g38156 )) + float2( 0,0 );
				float2 panner483_g38156 = ( mulTime806_g38156 * temp_cast_27 + rotator485_g38156);
				float2 temp_cast_28 = (temp_output_1150_0_g38156).xx;
				float cos481_g38156 = cos( _G_FlowSwirling.y );
				float sin481_g38156 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38156 = mul( texCoord487_g38156 - float2( 0,0 ) , float2x2( cos481_g38156 , -sin481_g38156 , sin481_g38156 , cos481_g38156 )) + float2( 0,0 );
				float2 panner480_g38156 = ( mulTime806_g38156 * temp_cast_28 + rotator481_g38156);
				float2 temp_cast_29 = (temp_output_1150_0_g38156).xx;
				float2 panner478_g38156 = ( mulTime806_g38156 * temp_cast_29 + texCoord487_g38156);
				float4 OUT_SWIRLING298_g38156 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner483_g38156 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner480_g38156 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner478_g38156 ) ) );
				float4 m_Swirling278_g38156 = OUT_SWIRLING298_g38156;
				float2 texCoord196_g38161 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38161 = IN.ase_texcoord5;
				float2 blendOpSrc197_g38161 = texCoord196_g38161;
				float2 blendOpDest197_g38161 = (_FLOWMAP_Map89_g38161).xy;
				float2 temp_output_197_0_g38161 = ( saturate( (( blendOpDest197_g38161 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38161 ) * ( 1.0 - blendOpSrc197_g38161 ) ) : ( 2.0 * blendOpDest197_g38161 * blendOpSrc197_g38161 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38161 = Speed1146_g38156;
				float temp_output_182_0_g38161 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38161 );
				float temp_output_194_0_g38161 = (0.0 + (( ( temp_output_182_0_g38161 - floor( ( temp_output_182_0_g38161 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g38156 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38161 = FlowStrength1147_g38156;
				float _TIME_UV_A199_g38161 = ( -temp_output_194_0_g38161 * _FLOWMAP_FlowStrength146_g38161 );
				float2 lerpResult198_g38161 = lerp( temp_output_197_0_g38161 , texCoord196_g38161 , _TIME_UV_A199_g38161);
				float2 INPUT_MAP_TILLING128_g38156 = temp_output_1214_0_g38156;
				float2 texCoord205_g38161 = IN.ase_texcoord3.xy * INPUT_MAP_TILLING128_g38156 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38161 = texCoord205_g38161;
				float2 FLOW_A201_g38161 = ( lerpResult198_g38161 + TEXTURE_TILLING211_g38161 );
				float temp_output_225_0_g38161 = (temp_output_182_0_g38161*1.0 + 0.5);
				float _TIME_UV_B214_g38161 = ( -(0.0 + (( ( temp_output_225_0_g38161 - floor( ( temp_output_225_0_g38161 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38161 );
				float2 lerpResult229_g38161 = lerp( temp_output_197_0_g38161 , texCoord196_g38161 , _TIME_UV_B214_g38161);
				float2 FLOW_B232_g38161 = ( lerpResult229_g38161 + TEXTURE_TILLING211_g38161 );
				float TIME_BLEND235_g38161 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38161 / 0.5 ) ) ) );
				float4 lerpResult1117_g38156 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38161 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38161 ) , TIME_BLEND235_g38161);
				float4 OUT_FLOW_FLOWMAP1119_g38156 = lerpResult1117_g38156;
				float4 m_FlowMap278_g38156 = OUT_FLOW_FLOWMAP1119_g38156;
				float4 localfloat4switch278_g38156 = float4switch278_g38156( m_switch278_g38156 , m_Off278_g38156 , m_Swirling278_g38156 , m_FlowMap278_g38156 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38156 = temp_cast_32;
				float3 unityObjectToViewPos262_g38156 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38156 = temp_cast_33;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38156 = temp_cast_35;
				float4 lerpResult281_g38156 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g38156 * _FOAMHORIZONTAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38156 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g38156.z + GRAB_SCREEN_DEPTH310_g38156 ) - temp_cast_34 ) * GRAB_SCREEN_CLOSENESS312_g38156 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g38156 ) ) ));
				float4 lerpResult265_g38156 = lerp( float4( 0,0,0,0 ) , lerpResult281_g38156 , FlowStrength1147_g38156);
				float _MASK_HORIZONTAL1160_g38156 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.7 );
				float4 lerpResult1185_g38156 = lerp( _MASK_VECTOR1200_g38156 , lerpResult265_g38156 , _MASK_HORIZONTAL1160_g38156);
				float4 temp_output_1188_0_g38156 = saturate( lerpResult1185_g38156 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g3661 = temp_output_1188_0_g38156;
				int m_switch278_g38145 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g38145 = float4( 0,0,0,0 );
				float mulTime806_g38145 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g38145 = _FoamShoreline_Speed;
				float temp_output_1185_0_g38145 = ( FlowSpeed1179_g38145 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g38145).xx;
				float2 appendResult219_g38145 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g38145 = ( appendResult219_g38145 * float2( 2,2 ) );
				float2 texCoord487_g38145 = IN.ase_texcoord3.xy * temp_output_1196_0_g38145 + float2( 0,0 );
				float cos485_g38145 = cos( _G_FlowSwirling.x );
				float sin485_g38145 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38145 = mul( texCoord487_g38145 - float2( 0,0 ) , float2x2( cos485_g38145 , -sin485_g38145 , sin485_g38145 , cos485_g38145 )) + float2( 0,0 );
				float2 panner483_g38145 = ( mulTime806_g38145 * temp_cast_38 + rotator485_g38145);
				float2 temp_cast_39 = (temp_output_1185_0_g38145).xx;
				float cos481_g38145 = cos( _G_FlowSwirling.y );
				float sin481_g38145 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38145 = mul( texCoord487_g38145 - float2( 0,0 ) , float2x2( cos481_g38145 , -sin481_g38145 , sin481_g38145 , cos481_g38145 )) + float2( 0,0 );
				float2 panner480_g38145 = ( mulTime806_g38145 * temp_cast_39 + rotator481_g38145);
				float2 temp_cast_40 = (temp_output_1185_0_g38145).xx;
				float2 panner478_g38145 = ( mulTime806_g38145 * temp_cast_40 + texCoord487_g38145);
				float4 OUT_SWIRLING298_g38145 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner483_g38145 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner480_g38145 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner478_g38145 ) ) );
				float4 m_Swirling278_g38145 = OUT_SWIRLING298_g38145;
				float2 texCoord196_g38150 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38150 = IN.ase_texcoord5;
				float2 blendOpSrc197_g38150 = texCoord196_g38150;
				float2 blendOpDest197_g38150 = (_FLOWMAP_Map89_g38150).xy;
				float2 temp_output_197_0_g38150 = ( saturate( (( blendOpDest197_g38150 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38150 ) * ( 1.0 - blendOpSrc197_g38150 ) ) : ( 2.0 * blendOpDest197_g38150 * blendOpSrc197_g38150 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38150 = FlowSpeed1179_g38145;
				float temp_output_182_0_g38150 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38150 );
				float temp_output_194_0_g38150 = (0.0 + (( ( temp_output_182_0_g38150 - floor( ( temp_output_182_0_g38150 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1182_g38145 = _FoamShoreline_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38150 = FlowStrength1182_g38145;
				float _TIME_UV_A199_g38150 = ( -temp_output_194_0_g38150 * _FLOWMAP_FlowStrength146_g38150 );
				float2 lerpResult198_g38150 = lerp( temp_output_197_0_g38150 , texCoord196_g38150 , _TIME_UV_A199_g38150);
				float2 INPUT_MAP_TILLING128_g38145 = temp_output_1196_0_g38145;
				float2 texCoord205_g38150 = IN.ase_texcoord3.xy * INPUT_MAP_TILLING128_g38145 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38150 = texCoord205_g38150;
				float2 FLOW_A201_g38150 = ( lerpResult198_g38150 + TEXTURE_TILLING211_g38150 );
				float temp_output_225_0_g38150 = (temp_output_182_0_g38150*1.0 + 0.5);
				float _TIME_UV_B214_g38150 = ( -(0.0 + (( ( temp_output_225_0_g38150 - floor( ( temp_output_225_0_g38150 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38150 );
				float2 lerpResult229_g38150 = lerp( temp_output_197_0_g38150 , texCoord196_g38150 , _TIME_UV_B214_g38150);
				float2 FLOW_B232_g38150 = ( lerpResult229_g38150 + TEXTURE_TILLING211_g38150 );
				float TIME_BLEND235_g38150 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38150 / 0.5 ) ) ) );
				float4 lerpResult1153_g38145 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38150 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38150 ) , TIME_BLEND235_g38150);
				float4 OUT_FLOW_FLOWMAP1156_g38145 = lerpResult1153_g38145;
				float4 m_FlowMap278_g38145 = OUT_FLOW_FLOWMAP1156_g38145;
				float4 localfloat4switch278_g38145 = float4switch278_g38145( m_switch278_g38145 , m_Off278_g38145 , m_Swirling278_g38145 , m_FlowMap278_g38145 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38145 = temp_cast_43;
				float3 unityObjectToViewPos731_g38145 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38145 = temp_cast_44;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38145 = temp_cast_46;
				float4 lerpResult769_g38145 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g38145 * _FoamShoreline_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38145 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g38145.z + GRAB_SCREEN_DEPTH310_g38145 ) - temp_cast_45 ) * GRAB_SCREEN_CLOSENESS312_g38145 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * GRAB_SCREEN_CLOSENESS312_g38145 ) ) ));
				float4 lerpResult761_g38145 = lerp( float4( 0,0,0,0 ) , lerpResult769_g38145 , FlowStrength1182_g38145);
				float4 FOAM_SHORELINE654_g3661 = lerpResult761_g38145;
				float4 temp_output_1492_0_g3661 = ( ( ( lerpResult105_g3661 + FOAM_VERTICAL_OFFSHORE655_g3661 ) + FOAM_HORIZONTAL_OFFSHORE1565_g3661 ) + FOAM_SHORELINE654_g3661 );
				float4 temp_output_746_0_g39462 = temp_output_1492_0_g3661;
				
				
				float3 Albedo = ( temp_output_746_0_g39462 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
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

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite [_ZWriteMode]
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half4 _SpecularColor;
			float4 _FoamShoreline_Tint;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FOAMHORIZONTAL_Tint;
			float _Vertical_SmoothEdge;
			float _Vertical_Speed;
			float _Vertical_Rows;
			float _Vertical_Columns;
			float _Vertical_ScreenContribution;
			float _Vertical_TilingY;
			float _Vertical_TilingX;
			int _Vertical_ModeUV;
			int _ZWriteMode;
			float _SMOOTHNESS_Strength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			int _Vertical_RainMode;
			float _Rain_WetnessDarken;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _URP_SpecularStrength;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_FresnelPower;
			float _FoamShoreline_FlowStrength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _Horizontal_Speed;
			float _Horizontal_Rows;
			float _Horizontal_Columns;
			float _Horizontal_ScreenContribution;
			float _Horizontal_OffsetY;
			float _Horizontal_OffsetX;
			float _Horizontal_TilingY;
			float _Horizontal_TilingX;
			int _Horizontal_ModeUV;
			int _Horizontal_RainMode;
			float _Static_Intensity;
			float _Static_ScreenContribution;
			float _Static_OffsetY;
			float _Static_OffsetX;
			float _Static_TilingY;
			float _Static_TilingX;
			int _Static_ModeUV;
			int _Static_RainMode;
			float _SMOOTHNESS_FresnelScale;
			float _TilingY_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_Timescale;
			int _WaterNormal_Vertical_FlowType;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			float _WaterNormal_Vertical_TilingY;
			float _TilingX_Shoreline;
			float _WaterNormal_Vertical_NormalStrength;
			float _RefractionScale;
			float _FoamShoreline_Timescale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FOAMHORIZONTAL_TilingY;
			float _FOAMHORIZONTAL_TilingX;
			float _FOAMHORIZONTAL_Speed;
			float _FOAMHORIZONTAL_Timescale;
			int _FOAMHORIZONTAL_ModeFlowType;
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
			float _WaterNormal_Vertical_FlowStrength;
			int _Rain_GlobalWetnessMode;
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
			
			float3 float3switch238_g38135( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float3 float3switch456_g38116( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float4 float4switch278_g38104( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
			
			float4 float4switch278_g38156( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
			
			float4 float4switch278_g38145( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
				o.ase_texcoord3.z = eyeDepth;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_texcoord5 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord6 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				
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

				float4 screenPos = IN.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g3661 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g3661 = abs( ( screenDepth2_g3661 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g3661 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g3661*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g3661 = lerp( _DepthTint , lerpResult25_g3661 , saturate( (distanceDepth2_g3661*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g3661 = lerpResult27_g3661;
				int m_switch238_g38135 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g38135 = float3(0,0,0.001);
				float mulTime155_g38135 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g38135 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g38135 = ( FlowSpeed365_g38135 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g38135).xx;
				float2 appendResult235_g38135 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g38135 = IN.ase_texcoord3.xy * ( appendResult235_g38135 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g38135 = cos( _G_FlowSwirling.x );
				float sin62_g38135 = sin( _G_FlowSwirling.x );
				float2 rotator62_g38135 = mul( texCoord23_g38135 - float2( 0,0 ) , float2x2( cos62_g38135 , -sin62_g38135 , sin62_g38135 , cos62_g38135 )) + float2( 0,0 );
				float2 panner15_g38135 = ( mulTime155_g38135 * temp_cast_0 + rotator62_g38135);
				float2 temp_cast_1 = (temp_output_367_0_g38135).xx;
				float cos8_g38135 = cos( _G_FlowSwirling.y );
				float sin8_g38135 = sin( _G_FlowSwirling.y );
				float2 rotator8_g38135 = mul( texCoord23_g38135 - float2( 0,0 ) , float2x2( cos8_g38135 , -sin8_g38135 , sin8_g38135 , cos8_g38135 )) + float2( 0,0 );
				float2 panner16_g38135 = ( mulTime155_g38135 * temp_cast_1 + rotator8_g38135);
				float2 temp_cast_2 = (temp_output_367_0_g38135).xx;
				float2 panner17_g38135 = ( mulTime155_g38135 * temp_cast_2 + texCoord23_g38135);
				float2 layeredBlendVar666_g38135 = IN.ase_texcoord3.xy;
				float4 layeredBlend666_g38135 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g38135 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g38135 ) , layeredBlendVar666_g38135.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g38135 ) , layeredBlendVar666_g38135.y ) );
				float4 temp_output_1_0_g38136 = layeredBlend666_g38135;
				float temp_output_8_0_g38136 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g38136 = UnpackNormalScale( temp_output_1_0_g38136, temp_output_8_0_g38136 );
				unpack52_g38136.z = lerp( 1, unpack52_g38136.z, saturate(temp_output_8_0_g38136) );
				float3 temp_output_699_59_g38135 = unpack52_g38136;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 temp_output_372_0_g38135 = abs( ase_worldNormal );
				float3 break386_g38135 = ( temp_output_372_0_g38135 * temp_output_372_0_g38135 );
				float _MASK_VERTICAL_Z381_g38135 = ( break386_g38135.z + 0.01 );
				float3 lerpResult677_g38135 = lerp( float3( 0,0,0 ) , temp_output_699_59_g38135 , _MASK_VERTICAL_Z381_g38135);
				float _MASK_VERTICAL_X373_g38135 = ( -break386_g38135.x + 0.2 );
				float3 lerpResult681_g38135 = lerp( float3( 0,0,0 ) , temp_output_699_59_g38135 , _MASK_VERTICAL_X373_g38135);
				float _MASK_VERTICAL_Y_NEG413_g38135 = ( ( ase_worldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g38135 = lerp( float3( 0,0,0 ) , ( lerpResult677_g38135 + lerpResult681_g38135 ) , _MASK_VERTICAL_Y_NEG413_g38135);
				float3 m_Swirling238_g38135 = lerpResult679_g38135;
				float2 texCoord196_g38140 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38140 = IN.ase_texcoord5;
				float2 blendOpSrc197_g38140 = texCoord196_g38140;
				float2 blendOpDest197_g38140 = (_FLOWMAP_Map89_g38140).xy;
				float2 temp_output_197_0_g38140 = ( saturate( (( blendOpDest197_g38140 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38140 ) * ( 1.0 - blendOpSrc197_g38140 ) ) : ( 2.0 * blendOpDest197_g38140 * blendOpSrc197_g38140 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38140 = FlowSpeed365_g38135;
				float temp_output_182_0_g38140 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38140 );
				float temp_output_194_0_g38140 = (0.0 + (( ( temp_output_182_0_g38140 - floor( ( temp_output_182_0_g38140 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g38140 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g38140 = ( -temp_output_194_0_g38140 * _FLOWMAP_FlowStrength146_g38140 );
				float2 lerpResult198_g38140 = lerp( temp_output_197_0_g38140 , texCoord196_g38140 , _TIME_UV_A199_g38140);
				float2 INPUT_MAP_TILLING128_g38135 = appendResult235_g38135;
				float2 texCoord205_g38140 = IN.ase_texcoord3.xy * INPUT_MAP_TILLING128_g38135 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38140 = texCoord205_g38140;
				float2 FLOW_A201_g38140 = ( lerpResult198_g38140 + TEXTURE_TILLING211_g38140 );
				float temp_output_225_0_g38140 = (temp_output_182_0_g38140*1.0 + 0.5);
				float _TIME_UV_B214_g38140 = ( -(0.0 + (( ( temp_output_225_0_g38140 - floor( ( temp_output_225_0_g38140 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38140 );
				float2 lerpResult229_g38140 = lerp( temp_output_197_0_g38140 , texCoord196_g38140 , _TIME_UV_B214_g38140);
				float2 FLOW_B232_g38140 = ( lerpResult229_g38140 + TEXTURE_TILLING211_g38140 );
				float TIME_BLEND235_g38140 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38140 / 0.5 ) ) ) );
				float4 lerpResult317_g38135 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g38140 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g38140 ) , TIME_BLEND235_g38140);
				float4 temp_output_1_0_g38142 = lerpResult317_g38135;
				float NormalStrength152_g38135 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g38142 = NormalStrength152_g38135;
				float3 unpack52_g38142 = UnpackNormalScale( temp_output_1_0_g38142, temp_output_8_0_g38142 );
				unpack52_g38142.z = lerp( 1, unpack52_g38142.z, saturate(temp_output_8_0_g38142) );
				float3 temp_output_701_59_g38135 = unpack52_g38142;
				float3 lerpResult692_g38135 = lerp( float3( 0,0,0 ) , temp_output_701_59_g38135 , _MASK_VERTICAL_Z381_g38135);
				float3 lerpResult691_g38135 = lerp( float3( 0,0,0 ) , temp_output_701_59_g38135 , _MASK_VERTICAL_X373_g38135);
				float3 lerpResult697_g38135 = lerp( float3( 0,0,0 ) , ( lerpResult692_g38135 + lerpResult691_g38135 ) , _MASK_VERTICAL_Y_NEG413_g38135);
				float3 m_FlowMap238_g38135 = lerpResult697_g38135;
				float3 localfloat3switch238_g38135 = float3switch238_g38135( m_switch238_g38135 , m_Off238_g38135 , m_Swirling238_g38135 , m_FlowMap238_g38135 );
				int m_switch456_g38116 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g38116 = float3(0,0,0.001);
				float mulTime155_g38116 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g38116 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g38116 = ( FlowSpeed365_g38116 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g38116).xx;
				float2 appendResult235_g38116 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g38116 = IN.ase_texcoord3.xy * ( appendResult235_g38116 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g38116 = cos( _G_FlowSwirling.x );
				float sin62_g38116 = sin( _G_FlowSwirling.x );
				float2 rotator62_g38116 = mul( texCoord23_g38116 - float2( 0,0 ) , float2x2( cos62_g38116 , -sin62_g38116 , sin62_g38116 , cos62_g38116 )) + float2( 0,0 );
				float2 panner15_g38116 = ( mulTime155_g38116 * temp_cast_5 + rotator62_g38116);
				float2 temp_cast_6 = (temp_output_367_0_g38116).xx;
				float cos8_g38116 = cos( _G_FlowSwirling.y );
				float sin8_g38116 = sin( _G_FlowSwirling.y );
				float2 rotator8_g38116 = mul( texCoord23_g38116 - float2( 0,0 ) , float2x2( cos8_g38116 , -sin8_g38116 , sin8_g38116 , cos8_g38116 )) + float2( 0,0 );
				float2 panner16_g38116 = ( mulTime155_g38116 * temp_cast_6 + rotator8_g38116);
				float2 temp_cast_7 = (temp_output_367_0_g38116).xx;
				float2 panner17_g38116 = ( mulTime155_g38116 * temp_cast_7 + texCoord23_g38116);
				float2 layeredBlendVar448_g38116 = IN.ase_texcoord3.xy;
				float4 layeredBlend448_g38116 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g38116 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g38116 ) , layeredBlendVar448_g38116.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g38116 ) , layeredBlendVar448_g38116.y ) );
				float4 temp_output_1_0_g38120 = layeredBlend448_g38116;
				float temp_output_8_0_g38120 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g38120 = UnpackNormalScale( temp_output_1_0_g38120, temp_output_8_0_g38120 );
				unpack52_g38120.z = lerp( 1, unpack52_g38120.z, saturate(temp_output_8_0_g38120) );
				float3 temp_output_481_59_g38116 = unpack52_g38120;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g38116 = ( abs( ase_worldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g38116 = ( break386_g38116.z + 0.75 );
				float3 lerpResult465_g38116 = lerp( float3( 0,0,0 ) , temp_output_481_59_g38116 , _MASK_VERTICAL_Z381_g38116);
				float _MASK_VERTICAL_X373_g38116 = ( break386_g38116.x + 0.45 );
				float3 lerpResult457_g38116 = lerp( float3( 0,0,0 ) , temp_output_481_59_g38116 , _MASK_VERTICAL_X373_g38116);
				float _MASK_VERTICAL_Y383_g38116 = ( -break386_g38116.y + 5.0 );
				float3 lerpResult454_g38116 = lerp( lerpResult465_g38116 , ( lerpResult465_g38116 + lerpResult457_g38116 ) , _MASK_VERTICAL_Y383_g38116);
				float _MASK_VERTICAL_Y_NEG413_g38116 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.0 );
				float3 lerpResult477_g38116 = lerp( float3( 0,0,0 ) , lerpResult454_g38116 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g38116 ));
				float3 m_Swirling456_g38116 = lerpResult477_g38116;
				float2 texCoord196_g38118 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38118 = IN.ase_texcoord5;
				float2 blendOpSrc197_g38118 = texCoord196_g38118;
				float2 blendOpDest197_g38118 = (_FLOWMAP_Map89_g38118).xy;
				float2 temp_output_197_0_g38118 = ( saturate( (( blendOpDest197_g38118 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38118 ) * ( 1.0 - blendOpSrc197_g38118 ) ) : ( 2.0 * blendOpDest197_g38118 * blendOpSrc197_g38118 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38118 = FlowSpeed365_g38116;
				float temp_output_182_0_g38118 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38118 );
				float temp_output_194_0_g38118 = (0.0 + (( ( temp_output_182_0_g38118 - floor( ( temp_output_182_0_g38118 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g38118 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g38118 = ( -temp_output_194_0_g38118 * _FLOWMAP_FlowStrength146_g38118 );
				float2 lerpResult198_g38118 = lerp( temp_output_197_0_g38118 , texCoord196_g38118 , _TIME_UV_A199_g38118);
				float2 INPUT_MAP_TILLING128_g38116 = appendResult235_g38116;
				float2 texCoord205_g38118 = IN.ase_texcoord3.xy * INPUT_MAP_TILLING128_g38116 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38118 = texCoord205_g38118;
				float2 FLOW_A201_g38118 = ( lerpResult198_g38118 + TEXTURE_TILLING211_g38118 );
				float temp_output_225_0_g38118 = (temp_output_182_0_g38118*1.0 + 0.5);
				float _TIME_UV_B214_g38118 = ( -(0.0 + (( ( temp_output_225_0_g38118 - floor( ( temp_output_225_0_g38118 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38118 );
				float2 lerpResult229_g38118 = lerp( temp_output_197_0_g38118 , texCoord196_g38118 , _TIME_UV_B214_g38118);
				float2 FLOW_B232_g38118 = ( lerpResult229_g38118 + TEXTURE_TILLING211_g38118 );
				float TIME_BLEND235_g38118 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38118 / 0.5 ) ) ) );
				float4 lerpResult317_g38116 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g38118 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g38118 ) , TIME_BLEND235_g38118);
				float4 temp_output_1_0_g38124 = lerpResult317_g38116;
				float NormalStrength152_g38116 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g38124 = NormalStrength152_g38116;
				float3 unpack52_g38124 = UnpackNormalScale( temp_output_1_0_g38124, temp_output_8_0_g38124 );
				unpack52_g38124.z = lerp( 1, unpack52_g38124.z, saturate(temp_output_8_0_g38124) );
				float3 temp_output_483_59_g38116 = unpack52_g38124;
				float3 lerpResult466_g38116 = lerp( float3( 0,0,0 ) , temp_output_483_59_g38116 , _MASK_VERTICAL_Z381_g38116);
				float3 lerpResult453_g38116 = lerp( float3( 0,0,0 ) , temp_output_483_59_g38116 , _MASK_VERTICAL_X373_g38116);
				float3 lerpResult460_g38116 = lerp( lerpResult466_g38116 , ( lerpResult466_g38116 + lerpResult453_g38116 ) , _MASK_VERTICAL_Y383_g38116);
				float3 lerpResult411_g38116 = lerp( float3( 0,0,0 ) , lerpResult460_g38116 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g38116 ));
				float3 m_FlowMap456_g38116 = lerpResult411_g38116;
				float3 localfloat3switch456_g38116 = float3switch456_g38116( m_switch456_g38116 , m_Off456_g38116 , m_Swirling456_g38116 , m_FlowMap456_g38116 );
				float2 weightedBlendVar1711_g3661 = IN.ase_texcoord3.xy;
				float3 weightedBlend1711_g3661 = ( weightedBlendVar1711_g3661.x*localfloat3switch238_g38135 + weightedBlendVar1711_g3661.y*localfloat3switch456_g38116 );
				float3 NORMAL_IN84_g38163 = ( weightedBlend1711_g3661 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g38163 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord3.z;
				float eyeDepth7_g38163 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g38163 = ( (NORMAL_IN84_g38163).xy * ( REFACTED_SCALE_FLOAT78_g38163 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g38163 - eyeDepth ) ) );
				float eyeDepth27_g38163 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g38163, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g38163 = (( float4( ( temp_output_21_0_g38163 * saturate( ( eyeDepth27_g38163 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g38163 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g38163 ), 1.0 );
				float4 REFRACTED_DEPTH144_g3661 = fetchOpaqueVal89_g38163;
				float temp_output_20_0_g3661 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g3661 = 0.0;
				#else
				float staticSwitch37_g3661 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g3661*-5.0 + 1.0) ) ) ) * temp_output_20_0_g3661 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g3661 = staticSwitch37_g3661;
				float4 lerpResult105_g3661 = lerp( COLOR_TINT161_g3661 , REFRACTED_DEPTH144_g3661 , DEPTH_TINT_ALPHA93_g3661);
				float4 _MASK_VECTOR1199_g38104 = float4(0.001,0.001,0.001,0);
				int m_switch278_g38104 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g38104 = float4( 0,0,0,0 );
				float mulTime806_g38104 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g38104 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g38104 = ( FlowSpeed1146_g38104 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g38104).xx;
				float2 appendResult219_g38104 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g38104 = ( appendResult219_g38104 * float2( 2,2 ) );
				float2 texCoord487_g38104 = IN.ase_texcoord3.xy * temp_output_1294_0_g38104 + float2( 0,0 );
				float cos485_g38104 = cos( _G_FlowSwirling.x );
				float sin485_g38104 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38104 = mul( texCoord487_g38104 - float2( 0,0 ) , float2x2( cos485_g38104 , -sin485_g38104 , sin485_g38104 , cos485_g38104 )) + float2( 0,0 );
				float2 panner483_g38104 = ( mulTime806_g38104 * temp_cast_14 + rotator485_g38104);
				float2 temp_cast_15 = (temp_output_1150_0_g38104).xx;
				float cos481_g38104 = cos( _G_FlowSwirling.y );
				float sin481_g38104 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38104 = mul( texCoord487_g38104 - float2( 0,0 ) , float2x2( cos481_g38104 , -sin481_g38104 , sin481_g38104 , cos481_g38104 )) + float2( 0,0 );
				float2 panner480_g38104 = ( mulTime806_g38104 * temp_cast_15 + rotator481_g38104);
				float2 temp_cast_16 = (temp_output_1150_0_g38104).xx;
				float2 panner478_g38104 = ( mulTime806_g38104 * temp_cast_16 + texCoord487_g38104);
				float4 OUT_SWIRLING298_g38104 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner483_g38104 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner480_g38104 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner478_g38104 ) ) );
				float4 m_Swirling278_g38104 = OUT_SWIRLING298_g38104;
				float2 texCoord196_g38109 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38109 = IN.ase_texcoord5;
				float2 blendOpSrc197_g38109 = texCoord196_g38109;
				float2 blendOpDest197_g38109 = (_FLOWMAP_Map89_g38109).xy;
				float2 temp_output_197_0_g38109 = ( saturate( (( blendOpDest197_g38109 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38109 ) * ( 1.0 - blendOpSrc197_g38109 ) ) : ( 2.0 * blendOpDest197_g38109 * blendOpSrc197_g38109 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38109 = FlowSpeed1146_g38104;
				float temp_output_182_0_g38109 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38109 );
				float temp_output_194_0_g38109 = (0.0 + (( ( temp_output_182_0_g38109 - floor( ( temp_output_182_0_g38109 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g38104 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38109 = FlowStrength1147_g38104;
				float _TIME_UV_A199_g38109 = ( -temp_output_194_0_g38109 * _FLOWMAP_FlowStrength146_g38109 );
				float2 lerpResult198_g38109 = lerp( temp_output_197_0_g38109 , texCoord196_g38109 , _TIME_UV_A199_g38109);
				float2 INPUT_MAP_TILLING128_g38104 = temp_output_1294_0_g38104;
				float2 texCoord205_g38109 = IN.ase_texcoord3.xy * INPUT_MAP_TILLING128_g38104 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38109 = texCoord205_g38109;
				float2 FLOW_A201_g38109 = ( lerpResult198_g38109 + TEXTURE_TILLING211_g38109 );
				float temp_output_225_0_g38109 = (temp_output_182_0_g38109*1.0 + 0.5);
				float _TIME_UV_B214_g38109 = ( -(0.0 + (( ( temp_output_225_0_g38109 - floor( ( temp_output_225_0_g38109 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38109 );
				float2 lerpResult229_g38109 = lerp( temp_output_197_0_g38109 , texCoord196_g38109 , _TIME_UV_B214_g38109);
				float2 FLOW_B232_g38109 = ( lerpResult229_g38109 + TEXTURE_TILLING211_g38109 );
				float TIME_BLEND235_g38109 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38109 / 0.5 ) ) ) );
				float4 lerpResult1117_g38104 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38109 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38109 ) , TIME_BLEND235_g38109);
				float4 OUT_FLOW_FLOWMAP1119_g38104 = lerpResult1117_g38104;
				float4 m_FlowMap278_g38104 = OUT_FLOW_FLOWMAP1119_g38104;
				float4 localfloat4switch278_g38104 = float4switch278_g38104( m_switch278_g38104 , m_Off278_g38104 , m_Swirling278_g38104 , m_FlowMap278_g38104 );
				float clampDepth2_g38130 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g38130 = clampDepth2_g38130;
				float4 localCalculateObliqueFrustumCorrection3_g38154 = CalculateObliqueFrustumCorrection();
				float dotResult4_g38154 = dot( float4( IN.ase_texcoord6.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g38154 );
				float correctionFactor1_g38130 = dotResult4_g38154;
				float localCorrectedLinearEyeDepth1_g38130 = CorrectedLinearEyeDepth( z1_g38130 , correctionFactor1_g38130 );
				float eyeDepth18_g38130 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g38130 = ( eyeDepth18_g38130 - screenPos.w );
				float temp_output_13_0_g38130 = ( localCorrectedLinearEyeDepth1_g38130 - abs( temp_output_17_0_g38130 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g3661 = saturate( temp_output_13_0_g38130 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38104 = temp_cast_20;
				float3 unityObjectToViewPos262_g38104 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float GRAB_SCREEN_DEPTH73_g3661 = localCorrectedLinearEyeDepth1_g38130;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38104 = temp_cast_21;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g3661 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38104 = temp_cast_23;
				float4 lerpResult281_g38104 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g38104 * _FOAMVERTICAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38104 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g38104.z + GRAB_SCREEN_DEPTH310_g38104 ) - temp_cast_22 ) * GRAB_SCREEN_CLOSENESS312_g38104 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g38104 ) ) ));
				float4 lerpResult265_g38104 = lerp( float4( 0,0,0,0 ) , lerpResult281_g38104 , FlowStrength1147_g38104);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g38104 = ( abs( ase_worldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g38104 = ( break1161_g38104.z + 0.45 );
				float4 lerpResult1173_g38104 = lerp( _MASK_VECTOR1199_g38104 , lerpResult265_g38104 , _MASK_VERTICAL_Z1162_g38104);
				float _MASK_VERTICAL_X1170_g38104 = ( break1161_g38104.x + 0.46 );
				float4 lerpResult1176_g38104 = lerp( _MASK_VECTOR1199_g38104 , lerpResult265_g38104 , _MASK_VERTICAL_X1170_g38104);
				float _MASK_VERTICAL_Y1163_g38104 = ( -break1161_g38104.y + 6.5 );
				float4 lerpResult1179_g38104 = lerp( lerpResult1173_g38104 , ( lerpResult1173_g38104 + lerpResult1176_g38104 ) , _MASK_VERTICAL_Y1163_g38104);
				float4 temp_output_1189_0_g38104 = saturate( lerpResult1179_g38104 );
				float4 FOAM_VERTICAL_OFFSHORE655_g3661 = temp_output_1189_0_g38104;
				float4 _MASK_VECTOR1200_g38156 = float4(0.001,0.001,0.001,0);
				int m_switch278_g38156 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g38156 = float4( 0,0,0,0 );
				float mulTime806_g38156 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g38156 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g38156 = ( Speed1146_g38156 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g38156).xx;
				float2 appendResult219_g38156 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g38156 = ( appendResult219_g38156 * float2( 2,2 ) );
				float2 texCoord487_g38156 = IN.ase_texcoord3.xy * temp_output_1214_0_g38156 + float2( 0,0 );
				float cos485_g38156 = cos( _G_FlowSwirling.x );
				float sin485_g38156 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38156 = mul( texCoord487_g38156 - float2( 0,0 ) , float2x2( cos485_g38156 , -sin485_g38156 , sin485_g38156 , cos485_g38156 )) + float2( 0,0 );
				float2 panner483_g38156 = ( mulTime806_g38156 * temp_cast_27 + rotator485_g38156);
				float2 temp_cast_28 = (temp_output_1150_0_g38156).xx;
				float cos481_g38156 = cos( _G_FlowSwirling.y );
				float sin481_g38156 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38156 = mul( texCoord487_g38156 - float2( 0,0 ) , float2x2( cos481_g38156 , -sin481_g38156 , sin481_g38156 , cos481_g38156 )) + float2( 0,0 );
				float2 panner480_g38156 = ( mulTime806_g38156 * temp_cast_28 + rotator481_g38156);
				float2 temp_cast_29 = (temp_output_1150_0_g38156).xx;
				float2 panner478_g38156 = ( mulTime806_g38156 * temp_cast_29 + texCoord487_g38156);
				float4 OUT_SWIRLING298_g38156 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner483_g38156 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner480_g38156 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner478_g38156 ) ) );
				float4 m_Swirling278_g38156 = OUT_SWIRLING298_g38156;
				float2 texCoord196_g38161 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38161 = IN.ase_texcoord5;
				float2 blendOpSrc197_g38161 = texCoord196_g38161;
				float2 blendOpDest197_g38161 = (_FLOWMAP_Map89_g38161).xy;
				float2 temp_output_197_0_g38161 = ( saturate( (( blendOpDest197_g38161 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38161 ) * ( 1.0 - blendOpSrc197_g38161 ) ) : ( 2.0 * blendOpDest197_g38161 * blendOpSrc197_g38161 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38161 = Speed1146_g38156;
				float temp_output_182_0_g38161 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38161 );
				float temp_output_194_0_g38161 = (0.0 + (( ( temp_output_182_0_g38161 - floor( ( temp_output_182_0_g38161 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g38156 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38161 = FlowStrength1147_g38156;
				float _TIME_UV_A199_g38161 = ( -temp_output_194_0_g38161 * _FLOWMAP_FlowStrength146_g38161 );
				float2 lerpResult198_g38161 = lerp( temp_output_197_0_g38161 , texCoord196_g38161 , _TIME_UV_A199_g38161);
				float2 INPUT_MAP_TILLING128_g38156 = temp_output_1214_0_g38156;
				float2 texCoord205_g38161 = IN.ase_texcoord3.xy * INPUT_MAP_TILLING128_g38156 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38161 = texCoord205_g38161;
				float2 FLOW_A201_g38161 = ( lerpResult198_g38161 + TEXTURE_TILLING211_g38161 );
				float temp_output_225_0_g38161 = (temp_output_182_0_g38161*1.0 + 0.5);
				float _TIME_UV_B214_g38161 = ( -(0.0 + (( ( temp_output_225_0_g38161 - floor( ( temp_output_225_0_g38161 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38161 );
				float2 lerpResult229_g38161 = lerp( temp_output_197_0_g38161 , texCoord196_g38161 , _TIME_UV_B214_g38161);
				float2 FLOW_B232_g38161 = ( lerpResult229_g38161 + TEXTURE_TILLING211_g38161 );
				float TIME_BLEND235_g38161 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38161 / 0.5 ) ) ) );
				float4 lerpResult1117_g38156 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38161 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38161 ) , TIME_BLEND235_g38161);
				float4 OUT_FLOW_FLOWMAP1119_g38156 = lerpResult1117_g38156;
				float4 m_FlowMap278_g38156 = OUT_FLOW_FLOWMAP1119_g38156;
				float4 localfloat4switch278_g38156 = float4switch278_g38156( m_switch278_g38156 , m_Off278_g38156 , m_Swirling278_g38156 , m_FlowMap278_g38156 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38156 = temp_cast_32;
				float3 unityObjectToViewPos262_g38156 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38156 = temp_cast_33;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38156 = temp_cast_35;
				float4 lerpResult281_g38156 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g38156 * _FOAMHORIZONTAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38156 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g38156.z + GRAB_SCREEN_DEPTH310_g38156 ) - temp_cast_34 ) * GRAB_SCREEN_CLOSENESS312_g38156 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g38156 ) ) ));
				float4 lerpResult265_g38156 = lerp( float4( 0,0,0,0 ) , lerpResult281_g38156 , FlowStrength1147_g38156);
				float _MASK_HORIZONTAL1160_g38156 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.7 );
				float4 lerpResult1185_g38156 = lerp( _MASK_VECTOR1200_g38156 , lerpResult265_g38156 , _MASK_HORIZONTAL1160_g38156);
				float4 temp_output_1188_0_g38156 = saturate( lerpResult1185_g38156 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g3661 = temp_output_1188_0_g38156;
				int m_switch278_g38145 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g38145 = float4( 0,0,0,0 );
				float mulTime806_g38145 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g38145 = _FoamShoreline_Speed;
				float temp_output_1185_0_g38145 = ( FlowSpeed1179_g38145 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g38145).xx;
				float2 appendResult219_g38145 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g38145 = ( appendResult219_g38145 * float2( 2,2 ) );
				float2 texCoord487_g38145 = IN.ase_texcoord3.xy * temp_output_1196_0_g38145 + float2( 0,0 );
				float cos485_g38145 = cos( _G_FlowSwirling.x );
				float sin485_g38145 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38145 = mul( texCoord487_g38145 - float2( 0,0 ) , float2x2( cos485_g38145 , -sin485_g38145 , sin485_g38145 , cos485_g38145 )) + float2( 0,0 );
				float2 panner483_g38145 = ( mulTime806_g38145 * temp_cast_38 + rotator485_g38145);
				float2 temp_cast_39 = (temp_output_1185_0_g38145).xx;
				float cos481_g38145 = cos( _G_FlowSwirling.y );
				float sin481_g38145 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38145 = mul( texCoord487_g38145 - float2( 0,0 ) , float2x2( cos481_g38145 , -sin481_g38145 , sin481_g38145 , cos481_g38145 )) + float2( 0,0 );
				float2 panner480_g38145 = ( mulTime806_g38145 * temp_cast_39 + rotator481_g38145);
				float2 temp_cast_40 = (temp_output_1185_0_g38145).xx;
				float2 panner478_g38145 = ( mulTime806_g38145 * temp_cast_40 + texCoord487_g38145);
				float4 OUT_SWIRLING298_g38145 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner483_g38145 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner480_g38145 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner478_g38145 ) ) );
				float4 m_Swirling278_g38145 = OUT_SWIRLING298_g38145;
				float2 texCoord196_g38150 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38150 = IN.ase_texcoord5;
				float2 blendOpSrc197_g38150 = texCoord196_g38150;
				float2 blendOpDest197_g38150 = (_FLOWMAP_Map89_g38150).xy;
				float2 temp_output_197_0_g38150 = ( saturate( (( blendOpDest197_g38150 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38150 ) * ( 1.0 - blendOpSrc197_g38150 ) ) : ( 2.0 * blendOpDest197_g38150 * blendOpSrc197_g38150 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38150 = FlowSpeed1179_g38145;
				float temp_output_182_0_g38150 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38150 );
				float temp_output_194_0_g38150 = (0.0 + (( ( temp_output_182_0_g38150 - floor( ( temp_output_182_0_g38150 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1182_g38145 = _FoamShoreline_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38150 = FlowStrength1182_g38145;
				float _TIME_UV_A199_g38150 = ( -temp_output_194_0_g38150 * _FLOWMAP_FlowStrength146_g38150 );
				float2 lerpResult198_g38150 = lerp( temp_output_197_0_g38150 , texCoord196_g38150 , _TIME_UV_A199_g38150);
				float2 INPUT_MAP_TILLING128_g38145 = temp_output_1196_0_g38145;
				float2 texCoord205_g38150 = IN.ase_texcoord3.xy * INPUT_MAP_TILLING128_g38145 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38150 = texCoord205_g38150;
				float2 FLOW_A201_g38150 = ( lerpResult198_g38150 + TEXTURE_TILLING211_g38150 );
				float temp_output_225_0_g38150 = (temp_output_182_0_g38150*1.0 + 0.5);
				float _TIME_UV_B214_g38150 = ( -(0.0 + (( ( temp_output_225_0_g38150 - floor( ( temp_output_225_0_g38150 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38150 );
				float2 lerpResult229_g38150 = lerp( temp_output_197_0_g38150 , texCoord196_g38150 , _TIME_UV_B214_g38150);
				float2 FLOW_B232_g38150 = ( lerpResult229_g38150 + TEXTURE_TILLING211_g38150 );
				float TIME_BLEND235_g38150 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38150 / 0.5 ) ) ) );
				float4 lerpResult1153_g38145 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38150 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38150 ) , TIME_BLEND235_g38150);
				float4 OUT_FLOW_FLOWMAP1156_g38145 = lerpResult1153_g38145;
				float4 m_FlowMap278_g38145 = OUT_FLOW_FLOWMAP1156_g38145;
				float4 localfloat4switch278_g38145 = float4switch278_g38145( m_switch278_g38145 , m_Off278_g38145 , m_Swirling278_g38145 , m_FlowMap278_g38145 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38145 = temp_cast_43;
				float3 unityObjectToViewPos731_g38145 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38145 = temp_cast_44;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38145 = temp_cast_46;
				float4 lerpResult769_g38145 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g38145 * _FoamShoreline_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38145 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g38145.z + GRAB_SCREEN_DEPTH310_g38145 ) - temp_cast_45 ) * GRAB_SCREEN_CLOSENESS312_g38145 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * GRAB_SCREEN_CLOSENESS312_g38145 ) ) ));
				float4 lerpResult761_g38145 = lerp( float4( 0,0,0,0 ) , lerpResult769_g38145 , FlowStrength1182_g38145);
				float4 FOAM_SHORELINE654_g3661 = lerpResult761_g38145;
				float4 temp_output_1492_0_g3661 = ( ( ( lerpResult105_g3661 + FOAM_VERTICAL_OFFSHORE655_g3661 ) + FOAM_HORIZONTAL_OFFSHORE1565_g3661 ) + FOAM_SHORELINE654_g3661 );
				float4 temp_output_746_0_g39462 = temp_output_1492_0_g3661;
				
				
				float3 Albedo = ( temp_output_746_0_g39462 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
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
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half4 _SpecularColor;
			float4 _FoamShoreline_Tint;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FOAMHORIZONTAL_Tint;
			float _Vertical_SmoothEdge;
			float _Vertical_Speed;
			float _Vertical_Rows;
			float _Vertical_Columns;
			float _Vertical_ScreenContribution;
			float _Vertical_TilingY;
			float _Vertical_TilingX;
			int _Vertical_ModeUV;
			int _ZWriteMode;
			float _SMOOTHNESS_Strength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			int _Vertical_RainMode;
			float _Rain_WetnessDarken;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _URP_SpecularStrength;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_FresnelPower;
			float _FoamShoreline_FlowStrength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _Horizontal_Speed;
			float _Horizontal_Rows;
			float _Horizontal_Columns;
			float _Horizontal_ScreenContribution;
			float _Horizontal_OffsetY;
			float _Horizontal_OffsetX;
			float _Horizontal_TilingY;
			float _Horizontal_TilingX;
			int _Horizontal_ModeUV;
			int _Horizontal_RainMode;
			float _Static_Intensity;
			float _Static_ScreenContribution;
			float _Static_OffsetY;
			float _Static_OffsetX;
			float _Static_TilingY;
			float _Static_TilingX;
			int _Static_ModeUV;
			int _Static_RainMode;
			float _SMOOTHNESS_FresnelScale;
			float _TilingY_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_Timescale;
			int _WaterNormal_Vertical_FlowType;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			float _WaterNormal_Vertical_TilingY;
			float _TilingX_Shoreline;
			float _WaterNormal_Vertical_NormalStrength;
			float _RefractionScale;
			float _FoamShoreline_Timescale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FOAMHORIZONTAL_TilingY;
			float _FOAMHORIZONTAL_TilingX;
			float _FOAMHORIZONTAL_Speed;
			float _FOAMHORIZONTAL_Timescale;
			int _FOAMHORIZONTAL_ModeFlowType;
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
			float _WaterNormal_Vertical_FlowStrength;
			int _Rain_GlobalWetnessMode;
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
			
			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite [_ZWriteMode]
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
			#define ASE_NEEDS_FRAG_COLOR
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
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half4 _SpecularColor;
			float4 _FoamShoreline_Tint;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FOAMHORIZONTAL_Tint;
			float _Vertical_SmoothEdge;
			float _Vertical_Speed;
			float _Vertical_Rows;
			float _Vertical_Columns;
			float _Vertical_ScreenContribution;
			float _Vertical_TilingY;
			float _Vertical_TilingX;
			int _Vertical_ModeUV;
			int _ZWriteMode;
			float _SMOOTHNESS_Strength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			int _Vertical_RainMode;
			float _Rain_WetnessDarken;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _URP_SpecularStrength;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_FresnelPower;
			float _FoamShoreline_FlowStrength;
			half _Shininess;
			float _SpecularWrap;
			int _Specular_Mode;
			float _Horizontal_Speed;
			float _Horizontal_Rows;
			float _Horizontal_Columns;
			float _Horizontal_ScreenContribution;
			float _Horizontal_OffsetY;
			float _Horizontal_OffsetX;
			float _Horizontal_TilingY;
			float _Horizontal_TilingX;
			int _Horizontal_ModeUV;
			int _Horizontal_RainMode;
			float _Static_Intensity;
			float _Static_ScreenContribution;
			float _Static_OffsetY;
			float _Static_OffsetX;
			float _Static_TilingY;
			float _Static_TilingX;
			int _Static_ModeUV;
			int _Static_RainMode;
			float _SMOOTHNESS_FresnelScale;
			float _TilingY_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Speed;
			float _WaterNormal_Vertical_TilingX;
			float _WaterNormal_Vertical_Speed;
			float _WaterNormal_Vertical_Timescale;
			int _WaterNormal_Vertical_FlowType;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _ColorMask;
			int _CullMode;
			float _AlphatoCoverage;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			float _WaterNormal_Vertical_TilingY;
			float _TilingX_Shoreline;
			float _WaterNormal_Vertical_NormalStrength;
			float _RefractionScale;
			float _FoamShoreline_Timescale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FOAMHORIZONTAL_TilingY;
			float _FOAMHORIZONTAL_TilingX;
			float _FOAMHORIZONTAL_Speed;
			float _FOAMHORIZONTAL_Timescale;
			int _FOAMHORIZONTAL_ModeFlowType;
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
			float _WaterNormal_Vertical_FlowStrength;
			int _Rain_GlobalWetnessMode;
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
			TEXTURE2D(_Vertical_RainMap);
			int _Global_Rain_Enabled;
			half _Global_Rain_Intensity;
			TEXTURE2D(_Static_RainMap);
			TEXTURE2D(_Horizontal_RainMap);
			int _Global_Wetness_Enabled;
			half _Global_Wetness_Intensity;


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
			
			float3 float3switch238_g38135( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float3 float3switch456_g38116( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float4 float4switch278_g38104( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
			
			float4 float4switch278_g38156( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
			
			float4 float4switch278_g38145( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
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
			
			real3 ASESafeNormalize(float3 inVec)
			{
				real dp3 = max(FLT_MIN, dot(inVec, inVec));
				return inVec* rsqrt( dp3);
			}
			
			float3 float3switch1246_g38104( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float3 float3switch1230_g38156( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float3 float3switch1223_g38145( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
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
			
			float floatswitch1190_g39462( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			void StochasticTiling( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				float2 vertex1, vertex2, vertex3;
				// Scaling of the input
				float2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				float2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				float3 temp = float3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			float3 float3switch914_g39462( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1186_g39462( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			float3 float3switch992_g39462( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1179_g39462( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			float3 float3switch1505_g39462( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch31_g38128( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
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
			
			float3 float3switch11_g38128( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
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
			
			float3 float3switch18_g38128( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
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
			
			float4 float4switch12_g39467( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch23_g39467( int m_switch, float4 m_Off, float4 m_Active )
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

				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord7.z = eyeDepth;
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_texcoord8 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord9 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.w = 0;
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
								 )
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

				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g3661 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g3661 = abs( ( screenDepth2_g3661 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g3661 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g3661*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g3661 = lerp( _DepthTint , lerpResult25_g3661 , saturate( (distanceDepth2_g3661*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g3661 = lerpResult27_g3661;
				int m_switch238_g38135 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g38135 = float3(0,0,0.001);
				float mulTime155_g38135 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g38135 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g38135 = ( FlowSpeed365_g38135 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g38135).xx;
				float2 appendResult235_g38135 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g38135 = IN.ase_texcoord7.xy * ( appendResult235_g38135 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g38135 = cos( _G_FlowSwirling.x );
				float sin62_g38135 = sin( _G_FlowSwirling.x );
				float2 rotator62_g38135 = mul( texCoord23_g38135 - float2( 0,0 ) , float2x2( cos62_g38135 , -sin62_g38135 , sin62_g38135 , cos62_g38135 )) + float2( 0,0 );
				float2 panner15_g38135 = ( mulTime155_g38135 * temp_cast_0 + rotator62_g38135);
				float2 temp_cast_1 = (temp_output_367_0_g38135).xx;
				float cos8_g38135 = cos( _G_FlowSwirling.y );
				float sin8_g38135 = sin( _G_FlowSwirling.y );
				float2 rotator8_g38135 = mul( texCoord23_g38135 - float2( 0,0 ) , float2x2( cos8_g38135 , -sin8_g38135 , sin8_g38135 , cos8_g38135 )) + float2( 0,0 );
				float2 panner16_g38135 = ( mulTime155_g38135 * temp_cast_1 + rotator8_g38135);
				float2 temp_cast_2 = (temp_output_367_0_g38135).xx;
				float2 panner17_g38135 = ( mulTime155_g38135 * temp_cast_2 + texCoord23_g38135);
				float2 layeredBlendVar666_g38135 = IN.ase_texcoord7.xy;
				float4 layeredBlend666_g38135 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g38135 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g38135 ) , layeredBlendVar666_g38135.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g38135 ) , layeredBlendVar666_g38135.y ) );
				float4 temp_output_1_0_g38136 = layeredBlend666_g38135;
				float temp_output_8_0_g38136 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g38136 = UnpackNormalScale( temp_output_1_0_g38136, temp_output_8_0_g38136 );
				unpack52_g38136.z = lerp( 1, unpack52_g38136.z, saturate(temp_output_8_0_g38136) );
				float3 temp_output_699_59_g38135 = unpack52_g38136;
				float3 temp_output_372_0_g38135 = abs( WorldNormal );
				float3 break386_g38135 = ( temp_output_372_0_g38135 * temp_output_372_0_g38135 );
				float _MASK_VERTICAL_Z381_g38135 = ( break386_g38135.z + 0.01 );
				float3 lerpResult677_g38135 = lerp( float3( 0,0,0 ) , temp_output_699_59_g38135 , _MASK_VERTICAL_Z381_g38135);
				float _MASK_VERTICAL_X373_g38135 = ( -break386_g38135.x + 0.2 );
				float3 lerpResult681_g38135 = lerp( float3( 0,0,0 ) , temp_output_699_59_g38135 , _MASK_VERTICAL_X373_g38135);
				float _MASK_VERTICAL_Y_NEG413_g38135 = ( ( WorldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g38135 = lerp( float3( 0,0,0 ) , ( lerpResult677_g38135 + lerpResult681_g38135 ) , _MASK_VERTICAL_Y_NEG413_g38135);
				float3 m_Swirling238_g38135 = lerpResult679_g38135;
				float2 texCoord196_g38140 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38140 = IN.ase_texcoord8;
				float2 blendOpSrc197_g38140 = texCoord196_g38140;
				float2 blendOpDest197_g38140 = (_FLOWMAP_Map89_g38140).xy;
				float2 temp_output_197_0_g38140 = ( saturate( (( blendOpDest197_g38140 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38140 ) * ( 1.0 - blendOpSrc197_g38140 ) ) : ( 2.0 * blendOpDest197_g38140 * blendOpSrc197_g38140 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38140 = FlowSpeed365_g38135;
				float temp_output_182_0_g38140 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38140 );
				float temp_output_194_0_g38140 = (0.0 + (( ( temp_output_182_0_g38140 - floor( ( temp_output_182_0_g38140 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g38140 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g38140 = ( -temp_output_194_0_g38140 * _FLOWMAP_FlowStrength146_g38140 );
				float2 lerpResult198_g38140 = lerp( temp_output_197_0_g38140 , texCoord196_g38140 , _TIME_UV_A199_g38140);
				float2 INPUT_MAP_TILLING128_g38135 = appendResult235_g38135;
				float2 texCoord205_g38140 = IN.ase_texcoord7.xy * INPUT_MAP_TILLING128_g38135 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38140 = texCoord205_g38140;
				float2 FLOW_A201_g38140 = ( lerpResult198_g38140 + TEXTURE_TILLING211_g38140 );
				float temp_output_225_0_g38140 = (temp_output_182_0_g38140*1.0 + 0.5);
				float _TIME_UV_B214_g38140 = ( -(0.0 + (( ( temp_output_225_0_g38140 - floor( ( temp_output_225_0_g38140 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38140 );
				float2 lerpResult229_g38140 = lerp( temp_output_197_0_g38140 , texCoord196_g38140 , _TIME_UV_B214_g38140);
				float2 FLOW_B232_g38140 = ( lerpResult229_g38140 + TEXTURE_TILLING211_g38140 );
				float TIME_BLEND235_g38140 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38140 / 0.5 ) ) ) );
				float4 lerpResult317_g38135 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g38140 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g38140 ) , TIME_BLEND235_g38140);
				float4 temp_output_1_0_g38142 = lerpResult317_g38135;
				float NormalStrength152_g38135 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g38142 = NormalStrength152_g38135;
				float3 unpack52_g38142 = UnpackNormalScale( temp_output_1_0_g38142, temp_output_8_0_g38142 );
				unpack52_g38142.z = lerp( 1, unpack52_g38142.z, saturate(temp_output_8_0_g38142) );
				float3 temp_output_701_59_g38135 = unpack52_g38142;
				float3 lerpResult692_g38135 = lerp( float3( 0,0,0 ) , temp_output_701_59_g38135 , _MASK_VERTICAL_Z381_g38135);
				float3 lerpResult691_g38135 = lerp( float3( 0,0,0 ) , temp_output_701_59_g38135 , _MASK_VERTICAL_X373_g38135);
				float3 lerpResult697_g38135 = lerp( float3( 0,0,0 ) , ( lerpResult692_g38135 + lerpResult691_g38135 ) , _MASK_VERTICAL_Y_NEG413_g38135);
				float3 m_FlowMap238_g38135 = lerpResult697_g38135;
				float3 localfloat3switch238_g38135 = float3switch238_g38135( m_switch238_g38135 , m_Off238_g38135 , m_Swirling238_g38135 , m_FlowMap238_g38135 );
				int m_switch456_g38116 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g38116 = float3(0,0,0.001);
				float mulTime155_g38116 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g38116 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g38116 = ( FlowSpeed365_g38116 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g38116).xx;
				float2 appendResult235_g38116 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g38116 = IN.ase_texcoord7.xy * ( appendResult235_g38116 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g38116 = cos( _G_FlowSwirling.x );
				float sin62_g38116 = sin( _G_FlowSwirling.x );
				float2 rotator62_g38116 = mul( texCoord23_g38116 - float2( 0,0 ) , float2x2( cos62_g38116 , -sin62_g38116 , sin62_g38116 , cos62_g38116 )) + float2( 0,0 );
				float2 panner15_g38116 = ( mulTime155_g38116 * temp_cast_5 + rotator62_g38116);
				float2 temp_cast_6 = (temp_output_367_0_g38116).xx;
				float cos8_g38116 = cos( _G_FlowSwirling.y );
				float sin8_g38116 = sin( _G_FlowSwirling.y );
				float2 rotator8_g38116 = mul( texCoord23_g38116 - float2( 0,0 ) , float2x2( cos8_g38116 , -sin8_g38116 , sin8_g38116 , cos8_g38116 )) + float2( 0,0 );
				float2 panner16_g38116 = ( mulTime155_g38116 * temp_cast_6 + rotator8_g38116);
				float2 temp_cast_7 = (temp_output_367_0_g38116).xx;
				float2 panner17_g38116 = ( mulTime155_g38116 * temp_cast_7 + texCoord23_g38116);
				float2 layeredBlendVar448_g38116 = IN.ase_texcoord7.xy;
				float4 layeredBlend448_g38116 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner15_g38116 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner16_g38116 ) , layeredBlendVar448_g38116.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, panner17_g38116 ) , layeredBlendVar448_g38116.y ) );
				float4 temp_output_1_0_g38120 = layeredBlend448_g38116;
				float temp_output_8_0_g38120 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g38120 = UnpackNormalScale( temp_output_1_0_g38120, temp_output_8_0_g38120 );
				unpack52_g38120.z = lerp( 1, unpack52_g38120.z, saturate(temp_output_8_0_g38120) );
				float3 temp_output_481_59_g38116 = unpack52_g38120;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g38116 = ( abs( WorldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g38116 = ( break386_g38116.z + 0.75 );
				float3 lerpResult465_g38116 = lerp( float3( 0,0,0 ) , temp_output_481_59_g38116 , _MASK_VERTICAL_Z381_g38116);
				float _MASK_VERTICAL_X373_g38116 = ( break386_g38116.x + 0.45 );
				float3 lerpResult457_g38116 = lerp( float3( 0,0,0 ) , temp_output_481_59_g38116 , _MASK_VERTICAL_X373_g38116);
				float _MASK_VERTICAL_Y383_g38116 = ( -break386_g38116.y + 5.0 );
				float3 lerpResult454_g38116 = lerp( lerpResult465_g38116 , ( lerpResult465_g38116 + lerpResult457_g38116 ) , _MASK_VERTICAL_Y383_g38116);
				float _MASK_VERTICAL_Y_NEG413_g38116 = ( ( WorldNormal.y + WorldNormal.y ) - 1.0 );
				float3 lerpResult477_g38116 = lerp( float3( 0,0,0 ) , lerpResult454_g38116 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g38116 ));
				float3 m_Swirling456_g38116 = lerpResult477_g38116;
				float2 texCoord196_g38118 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38118 = IN.ase_texcoord8;
				float2 blendOpSrc197_g38118 = texCoord196_g38118;
				float2 blendOpDest197_g38118 = (_FLOWMAP_Map89_g38118).xy;
				float2 temp_output_197_0_g38118 = ( saturate( (( blendOpDest197_g38118 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38118 ) * ( 1.0 - blendOpSrc197_g38118 ) ) : ( 2.0 * blendOpDest197_g38118 * blendOpSrc197_g38118 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38118 = FlowSpeed365_g38116;
				float temp_output_182_0_g38118 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38118 );
				float temp_output_194_0_g38118 = (0.0 + (( ( temp_output_182_0_g38118 - floor( ( temp_output_182_0_g38118 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g38118 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g38118 = ( -temp_output_194_0_g38118 * _FLOWMAP_FlowStrength146_g38118 );
				float2 lerpResult198_g38118 = lerp( temp_output_197_0_g38118 , texCoord196_g38118 , _TIME_UV_A199_g38118);
				float2 INPUT_MAP_TILLING128_g38116 = appendResult235_g38116;
				float2 texCoord205_g38118 = IN.ase_texcoord7.xy * INPUT_MAP_TILLING128_g38116 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38118 = texCoord205_g38118;
				float2 FLOW_A201_g38118 = ( lerpResult198_g38118 + TEXTURE_TILLING211_g38118 );
				float temp_output_225_0_g38118 = (temp_output_182_0_g38118*1.0 + 0.5);
				float _TIME_UV_B214_g38118 = ( -(0.0 + (( ( temp_output_225_0_g38118 - floor( ( temp_output_225_0_g38118 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38118 );
				float2 lerpResult229_g38118 = lerp( temp_output_197_0_g38118 , texCoord196_g38118 , _TIME_UV_B214_g38118);
				float2 FLOW_B232_g38118 = ( lerpResult229_g38118 + TEXTURE_TILLING211_g38118 );
				float TIME_BLEND235_g38118 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38118 / 0.5 ) ) ) );
				float4 lerpResult317_g38116 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_A201_g38118 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat, FLOW_B232_g38118 ) , TIME_BLEND235_g38118);
				float4 temp_output_1_0_g38124 = lerpResult317_g38116;
				float NormalStrength152_g38116 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g38124 = NormalStrength152_g38116;
				float3 unpack52_g38124 = UnpackNormalScale( temp_output_1_0_g38124, temp_output_8_0_g38124 );
				unpack52_g38124.z = lerp( 1, unpack52_g38124.z, saturate(temp_output_8_0_g38124) );
				float3 temp_output_483_59_g38116 = unpack52_g38124;
				float3 lerpResult466_g38116 = lerp( float3( 0,0,0 ) , temp_output_483_59_g38116 , _MASK_VERTICAL_Z381_g38116);
				float3 lerpResult453_g38116 = lerp( float3( 0,0,0 ) , temp_output_483_59_g38116 , _MASK_VERTICAL_X373_g38116);
				float3 lerpResult460_g38116 = lerp( lerpResult466_g38116 , ( lerpResult466_g38116 + lerpResult453_g38116 ) , _MASK_VERTICAL_Y383_g38116);
				float3 lerpResult411_g38116 = lerp( float3( 0,0,0 ) , lerpResult460_g38116 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g38116 ));
				float3 m_FlowMap456_g38116 = lerpResult411_g38116;
				float3 localfloat3switch456_g38116 = float3switch456_g38116( m_switch456_g38116 , m_Off456_g38116 , m_Swirling456_g38116 , m_FlowMap456_g38116 );
				float2 weightedBlendVar1711_g3661 = IN.ase_texcoord7.xy;
				float3 weightedBlend1711_g3661 = ( weightedBlendVar1711_g3661.x*localfloat3switch238_g38135 + weightedBlendVar1711_g3661.y*localfloat3switch456_g38116 );
				float3 NORMAL_IN84_g38163 = ( weightedBlend1711_g3661 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g38163 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord7.z;
				float eyeDepth7_g38163 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g38163 = ( (NORMAL_IN84_g38163).xy * ( REFACTED_SCALE_FLOAT78_g38163 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g38163 - eyeDepth ) ) );
				float eyeDepth27_g38163 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g38163, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g38163 = (( float4( ( temp_output_21_0_g38163 * saturate( ( eyeDepth27_g38163 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g38163 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g38163 ), 1.0 );
				float4 REFRACTED_DEPTH144_g3661 = fetchOpaqueVal89_g38163;
				float temp_output_20_0_g3661 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g3661 = 0.0;
				#else
				float staticSwitch37_g3661 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g3661*-5.0 + 1.0) ) ) ) * temp_output_20_0_g3661 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g3661 = staticSwitch37_g3661;
				float4 lerpResult105_g3661 = lerp( COLOR_TINT161_g3661 , REFRACTED_DEPTH144_g3661 , DEPTH_TINT_ALPHA93_g3661);
				float4 _MASK_VECTOR1199_g38104 = float4(0.001,0.001,0.001,0);
				int m_switch278_g38104 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g38104 = float4( 0,0,0,0 );
				float mulTime806_g38104 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g38104 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g38104 = ( FlowSpeed1146_g38104 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g38104).xx;
				float2 appendResult219_g38104 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g38104 = ( appendResult219_g38104 * float2( 2,2 ) );
				float2 texCoord487_g38104 = IN.ase_texcoord7.xy * temp_output_1294_0_g38104 + float2( 0,0 );
				float cos485_g38104 = cos( _G_FlowSwirling.x );
				float sin485_g38104 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38104 = mul( texCoord487_g38104 - float2( 0,0 ) , float2x2( cos485_g38104 , -sin485_g38104 , sin485_g38104 , cos485_g38104 )) + float2( 0,0 );
				float2 panner483_g38104 = ( mulTime806_g38104 * temp_cast_14 + rotator485_g38104);
				float2 temp_cast_15 = (temp_output_1150_0_g38104).xx;
				float cos481_g38104 = cos( _G_FlowSwirling.y );
				float sin481_g38104 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38104 = mul( texCoord487_g38104 - float2( 0,0 ) , float2x2( cos481_g38104 , -sin481_g38104 , sin481_g38104 , cos481_g38104 )) + float2( 0,0 );
				float2 panner480_g38104 = ( mulTime806_g38104 * temp_cast_15 + rotator481_g38104);
				float2 temp_cast_16 = (temp_output_1150_0_g38104).xx;
				float2 panner478_g38104 = ( mulTime806_g38104 * temp_cast_16 + texCoord487_g38104);
				float4 OUT_SWIRLING298_g38104 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner483_g38104 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner480_g38104 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, panner478_g38104 ) ) );
				float4 m_Swirling278_g38104 = OUT_SWIRLING298_g38104;
				float2 texCoord196_g38109 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38109 = IN.ase_texcoord8;
				float2 blendOpSrc197_g38109 = texCoord196_g38109;
				float2 blendOpDest197_g38109 = (_FLOWMAP_Map89_g38109).xy;
				float2 temp_output_197_0_g38109 = ( saturate( (( blendOpDest197_g38109 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38109 ) * ( 1.0 - blendOpSrc197_g38109 ) ) : ( 2.0 * blendOpDest197_g38109 * blendOpSrc197_g38109 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38109 = FlowSpeed1146_g38104;
				float temp_output_182_0_g38109 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38109 );
				float temp_output_194_0_g38109 = (0.0 + (( ( temp_output_182_0_g38109 - floor( ( temp_output_182_0_g38109 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g38104 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38109 = FlowStrength1147_g38104;
				float _TIME_UV_A199_g38109 = ( -temp_output_194_0_g38109 * _FLOWMAP_FlowStrength146_g38109 );
				float2 lerpResult198_g38109 = lerp( temp_output_197_0_g38109 , texCoord196_g38109 , _TIME_UV_A199_g38109);
				float2 INPUT_MAP_TILLING128_g38104 = temp_output_1294_0_g38104;
				float2 texCoord205_g38109 = IN.ase_texcoord7.xy * INPUT_MAP_TILLING128_g38104 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38109 = texCoord205_g38109;
				float2 FLOW_A201_g38109 = ( lerpResult198_g38109 + TEXTURE_TILLING211_g38109 );
				float temp_output_225_0_g38109 = (temp_output_182_0_g38109*1.0 + 0.5);
				float _TIME_UV_B214_g38109 = ( -(0.0 + (( ( temp_output_225_0_g38109 - floor( ( temp_output_225_0_g38109 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38109 );
				float2 lerpResult229_g38109 = lerp( temp_output_197_0_g38109 , texCoord196_g38109 , _TIME_UV_B214_g38109);
				float2 FLOW_B232_g38109 = ( lerpResult229_g38109 + TEXTURE_TILLING211_g38109 );
				float TIME_BLEND235_g38109 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38109 / 0.5 ) ) ) );
				float4 lerpResult1117_g38104 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38109 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38109 ) , TIME_BLEND235_g38109);
				float4 OUT_FLOW_FLOWMAP1119_g38104 = lerpResult1117_g38104;
				float4 m_FlowMap278_g38104 = OUT_FLOW_FLOWMAP1119_g38104;
				float4 localfloat4switch278_g38104 = float4switch278_g38104( m_switch278_g38104 , m_Off278_g38104 , m_Swirling278_g38104 , m_FlowMap278_g38104 );
				float clampDepth2_g38130 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g38130 = clampDepth2_g38130;
				float4 localCalculateObliqueFrustumCorrection3_g38154 = CalculateObliqueFrustumCorrection();
				float dotResult4_g38154 = dot( float4( IN.ase_texcoord9.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g38154 );
				float correctionFactor1_g38130 = dotResult4_g38154;
				float localCorrectedLinearEyeDepth1_g38130 = CorrectedLinearEyeDepth( z1_g38130 , correctionFactor1_g38130 );
				float eyeDepth18_g38130 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g38130 = ( eyeDepth18_g38130 - ScreenPos.w );
				float temp_output_13_0_g38130 = ( localCorrectedLinearEyeDepth1_g38130 - abs( temp_output_17_0_g38130 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g3661 = saturate( temp_output_13_0_g38130 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38104 = temp_cast_20;
				float3 unityObjectToViewPos262_g38104 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float GRAB_SCREEN_DEPTH73_g3661 = localCorrectedLinearEyeDepth1_g38130;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38104 = temp_cast_21;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g3661 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38104 = temp_cast_23;
				float4 lerpResult281_g38104 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g38104 * _FOAMVERTICAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38104 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g38104.z + GRAB_SCREEN_DEPTH310_g38104 ) - temp_cast_22 ) * GRAB_SCREEN_CLOSENESS312_g38104 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g38104 ) ) ));
				float4 lerpResult265_g38104 = lerp( float4( 0,0,0,0 ) , lerpResult281_g38104 , FlowStrength1147_g38104);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g38104 = ( abs( WorldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g38104 = ( break1161_g38104.z + 0.45 );
				float4 lerpResult1173_g38104 = lerp( _MASK_VECTOR1199_g38104 , lerpResult265_g38104 , _MASK_VERTICAL_Z1162_g38104);
				float _MASK_VERTICAL_X1170_g38104 = ( break1161_g38104.x + 0.46 );
				float4 lerpResult1176_g38104 = lerp( _MASK_VECTOR1199_g38104 , lerpResult265_g38104 , _MASK_VERTICAL_X1170_g38104);
				float _MASK_VERTICAL_Y1163_g38104 = ( -break1161_g38104.y + 6.5 );
				float4 lerpResult1179_g38104 = lerp( lerpResult1173_g38104 , ( lerpResult1173_g38104 + lerpResult1176_g38104 ) , _MASK_VERTICAL_Y1163_g38104);
				float4 temp_output_1189_0_g38104 = saturate( lerpResult1179_g38104 );
				float4 FOAM_VERTICAL_OFFSHORE655_g3661 = temp_output_1189_0_g38104;
				float4 _MASK_VECTOR1200_g38156 = float4(0.001,0.001,0.001,0);
				int m_switch278_g38156 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g38156 = float4( 0,0,0,0 );
				float mulTime806_g38156 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g38156 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g38156 = ( Speed1146_g38156 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g38156).xx;
				float2 appendResult219_g38156 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g38156 = ( appendResult219_g38156 * float2( 2,2 ) );
				float2 texCoord487_g38156 = IN.ase_texcoord7.xy * temp_output_1214_0_g38156 + float2( 0,0 );
				float cos485_g38156 = cos( _G_FlowSwirling.x );
				float sin485_g38156 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38156 = mul( texCoord487_g38156 - float2( 0,0 ) , float2x2( cos485_g38156 , -sin485_g38156 , sin485_g38156 , cos485_g38156 )) + float2( 0,0 );
				float2 panner483_g38156 = ( mulTime806_g38156 * temp_cast_27 + rotator485_g38156);
				float2 temp_cast_28 = (temp_output_1150_0_g38156).xx;
				float cos481_g38156 = cos( _G_FlowSwirling.y );
				float sin481_g38156 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38156 = mul( texCoord487_g38156 - float2( 0,0 ) , float2x2( cos481_g38156 , -sin481_g38156 , sin481_g38156 , cos481_g38156 )) + float2( 0,0 );
				float2 panner480_g38156 = ( mulTime806_g38156 * temp_cast_28 + rotator481_g38156);
				float2 temp_cast_29 = (temp_output_1150_0_g38156).xx;
				float2 panner478_g38156 = ( mulTime806_g38156 * temp_cast_29 + texCoord487_g38156);
				float4 OUT_SWIRLING298_g38156 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner483_g38156 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner480_g38156 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, panner478_g38156 ) ) );
				float4 m_Swirling278_g38156 = OUT_SWIRLING298_g38156;
				float2 texCoord196_g38161 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38161 = IN.ase_texcoord8;
				float2 blendOpSrc197_g38161 = texCoord196_g38161;
				float2 blendOpDest197_g38161 = (_FLOWMAP_Map89_g38161).xy;
				float2 temp_output_197_0_g38161 = ( saturate( (( blendOpDest197_g38161 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38161 ) * ( 1.0 - blendOpSrc197_g38161 ) ) : ( 2.0 * blendOpDest197_g38161 * blendOpSrc197_g38161 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38161 = Speed1146_g38156;
				float temp_output_182_0_g38161 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38161 );
				float temp_output_194_0_g38161 = (0.0 + (( ( temp_output_182_0_g38161 - floor( ( temp_output_182_0_g38161 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g38156 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38161 = FlowStrength1147_g38156;
				float _TIME_UV_A199_g38161 = ( -temp_output_194_0_g38161 * _FLOWMAP_FlowStrength146_g38161 );
				float2 lerpResult198_g38161 = lerp( temp_output_197_0_g38161 , texCoord196_g38161 , _TIME_UV_A199_g38161);
				float2 INPUT_MAP_TILLING128_g38156 = temp_output_1214_0_g38156;
				float2 texCoord205_g38161 = IN.ase_texcoord7.xy * INPUT_MAP_TILLING128_g38156 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38161 = texCoord205_g38161;
				float2 FLOW_A201_g38161 = ( lerpResult198_g38161 + TEXTURE_TILLING211_g38161 );
				float temp_output_225_0_g38161 = (temp_output_182_0_g38161*1.0 + 0.5);
				float _TIME_UV_B214_g38161 = ( -(0.0 + (( ( temp_output_225_0_g38161 - floor( ( temp_output_225_0_g38161 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38161 );
				float2 lerpResult229_g38161 = lerp( temp_output_197_0_g38161 , texCoord196_g38161 , _TIME_UV_B214_g38161);
				float2 FLOW_B232_g38161 = ( lerpResult229_g38161 + TEXTURE_TILLING211_g38161 );
				float TIME_BLEND235_g38161 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38161 / 0.5 ) ) ) );
				float4 lerpResult1117_g38156 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38161 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38161 ) , TIME_BLEND235_g38161);
				float4 OUT_FLOW_FLOWMAP1119_g38156 = lerpResult1117_g38156;
				float4 m_FlowMap278_g38156 = OUT_FLOW_FLOWMAP1119_g38156;
				float4 localfloat4switch278_g38156 = float4switch278_g38156( m_switch278_g38156 , m_Off278_g38156 , m_Swirling278_g38156 , m_FlowMap278_g38156 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38156 = temp_cast_32;
				float3 unityObjectToViewPos262_g38156 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38156 = temp_cast_33;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38156 = temp_cast_35;
				float4 lerpResult281_g38156 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g38156 * _FOAMHORIZONTAL_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38156 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g38156.z + GRAB_SCREEN_DEPTH310_g38156 ) - temp_cast_34 ) * GRAB_SCREEN_CLOSENESS312_g38156 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS312_g38156 ) ) ));
				float4 lerpResult265_g38156 = lerp( float4( 0,0,0,0 ) , lerpResult281_g38156 , FlowStrength1147_g38156);
				float _MASK_HORIZONTAL1160_g38156 = ( ( WorldNormal.y + WorldNormal.y ) - 1.7 );
				float4 lerpResult1185_g38156 = lerp( _MASK_VECTOR1200_g38156 , lerpResult265_g38156 , _MASK_HORIZONTAL1160_g38156);
				float4 temp_output_1188_0_g38156 = saturate( lerpResult1185_g38156 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g3661 = temp_output_1188_0_g38156;
				int m_switch278_g38145 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g38145 = float4( 0,0,0,0 );
				float mulTime806_g38145 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g38145 = _FoamShoreline_Speed;
				float temp_output_1185_0_g38145 = ( FlowSpeed1179_g38145 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g38145).xx;
				float2 appendResult219_g38145 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g38145 = ( appendResult219_g38145 * float2( 2,2 ) );
				float2 texCoord487_g38145 = IN.ase_texcoord7.xy * temp_output_1196_0_g38145 + float2( 0,0 );
				float cos485_g38145 = cos( _G_FlowSwirling.x );
				float sin485_g38145 = sin( _G_FlowSwirling.x );
				float2 rotator485_g38145 = mul( texCoord487_g38145 - float2( 0,0 ) , float2x2( cos485_g38145 , -sin485_g38145 , sin485_g38145 , cos485_g38145 )) + float2( 0,0 );
				float2 panner483_g38145 = ( mulTime806_g38145 * temp_cast_38 + rotator485_g38145);
				float2 temp_cast_39 = (temp_output_1185_0_g38145).xx;
				float cos481_g38145 = cos( _G_FlowSwirling.y );
				float sin481_g38145 = sin( _G_FlowSwirling.y );
				float2 rotator481_g38145 = mul( texCoord487_g38145 - float2( 0,0 ) , float2x2( cos481_g38145 , -sin481_g38145 , sin481_g38145 , cos481_g38145 )) + float2( 0,0 );
				float2 panner480_g38145 = ( mulTime806_g38145 * temp_cast_39 + rotator481_g38145);
				float2 temp_cast_40 = (temp_output_1185_0_g38145).xx;
				float2 panner478_g38145 = ( mulTime806_g38145 * temp_cast_40 + texCoord487_g38145);
				float4 OUT_SWIRLING298_g38145 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner483_g38145 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner480_g38145 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, panner478_g38145 ) ) );
				float4 m_Swirling278_g38145 = OUT_SWIRLING298_g38145;
				float2 texCoord196_g38150 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g38150 = IN.ase_texcoord8;
				float2 blendOpSrc197_g38150 = texCoord196_g38150;
				float2 blendOpDest197_g38150 = (_FLOWMAP_Map89_g38150).xy;
				float2 temp_output_197_0_g38150 = ( saturate( (( blendOpDest197_g38150 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g38150 ) * ( 1.0 - blendOpSrc197_g38150 ) ) : ( 2.0 * blendOpDest197_g38150 * blendOpSrc197_g38150 ) ) ));
				float _FLOWMAP_FlowSpeed148_g38150 = FlowSpeed1179_g38145;
				float temp_output_182_0_g38150 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g38150 );
				float temp_output_194_0_g38150 = (0.0 + (( ( temp_output_182_0_g38150 - floor( ( temp_output_182_0_g38150 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1182_g38145 = _FoamShoreline_FlowStrength;
				float _FLOWMAP_FlowStrength146_g38150 = FlowStrength1182_g38145;
				float _TIME_UV_A199_g38150 = ( -temp_output_194_0_g38150 * _FLOWMAP_FlowStrength146_g38150 );
				float2 lerpResult198_g38150 = lerp( temp_output_197_0_g38150 , texCoord196_g38150 , _TIME_UV_A199_g38150);
				float2 INPUT_MAP_TILLING128_g38145 = temp_output_1196_0_g38145;
				float2 texCoord205_g38150 = IN.ase_texcoord7.xy * INPUT_MAP_TILLING128_g38145 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g38150 = texCoord205_g38150;
				float2 FLOW_A201_g38150 = ( lerpResult198_g38150 + TEXTURE_TILLING211_g38150 );
				float temp_output_225_0_g38150 = (temp_output_182_0_g38150*1.0 + 0.5);
				float _TIME_UV_B214_g38150 = ( -(0.0 + (( ( temp_output_225_0_g38150 - floor( ( temp_output_225_0_g38150 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g38150 );
				float2 lerpResult229_g38150 = lerp( temp_output_197_0_g38150 , texCoord196_g38150 , _TIME_UV_B214_g38150);
				float2 FLOW_B232_g38150 = ( lerpResult229_g38150 + TEXTURE_TILLING211_g38150 );
				float TIME_BLEND235_g38150 = saturate( abs( ( 1.0 - ( temp_output_194_0_g38150 / 0.5 ) ) ) );
				float4 lerpResult1153_g38145 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_A201_g38150 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat, FLOW_B232_g38150 ) , TIME_BLEND235_g38150);
				float4 OUT_FLOW_FLOWMAP1156_g38145 = lerpResult1153_g38145;
				float4 m_FlowMap278_g38145 = OUT_FLOW_FLOWMAP1156_g38145;
				float4 localfloat4switch278_g38145 = float4switch278_g38145( m_switch278_g38145 , m_Off278_g38145 , m_Swirling278_g38145 , m_FlowMap278_g38145 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH_BEHIND314_g38145 = temp_cast_43;
				float3 unityObjectToViewPos731_g38145 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord9.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g3661).xxxx;
				float4 GRAB_SCREEN_DEPTH310_g38145 = temp_cast_44;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g3661).xxxx;
				float4 GRAB_SCREEN_CLOSENESS312_g38145 = temp_cast_46;
				float4 lerpResult769_g38145 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g38145 * _FoamShoreline_TintStrength ) * GRAB_SCREEN_DEPTH_BEHIND314_g38145 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g38145.z + GRAB_SCREEN_DEPTH310_g38145 ) - temp_cast_45 ) * GRAB_SCREEN_CLOSENESS312_g38145 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * GRAB_SCREEN_CLOSENESS312_g38145 ) ) ));
				float4 lerpResult761_g38145 = lerp( float4( 0,0,0,0 ) , lerpResult769_g38145 , FlowStrength1182_g38145);
				float4 FOAM_SHORELINE654_g3661 = lerpResult761_g38145;
				float4 temp_output_1492_0_g3661 = ( ( ( lerpResult105_g3661 + FOAM_VERTICAL_OFFSHORE655_g3661 ) + FOAM_HORIZONTAL_OFFSHORE1565_g3661 ) + FOAM_SHORELINE654_g3661 );
				float4 temp_output_746_0_g39462 = temp_output_1492_0_g3661;
				
				int m_switch103_g39462 = _Vertical_RainMode;
				int ModeFlowType1245_g38104 = _FOAMVERTICAL_ModeFlowType;
				int m_switch1246_g38104 = ModeFlowType1245_g38104;
				float3 m_Off1246_g38104 = float3( 0,0,1 );
				float3 temp_output_21_0_g38108 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g38108 = cross( WorldNormal , ddy( temp_output_21_0_g38108 ) );
				float3 temp_output_6_0_g38108 = ddx( temp_output_21_0_g38108 );
				float dotResult27_g38108 = dot( temp_output_15_0_g38108 , temp_output_6_0_g38108 );
				float temp_output_14_0_g38108 = abs( dotResult27_g38108 );
				float4 temp_output_8_0_g38108 = ( _FOAMVERTICAL_NormalStrength * temp_output_1189_0_g38104 );
				float4 break18_g38108 = ( sign( temp_output_14_0_g38108 ) * ( ( ddx( temp_output_8_0_g38108 ) * float4( temp_output_15_0_g38108 , 0.0 ) ) + ( ddy( temp_output_8_0_g38108 ) * float4( cross( WorldNormal , temp_output_6_0_g38108 ) , 0.0 ) ) ) );
				float3 appendResult7_g38108 = (float3(break18_g38108.x , -break18_g38108.y , break18_g38108.z));
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 worldToTangentDir5_g38108 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g38108 * WorldNormal ) - appendResult7_g38108 )) );
				float3 temp_output_1249_32_g38104 = worldToTangentDir5_g38108;
				float3 m_Swirling1246_g38104 = temp_output_1249_32_g38104;
				float3 m_FlowMap1246_g38104 = temp_output_1249_32_g38104;
				float3 localfloat3switch1246_g38104 = float3switch1246_g38104( m_switch1246_g38104 , m_Off1246_g38104 , m_Swirling1246_g38104 , m_FlowMap1246_g38104 );
				float3 FOAM_VERTICAL_OFFSHORE_NORMAL1192_g3661 = localfloat3switch1246_g38104;
				int ModeFlowType1232_g38156 = _FOAMHORIZONTAL_ModeFlowType;
				int m_switch1230_g38156 = ModeFlowType1232_g38156;
				float3 m_Off1230_g38156 = float3( 0,0,1 );
				float3 temp_output_21_0_g38160 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g38160 = cross( WorldNormal , ddy( temp_output_21_0_g38160 ) );
				float3 temp_output_6_0_g38160 = ddx( temp_output_21_0_g38160 );
				float dotResult27_g38160 = dot( temp_output_15_0_g38160 , temp_output_6_0_g38160 );
				float temp_output_14_0_g38160 = abs( dotResult27_g38160 );
				float4 temp_output_8_0_g38160 = ( _FOAMHORIZONTAL_NormalStrength * temp_output_1188_0_g38156 );
				float4 break18_g38160 = ( sign( temp_output_14_0_g38160 ) * ( ( ddx( temp_output_8_0_g38160 ) * float4( temp_output_15_0_g38160 , 0.0 ) ) + ( ddy( temp_output_8_0_g38160 ) * float4( cross( WorldNormal , temp_output_6_0_g38160 ) , 0.0 ) ) ) );
				float3 appendResult7_g38160 = (float3(break18_g38160.x , -break18_g38160.y , break18_g38160.z));
				float3 worldToTangentDir5_g38160 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g38160 * WorldNormal ) - appendResult7_g38160 )) );
				float3 temp_output_1233_32_g38156 = worldToTangentDir5_g38160;
				float3 m_Swirling1230_g38156 = temp_output_1233_32_g38156;
				float3 m_FlowMap1230_g38156 = temp_output_1233_32_g38156;
				float3 localfloat3switch1230_g38156 = float3switch1230_g38156( m_switch1230_g38156 , m_Off1230_g38156 , m_Swirling1230_g38156 , m_FlowMap1230_g38156 );
				float3 FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g3661 = localfloat3switch1230_g38156;
				int ModeFlowType1225_g38145 = _FoamShoreline_ModeFlowType;
				int m_switch1223_g38145 = ModeFlowType1225_g38145;
				float3 m_Off1223_g38145 = float3( 0,0,1 );
				float3 temp_output_21_0_g38149 = ( IN.ase_texcoord9.xyz * 500.0 );
				float3 temp_output_15_0_g38149 = cross( WorldNormal , ddy( temp_output_21_0_g38149 ) );
				float3 temp_output_6_0_g38149 = ddx( temp_output_21_0_g38149 );
				float dotResult27_g38149 = dot( temp_output_15_0_g38149 , temp_output_6_0_g38149 );
				float temp_output_14_0_g38149 = abs( dotResult27_g38149 );
				float4 temp_output_8_0_g38149 = ( _FoamShoreline_NormalStrength * lerpResult761_g38145 );
				float4 break18_g38149 = ( sign( temp_output_14_0_g38149 ) * ( ( ddx( temp_output_8_0_g38149 ) * float4( temp_output_15_0_g38149 , 0.0 ) ) + ( ddy( temp_output_8_0_g38149 ) * float4( cross( WorldNormal , temp_output_6_0_g38149 ) , 0.0 ) ) ) );
				float3 appendResult7_g38149 = (float3(break18_g38149.x , -break18_g38149.y , break18_g38149.z));
				float3 worldToTangentDir5_g38149 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g38149 * WorldNormal ) - appendResult7_g38149 )) );
				float3 temp_output_1222_32_g38145 = worldToTangentDir5_g38149;
				float3 m_Swirling1223_g38145 = temp_output_1222_32_g38145;
				float3 m_FlowMap1223_g38145 = temp_output_1222_32_g38145;
				float3 localfloat3switch1223_g38145 = float3switch1223_g38145( m_switch1223_g38145 , m_Off1223_g38145 , m_Swirling1223_g38145 , m_FlowMap1223_g38145 );
				float3 FOAM_NORMALShorline1208_g3661 = localfloat3switch1223_g38145;
				float3 temp_output_1715_0_g3661 = BlendNormal( BlendNormal( BlendNormal( weightedBlend1711_g3661 , FOAM_VERTICAL_OFFSHORE_NORMAL1192_g3661 ) , FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g3661 ) , FOAM_NORMALShorline1208_g3661 );
				float3 worldPosValue71_g38152 = WorldPosition;
				float3 WorldPosition66_g38152 = worldPosValue71_g38152;
				float3 NORMAL_OUT1731_g3661 = temp_output_1715_0_g3661;
				float3 temp_output_16_0_g38152 = NORMAL_OUT1731_g3661;
				float3 lerpResult163_g38152 = lerp( ( WorldTangent * temp_output_16_0_g38152.x ) , ( WorldBiTangent * temp_output_16_0_g38152.y ) , ( WorldNormal * temp_output_16_0_g38152.z ));
				float3 NORMAL_PERPIXEL136_g38152 = lerpResult163_g38152;
				float3 WorldNormal66_g38152 = NORMAL_PERPIXEL136_g38152;
				float3 WorldView66_g38152 = WorldViewDirection;
				float3 temp_output_1_0_g38152 = _URP_SpecularColor.rgb;
				float3 SpecColor66_g38152 = (temp_output_1_0_g38152).xyz;
				float temp_output_173_0_g38152 = ( 1.0 - _URP_SpecularStrength );
				float Smoothness66_g38152 = temp_output_173_0_g38152;
				float4 shadowMaskValue77_g38152 = float4(1,1,1,1);
				float4 ShadowMask66_g38152 = shadowMaskValue77_g38152;
				float3 localAdditionalLightsSpecularMask66_g38152 = AdditionalLightsSpecularMask( WorldPosition66_g38152 , WorldNormal66_g38152 , WorldView66_g38152 , SpecColor66_g38152 , Smoothness66_g38152 , ShadowMask66_g38152 );
				float3 ADDITIONAL_LIGHT1730_g3661 = localAdditionalLightsSpecularMask66_g38152;
				float3 temp_output_1732_0_g3661 = ( temp_output_1715_0_g3661 + ADDITIONAL_LIGHT1730_g3661 );
				float3 temp_output_19_0_g39462 = temp_output_1732_0_g3661;
				float3 NORMAL_IN105_g39462 = temp_output_19_0_g39462;
				float3 m_Off103_g39462 = NORMAL_IN105_g39462;
				int m_switch914_g39462 = _Vertical_ModeUV;
				float3 _MASK_VECTOR1485_g39462 = float3(0.001,0.001,0.001);
				float2 appendResult259_g39462 = (float2(_Vertical_TilingX , _Vertical_TilingY));
				float2 VERTICAL_UV_TILING377_g39462 = appendResult259_g39462;
				float2 UV_TILING88_g39473 = VERTICAL_UV_TILING377_g39462;
				float3 objToWorld137_g39473 = mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord9.xyz, 1 ) ).xyz;
				float2 appendResult129_g39473 = (float2(-objToWorld137_g39473.x , objToWorld137_g39473.y));
				float temp_output_52_0_g39473 = _Vertical_Columns;
				float temp_output_53_0_g39473 = _Vertical_Rows;
				float2 appendResult1_g39473 = (float2(temp_output_52_0_g39473 , temp_output_53_0_g39473));
				float VERTICAL_FRAMES15_g39473 = ( temp_output_52_0_g39473 * temp_output_53_0_g39473 );
				float2 appendResult49_g39473 = (float2(VERTICAL_FRAMES15_g39473 , temp_output_53_0_g39473));
				float clampResult37_g39473 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39473 - 1.0 ) );
				float temp_output_36_0_g39473 = frac( ( ( ( _TimeParameters.x * _Vertical_Speed ) + clampResult37_g39473 ) / VERTICAL_FRAMES15_g39473 ) );
				float2 appendResult31_g39473 = (float2(temp_output_36_0_g39473 , ( 1.0 - temp_output_36_0_g39473 )));
				float2 _UV_VERTICAL_X_DOWN863_g39462 = ( ( ( ( UV_TILING88_g39473 * appendResult129_g39473 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g39473 ) + ( floor( ( appendResult49_g39473 * appendResult31_g39473 ) ) / appendResult1_g39473 ) );
				int _Global_Rain_Enabled1178_g39462 = _Global_Rain_Enabled;
				int m_switch1190_g39462 = _Global_Rain_Enabled1178_g39462;
				float m_Off1190_g39462 = _Vertical_Intensity;
				float _Global_Rain_Intensity1174_g39462 = _Global_Rain_Intensity;
				float m_Active1190_g39462 = ( _Vertical_Intensity * _Global_Rain_Intensity1174_g39462 );
				float localfloatswitch1190_g39462 = floatswitch1190_g39462( m_switch1190_g39462 , m_Off1190_g39462 , m_Active1190_g39462 );
				float _VERTICAL_INTENSITY861_g39462 = saturate( localfloatswitch1190_g39462 );
				float3 unpack908_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_X_DOWN863_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack908_g39462.z = lerp( 1, unpack908_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float3 temp_cast_57 = (0.5).xxx;
				float3 break149_g39462 = ( abs( WorldNormal ) - temp_cast_57 );
				float smoothstepResult1521_g39462 = smoothstep( _Vertical_SmoothEdge , 1.0 , ( break149_g39462.z + 0.5 ));
				float _MASK_VERTICAL_Z1241_g39462 = smoothstepResult1521_g39462;
				float3 lerpResult1138_g39462 = lerp( _MASK_VECTOR1485_g39462 , unpack908_g39462 , _MASK_VERTICAL_Z1241_g39462);
				float2 UV_TILING88_g39463 = VERTICAL_UV_TILING377_g39462;
				float3 objToWorld137_g39463 = mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord9.xyz, 1 ) ).xyz;
				float2 appendResult115_g39463 = (float2(objToWorld137_g39463.z , objToWorld137_g39463.y));
				float temp_output_52_0_g39463 = _Vertical_Columns;
				float temp_output_53_0_g39463 = _Vertical_Rows;
				float2 appendResult1_g39463 = (float2(temp_output_52_0_g39463 , temp_output_53_0_g39463));
				float VERTICAL_FRAMES15_g39463 = ( temp_output_52_0_g39463 * temp_output_53_0_g39463 );
				float2 appendResult49_g39463 = (float2(VERTICAL_FRAMES15_g39463 , temp_output_53_0_g39463));
				float clampResult37_g39463 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39463 - 1.0 ) );
				float temp_output_36_0_g39463 = frac( ( ( ( _TimeParameters.x * _Vertical_Speed ) + clampResult37_g39463 ) / VERTICAL_FRAMES15_g39463 ) );
				float2 appendResult31_g39463 = (float2(temp_output_36_0_g39463 , ( 1.0 - temp_output_36_0_g39463 )));
				float2 _UV_VERTICAL_Y_DOWN870_g39462 = ( ( ( ( UV_TILING88_g39463 * appendResult115_g39463 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g39463 ) + ( floor( ( appendResult49_g39463 * appendResult31_g39463 ) ) / appendResult1_g39463 ) );
				float3 unpack925_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_Y_DOWN870_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack925_g39462.z = lerp( 1, unpack925_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float2 _SmoothX = float2(0,1);
				float smoothstepResult1523_g39462 = smoothstep( _SmoothX.x , _SmoothX.y , ( break149_g39462.x + 0.45 ));
				float _MASK_VERTICAL_X151_g39462 = smoothstepResult1523_g39462;
				float3 lerpResult1261_g39462 = lerp( _MASK_VECTOR1485_g39462 , unpack925_g39462 , _MASK_VERTICAL_X151_g39462);
				float2 _SmoothY = float2(0,1);
				float smoothstepResult1519_g39462 = smoothstep( _SmoothY.x , _SmoothY.y , ( -break149_g39462.y + 0.45 ));
				float _MASK_VERTICAL_Y1216_g39462 = smoothstepResult1519_g39462;
				float3 lerpResult1390_g39462 = lerp( lerpResult1138_g39462 , BlendNormal( lerpResult1138_g39462 , lerpResult1261_g39462 ) , _MASK_VERTICAL_Y1216_g39462);
				float3 m_Standard914_g39462 = lerpResult1390_g39462;
				float localStochasticTiling895_g39462 = ( 0.0 );
				float2 UV895_g39462 = _UV_VERTICAL_X_DOWN863_g39462;
				float2 UV1895_g39462 = float2( 0,0 );
				float2 UV2895_g39462 = float2( 0,0 );
				float2 UV3895_g39462 = float2( 0,0 );
				float W1895_g39462 = 0.0;
				float W2895_g39462 = 0.0;
				float W3895_g39462 = 0.0;
				StochasticTiling( UV895_g39462 , UV1895_g39462 , UV2895_g39462 , UV3895_g39462 , W1895_g39462 , W2895_g39462 , W3895_g39462 );
				float2 temp_output_906_0_g39462 = ddx( _UV_VERTICAL_X_DOWN863_g39462 );
				float2 temp_output_886_0_g39462 = ddy( _UV_VERTICAL_X_DOWN863_g39462 );
				float3 unpack913_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1895_g39462, temp_output_906_0_g39462, temp_output_886_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack913_g39462.z = lerp( 1, unpack913_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V1_W1887_g39462 = W1895_g39462;
				float3 unpack920_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2895_g39462, temp_output_906_0_g39462, temp_output_886_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack920_g39462.z = lerp( 1, unpack920_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V1_W2897_g39462 = W2895_g39462;
				float3 unpack892_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3895_g39462, temp_output_906_0_g39462, temp_output_886_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack892_g39462.z = lerp( 1, unpack892_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V1_W3926_g39462 = W3895_g39462;
				float3 lerpResult950_g39462 = lerp( _MASK_VECTOR1485_g39462 , ( ( unpack913_g39462 * UV1_V1_W1887_g39462 ) + ( ( unpack920_g39462 * UV1_V1_W2897_g39462 ) + ( unpack892_g39462 * UV1_V1_W3926_g39462 ) ) ) , _MASK_VERTICAL_Z1241_g39462);
				float localStochasticTiling865_g39462 = ( 0.0 );
				float2 UV865_g39462 = _UV_VERTICAL_Y_DOWN870_g39462;
				float2 UV1865_g39462 = float2( 0,0 );
				float2 UV2865_g39462 = float2( 0,0 );
				float2 UV3865_g39462 = float2( 0,0 );
				float W1865_g39462 = 0.0;
				float W2865_g39462 = 0.0;
				float W3865_g39462 = 0.0;
				StochasticTiling( UV865_g39462 , UV1865_g39462 , UV2865_g39462 , UV3865_g39462 , W1865_g39462 , W2865_g39462 , W3865_g39462 );
				float2 temp_output_883_0_g39462 = ddx( _UV_VERTICAL_Y_DOWN870_g39462 );
				float2 temp_output_894_0_g39462 = ddy( _UV_VERTICAL_Y_DOWN870_g39462 );
				float3 unpack904_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1865_g39462, temp_output_883_0_g39462, temp_output_894_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack904_g39462.z = lerp( 1, unpack904_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V2_W1866_g39462 = W1865_g39462;
				float3 unpack922_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2865_g39462, temp_output_883_0_g39462, temp_output_894_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack922_g39462.z = lerp( 1, unpack922_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V2_W2884_g39462 = W2865_g39462;
				float3 unpack910_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3865_g39462, temp_output_883_0_g39462, temp_output_894_0_g39462 ), _VERTICAL_INTENSITY861_g39462 );
				unpack910_g39462.z = lerp( 1, unpack910_g39462.z, saturate(_VERTICAL_INTENSITY861_g39462) );
				float UV1_V2_W3871_g39462 = W3865_g39462;
				float3 lerpResult946_g39462 = lerp( _MASK_VECTOR1485_g39462 , ( ( unpack904_g39462 * UV1_V2_W1866_g39462 ) + ( ( unpack922_g39462 * UV1_V2_W2884_g39462 ) + ( unpack910_g39462 * UV1_V2_W3871_g39462 ) ) ) , _MASK_VERTICAL_X151_g39462);
				float3 lerpResult1400_g39462 = lerp( lerpResult950_g39462 , BlendNormal( lerpResult950_g39462 , lerpResult946_g39462 ) , _MASK_VERTICAL_Y1216_g39462);
				float3 m_Stochastic914_g39462 = lerpResult1400_g39462;
				float3 localfloat3switch914_g39462 = float3switch914_g39462( m_switch914_g39462 , m_Standard914_g39462 , m_Stochastic914_g39462 );
				float3 RAIN_VERTICAL127_g39462 = localfloat3switch914_g39462;
				float temp_output_1454_0_g3661 = ( _SMOOTHNESS_Strength * _SMOOTHNESS_Strength );
				float3 temp_cast_58 = (temp_output_1454_0_g3661).xxx;
				float3 NORMAL_OUT_Z505_g3661 = weightedBlend1711_g3661;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal1601_g3661 = NORMAL_OUT_Z505_g3661;
				float3 worldNormal1601_g3661 = float3(dot(tanToWorld0,tanNormal1601_g3661), dot(tanToWorld1,tanNormal1601_g3661), dot(tanToWorld2,tanNormal1601_g3661));
				float fresnelNdotV1412_g3661 = dot( worldNormal1601_g3661, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode1412_g3661 = ( _SMOOTHNESS_FresnelBias + _SMOOTHNESS_FresnelScale * pow( max( 1.0 - fresnelNdotV1412_g3661 , 0.0001 ), _SMOOTHNESS_FresnelPower ) );
				float3 lerpResult1403_g3661 = lerp( temp_cast_58 , ( temp_output_1454_0_g3661 * worldNormal1601_g3661 ) , ( fresnelNode1412_g3661 * ( 1.0 - fresnelNode1412_g3661 ) ));
				float3 clampResult1740_g3661 = clamp( lerpResult1403_g3661 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float4 temp_output_23_0_g39462 = float4( clampResult1740_g3661 , 0.0 );
				float4 lerpResult144_g39462 = lerp( temp_output_23_0_g39462 , ( temp_output_23_0_g39462 * 0.05 ) , IN.ase_color.r);
				float4 temp_cast_60 = (0.7).xxxx;
				float4 SMOOTHNESS94_g39462 = step( step( lerpResult144_g39462 , temp_cast_60 ) , float4( 0,0,0,0 ) );
				float3 lerpResult42_g39462 = lerp( RAIN_VERTICAL127_g39462 , float3( 0,0,0 ) , SMOOTHNESS94_g39462.xyz);
				float3 temp_output_26_0_g39468 = float3( 0,0,0 );
				float3 m_Active103_g39462 = BlendNormal( temp_output_19_0_g39462 , ( ( lerpResult42_g39462 - temp_output_26_0_g39468 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39468 ) ) );
				float3 localfloat3switch103_g39462 = float3switch( m_switch103_g39462 , m_Off103_g39462 , m_Active103_g39462 );
				int m_switch1010_g39462 = _Static_RainMode;
				float3 m_Off1010_g39462 = NORMAL_IN105_g39462;
				int m_switch992_g39462 = _Static_ModeUV;
				float2 appendResult737_g39462 = (float2(_Static_TilingX , _Static_TilingY));
				float2 appendResult738_g39462 = (float2(_Static_OffsetX , _Static_OffsetY));
				float2 texCoord736_g39462 = IN.ase_texcoord7.xy * appendResult737_g39462 + appendResult738_g39462;
				float2 appendResult731_g39462 = (float2(frac( texCoord736_g39462.x ) , frac( texCoord736_g39462.y )));
				float2 _STATIC_UV01_OUT990_g39462 = ( appendResult731_g39462 + ( (ase_screenPosNorm).xy * _Static_ScreenContribution ) );
				int m_switch1186_g39462 = _Global_Rain_Enabled1178_g39462;
				float m_Off1186_g39462 = _Static_Intensity;
				float m_Active1186_g39462 = ( _Static_Intensity * _Global_Rain_Intensity1174_g39462 );
				float localfloatswitch1186_g39462 = floatswitch1186_g39462( m_switch1186_g39462 , m_Off1186_g39462 , m_Active1186_g39462 );
				float _STATIC_INTENSITY991_g39462 = saturate( localfloatswitch1186_g39462 );
				float3 unpack727_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Static_RainMap, sampler_trilinear_repeat, _STATIC_UV01_OUT990_g39462 ), _STATIC_INTENSITY991_g39462 );
				unpack727_g39462.z = lerp( 1, unpack727_g39462.z, saturate(_STATIC_INTENSITY991_g39462) );
				float3 m_Standard992_g39462 = unpack727_g39462;
				float localStochasticTiling973_g39462 = ( 0.0 );
				float2 UV973_g39462 = _STATIC_UV01_OUT990_g39462;
				float2 UV1973_g39462 = float2( 0,0 );
				float2 UV2973_g39462 = float2( 0,0 );
				float2 UV3973_g39462 = float2( 0,0 );
				float W1973_g39462 = 0.0;
				float W2973_g39462 = 0.0;
				float W3973_g39462 = 0.0;
				StochasticTiling( UV973_g39462 , UV1973_g39462 , UV2973_g39462 , UV3973_g39462 , W1973_g39462 , W2973_g39462 , W3973_g39462 );
				float2 temp_output_977_0_g39462 = ddx( _STATIC_UV01_OUT990_g39462 );
				float2 temp_output_978_0_g39462 = ddy( _STATIC_UV01_OUT990_g39462 );
				float3 unpack974_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV1973_g39462, temp_output_977_0_g39462, temp_output_978_0_g39462 ), _STATIC_INTENSITY991_g39462 );
				unpack974_g39462.z = lerp( 1, unpack974_g39462.z, saturate(_STATIC_INTENSITY991_g39462) );
				float UV1_S1_W1975_g39462 = W1973_g39462;
				float3 unpack970_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV2973_g39462, temp_output_977_0_g39462, temp_output_978_0_g39462 ), _STATIC_INTENSITY991_g39462 );
				unpack970_g39462.z = lerp( 1, unpack970_g39462.z, saturate(_STATIC_INTENSITY991_g39462) );
				float UV1_S1_W2972_g39462 = W2973_g39462;
				float3 unpack971_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV3973_g39462, temp_output_977_0_g39462, temp_output_978_0_g39462 ), _STATIC_INTENSITY991_g39462 );
				unpack971_g39462.z = lerp( 1, unpack971_g39462.z, saturate(_STATIC_INTENSITY991_g39462) );
				float UV1_S1_W3976_g39462 = W3973_g39462;
				float3 m_Stochastic992_g39462 = ( ( unpack974_g39462 * UV1_S1_W1975_g39462 ) + ( ( unpack970_g39462 * UV1_S1_W2972_g39462 ) + ( unpack971_g39462 * UV1_S1_W3976_g39462 ) ) );
				float3 localfloat3switch992_g39462 = float3switch992_g39462( m_switch992_g39462 , m_Standard992_g39462 , m_Stochastic992_g39462 );
				float3 RAIN_STATIC743_g39462 = localfloat3switch992_g39462;
				float3 lerpResult1005_g39462 = lerp( RAIN_STATIC743_g39462 , float3( 0,0,0 ) , SMOOTHNESS94_g39462.xyz);
				float3 temp_output_26_0_g39479 = float3( 0,0,0 );
				float3 m_Active1010_g39462 = BlendNormal( temp_output_19_0_g39462 , ( ( lerpResult1005_g39462 - temp_output_26_0_g39479 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39479 ) ) );
				float3 localfloat3switch1010_g39462 = float3switch( m_switch1010_g39462 , m_Off1010_g39462 , m_Active1010_g39462 );
				int m_switch1009_g39462 = _Horizontal_RainMode;
				float3 m_Off1009_g39462 = NORMAL_IN105_g39462;
				int m_switch1505_g39462 = _Horizontal_ModeUV;
				float2 appendResult269_g39462 = (float2(_Horizontal_TilingX , _Horizontal_TilingY));
				float2 HORIZONTAL_UV_TILING158_g39462 = appendResult269_g39462;
				float2 UV_TILING88_g39477 = HORIZONTAL_UV_TILING158_g39462;
				float2 appendResult271_g39462 = (float2(_Horizontal_OffsetX , _Horizontal_OffsetY));
				float2 HORIZONTAL_UV_OFFSET159_g39462 = appendResult271_g39462;
				float2 UV_OFFSET94_g39477 = HORIZONTAL_UV_OFFSET159_g39462;
				float2 texCoord87_g39477 = IN.ase_texcoord7.xy * UV_TILING88_g39477 + UV_OFFSET94_g39477;
				float2 appendResult86_g39477 = (float2(frac( texCoord87_g39477.x ) , frac( texCoord87_g39477.y )));
				float temp_output_52_0_g39477 = _Horizontal_Columns;
				float temp_output_53_0_g39477 = _Horizontal_Rows;
				float2 appendResult1_g39477 = (float2(temp_output_52_0_g39477 , temp_output_53_0_g39477));
				float VERTICAL_FRAMES15_g39477 = ( temp_output_52_0_g39477 * temp_output_53_0_g39477 );
				float2 appendResult49_g39477 = (float2(VERTICAL_FRAMES15_g39477 , temp_output_53_0_g39477));
				float clampResult37_g39477 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39477 - 1.0 ) );
				float temp_output_36_0_g39477 = frac( ( ( ( _TimeParameters.x * _Horizontal_Speed ) + clampResult37_g39477 ) / VERTICAL_FRAMES15_g39477 ) );
				float2 appendResult31_g39477 = (float2(temp_output_36_0_g39477 , ( 1.0 - temp_output_36_0_g39477 )));
				float2 UV_HORIZONTAL_DEFAULT_01817_g39462 = ( ( ( appendResult86_g39477 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g39477 ) + ( floor( ( appendResult49_g39477 * appendResult31_g39477 ) ) / appendResult1_g39477 ) );
				int m_switch1179_g39462 = _Global_Rain_Enabled1178_g39462;
				float m_Off1179_g39462 = _Horizontal_Intensity;
				float m_Active1179_g39462 = ( _Horizontal_Intensity * _Global_Rain_Intensity1174_g39462 );
				float localfloatswitch1179_g39462 = floatswitch1179_g39462( m_switch1179_g39462 , m_Off1179_g39462 , m_Active1179_g39462 );
				float _HORIZONTAL_INTENSITY814_g39462 = saturate( localfloatswitch1179_g39462 );
				float3 unpack9_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_01817_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack9_g39462.z = lerp( 1, unpack9_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float2 UV_TILING88_g39465 = ( HORIZONTAL_UV_TILING158_g39462 / float2( 0.6,0.6 ) );
				float2 UV_OFFSET94_g39465 = ( HORIZONTAL_UV_OFFSET159_g39462 + float2( 0.3,0.3 ) );
				float2 texCoord87_g39465 = IN.ase_texcoord7.xy * UV_TILING88_g39465 + UV_OFFSET94_g39465;
				float2 appendResult86_g39465 = (float2(frac( texCoord87_g39465.x ) , frac( texCoord87_g39465.y )));
				float temp_output_52_0_g39465 = _Horizontal_Columns;
				float temp_output_53_0_g39465 = _Horizontal_Rows;
				float2 appendResult1_g39465 = (float2(temp_output_52_0_g39465 , temp_output_53_0_g39465));
				float VERTICAL_FRAMES15_g39465 = ( temp_output_52_0_g39465 * temp_output_53_0_g39465 );
				float2 appendResult49_g39465 = (float2(VERTICAL_FRAMES15_g39465 , temp_output_53_0_g39465));
				float clampResult37_g39465 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39465 - 1.0 ) );
				float temp_output_36_0_g39465 = frac( ( ( ( _TimeParameters.x * _Horizontal_Speed ) + clampResult37_g39465 ) / VERTICAL_FRAMES15_g39465 ) );
				float2 appendResult31_g39465 = (float2(temp_output_36_0_g39465 , ( 1.0 - temp_output_36_0_g39465 )));
				float2 UV_HORIZONTAL_DEFAULT_02818_g39462 = ( ( ( appendResult86_g39465 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g39465 ) + ( floor( ( appendResult49_g39465 * appendResult31_g39465 ) ) / appendResult1_g39465 ) );
				float3 unpack339_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_02818_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack339_g39462.z = lerp( 1, unpack339_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float3 m_Standard1505_g39462 = BlendNormal( unpack9_g39462 , unpack339_g39462 );
				float localStochasticTiling800_g39462 = ( 0.0 );
				float2 UV800_g39462 = UV_HORIZONTAL_DEFAULT_01817_g39462;
				float2 UV1800_g39462 = float2( 0,0 );
				float2 UV2800_g39462 = float2( 0,0 );
				float2 UV3800_g39462 = float2( 0,0 );
				float W1800_g39462 = 0.0;
				float W2800_g39462 = 0.0;
				float W3800_g39462 = 0.0;
				StochasticTiling( UV800_g39462 , UV1800_g39462 , UV2800_g39462 , UV3800_g39462 , W1800_g39462 , W2800_g39462 , W3800_g39462 );
				float2 temp_output_804_0_g39462 = ddx( UV_HORIZONTAL_DEFAULT_01817_g39462 );
				float2 temp_output_797_0_g39462 = ddy( UV_HORIZONTAL_DEFAULT_01817_g39462 );
				float3 unpack809_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1800_g39462, temp_output_804_0_g39462, temp_output_797_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack809_g39462.z = lerp( 1, unpack809_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H1_W1805_g39462 = W1800_g39462;
				float3 unpack810_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2800_g39462, temp_output_804_0_g39462, temp_output_797_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack810_g39462.z = lerp( 1, unpack810_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H1_W2803_g39462 = W2800_g39462;
				float3 unpack811_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3800_g39462, temp_output_804_0_g39462, temp_output_797_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack811_g39462.z = lerp( 1, unpack811_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H1_W3812_g39462 = W3800_g39462;
				float localStochasticTiling781_g39462 = ( 0.0 );
				float2 UV781_g39462 = UV_HORIZONTAL_DEFAULT_02818_g39462;
				float2 UV1781_g39462 = float2( 0,0 );
				float2 UV2781_g39462 = float2( 0,0 );
				float2 UV3781_g39462 = float2( 0,0 );
				float W1781_g39462 = 0.0;
				float W2781_g39462 = 0.0;
				float W3781_g39462 = 0.0;
				StochasticTiling( UV781_g39462 , UV1781_g39462 , UV2781_g39462 , UV3781_g39462 , W1781_g39462 , W2781_g39462 , W3781_g39462 );
				float2 temp_output_788_0_g39462 = ddx( UV_HORIZONTAL_DEFAULT_02818_g39462 );
				float2 temp_output_777_0_g39462 = ddy( UV_HORIZONTAL_DEFAULT_02818_g39462 );
				float3 unpack782_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1781_g39462, temp_output_788_0_g39462, temp_output_777_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack782_g39462.z = lerp( 1, unpack782_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H2_W1789_g39462 = W1781_g39462;
				float3 unpack783_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2781_g39462, temp_output_788_0_g39462, temp_output_777_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack783_g39462.z = lerp( 1, unpack783_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H2_W2787_g39462 = W2781_g39462;
				float3 unpack779_g39462 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3781_g39462, temp_output_788_0_g39462, temp_output_777_0_g39462 ), _HORIZONTAL_INTENSITY814_g39462 );
				unpack779_g39462.z = lerp( 1, unpack779_g39462.z, saturate(_HORIZONTAL_INTENSITY814_g39462) );
				float UV1_H2_W3785_g39462 = W3781_g39462;
				float3 m_Stochastic1505_g39462 = BlendNormal( ( ( unpack809_g39462 * UV1_H1_W1805_g39462 ) + ( ( unpack810_g39462 * UV1_H1_W2803_g39462 ) + ( unpack811_g39462 * UV1_H1_W3812_g39462 ) ) ) , ( ( unpack782_g39462 * UV1_H2_W1789_g39462 ) + ( ( unpack783_g39462 * UV1_H2_W2787_g39462 ) + ( unpack779_g39462 * UV1_H2_W3785_g39462 ) ) ) );
				float3 localfloat3switch1505_g39462 = float3switch1505_g39462( m_switch1505_g39462 , m_Standard1505_g39462 , m_Stochastic1505_g39462 );
				float2 _SmoothH = float2(0,1);
				float smoothstepResult1517_g39462 = smoothstep( _SmoothH.x , _SmoothH.y , ( WorldNormal.y + 0.02 ));
				float _MASK_HORIZONTAL152_g39462 = smoothstepResult1517_g39462;
				float3 lerpResult279_g39462 = lerp( _MASK_VECTOR1485_g39462 , localfloat3switch1505_g39462 , _MASK_HORIZONTAL152_g39462);
				float3 RAIN_HORIZONTAL123_g39462 = lerpResult279_g39462;
				float3 lerpResult1002_g39462 = lerp( RAIN_HORIZONTAL123_g39462 , float3( 0,0,0 ) , SMOOTHNESS94_g39462.xyz);
				float3 temp_output_26_0_g39470 = float3( 0,0,0 );
				float3 m_Active1009_g39462 = BlendNormal( temp_output_19_0_g39462 , ( ( lerpResult1002_g39462 - temp_output_26_0_g39470 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39470 ) ) );
				float3 localfloat3switch1009_g39462 = float3switch( m_switch1009_g39462 , m_Off1009_g39462 , m_Active1009_g39462 );
				
				int temp_output_43_0_g38128 = _Specular_Mode;
				int m_switch18_g38128 = temp_output_43_0_g38128;
				float3 m_Off18_g38128 = float3( 0,0,0 );
				float3 tanNormal37_g38128 = temp_output_1732_0_g3661;
				float3 worldNormal37_g38128 = float3(dot(tanToWorld0,tanNormal37_g38128), dot(tanToWorld1,tanNormal37_g38128), dot(tanToWorld2,tanNormal37_g38128));
				float3 normalizeResult20_g38128 = normalize( worldNormal37_g38128 );
				float3 normalizeResult27_g38128 = normalize( ( WorldViewDirection + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult19_g38128 = dot( normalizeResult20_g38128 , normalizeResult27_g38128 );
				float temp_output_48_0_g38128 = _SpecularWrap;
				float temp_output_46_0_g38128 = (dotResult19_g38128*temp_output_48_0_g38128 + temp_output_48_0_g38128);
				float saferPower25_g38128 = max( ( temp_output_46_0_g38128 * temp_output_46_0_g38128 * temp_output_46_0_g38128 ) , 0.0001 );
				int _SPECULAR_Mode22_g38128 = temp_output_43_0_g38128;
				int m_switch31_g38128 = _SPECULAR_Mode22_g38128;
				float3 m_Off31_g38128 = float3( 0,0,0 );
				float3 temp_output_16_0_g38128 = (_SpecularColor).rgb;
				float3 m_Active31_g38128 = temp_output_16_0_g38128;
				float3 clampResult5_g38128 = clamp( temp_output_16_0_g38128 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp31_g38128 = clampResult5_g38128;
				float3 localfloat3switch31_g38128 = float3switch31_g38128( m_switch31_g38128 , m_Off31_g38128 , m_Active31_g38128 , m_ActiveClamp31_g38128 );
				int m_switch11_g38128 = _SPECULAR_Mode22_g38128;
				float3 m_Off11_g38128 = float3( 0,0,0 );
				float3 temp_output_4_0_g38128 = (_MainLightColor).rgb;
				float3 m_Active11_g38128 = temp_output_4_0_g38128;
				float3 clampResult9_g38128 = clamp( temp_output_4_0_g38128 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp11_g38128 = clampResult9_g38128;
				float3 localfloat3switch11_g38128 = float3switch11_g38128( m_switch11_g38128 , m_Off11_g38128 , m_Active11_g38128 , m_ActiveClamp11_g38128 );
				float3 temp_output_24_0_g38128 = saturate( ( pow( saferPower25_g38128 , ( 1.0 - _Shininess ) ) * saturate( ( localfloat3switch31_g38128 * localfloat3switch11_g38128 ) ) ) );
				float3 m_Active18_g38128 = temp_output_24_0_g38128;
				float3 m_ActiveClamp18_g38128 = temp_output_24_0_g38128;
				float3 localfloat3switch18_g38128 = float3switch18_g38128( m_switch18_g38128 , m_Off18_g38128 , m_Active18_g38128 , m_ActiveClamp18_g38128 );
				
				int m_switch23_g39467 = _Rain_GlobalWetnessMode;
				float4 temp_output_17_0_g39467 = temp_output_23_0_g39462;
				float4 m_Off23_g39467 = temp_output_17_0_g39467;
				int m_switch12_g39467 = _Global_Wetness_Enabled;
				float4 m_Off12_g39467 = temp_output_17_0_g39467;
				float4 m_Active12_g39467 = saturate( ( temp_output_17_0_g39467 + _Global_Wetness_Intensity ) );
				float4 localfloat4switch12_g39467 = float4switch12_g39467( m_switch12_g39467 , m_Off12_g39467 , m_Active12_g39467 );
				float4 m_Active23_g39467 = localfloat4switch12_g39467;
				float4 localfloat4switch23_g39467 = float4switch23_g39467( m_switch23_g39467 , m_Off23_g39467 , m_Active23_g39467 );
				
				float3 Albedo = ( temp_output_746_0_g39462 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
				float3 Normal = ( localfloat3switch103_g39462 + localfloat3switch1010_g39462 + localfloat3switch1009_g39462 );
				float3 Emission = 0;
				float3 Specular = localfloat3switch18_g38128;
				float Metallic = 0;
				float Smoothness = localfloat4switch23_g39467.x;
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
	Fallback " "
	
}
/*ASEBEGIN
Version=18913
4;29.33333;1436.667;767.6667;700.3125;3406.616;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;975;192.1422,-2577.905;Inherit;False;335.6667;118;DESF Common ASE Compile Shaders;1;976;;0,0.2047877,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;843;200.0305,-3187.07;Inherit;False;175;112;GLOBAL SETTINGS ;1;207;;0,0,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;974;-546.5249,-2853.571;Inherit;False;DESF Core Water URP;5;;3661;2ce30b88128d2f64bb175b3da03ff631;9,1745,7,169,0,212,1,1081,0,440,0,438,0,1078,0,310,0,1079,0;0;7;COLOR;0;FLOAT3;123;FLOAT3;1651;FLOAT3;122;FLOAT;419;FLOAT;417;FLOAT;1080
Node;AmplifyShaderEditor.CommentaryNode;844;199.208,-3064.666;Inherit;False;355.5028;184.4201;DEBUG SETTINGS ;3;700;698;964;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;979;-82.22913,-3187.283;Inherit;False;271;139;_RECEIVE_SHADOWS_OFF;1;980;;0,0,0,1;0;0
Node;AmplifyShaderEditor.StaticSwitch;980;-74.22913,-3148.283;Inherit;False;Property;_RECEIVE_SHADOWS_OFF;Receive Shadows;3;0;Create;False;0;0;0;True;0;False;0;0;0;True;_RECEIVE_SHADOWS_OFF;Toggle;2;Key0;Key1;Fetch;True;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;698;205.3818,-3024.394;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;964;209.8078,-2953.154;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;207;216.0131,-3152.746;Float;False;Property;_CullMode;Cull Mode;4;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;973;-153.942,-2868.655;Inherit;False;DESF Module Rain;141;;39462;58c64a46e00b7044aaf191f7451a976c;1,1532,1;3;746;FLOAT4;0,0,0,0;False;19;FLOAT3;0,0,1;False;23;FLOAT4;1,0,0,0;False;3;FLOAT4;747;FLOAT3;0;FLOAT4;1536
Node;AmplifyShaderEditor.IntNode;700;396.1788,-3022.381;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;976;209.1422,-2536.905;Inherit;False;DESF Common ASE Compile Shaders;-1;;39481;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;905;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;2;5;False;-1;10;False;-1;1;1;False;-1;10;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;False;False;False;False;False;False;True;2;True;700;True;3;False;697;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;970;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;2;5;False;-1;10;False;-1;1;1;False;-1;10;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;2;True;700;True;3;False;697;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;901;198.1309,-2867.459;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;DEC/Rain/Rain Water Lake Simple;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;1;True;964;False;True;2;True;207;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;5;True;18;all;0;True;True;2;5;False;-1;10;False;-1;1;1;False;-1;10;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;2;True;700;True;3;False;697;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;False;2;Include;;False;;Native;Pragma;shader_feature_local _RECEIVE_SHADOWS_OFF;False;;Custom; ;0;0;Standard;38;Workflow;0;Surface;1;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,False,-1;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;0;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;0;  Phong;0;  Strength;0.5,True,388;  Type;0;  Tess;16,True,386;  Min;10,True,387;  Max;25,True,385;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Write Depth;0;  Early Z;0;Vertex Position,InvertActionOnDeselection;1;0;8;False;True;False;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;903;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;969;198.1309,-2807.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;904;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;902;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;900;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;973;746;974;0
WireConnection;973;19;974;123
WireConnection;973;23;974;122
WireConnection;901;0;973;747
WireConnection;901;1;973;0
WireConnection;901;9;974;1651
WireConnection;901;4;973;1536
ASEEND*/
//CHKSM=AC7DB9BF9B9DDE3CE43D6BFE8D5E36FDAF355A4F