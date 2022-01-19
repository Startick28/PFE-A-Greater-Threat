// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Rain/Rain Surface Height Detail Tessellation"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Toggle(_RECEIVE_SHADOWS_OFF)] _RECEIVE_SHADOWS_OFF("Receive Shadows", Float) = 0
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Header(MAP MAIN TEXTURE)]_Color("Albedo Tint", Color) = (1,1,1,0)
		[SingleLineTexture]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1
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
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.5
		[SingleLineTexture]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Standard,0,Geometric,1,Texture,2)]_SmoothnessModeSurface("Smoothness Mode", Int) = 2
		[Enum(Smoothness,0,Roughness,1)]_SmoothnessType("Smoothness Type", Int) = 0
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0.1
		_SmoothnessThreshold("Smoothness Threshold", Range( 0 , 0.5)) = 0
		_SmoothnessVariance("Smoothness Variance", Range( 0 , 1)) = 0.2
		[Header(DISPLACEMENT)][Enum(Off,0,Active,1,Active Reconstructed,2)]_Displacement_Mode("Mode", Int) = 0
		[SingleLineTexture]_ParallaxMap("Displacement Map", 2D) = "white" {}
		_Displacement_Strength("Strength", Range( 0 , 1)) = 0
		[Header(TESSELLATION URP)]_TessellationStrength("Tessellation Strength", Range( 0.001 , 32)) = 6
		_TessellationPhong("Tessellation Phong", Range( 0 , 1)) = 0.5
		_TessellationDistanceMin("Tessellation Distance Min", Float) = 0
		_TessellationDistanceMax("Tessellation Distance Max ", Float) = 5
		[Header(DETAIL)][Enum(Off,0,Active,1)]_EnableDetailMap("Enable Detail Map", Int) = 0
		_ColorDetail("Tint", Color) = (1,1,1,0)
		[SingleLineTexture]_DetailAlbedoMap("Albedo Map", 2D) = "white" {}
		_DetailTilingXDetail("Tiling X", Float) = 1
		_DetailTilingYDetail("Tiling Y", Float) = 1
		_DetailOffsetXDetail("Offset X", Float) = 0
		_DetailOffsetYDetail("Offset Y", Float) = 0
		[Normal][SingleLineTexture]_DetailNormalMap("Normal Map", 2D) = "bump" {}
		_DetailNormalMapScale("Normal Strength", Float) = 1
		_DetailBlendInfluence("Blend Influence", Range( 0 , 3)) = 0
		[Enum(Red,0,Green,1,Blue,2)]_BlendColor("Blend Vertex Color", Int) = 0
		_BlendHeight("Blend Height", Range( 0 , 1.25)) = 1
		_DetailBlendSmooth("Blend Smooth", Range( 0.01 , 0.5)) = 0.35
		[Header(DETAIL MASK)][Enum(Off,0,Active,1,Active Inverted,2)]_EnableDetailMask("Enable Detail Mask", Int) = 0
		[SingleLineTexture]_DetailMaskMap("Mask Map", 2D) = "white" {}
		_Detail_BlendAmountMask("Blend Amount", Range( 0.001 , 1)) = 0.5
		_Detail_BlendHardnessMask("Blend Hardness", Range( 0.001 , 5)) = 1
		_Detail_BlendFalloffMask("Blend Falloff", Range( 0.001 , 0.999)) = 0.5
		_DetailTilingXDetailMask("Tiling X", Float) = 1
		_DetailTilingYDetailMask("Tiling Y", Float) = 1
		_DetailOffsetXDetailMask("Offset X", Float) = 0
		_DetailOffsetYDetailMask("Offset Y", Float) = 0
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
		//_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Max Tessellation", Range( 1, 32 ) ) = 16
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
			Tags { "LightMode"="UniversalForward" "NatureRendererInstancing"="True" }
			
			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_POSITION
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
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_TexelSize;
			float4 _Color;
			half4 _ColorDetail;
			float _Vertical_TilingY;
			float _Vertical_ScreenContribution;
			float _Vertical_Columns;
			float _Vertical_Rows;
			float _Vertical_Speed;
			float _Vertical_SmoothEdge;
			int _Static_RainMode;
			int _SmoothnessType;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			int _Vertical_ModeUV;
			float _Vertical_TilingX;
			int _SmoothnessModeSurface;
			int _Static_ModeUV;
			float _Static_TilingX;
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
			half _DetailNormalMapScale;
			half _TessellationDistanceMax;
			half _NormalStrength;
			int _Vertical_RainMode;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			half _Displacement_Strength;
			int _Displacement_Mode;
			int _EnableDetailMap;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ColorMask;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationPhong;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _Rain_WetnessDarken;
			half _DetailBlendSmooth;
			half _BlendHeight;
			int _BlendColor;
			half _DetailBlendInfluence;
			half _Detail_BlendFalloffMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendAmountMask;
			half _DetailOffsetYDetailMask;
			half _DetailOffsetXDetailMask;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetYDetail;
			half _DetailOffsetXDetail;
			float _DetailTilingYDetail;
			float _MetallicStrength;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_Vertical_RainMap);
			int _Global_Rain_Enabled;
			half _Global_Rain_Intensity;
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);
			TEXTURE2D(_Static_RainMap);
			TEXTURE2D(_Horizontal_RainMap);
			TEXTURE2D(_MetallicGlossMap);
			int _Global_Wetness_Enabled;
			half _Global_Wetness_Intensity;


			float3 float3switch74_g39558( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch226_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float floatswitch319_g39591( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			float4 float4switch125_g39591( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			void CalculateUVsSmooth19_g39545( float2 UV, float4 TexelSize, out float2 UV0, out float2 UV1, out float2 UV2, out float2 UV3, out float2 UV4, out float2 UV5, out float2 UV6, out float2 UV7, out float2 UV8 )
			{
				{
				 float3 pos = float3( TexelSize.xy, 0 );
				    float3 neg = float3( -pos.xy, 0 );
				 UV0 = UV + neg.xy;
				    UV1 = UV + neg.zy;
				    UV2 = UV + float2( pos.x, neg.y );
				    UV3 = UV + neg.xz;
				    UV4 = UV;
				    UV5 = UV + pos.xz;
				    UV6 = UV + float2( neg.x, pos.y );
				    UV7 = UV + pos.zy;
				    UV8 = UV + pos.xy;
				    return;
				}
			}
			
			float3 CombineSamplesSmooth31_g39545( float Strength, float S0, float S1, float S2, float S3, float S4, float S5, float S6, float S7, float S8 )
			{
				{
				 float3 normal;
				    normal.x = Strength * ( S0 - S2 + 2 * S3 - 2 * S5 + S6 - S8 );
				    normal.y = Strength * ( S0 + 2 * S1 + S2 - S6 - 2 * S7 - S8 );
				    normal.z = 1.0;
				    return normalize( normal );
				}
			}
			
			float3 float3switch1310_g38551( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
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
			
			float3 float3switch221_g39591( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch127_g39591( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1190_g39622( int m_switch, float m_Off, float m_Active )
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
			
			float3 float3switch914_g39622( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch170_g39551( int m_switch, float4 m_Smoothness, float4 m_Roughness )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else
				return float4(0,0,0,0);
			}
			
			float3 float3switch1387_g38551( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch167_g39551( int m_switch, float4 m_Smoothness, float4 m_Roughness )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch99_g39551( int m_switch, float4 m_Standard, float4 m_Geometric, float4 m_Texture )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Geometric;
				else if(m_switch ==2)
					return m_Texture;
				else
				return float4(0,0,0,0);
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
			
			float floatswitch1186_g39622( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			float3 float3switch992_g39622( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1179_g39622( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			float3 float3switch1505_g39622( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch12_g39627( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch23_g39627( int m_switch, float4 m_Off, float4 m_Active )
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

				float3 temp_output_309_0_g38551 = float3(0,0,0);
				int temp_output_62_0_g39558 = _Displacement_Mode;
				int m_switch74_g39558 = temp_output_62_0_g39558;
				float3 Vector3_0_0_0155_g39558 = float3(0,0,0);
				float3 m_Off74_g39558 = Vector3_0_0_0155_g39558;
				float Strength158_g39558 = _Displacement_Strength;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = v.texcoord.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 OUT_DISPLAC1180_g38551 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g39580, 0.0 );
				float4 temp_output_60_0_g39558 = OUT_DISPLAC1180_g38551;
				float3 HEIGHT_DEFAULT162_g39558 = ( ( v.ase_normal * Strength158_g39558 ) * temp_output_60_0_g39558.x );
				float3 m_Active74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 m_ActiveReconstructed74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 localfloat3switch74_g39558 = float3switch74_g39558( m_switch74_g39558 , m_Off74_g39558 , m_Active74_g39558 , m_ActiveReconstructed74_g39558 );
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord8 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38551 + localfloat3switch74_g39558 );
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
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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

				int SURFACE_MAP_MODE122_g39591 = _EnableDetailMap;
				int m_switch125_g39591 = SURFACE_MAP_MODE122_g39591;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = IN.ase_texcoord7.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
				float4 OUT_ALBEDO_RGBA1177_g38551 = tex2DNode63_g39580;
				float3 temp_output_7_0_g38551 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38551).rgb * _Brightness );
				float4 temp_output_39_0_g39591 = ( float4( temp_output_7_0_g38551 , 0.0 ) + float4(0,0,0,0) );
				float4 ALBEDO_IN_RGBA40_g39591 = temp_output_39_0_g39591;
				float4 m_Off125_g39591 = ALBEDO_IN_RGBA40_g39591;
				int m_switch226_g39591 = _EnableDetailMask;
				float2 appendResult132_g39591 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g39591 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g39591 = IN.ase_texcoord7.xy * appendResult132_g39591 + appendResult114_g39591;
				float4 tex2DNode45_g39591 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g39591 );
				float4 ALBEDO_OUT255_g39591 = ( _ColorDetail * tex2DNode45_g39591 * _Brightness );
				float4 m_Off226_g39591 = ALBEDO_OUT255_g39591;
				float2 appendResult219_g39591 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g39591 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g39591 = IN.ase_texcoord7.xy * appendResult219_g39591 + appendResult206_g39591;
				float temp_output_15_0_g39595 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g39591 ).r );
				float temp_output_26_0_g39595 = _Detail_BlendAmountMask;
				float temp_output_24_0_g39595 = _Detail_BlendHardnessMask;
				float saferPower2_g39595 = max( max( saturate( (0.0 + (temp_output_15_0_g39595 - ( 1.0 - temp_output_26_0_g39595 )) * (temp_output_24_0_g39595 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g39595 ))) ) , 0.0 ) , 0.0001 );
				float temp_output_22_0_g39595 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g39591 = saturate( pow( saferPower2_g39595 , ( 1.0 - temp_output_22_0_g39595 ) ) );
				float4 lerpResult225_g39591 = lerp( ALBEDO_IN_RGBA40_g39591 , ALBEDO_OUT255_g39591 , temp_output_403_0_g39591);
				float4 m_Active226_g39591 = lerpResult225_g39591;
				float saferPower11_g39595 = max( max( saturate( (1.0 + (temp_output_15_0_g39595 - temp_output_26_0_g39595) * (( 1.0 - temp_output_24_0_g39595 ) - 1.0) / (0.0 - temp_output_26_0_g39595)) ) , 0.0 ) , 0.0001 );
				float temp_output_403_21_g39591 = saturate( pow( saferPower11_g39595 , temp_output_22_0_g39595 ) );
				float4 lerpResult408_g39591 = lerp( ALBEDO_OUT255_g39591 , ALBEDO_IN_RGBA40_g39591 , temp_output_403_21_g39591);
				float4 m_ActiveInverted226_g39591 = lerpResult408_g39591;
				float4 localfloat4switch226_g39591 = float4switch226_g39591( m_switch226_g39591 , m_Off226_g39591 , m_Active226_g39591 , m_ActiveInverted226_g39591 );
				float4 MASK_ALBEDO_OUT258_g39591 = localfloat4switch226_g39591;
				float4 break48_g39591 = temp_output_39_0_g39591;
				float ALBEDO_IN_RGB300_g39591 = ( break48_g39591.x + break48_g39591.y + break48_g39591.z );
				int m_switch319_g39591 = _BlendColor;
				float m_Red319_g39591 = IN.ase_color.r;
				float m_Green319_g39591 = IN.ase_color.g;
				float m_Blue319_g39591 = IN.ase_color.b;
				float localfloatswitch319_g39591 = floatswitch319_g39591( m_switch319_g39591 , m_Red319_g39591 , m_Green319_g39591 , m_Blue319_g39591 );
				float clampResult47_g39591 = clamp( ( ( ( ( ALBEDO_IN_RGB300_g39591 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localfloatswitch319_g39591 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DETAIL_BLEND43_g39591 = clampResult47_g39591;
				float4 lerpResult58_g39591 = lerp( MASK_ALBEDO_OUT258_g39591 , ALBEDO_IN_RGBA40_g39591 , DETAIL_BLEND43_g39591);
				float4 m_Active125_g39591 = lerpResult58_g39591;
				float4 localfloat4switch125_g39591 = float4switch125_g39591( m_switch125_g39591 , m_Off125_g39591 , m_Active125_g39591 );
				float4 temp_output_746_0_g39622 = localfloat4switch125_g39591;
				
				int m_switch103_g39622 = _Vertical_RainMode;
				int m_switch127_g39591 = SURFACE_MAP_MODE122_g39591;
				int _Displacement_Mode1309_g38551 = _Displacement_Mode;
				int m_switch1310_g38551 = _Displacement_Mode1309_g38551;
				float4 OUT_NORMAL1178_g38551 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_output_1_0_g39549 = OUT_NORMAL1178_g38551;
				float temp_output_8_0_g39549 = _NormalStrength;
				float3 unpack52_g39549 = UnpackNormalScale( temp_output_1_0_g39549, temp_output_8_0_g39549 );
				unpack52_g39549.z = lerp( 1, unpack52_g39549.z, saturate(temp_output_8_0_g39549) );
				float3 temp_output_1478_59_g38551 = unpack52_g39549;
				float3 m_Off1310_g38551 = temp_output_1478_59_g38551;
				float3 m_Active1310_g38551 = temp_output_1478_59_g38551;
				float temp_output_1334_0_g38551 = ( _NormalStrength * 2.0 );
				float temp_output_29_0_g39545 = temp_output_1334_0_g38551;
				float Strength31_g39545 = temp_output_29_0_g39545;
				float localCalculateUVsSmooth19_g39545 = ( 0.0 );
				float2 temp_output_96_0_g39545 = OUT_UV431_g38551;
				float2 UV19_g39545 = temp_output_96_0_g39545;
				float4 TexelSize19_g39545 = _ParallaxMap_TexelSize;
				float2 UV019_g39545 = float2( 0,0 );
				float2 UV119_g39545 = float2( 0,0 );
				float2 UV219_g39545 = float2( 0,0 );
				float2 UV319_g39545 = float2( 0,0 );
				float2 UV419_g39545 = float2( 0,0 );
				float2 UV519_g39545 = float2( 0,0 );
				float2 UV619_g39545 = float2( 0,0 );
				float2 UV719_g39545 = float2( 0,0 );
				float2 UV819_g39545 = float2( 0,0 );
				CalculateUVsSmooth19_g39545( UV19_g39545 , TexelSize19_g39545 , UV019_g39545 , UV119_g39545 , UV219_g39545 , UV319_g39545 , UV419_g39545 , UV519_g39545 , UV619_g39545 , UV719_g39545 , UV819_g39545 );
				float4 break13_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV019_g39545 );
				float S031_g39545 = break13_g39545.r;
				float4 break8_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV119_g39545 );
				float S131_g39545 = break8_g39545.r;
				float4 break5_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV219_g39545 );
				float S231_g39545 = break5_g39545.r;
				float4 break3_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV319_g39545 );
				float S331_g39545 = break3_g39545.r;
				float4 break12_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV419_g39545 );
				float S431_g39545 = break12_g39545.r;
				float4 break23_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV519_g39545 );
				float S531_g39545 = break23_g39545.r;
				float4 break44_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV619_g39545 );
				float S631_g39545 = break44_g39545.r;
				float4 break42_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV719_g39545 );
				float S731_g39545 = break42_g39545.r;
				float4 break40_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV819_g39545 );
				float S831_g39545 = break40_g39545.r;
				float3 localCombineSamplesSmooth31_g39545 = CombineSamplesSmooth31_g39545( Strength31_g39545 , S031_g39545 , S131_g39545 , S231_g39545 , S331_g39545 , S431_g39545 , S531_g39545 , S631_g39545 , S731_g39545 , S831_g39545 );
				float3 m_ActiveReconstructed1310_g38551 = localCombineSamplesSmooth31_g39545;
				float3 localfloat3switch1310_g38551 = float3switch1310_g38551( m_switch1310_g38551 , m_Off1310_g38551 , m_Active1310_g38551 , m_ActiveReconstructed1310_g38551 );
				float3 NORMAL_OUT314_g38551 = localfloat3switch1310_g38551;
				float3 temp_output_16_0_g39547 = NORMAL_OUT314_g38551;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal134_g39547 = temp_output_16_0_g39547;
				float3 worldNormal134_g39547 = float3(dot(tanToWorld0,tanNormal134_g39547), dot(tanToWorld1,tanNormal134_g39547), dot(tanToWorld2,tanNormal134_g39547));
				float3 NORMAL_TANGENTSPACE135_g39547 = worldNormal134_g39547;
				float3 WorldPosition63_g39547 = NORMAL_TANGENTSPACE135_g39547;
				float4 shadowMaskValue77_g39547 = float4(1,1,1,1);
				float4 ShadowMask63_g39547 = shadowMaskValue77_g39547;
				float3 localAdditionalLightsFlatMask63_g39547 = AdditionalLightsFlatMask( WorldPosition63_g39547 , ShadowMask63_g39547 );
				float3 ADDITIONAL_LIGHT1342_g38551 = localAdditionalLightsFlatMask63_g39547;
				float3 temp_output_38_0_g39591 = ( localfloat3switch1310_g38551 + ADDITIONAL_LIGHT1342_g38551 );
				float3 NORMAL_IN260_g39591 = temp_output_38_0_g39591;
				float3 m_Off127_g39591 = NORMAL_IN260_g39591;
				int EnableDetailMask216_g39591 = _EnableDetailMask;
				int m_switch221_g39591 = EnableDetailMask216_g39591;
				float4 temp_output_1_0_g39596 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, texCoord67_g39591 );
				float temp_output_8_0_g39596 = _DetailNormalMapScale;
				float3 unpack52_g39596 = UnpackNormalScale( temp_output_1_0_g39596, temp_output_8_0_g39596 );
				unpack52_g39596.z = lerp( 1, unpack52_g39596.z, saturate(temp_output_8_0_g39596) );
				float3 NORMAL_OUT199_g39591 = unpack52_g39596;
				float3 m_Off221_g39591 = NORMAL_OUT199_g39591;
				float3 lerpResult205_g39591 = lerp( NORMAL_IN260_g39591 , NORMAL_OUT199_g39591 , temp_output_403_0_g39591);
				float3 m_Active221_g39591 = saturate( lerpResult205_g39591 );
				float3 lerpResult406_g39591 = lerp( NORMAL_OUT199_g39591 , NORMAL_IN260_g39591 , temp_output_403_21_g39591);
				float3 m_ActiveInverted221_g39591 = saturate( lerpResult406_g39591 );
				float3 localfloat3switch221_g39591 = float3switch221_g39591( m_switch221_g39591 , m_Off221_g39591 , m_Active221_g39591 , m_ActiveInverted221_g39591 );
				float3 MASK_NORMAL_OUT222_g39591 = localfloat3switch221_g39591;
				float3 lerpResult62_g39591 = lerp( MASK_NORMAL_OUT222_g39591 , NORMAL_IN260_g39591 , DETAIL_BLEND43_g39591);
				float3 temp_output_318_0_g39591 = ( NORMAL_IN260_g39591 + saturate( lerpResult62_g39591 ) );
				float3 m_Active127_g39591 = temp_output_318_0_g39591;
				float3 localfloat3switch127_g39591 = float3switch127_g39591( m_switch127_g39591 , m_Off127_g39591 , m_Active127_g39591 );
				float3 temp_output_19_0_g39622 = localfloat3switch127_g39591;
				float3 NORMAL_IN105_g39622 = temp_output_19_0_g39622;
				float3 m_Off103_g39622 = NORMAL_IN105_g39622;
				int m_switch914_g39622 = _Vertical_ModeUV;
				float3 _MASK_VECTOR1485_g39622 = float3(0.001,0.001,0.001);
				float2 appendResult259_g39622 = (float2(_Vertical_TilingX , _Vertical_TilingY));
				float2 VERTICAL_UV_TILING377_g39622 = appendResult259_g39622;
				float2 UV_TILING88_g39633 = VERTICAL_UV_TILING377_g39622;
				float3 objToWorld137_g39633 = mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord8.xyz, 1 ) ).xyz;
				float2 appendResult129_g39633 = (float2(-objToWorld137_g39633.x , objToWorld137_g39633.y));
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float temp_output_52_0_g39633 = _Vertical_Columns;
				float temp_output_53_0_g39633 = _Vertical_Rows;
				float2 appendResult1_g39633 = (float2(temp_output_52_0_g39633 , temp_output_53_0_g39633));
				float VERTICAL_FRAMES15_g39633 = ( temp_output_52_0_g39633 * temp_output_53_0_g39633 );
				float2 appendResult49_g39633 = (float2(VERTICAL_FRAMES15_g39633 , temp_output_53_0_g39633));
				float clampResult37_g39633 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39633 - 1.0 ) );
				float temp_output_36_0_g39633 = frac( ( ( ( _TimeParameters.x * _Vertical_Speed ) + clampResult37_g39633 ) / VERTICAL_FRAMES15_g39633 ) );
				float2 appendResult31_g39633 = (float2(temp_output_36_0_g39633 , ( 1.0 - temp_output_36_0_g39633 )));
				float2 _UV_VERTICAL_X_DOWN863_g39622 = ( ( ( ( UV_TILING88_g39633 * appendResult129_g39633 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g39633 ) + ( floor( ( appendResult49_g39633 * appendResult31_g39633 ) ) / appendResult1_g39633 ) );
				int _Global_Rain_Enabled1178_g39622 = _Global_Rain_Enabled;
				int m_switch1190_g39622 = _Global_Rain_Enabled1178_g39622;
				float m_Off1190_g39622 = _Vertical_Intensity;
				float _Global_Rain_Intensity1174_g39622 = _Global_Rain_Intensity;
				float m_Active1190_g39622 = ( _Vertical_Intensity * _Global_Rain_Intensity1174_g39622 );
				float localfloatswitch1190_g39622 = floatswitch1190_g39622( m_switch1190_g39622 , m_Off1190_g39622 , m_Active1190_g39622 );
				float _VERTICAL_INTENSITY861_g39622 = saturate( localfloatswitch1190_g39622 );
				float3 unpack908_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_X_DOWN863_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack908_g39622.z = lerp( 1, unpack908_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float3 temp_cast_8 = (0.5).xxx;
				float3 break149_g39622 = ( abs( WorldNormal ) - temp_cast_8 );
				float smoothstepResult1521_g39622 = smoothstep( _Vertical_SmoothEdge , 1.0 , ( break149_g39622.z + 0.5 ));
				float _MASK_VERTICAL_Z1241_g39622 = smoothstepResult1521_g39622;
				float3 lerpResult1138_g39622 = lerp( _MASK_VECTOR1485_g39622 , unpack908_g39622 , _MASK_VERTICAL_Z1241_g39622);
				float2 UV_TILING88_g39623 = VERTICAL_UV_TILING377_g39622;
				float3 objToWorld137_g39623 = mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord8.xyz, 1 ) ).xyz;
				float2 appendResult115_g39623 = (float2(objToWorld137_g39623.z , objToWorld137_g39623.y));
				float temp_output_52_0_g39623 = _Vertical_Columns;
				float temp_output_53_0_g39623 = _Vertical_Rows;
				float2 appendResult1_g39623 = (float2(temp_output_52_0_g39623 , temp_output_53_0_g39623));
				float VERTICAL_FRAMES15_g39623 = ( temp_output_52_0_g39623 * temp_output_53_0_g39623 );
				float2 appendResult49_g39623 = (float2(VERTICAL_FRAMES15_g39623 , temp_output_53_0_g39623));
				float clampResult37_g39623 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39623 - 1.0 ) );
				float temp_output_36_0_g39623 = frac( ( ( ( _TimeParameters.x * _Vertical_Speed ) + clampResult37_g39623 ) / VERTICAL_FRAMES15_g39623 ) );
				float2 appendResult31_g39623 = (float2(temp_output_36_0_g39623 , ( 1.0 - temp_output_36_0_g39623 )));
				float2 _UV_VERTICAL_Y_DOWN870_g39622 = ( ( ( ( UV_TILING88_g39623 * appendResult115_g39623 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g39623 ) + ( floor( ( appendResult49_g39623 * appendResult31_g39623 ) ) / appendResult1_g39623 ) );
				float3 unpack925_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_Y_DOWN870_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack925_g39622.z = lerp( 1, unpack925_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float2 _SmoothX = float2(0,1);
				float smoothstepResult1523_g39622 = smoothstep( _SmoothX.x , _SmoothX.y , ( break149_g39622.x + 0.45 ));
				float _MASK_VERTICAL_X151_g39622 = smoothstepResult1523_g39622;
				float3 lerpResult1261_g39622 = lerp( _MASK_VECTOR1485_g39622 , unpack925_g39622 , _MASK_VERTICAL_X151_g39622);
				float2 _SmoothY = float2(0,1);
				float smoothstepResult1519_g39622 = smoothstep( _SmoothY.x , _SmoothY.y , ( -break149_g39622.y + 0.45 ));
				float _MASK_VERTICAL_Y1216_g39622 = smoothstepResult1519_g39622;
				float3 lerpResult1390_g39622 = lerp( lerpResult1138_g39622 , BlendNormal( lerpResult1138_g39622 , lerpResult1261_g39622 ) , _MASK_VERTICAL_Y1216_g39622);
				float3 m_Standard914_g39622 = lerpResult1390_g39622;
				float localStochasticTiling895_g39622 = ( 0.0 );
				float2 UV895_g39622 = _UV_VERTICAL_X_DOWN863_g39622;
				float2 UV1895_g39622 = float2( 0,0 );
				float2 UV2895_g39622 = float2( 0,0 );
				float2 UV3895_g39622 = float2( 0,0 );
				float W1895_g39622 = 0.0;
				float W2895_g39622 = 0.0;
				float W3895_g39622 = 0.0;
				StochasticTiling( UV895_g39622 , UV1895_g39622 , UV2895_g39622 , UV3895_g39622 , W1895_g39622 , W2895_g39622 , W3895_g39622 );
				float2 temp_output_906_0_g39622 = ddx( _UV_VERTICAL_X_DOWN863_g39622 );
				float2 temp_output_886_0_g39622 = ddy( _UV_VERTICAL_X_DOWN863_g39622 );
				float3 unpack913_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1895_g39622, temp_output_906_0_g39622, temp_output_886_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack913_g39622.z = lerp( 1, unpack913_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V1_W1887_g39622 = W1895_g39622;
				float3 unpack920_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2895_g39622, temp_output_906_0_g39622, temp_output_886_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack920_g39622.z = lerp( 1, unpack920_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V1_W2897_g39622 = W2895_g39622;
				float3 unpack892_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3895_g39622, temp_output_906_0_g39622, temp_output_886_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack892_g39622.z = lerp( 1, unpack892_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V1_W3926_g39622 = W3895_g39622;
				float3 lerpResult950_g39622 = lerp( _MASK_VECTOR1485_g39622 , ( ( unpack913_g39622 * UV1_V1_W1887_g39622 ) + ( ( unpack920_g39622 * UV1_V1_W2897_g39622 ) + ( unpack892_g39622 * UV1_V1_W3926_g39622 ) ) ) , _MASK_VERTICAL_Z1241_g39622);
				float localStochasticTiling865_g39622 = ( 0.0 );
				float2 UV865_g39622 = _UV_VERTICAL_Y_DOWN870_g39622;
				float2 UV1865_g39622 = float2( 0,0 );
				float2 UV2865_g39622 = float2( 0,0 );
				float2 UV3865_g39622 = float2( 0,0 );
				float W1865_g39622 = 0.0;
				float W2865_g39622 = 0.0;
				float W3865_g39622 = 0.0;
				StochasticTiling( UV865_g39622 , UV1865_g39622 , UV2865_g39622 , UV3865_g39622 , W1865_g39622 , W2865_g39622 , W3865_g39622 );
				float2 temp_output_883_0_g39622 = ddx( _UV_VERTICAL_Y_DOWN870_g39622 );
				float2 temp_output_894_0_g39622 = ddy( _UV_VERTICAL_Y_DOWN870_g39622 );
				float3 unpack904_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1865_g39622, temp_output_883_0_g39622, temp_output_894_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack904_g39622.z = lerp( 1, unpack904_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V2_W1866_g39622 = W1865_g39622;
				float3 unpack922_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2865_g39622, temp_output_883_0_g39622, temp_output_894_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack922_g39622.z = lerp( 1, unpack922_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V2_W2884_g39622 = W2865_g39622;
				float3 unpack910_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3865_g39622, temp_output_883_0_g39622, temp_output_894_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack910_g39622.z = lerp( 1, unpack910_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V2_W3871_g39622 = W3865_g39622;
				float3 lerpResult946_g39622 = lerp( _MASK_VECTOR1485_g39622 , ( ( unpack904_g39622 * UV1_V2_W1866_g39622 ) + ( ( unpack922_g39622 * UV1_V2_W2884_g39622 ) + ( unpack910_g39622 * UV1_V2_W3871_g39622 ) ) ) , _MASK_VERTICAL_X151_g39622);
				float3 lerpResult1400_g39622 = lerp( lerpResult950_g39622 , BlendNormal( lerpResult950_g39622 , lerpResult946_g39622 ) , _MASK_VERTICAL_Y1216_g39622);
				float3 m_Stochastic914_g39622 = lerpResult1400_g39622;
				float3 localfloat3switch914_g39622 = float3switch914_g39622( m_switch914_g39622 , m_Standard914_g39622 , m_Stochastic914_g39622 );
				float3 RAIN_VERTICAL127_g39622 = localfloat3switch914_g39622;
				int m_switch99_g39551 = _SmoothnessModeSurface;
				int m_switch170_g39551 = _SmoothnessType;
				float4 temp_cast_9 = (_SmoothnessStrength).xxxx;
				float4 m_Smoothness170_g39551 = temp_cast_9;
				float4 temp_cast_10 = (( 1.0 - _SmoothnessStrength )).xxxx;
				float4 m_Roughness170_g39551 = temp_cast_10;
				float4 localfloat4switch170_g39551 = float4switch170_g39551( m_switch170_g39551 , m_Smoothness170_g39551 , m_Roughness170_g39551 );
				float4 FINAL_STANDARD111_g39551 = localfloat4switch170_g39551;
				float4 m_Standard99_g39551 = FINAL_STANDARD111_g39551;
				int m_switch1387_g38551 = _Displacement_Mode1309_g38551;
				float3 tanNormal67_g39549 = unpack52_g39549;
				float3 worldNormal67_g39549 = float3(dot(tanToWorld0,tanNormal67_g39549), dot(tanToWorld1,tanNormal67_g39549), dot(tanToWorld2,tanNormal67_g39549));
				float3 temp_output_1478_66_g38551 = worldNormal67_g39549;
				float3 m_Off1387_g38551 = temp_output_1478_66_g38551;
				float3 m_Active1387_g38551 = temp_output_1478_66_g38551;
				float3x3 ase_tangentToWorldFast = float3x3(WorldTangent.x,WorldBiTangent.x,WorldNormal.x,WorldTangent.y,WorldBiTangent.y,WorldNormal.y,WorldTangent.z,WorldBiTangent.z,WorldNormal.z);
				float3 tangentToWorldDir104_g39545 = mul( ase_tangentToWorldFast, localCombineSamplesSmooth31_g39545 );
				float3 m_ActiveReconstructed1387_g38551 = tangentToWorldDir104_g39545;
				float3 localfloat3switch1387_g38551 = float3switch1387_g38551( m_switch1387_g38551 , m_Off1387_g38551 , m_Active1387_g38551 , m_ActiveReconstructed1387_g38551 );
				float3 NORMAL_WORLD_OUT164_g38551 = localfloat3switch1387_g38551;
				float3 temp_output_4_0_g39551 = NORMAL_WORLD_OUT164_g38551;
				float3 temp_output_23_0_g39551 = ddx( temp_output_4_0_g39551 );
				float dotResult25_g39551 = dot( temp_output_23_0_g39551 , temp_output_23_0_g39551 );
				float3 temp_output_7_0_g39551 = ddy( temp_output_4_0_g39551 );
				float dotResult27_g39551 = dot( temp_output_7_0_g39551 , temp_output_7_0_g39551 );
				float temp_output_28_0_g39551 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult25_g39551 + dotResult27_g39551 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
				float4 break377_g38551 = OUT_ALBEDO_RGBA1177_g38551;
				float ALBEDO_R169_g38551 = break377_g38551.r;
				float4 temp_cast_11 = (ALBEDO_R169_g38551).xxxx;
				float4 FINAL_GEOMETRIC114_g39551 = ( temp_output_28_0_g39551 * ( 1.0 - temp_cast_11 ) );
				float4 m_Geometric99_g39551 = FINAL_GEOMETRIC114_g39551;
				int SMOOTHNESS_TYPE173_g39551 = _SmoothnessType;
				int m_switch167_g39551 = SMOOTHNESS_TYPE173_g39551;
				float4 _MASK_G1438_g38551 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_output_83_0_g39551 = _MASK_G1438_g38551;
				float4 m_Smoothness167_g39551 = temp_output_83_0_g39551;
				float4 m_Roughness167_g39551 = ( 1.0 - temp_output_83_0_g39551 );
				float4 localfloat4switch167_g39551 = float4switch167_g39551( m_switch167_g39551 , m_Smoothness167_g39551 , m_Roughness167_g39551 );
				float4 FINAL_SMOOTHNESS_TEXTURE117_g39551 = ( temp_output_28_0_g39551 * localfloat4switch167_g39551 );
				float4 m_Texture99_g39551 = FINAL_SMOOTHNESS_TEXTURE117_g39551;
				float4 localfloat4switch99_g39551 = float4switch99_g39551( m_switch99_g39551 , m_Standard99_g39551 , m_Geometric99_g39551 , m_Texture99_g39551 );
				float4 temp_output_1267_33_g38551 = localfloat4switch99_g39551;
				float4 color301_g38551 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 _MASK_R1439_g38551 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_cast_13 = (IN.ase_color.a).xxxx;
				float4 lerpResult11_g38551 = lerp( _MASK_R1439_g38551 , temp_cast_13 , (float)_OcclusionSourceMode);
				float4 lerpResult14_g38551 = lerp( color301_g38551 , lerpResult11_g38551 , _OcclusionStrengthAO);
				float4 temp_output_23_0_g39622 = ( temp_output_1267_33_g38551 * lerpResult14_g38551 );
				float4 lerpResult144_g39622 = lerp( temp_output_23_0_g39622 , ( temp_output_23_0_g39622 * 0.05 ) , IN.ase_color.r);
				float4 temp_cast_16 = (0.7).xxxx;
				float4 SMOOTHNESS94_g39622 = step( step( lerpResult144_g39622 , temp_cast_16 ) , float4( 0,0,0,0 ) );
				float3 lerpResult42_g39622 = lerp( RAIN_VERTICAL127_g39622 , float3( 0,0,0 ) , SMOOTHNESS94_g39622.xyz);
				float3 temp_output_26_0_g39628 = float3( 0,0,0 );
				float3 m_Active103_g39622 = BlendNormal( temp_output_19_0_g39622 , ( ( lerpResult42_g39622 - temp_output_26_0_g39628 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39628 ) ) );
				float3 localfloat3switch103_g39622 = float3switch( m_switch103_g39622 , m_Off103_g39622 , m_Active103_g39622 );
				int m_switch1010_g39622 = _Static_RainMode;
				float3 m_Off1010_g39622 = NORMAL_IN105_g39622;
				int m_switch992_g39622 = _Static_ModeUV;
				float2 appendResult737_g39622 = (float2(_Static_TilingX , _Static_TilingY));
				float2 appendResult738_g39622 = (float2(_Static_OffsetX , _Static_OffsetY));
				float2 texCoord736_g39622 = IN.ase_texcoord7.xy * appendResult737_g39622 + appendResult738_g39622;
				float2 appendResult731_g39622 = (float2(frac( texCoord736_g39622.x ) , frac( texCoord736_g39622.y )));
				float2 _STATIC_UV01_OUT990_g39622 = ( appendResult731_g39622 + ( (ase_screenPosNorm).xy * _Static_ScreenContribution ) );
				int m_switch1186_g39622 = _Global_Rain_Enabled1178_g39622;
				float m_Off1186_g39622 = _Static_Intensity;
				float m_Active1186_g39622 = ( _Static_Intensity * _Global_Rain_Intensity1174_g39622 );
				float localfloatswitch1186_g39622 = floatswitch1186_g39622( m_switch1186_g39622 , m_Off1186_g39622 , m_Active1186_g39622 );
				float _STATIC_INTENSITY991_g39622 = saturate( localfloatswitch1186_g39622 );
				float3 unpack727_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Static_RainMap, sampler_trilinear_repeat, _STATIC_UV01_OUT990_g39622 ), _STATIC_INTENSITY991_g39622 );
				unpack727_g39622.z = lerp( 1, unpack727_g39622.z, saturate(_STATIC_INTENSITY991_g39622) );
				float3 m_Standard992_g39622 = unpack727_g39622;
				float localStochasticTiling973_g39622 = ( 0.0 );
				float2 UV973_g39622 = _STATIC_UV01_OUT990_g39622;
				float2 UV1973_g39622 = float2( 0,0 );
				float2 UV2973_g39622 = float2( 0,0 );
				float2 UV3973_g39622 = float2( 0,0 );
				float W1973_g39622 = 0.0;
				float W2973_g39622 = 0.0;
				float W3973_g39622 = 0.0;
				StochasticTiling( UV973_g39622 , UV1973_g39622 , UV2973_g39622 , UV3973_g39622 , W1973_g39622 , W2973_g39622 , W3973_g39622 );
				float2 temp_output_977_0_g39622 = ddx( _STATIC_UV01_OUT990_g39622 );
				float2 temp_output_978_0_g39622 = ddy( _STATIC_UV01_OUT990_g39622 );
				float3 unpack974_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV1973_g39622, temp_output_977_0_g39622, temp_output_978_0_g39622 ), _STATIC_INTENSITY991_g39622 );
				unpack974_g39622.z = lerp( 1, unpack974_g39622.z, saturate(_STATIC_INTENSITY991_g39622) );
				float UV1_S1_W1975_g39622 = W1973_g39622;
				float3 unpack970_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV2973_g39622, temp_output_977_0_g39622, temp_output_978_0_g39622 ), _STATIC_INTENSITY991_g39622 );
				unpack970_g39622.z = lerp( 1, unpack970_g39622.z, saturate(_STATIC_INTENSITY991_g39622) );
				float UV1_S1_W2972_g39622 = W2973_g39622;
				float3 unpack971_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV3973_g39622, temp_output_977_0_g39622, temp_output_978_0_g39622 ), _STATIC_INTENSITY991_g39622 );
				unpack971_g39622.z = lerp( 1, unpack971_g39622.z, saturate(_STATIC_INTENSITY991_g39622) );
				float UV1_S1_W3976_g39622 = W3973_g39622;
				float3 m_Stochastic992_g39622 = ( ( unpack974_g39622 * UV1_S1_W1975_g39622 ) + ( ( unpack970_g39622 * UV1_S1_W2972_g39622 ) + ( unpack971_g39622 * UV1_S1_W3976_g39622 ) ) );
				float3 localfloat3switch992_g39622 = float3switch992_g39622( m_switch992_g39622 , m_Standard992_g39622 , m_Stochastic992_g39622 );
				float3 RAIN_STATIC743_g39622 = localfloat3switch992_g39622;
				float3 lerpResult1005_g39622 = lerp( RAIN_STATIC743_g39622 , float3( 0,0,0 ) , SMOOTHNESS94_g39622.xyz);
				float3 temp_output_26_0_g39639 = float3( 0,0,0 );
				float3 m_Active1010_g39622 = BlendNormal( temp_output_19_0_g39622 , ( ( lerpResult1005_g39622 - temp_output_26_0_g39639 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39639 ) ) );
				float3 localfloat3switch1010_g39622 = float3switch( m_switch1010_g39622 , m_Off1010_g39622 , m_Active1010_g39622 );
				int m_switch1009_g39622 = _Horizontal_RainMode;
				float3 m_Off1009_g39622 = NORMAL_IN105_g39622;
				int m_switch1505_g39622 = _Horizontal_ModeUV;
				float2 appendResult269_g39622 = (float2(_Horizontal_TilingX , _Horizontal_TilingY));
				float2 HORIZONTAL_UV_TILING158_g39622 = appendResult269_g39622;
				float2 UV_TILING88_g39637 = HORIZONTAL_UV_TILING158_g39622;
				float2 appendResult271_g39622 = (float2(_Horizontal_OffsetX , _Horizontal_OffsetY));
				float2 HORIZONTAL_UV_OFFSET159_g39622 = appendResult271_g39622;
				float2 UV_OFFSET94_g39637 = HORIZONTAL_UV_OFFSET159_g39622;
				float2 texCoord87_g39637 = IN.ase_texcoord7.xy * UV_TILING88_g39637 + UV_OFFSET94_g39637;
				float2 appendResult86_g39637 = (float2(frac( texCoord87_g39637.x ) , frac( texCoord87_g39637.y )));
				float temp_output_52_0_g39637 = _Horizontal_Columns;
				float temp_output_53_0_g39637 = _Horizontal_Rows;
				float2 appendResult1_g39637 = (float2(temp_output_52_0_g39637 , temp_output_53_0_g39637));
				float VERTICAL_FRAMES15_g39637 = ( temp_output_52_0_g39637 * temp_output_53_0_g39637 );
				float2 appendResult49_g39637 = (float2(VERTICAL_FRAMES15_g39637 , temp_output_53_0_g39637));
				float clampResult37_g39637 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39637 - 1.0 ) );
				float temp_output_36_0_g39637 = frac( ( ( ( _TimeParameters.x * _Horizontal_Speed ) + clampResult37_g39637 ) / VERTICAL_FRAMES15_g39637 ) );
				float2 appendResult31_g39637 = (float2(temp_output_36_0_g39637 , ( 1.0 - temp_output_36_0_g39637 )));
				float2 UV_HORIZONTAL_DEFAULT_01817_g39622 = ( ( ( appendResult86_g39637 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g39637 ) + ( floor( ( appendResult49_g39637 * appendResult31_g39637 ) ) / appendResult1_g39637 ) );
				int m_switch1179_g39622 = _Global_Rain_Enabled1178_g39622;
				float m_Off1179_g39622 = _Horizontal_Intensity;
				float m_Active1179_g39622 = ( _Horizontal_Intensity * _Global_Rain_Intensity1174_g39622 );
				float localfloatswitch1179_g39622 = floatswitch1179_g39622( m_switch1179_g39622 , m_Off1179_g39622 , m_Active1179_g39622 );
				float _HORIZONTAL_INTENSITY814_g39622 = saturate( localfloatswitch1179_g39622 );
				float3 unpack9_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_01817_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack9_g39622.z = lerp( 1, unpack9_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float2 UV_TILING88_g39625 = ( HORIZONTAL_UV_TILING158_g39622 / float2( 0.6,0.6 ) );
				float2 UV_OFFSET94_g39625 = ( HORIZONTAL_UV_OFFSET159_g39622 + float2( 0.3,0.3 ) );
				float2 texCoord87_g39625 = IN.ase_texcoord7.xy * UV_TILING88_g39625 + UV_OFFSET94_g39625;
				float2 appendResult86_g39625 = (float2(frac( texCoord87_g39625.x ) , frac( texCoord87_g39625.y )));
				float temp_output_52_0_g39625 = _Horizontal_Columns;
				float temp_output_53_0_g39625 = _Horizontal_Rows;
				float2 appendResult1_g39625 = (float2(temp_output_52_0_g39625 , temp_output_53_0_g39625));
				float VERTICAL_FRAMES15_g39625 = ( temp_output_52_0_g39625 * temp_output_53_0_g39625 );
				float2 appendResult49_g39625 = (float2(VERTICAL_FRAMES15_g39625 , temp_output_53_0_g39625));
				float clampResult37_g39625 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39625 - 1.0 ) );
				float temp_output_36_0_g39625 = frac( ( ( ( _TimeParameters.x * _Horizontal_Speed ) + clampResult37_g39625 ) / VERTICAL_FRAMES15_g39625 ) );
				float2 appendResult31_g39625 = (float2(temp_output_36_0_g39625 , ( 1.0 - temp_output_36_0_g39625 )));
				float2 UV_HORIZONTAL_DEFAULT_02818_g39622 = ( ( ( appendResult86_g39625 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g39625 ) + ( floor( ( appendResult49_g39625 * appendResult31_g39625 ) ) / appendResult1_g39625 ) );
				float3 unpack339_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_02818_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack339_g39622.z = lerp( 1, unpack339_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float3 m_Standard1505_g39622 = BlendNormal( unpack9_g39622 , unpack339_g39622 );
				float localStochasticTiling800_g39622 = ( 0.0 );
				float2 UV800_g39622 = UV_HORIZONTAL_DEFAULT_01817_g39622;
				float2 UV1800_g39622 = float2( 0,0 );
				float2 UV2800_g39622 = float2( 0,0 );
				float2 UV3800_g39622 = float2( 0,0 );
				float W1800_g39622 = 0.0;
				float W2800_g39622 = 0.0;
				float W3800_g39622 = 0.0;
				StochasticTiling( UV800_g39622 , UV1800_g39622 , UV2800_g39622 , UV3800_g39622 , W1800_g39622 , W2800_g39622 , W3800_g39622 );
				float2 temp_output_804_0_g39622 = ddx( UV_HORIZONTAL_DEFAULT_01817_g39622 );
				float2 temp_output_797_0_g39622 = ddy( UV_HORIZONTAL_DEFAULT_01817_g39622 );
				float3 unpack809_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1800_g39622, temp_output_804_0_g39622, temp_output_797_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack809_g39622.z = lerp( 1, unpack809_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H1_W1805_g39622 = W1800_g39622;
				float3 unpack810_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2800_g39622, temp_output_804_0_g39622, temp_output_797_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack810_g39622.z = lerp( 1, unpack810_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H1_W2803_g39622 = W2800_g39622;
				float3 unpack811_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3800_g39622, temp_output_804_0_g39622, temp_output_797_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack811_g39622.z = lerp( 1, unpack811_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H1_W3812_g39622 = W3800_g39622;
				float localStochasticTiling781_g39622 = ( 0.0 );
				float2 UV781_g39622 = UV_HORIZONTAL_DEFAULT_02818_g39622;
				float2 UV1781_g39622 = float2( 0,0 );
				float2 UV2781_g39622 = float2( 0,0 );
				float2 UV3781_g39622 = float2( 0,0 );
				float W1781_g39622 = 0.0;
				float W2781_g39622 = 0.0;
				float W3781_g39622 = 0.0;
				StochasticTiling( UV781_g39622 , UV1781_g39622 , UV2781_g39622 , UV3781_g39622 , W1781_g39622 , W2781_g39622 , W3781_g39622 );
				float2 temp_output_788_0_g39622 = ddx( UV_HORIZONTAL_DEFAULT_02818_g39622 );
				float2 temp_output_777_0_g39622 = ddy( UV_HORIZONTAL_DEFAULT_02818_g39622 );
				float3 unpack782_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1781_g39622, temp_output_788_0_g39622, temp_output_777_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack782_g39622.z = lerp( 1, unpack782_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H2_W1789_g39622 = W1781_g39622;
				float3 unpack783_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2781_g39622, temp_output_788_0_g39622, temp_output_777_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack783_g39622.z = lerp( 1, unpack783_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H2_W2787_g39622 = W2781_g39622;
				float3 unpack779_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3781_g39622, temp_output_788_0_g39622, temp_output_777_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack779_g39622.z = lerp( 1, unpack779_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H2_W3785_g39622 = W3781_g39622;
				float3 m_Stochastic1505_g39622 = BlendNormal( ( ( unpack809_g39622 * UV1_H1_W1805_g39622 ) + ( ( unpack810_g39622 * UV1_H1_W2803_g39622 ) + ( unpack811_g39622 * UV1_H1_W3812_g39622 ) ) ) , ( ( unpack782_g39622 * UV1_H2_W1789_g39622 ) + ( ( unpack783_g39622 * UV1_H2_W2787_g39622 ) + ( unpack779_g39622 * UV1_H2_W3785_g39622 ) ) ) );
				float3 localfloat3switch1505_g39622 = float3switch1505_g39622( m_switch1505_g39622 , m_Standard1505_g39622 , m_Stochastic1505_g39622 );
				float2 _SmoothH = float2(0,1);
				float smoothstepResult1517_g39622 = smoothstep( _SmoothH.x , _SmoothH.y , ( WorldNormal.y + 0.02 ));
				float _MASK_HORIZONTAL152_g39622 = smoothstepResult1517_g39622;
				float3 lerpResult279_g39622 = lerp( _MASK_VECTOR1485_g39622 , localfloat3switch1505_g39622 , _MASK_HORIZONTAL152_g39622);
				float3 RAIN_HORIZONTAL123_g39622 = lerpResult279_g39622;
				float3 lerpResult1002_g39622 = lerp( RAIN_HORIZONTAL123_g39622 , float3( 0,0,0 ) , SMOOTHNESS94_g39622.xyz);
				float3 temp_output_26_0_g39630 = float3( 0,0,0 );
				float3 m_Active1009_g39622 = BlendNormal( temp_output_19_0_g39622 , ( ( lerpResult1002_g39622 - temp_output_26_0_g39630 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39630 ) ) );
				float3 localfloat3switch1009_g39622 = float3switch( m_switch1009_g39622 , m_Off1009_g39622 , m_Active1009_g39622 );
				
				float4 _MASK_B1440_g38551 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g39580 );
				
				int m_switch23_g39627 = _Rain_GlobalWetnessMode;
				float4 temp_output_17_0_g39627 = temp_output_23_0_g39622;
				float4 m_Off23_g39627 = temp_output_17_0_g39627;
				int m_switch12_g39627 = _Global_Wetness_Enabled;
				float4 m_Off12_g39627 = temp_output_17_0_g39627;
				float4 m_Active12_g39627 = saturate( ( temp_output_17_0_g39627 + _Global_Wetness_Intensity ) );
				float4 localfloat4switch12_g39627 = float4switch12_g39627( m_switch12_g39627 , m_Off12_g39627 , m_Active12_g39627 );
				float4 m_Active23_g39627 = localfloat4switch12_g39627;
				float4 localfloat4switch23_g39627 = float4switch23_g39627( m_switch23_g39627 , m_Off23_g39627 , m_Active23_g39627 );
				
				float3 Albedo = ( temp_output_746_0_g39622 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
				float3 Normal = ( localfloat3switch103_g39622 + localfloat3switch1010_g39622 + localfloat3switch1009_g39622 );
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( _MetallicStrength * _MASK_B1440_g38551 ).r;
				float Smoothness = localfloat4switch23_g39627.x;
				float Occlusion = saturate( lerpResult14_g38551 ).r;
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
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_TexelSize;
			float4 _Color;
			half4 _ColorDetail;
			float _Vertical_TilingY;
			float _Vertical_ScreenContribution;
			float _Vertical_Columns;
			float _Vertical_Rows;
			float _Vertical_Speed;
			float _Vertical_SmoothEdge;
			int _Static_RainMode;
			int _SmoothnessType;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			int _Vertical_ModeUV;
			float _Vertical_TilingX;
			int _SmoothnessModeSurface;
			int _Static_ModeUV;
			float _Static_TilingX;
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
			half _DetailNormalMapScale;
			half _TessellationDistanceMax;
			half _NormalStrength;
			int _Vertical_RainMode;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			half _Displacement_Strength;
			int _Displacement_Mode;
			int _EnableDetailMap;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ColorMask;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationPhong;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _Rain_WetnessDarken;
			half _DetailBlendSmooth;
			half _BlendHeight;
			int _BlendColor;
			half _DetailBlendInfluence;
			half _Detail_BlendFalloffMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendAmountMask;
			half _DetailOffsetYDetailMask;
			half _DetailOffsetXDetailMask;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetYDetail;
			half _DetailOffsetXDetail;
			float _DetailTilingYDetail;
			float _MetallicStrength;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);


			float3 float3switch74_g39558( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			

			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 temp_output_309_0_g38551 = float3(0,0,0);
				int temp_output_62_0_g39558 = _Displacement_Mode;
				int m_switch74_g39558 = temp_output_62_0_g39558;
				float3 Vector3_0_0_0155_g39558 = float3(0,0,0);
				float3 m_Off74_g39558 = Vector3_0_0_0155_g39558;
				float Strength158_g39558 = _Displacement_Strength;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = v.ase_texcoord.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 OUT_DISPLAC1180_g38551 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g39580, 0.0 );
				float4 temp_output_60_0_g39558 = OUT_DISPLAC1180_g38551;
				float3 HEIGHT_DEFAULT162_g39558 = ( ( v.ase_normal * Strength158_g39558 ) * temp_output_60_0_g39558.x );
				float3 m_Active74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 m_ActiveReconstructed74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 localfloat3switch74_g39558 = float3switch74_g39558( m_switch74_g39558 , m_Off74_g39558 , m_Active74_g39558 , m_ActiveReconstructed74_g39558 );
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38551 + localfloat3switch74_g39558 );
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
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_TexelSize;
			float4 _Color;
			half4 _ColorDetail;
			float _Vertical_TilingY;
			float _Vertical_ScreenContribution;
			float _Vertical_Columns;
			float _Vertical_Rows;
			float _Vertical_Speed;
			float _Vertical_SmoothEdge;
			int _Static_RainMode;
			int _SmoothnessType;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			int _Vertical_ModeUV;
			float _Vertical_TilingX;
			int _SmoothnessModeSurface;
			int _Static_ModeUV;
			float _Static_TilingX;
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
			half _DetailNormalMapScale;
			half _TessellationDistanceMax;
			half _NormalStrength;
			int _Vertical_RainMode;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			half _Displacement_Strength;
			int _Displacement_Mode;
			int _EnableDetailMap;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ColorMask;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationPhong;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _Rain_WetnessDarken;
			half _DetailBlendSmooth;
			half _BlendHeight;
			int _BlendColor;
			half _DetailBlendInfluence;
			half _Detail_BlendFalloffMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendAmountMask;
			half _DetailOffsetYDetailMask;
			half _DetailOffsetXDetailMask;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetYDetail;
			half _DetailOffsetXDetail;
			float _DetailTilingYDetail;
			float _MetallicStrength;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);


			float3 float3switch74_g39558( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_output_309_0_g38551 = float3(0,0,0);
				int temp_output_62_0_g39558 = _Displacement_Mode;
				int m_switch74_g39558 = temp_output_62_0_g39558;
				float3 Vector3_0_0_0155_g39558 = float3(0,0,0);
				float3 m_Off74_g39558 = Vector3_0_0_0155_g39558;
				float Strength158_g39558 = _Displacement_Strength;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = v.ase_texcoord.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 OUT_DISPLAC1180_g38551 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g39580, 0.0 );
				float4 temp_output_60_0_g39558 = OUT_DISPLAC1180_g38551;
				float3 HEIGHT_DEFAULT162_g39558 = ( ( v.ase_normal * Strength158_g39558 ) * temp_output_60_0_g39558.x );
				float3 m_Active74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 m_ActiveReconstructed74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 localfloat3switch74_g39558 = float3switch74_g39558( m_switch74_g39558 , m_Off74_g39558 , m_Active74_g39558 , m_ActiveReconstructed74_g39558 );
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38551 + localfloat3switch74_g39558 );
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
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
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
				float4 ase_texcoord : TEXCOORD0;
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_TexelSize;
			float4 _Color;
			half4 _ColorDetail;
			float _Vertical_TilingY;
			float _Vertical_ScreenContribution;
			float _Vertical_Columns;
			float _Vertical_Rows;
			float _Vertical_Speed;
			float _Vertical_SmoothEdge;
			int _Static_RainMode;
			int _SmoothnessType;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			int _Vertical_ModeUV;
			float _Vertical_TilingX;
			int _SmoothnessModeSurface;
			int _Static_ModeUV;
			float _Static_TilingX;
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
			half _DetailNormalMapScale;
			half _TessellationDistanceMax;
			half _NormalStrength;
			int _Vertical_RainMode;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			half _Displacement_Strength;
			int _Displacement_Mode;
			int _EnableDetailMap;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ColorMask;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationPhong;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _Rain_WetnessDarken;
			half _DetailBlendSmooth;
			half _BlendHeight;
			int _BlendColor;
			half _DetailBlendInfluence;
			half _Detail_BlendFalloffMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendAmountMask;
			half _DetailOffsetYDetailMask;
			half _DetailOffsetXDetailMask;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetYDetail;
			half _DetailOffsetXDetail;
			float _DetailTilingYDetail;
			float _MetallicStrength;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);


			float3 float3switch74_g39558( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch226_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float floatswitch319_g39591( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			float4 float4switch125_g39591( int m_switch, float4 m_Off, float4 m_Active )
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

				float3 temp_output_309_0_g38551 = float3(0,0,0);
				int temp_output_62_0_g39558 = _Displacement_Mode;
				int m_switch74_g39558 = temp_output_62_0_g39558;
				float3 Vector3_0_0_0155_g39558 = float3(0,0,0);
				float3 m_Off74_g39558 = Vector3_0_0_0155_g39558;
				float Strength158_g39558 = _Displacement_Strength;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = v.ase_texcoord.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 OUT_DISPLAC1180_g38551 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g39580, 0.0 );
				float4 temp_output_60_0_g39558 = OUT_DISPLAC1180_g38551;
				float3 HEIGHT_DEFAULT162_g39558 = ( ( v.ase_normal * Strength158_g39558 ) * temp_output_60_0_g39558.x );
				float3 m_Active74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 m_ActiveReconstructed74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 localfloat3switch74_g39558 = float3switch74_g39558( m_switch74_g39558 , m_Off74_g39558 , m_Active74_g39558 , m_ActiveReconstructed74_g39558 );
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38551 + localfloat3switch74_g39558 );
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
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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

				int SURFACE_MAP_MODE122_g39591 = _EnableDetailMap;
				int m_switch125_g39591 = SURFACE_MAP_MODE122_g39591;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = IN.ase_texcoord2.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
				float4 OUT_ALBEDO_RGBA1177_g38551 = tex2DNode63_g39580;
				float3 temp_output_7_0_g38551 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38551).rgb * _Brightness );
				float4 temp_output_39_0_g39591 = ( float4( temp_output_7_0_g38551 , 0.0 ) + float4(0,0,0,0) );
				float4 ALBEDO_IN_RGBA40_g39591 = temp_output_39_0_g39591;
				float4 m_Off125_g39591 = ALBEDO_IN_RGBA40_g39591;
				int m_switch226_g39591 = _EnableDetailMask;
				float2 appendResult132_g39591 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g39591 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g39591 = IN.ase_texcoord2.xy * appendResult132_g39591 + appendResult114_g39591;
				float4 tex2DNode45_g39591 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g39591 );
				float4 ALBEDO_OUT255_g39591 = ( _ColorDetail * tex2DNode45_g39591 * _Brightness );
				float4 m_Off226_g39591 = ALBEDO_OUT255_g39591;
				float2 appendResult219_g39591 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g39591 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g39591 = IN.ase_texcoord2.xy * appendResult219_g39591 + appendResult206_g39591;
				float temp_output_15_0_g39595 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g39591 ).r );
				float temp_output_26_0_g39595 = _Detail_BlendAmountMask;
				float temp_output_24_0_g39595 = _Detail_BlendHardnessMask;
				float saferPower2_g39595 = max( max( saturate( (0.0 + (temp_output_15_0_g39595 - ( 1.0 - temp_output_26_0_g39595 )) * (temp_output_24_0_g39595 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g39595 ))) ) , 0.0 ) , 0.0001 );
				float temp_output_22_0_g39595 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g39591 = saturate( pow( saferPower2_g39595 , ( 1.0 - temp_output_22_0_g39595 ) ) );
				float4 lerpResult225_g39591 = lerp( ALBEDO_IN_RGBA40_g39591 , ALBEDO_OUT255_g39591 , temp_output_403_0_g39591);
				float4 m_Active226_g39591 = lerpResult225_g39591;
				float saferPower11_g39595 = max( max( saturate( (1.0 + (temp_output_15_0_g39595 - temp_output_26_0_g39595) * (( 1.0 - temp_output_24_0_g39595 ) - 1.0) / (0.0 - temp_output_26_0_g39595)) ) , 0.0 ) , 0.0001 );
				float temp_output_403_21_g39591 = saturate( pow( saferPower11_g39595 , temp_output_22_0_g39595 ) );
				float4 lerpResult408_g39591 = lerp( ALBEDO_OUT255_g39591 , ALBEDO_IN_RGBA40_g39591 , temp_output_403_21_g39591);
				float4 m_ActiveInverted226_g39591 = lerpResult408_g39591;
				float4 localfloat4switch226_g39591 = float4switch226_g39591( m_switch226_g39591 , m_Off226_g39591 , m_Active226_g39591 , m_ActiveInverted226_g39591 );
				float4 MASK_ALBEDO_OUT258_g39591 = localfloat4switch226_g39591;
				float4 break48_g39591 = temp_output_39_0_g39591;
				float ALBEDO_IN_RGB300_g39591 = ( break48_g39591.x + break48_g39591.y + break48_g39591.z );
				int m_switch319_g39591 = _BlendColor;
				float m_Red319_g39591 = IN.ase_color.r;
				float m_Green319_g39591 = IN.ase_color.g;
				float m_Blue319_g39591 = IN.ase_color.b;
				float localfloatswitch319_g39591 = floatswitch319_g39591( m_switch319_g39591 , m_Red319_g39591 , m_Green319_g39591 , m_Blue319_g39591 );
				float clampResult47_g39591 = clamp( ( ( ( ( ALBEDO_IN_RGB300_g39591 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localfloatswitch319_g39591 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DETAIL_BLEND43_g39591 = clampResult47_g39591;
				float4 lerpResult58_g39591 = lerp( MASK_ALBEDO_OUT258_g39591 , ALBEDO_IN_RGBA40_g39591 , DETAIL_BLEND43_g39591);
				float4 m_Active125_g39591 = lerpResult58_g39591;
				float4 localfloat4switch125_g39591 = float4switch125_g39591( m_switch125_g39591 , m_Off125_g39591 , m_Active125_g39591 );
				float4 temp_output_746_0_g39622 = localfloat4switch125_g39591;
				
				
				float3 Albedo = ( temp_output_746_0_g39622 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
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

			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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
			
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
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
				float4 ase_texcoord : TEXCOORD0;
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_TexelSize;
			float4 _Color;
			half4 _ColorDetail;
			float _Vertical_TilingY;
			float _Vertical_ScreenContribution;
			float _Vertical_Columns;
			float _Vertical_Rows;
			float _Vertical_Speed;
			float _Vertical_SmoothEdge;
			int _Static_RainMode;
			int _SmoothnessType;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			int _Vertical_ModeUV;
			float _Vertical_TilingX;
			int _SmoothnessModeSurface;
			int _Static_ModeUV;
			float _Static_TilingX;
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
			half _DetailNormalMapScale;
			half _TessellationDistanceMax;
			half _NormalStrength;
			int _Vertical_RainMode;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			half _Displacement_Strength;
			int _Displacement_Mode;
			int _EnableDetailMap;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ColorMask;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationPhong;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _Rain_WetnessDarken;
			half _DetailBlendSmooth;
			half _BlendHeight;
			int _BlendColor;
			half _DetailBlendInfluence;
			half _Detail_BlendFalloffMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendAmountMask;
			half _DetailOffsetYDetailMask;
			half _DetailOffsetXDetailMask;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetYDetail;
			half _DetailOffsetXDetail;
			float _DetailTilingYDetail;
			float _MetallicStrength;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);


			float3 float3switch74_g39558( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch226_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float floatswitch319_g39591( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			float4 float4switch125_g39591( int m_switch, float4 m_Off, float4 m_Active )
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
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 temp_output_309_0_g38551 = float3(0,0,0);
				int temp_output_62_0_g39558 = _Displacement_Mode;
				int m_switch74_g39558 = temp_output_62_0_g39558;
				float3 Vector3_0_0_0155_g39558 = float3(0,0,0);
				float3 m_Off74_g39558 = Vector3_0_0_0155_g39558;
				float Strength158_g39558 = _Displacement_Strength;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = v.ase_texcoord.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 OUT_DISPLAC1180_g38551 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g39580, 0.0 );
				float4 temp_output_60_0_g39558 = OUT_DISPLAC1180_g38551;
				float3 HEIGHT_DEFAULT162_g39558 = ( ( v.ase_normal * Strength158_g39558 ) * temp_output_60_0_g39558.x );
				float3 m_Active74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 m_ActiveReconstructed74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 localfloat3switch74_g39558 = float3switch74_g39558( m_switch74_g39558 , m_Off74_g39558 , m_Active74_g39558 , m_ActiveReconstructed74_g39558 );
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38551 + localfloat3switch74_g39558 );
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
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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

				int SURFACE_MAP_MODE122_g39591 = _EnableDetailMap;
				int m_switch125_g39591 = SURFACE_MAP_MODE122_g39591;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = IN.ase_texcoord2.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
				float4 OUT_ALBEDO_RGBA1177_g38551 = tex2DNode63_g39580;
				float3 temp_output_7_0_g38551 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38551).rgb * _Brightness );
				float4 temp_output_39_0_g39591 = ( float4( temp_output_7_0_g38551 , 0.0 ) + float4(0,0,0,0) );
				float4 ALBEDO_IN_RGBA40_g39591 = temp_output_39_0_g39591;
				float4 m_Off125_g39591 = ALBEDO_IN_RGBA40_g39591;
				int m_switch226_g39591 = _EnableDetailMask;
				float2 appendResult132_g39591 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g39591 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g39591 = IN.ase_texcoord2.xy * appendResult132_g39591 + appendResult114_g39591;
				float4 tex2DNode45_g39591 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g39591 );
				float4 ALBEDO_OUT255_g39591 = ( _ColorDetail * tex2DNode45_g39591 * _Brightness );
				float4 m_Off226_g39591 = ALBEDO_OUT255_g39591;
				float2 appendResult219_g39591 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g39591 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g39591 = IN.ase_texcoord2.xy * appendResult219_g39591 + appendResult206_g39591;
				float temp_output_15_0_g39595 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g39591 ).r );
				float temp_output_26_0_g39595 = _Detail_BlendAmountMask;
				float temp_output_24_0_g39595 = _Detail_BlendHardnessMask;
				float saferPower2_g39595 = max( max( saturate( (0.0 + (temp_output_15_0_g39595 - ( 1.0 - temp_output_26_0_g39595 )) * (temp_output_24_0_g39595 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g39595 ))) ) , 0.0 ) , 0.0001 );
				float temp_output_22_0_g39595 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g39591 = saturate( pow( saferPower2_g39595 , ( 1.0 - temp_output_22_0_g39595 ) ) );
				float4 lerpResult225_g39591 = lerp( ALBEDO_IN_RGBA40_g39591 , ALBEDO_OUT255_g39591 , temp_output_403_0_g39591);
				float4 m_Active226_g39591 = lerpResult225_g39591;
				float saferPower11_g39595 = max( max( saturate( (1.0 + (temp_output_15_0_g39595 - temp_output_26_0_g39595) * (( 1.0 - temp_output_24_0_g39595 ) - 1.0) / (0.0 - temp_output_26_0_g39595)) ) , 0.0 ) , 0.0001 );
				float temp_output_403_21_g39591 = saturate( pow( saferPower11_g39595 , temp_output_22_0_g39595 ) );
				float4 lerpResult408_g39591 = lerp( ALBEDO_OUT255_g39591 , ALBEDO_IN_RGBA40_g39591 , temp_output_403_21_g39591);
				float4 m_ActiveInverted226_g39591 = lerpResult408_g39591;
				float4 localfloat4switch226_g39591 = float4switch226_g39591( m_switch226_g39591 , m_Off226_g39591 , m_Active226_g39591 , m_ActiveInverted226_g39591 );
				float4 MASK_ALBEDO_OUT258_g39591 = localfloat4switch226_g39591;
				float4 break48_g39591 = temp_output_39_0_g39591;
				float ALBEDO_IN_RGB300_g39591 = ( break48_g39591.x + break48_g39591.y + break48_g39591.z );
				int m_switch319_g39591 = _BlendColor;
				float m_Red319_g39591 = IN.ase_color.r;
				float m_Green319_g39591 = IN.ase_color.g;
				float m_Blue319_g39591 = IN.ase_color.b;
				float localfloatswitch319_g39591 = floatswitch319_g39591( m_switch319_g39591 , m_Red319_g39591 , m_Green319_g39591 , m_Blue319_g39591 );
				float clampResult47_g39591 = clamp( ( ( ( ( ALBEDO_IN_RGB300_g39591 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localfloatswitch319_g39591 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DETAIL_BLEND43_g39591 = clampResult47_g39591;
				float4 lerpResult58_g39591 = lerp( MASK_ALBEDO_OUT258_g39591 , ALBEDO_IN_RGBA40_g39591 , DETAIL_BLEND43_g39591);
				float4 m_Active125_g39591 = lerpResult58_g39591;
				float4 localfloat4switch125_g39591 = float4switch125_g39591( m_switch125_g39591 , m_Off125_g39591 , m_Active125_g39591 );
				float4 temp_output_746_0_g39622 = localfloat4switch125_g39591;
				
				
				float3 Albedo = ( temp_output_746_0_g39622 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
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
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_TexelSize;
			float4 _Color;
			half4 _ColorDetail;
			float _Vertical_TilingY;
			float _Vertical_ScreenContribution;
			float _Vertical_Columns;
			float _Vertical_Rows;
			float _Vertical_Speed;
			float _Vertical_SmoothEdge;
			int _Static_RainMode;
			int _SmoothnessType;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			int _Vertical_ModeUV;
			float _Vertical_TilingX;
			int _SmoothnessModeSurface;
			int _Static_ModeUV;
			float _Static_TilingX;
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
			half _DetailNormalMapScale;
			half _TessellationDistanceMax;
			half _NormalStrength;
			int _Vertical_RainMode;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			half _Displacement_Strength;
			int _Displacement_Mode;
			int _EnableDetailMap;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ColorMask;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationPhong;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _Rain_WetnessDarken;
			half _DetailBlendSmooth;
			half _BlendHeight;
			int _BlendColor;
			half _DetailBlendInfluence;
			half _Detail_BlendFalloffMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendAmountMask;
			half _DetailOffsetYDetailMask;
			half _DetailOffsetXDetailMask;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetYDetail;
			half _DetailOffsetXDetail;
			float _DetailTilingYDetail;
			float _MetallicStrength;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);


			float3 float3switch74_g39558( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_output_309_0_g38551 = float3(0,0,0);
				int temp_output_62_0_g39558 = _Displacement_Mode;
				int m_switch74_g39558 = temp_output_62_0_g39558;
				float3 Vector3_0_0_0155_g39558 = float3(0,0,0);
				float3 m_Off74_g39558 = Vector3_0_0_0155_g39558;
				float Strength158_g39558 = _Displacement_Strength;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = v.ase_texcoord.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 OUT_DISPLAC1180_g38551 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g39580, 0.0 );
				float4 temp_output_60_0_g39558 = OUT_DISPLAC1180_g38551;
				float3 HEIGHT_DEFAULT162_g39558 = ( ( v.ase_normal * Strength158_g39558 ) * temp_output_60_0_g39558.x );
				float3 m_Active74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 m_ActiveReconstructed74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 localfloat3switch74_g39558 = float3switch74_g39558( m_switch74_g39558 , m_Off74_g39558 , m_Active74_g39558 , m_ActiveReconstructed74_g39558 );
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38551 + localfloat3switch74_g39558 );
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
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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
			
			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_POSITION
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
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_TexelSize;
			float4 _Color;
			half4 _ColorDetail;
			float _Vertical_TilingY;
			float _Vertical_ScreenContribution;
			float _Vertical_Columns;
			float _Vertical_Rows;
			float _Vertical_Speed;
			float _Vertical_SmoothEdge;
			int _Static_RainMode;
			int _SmoothnessType;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			int _Vertical_ModeUV;
			float _Vertical_TilingX;
			int _SmoothnessModeSurface;
			int _Static_ModeUV;
			float _Static_TilingX;
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
			half _DetailNormalMapScale;
			half _TessellationDistanceMax;
			half _NormalStrength;
			int _Vertical_RainMode;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			half _Displacement_Strength;
			int _Displacement_Mode;
			int _EnableDetailMap;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ColorMask;
			float _Horizontal_Intensity;
			float _Vertical_Intensity;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationPhong;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _Rain_WetnessDarken;
			half _DetailBlendSmooth;
			half _BlendHeight;
			int _BlendColor;
			half _DetailBlendInfluence;
			half _Detail_BlendFalloffMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendAmountMask;
			half _DetailOffsetYDetailMask;
			half _DetailOffsetXDetailMask;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetYDetail;
			half _DetailOffsetXDetail;
			float _DetailTilingYDetail;
			float _MetallicStrength;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_Vertical_RainMap);
			int _Global_Rain_Enabled;
			half _Global_Rain_Intensity;
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);
			TEXTURE2D(_Static_RainMap);
			TEXTURE2D(_Horizontal_RainMap);
			TEXTURE2D(_MetallicGlossMap);
			int _Global_Wetness_Enabled;
			half _Global_Wetness_Intensity;


			float3 float3switch74_g39558( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch226_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float floatswitch319_g39591( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			float4 float4switch125_g39591( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			void CalculateUVsSmooth19_g39545( float2 UV, float4 TexelSize, out float2 UV0, out float2 UV1, out float2 UV2, out float2 UV3, out float2 UV4, out float2 UV5, out float2 UV6, out float2 UV7, out float2 UV8 )
			{
				{
				 float3 pos = float3( TexelSize.xy, 0 );
				    float3 neg = float3( -pos.xy, 0 );
				 UV0 = UV + neg.xy;
				    UV1 = UV + neg.zy;
				    UV2 = UV + float2( pos.x, neg.y );
				    UV3 = UV + neg.xz;
				    UV4 = UV;
				    UV5 = UV + pos.xz;
				    UV6 = UV + float2( neg.x, pos.y );
				    UV7 = UV + pos.zy;
				    UV8 = UV + pos.xy;
				    return;
				}
			}
			
			float3 CombineSamplesSmooth31_g39545( float Strength, float S0, float S1, float S2, float S3, float S4, float S5, float S6, float S7, float S8 )
			{
				{
				 float3 normal;
				    normal.x = Strength * ( S0 - S2 + 2 * S3 - 2 * S5 + S6 - S8 );
				    normal.y = Strength * ( S0 + 2 * S1 + S2 - S6 - 2 * S7 - S8 );
				    normal.z = 1.0;
				    return normalize( normal );
				}
			}
			
			float3 float3switch1310_g38551( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
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
			
			float3 float3switch221_g39591( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch127_g39591( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1190_g39622( int m_switch, float m_Off, float m_Active )
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
			
			float3 float3switch914_g39622( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch170_g39551( int m_switch, float4 m_Smoothness, float4 m_Roughness )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else
				return float4(0,0,0,0);
			}
			
			float3 float3switch1387_g38551( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch167_g39551( int m_switch, float4 m_Smoothness, float4 m_Roughness )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch99_g39551( int m_switch, float4 m_Standard, float4 m_Geometric, float4 m_Texture )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Geometric;
				else if(m_switch ==2)
					return m_Texture;
				else
				return float4(0,0,0,0);
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
			
			float floatswitch1186_g39622( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			float3 float3switch992_g39622( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float floatswitch1179_g39622( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			
			float3 float3switch1505_g39622( int m_switch, float3 m_Standard, float3 m_Stochastic )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Stochastic;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch12_g39627( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch23_g39627( int m_switch, float4 m_Off, float4 m_Active )
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

				float3 temp_output_309_0_g38551 = float3(0,0,0);
				int temp_output_62_0_g39558 = _Displacement_Mode;
				int m_switch74_g39558 = temp_output_62_0_g39558;
				float3 Vector3_0_0_0155_g39558 = float3(0,0,0);
				float3 m_Off74_g39558 = Vector3_0_0_0155_g39558;
				float Strength158_g39558 = _Displacement_Strength;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = v.texcoord.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 OUT_DISPLAC1180_g38551 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g39580, 0.0 );
				float4 temp_output_60_0_g39558 = OUT_DISPLAC1180_g38551;
				float3 HEIGHT_DEFAULT162_g39558 = ( ( v.ase_normal * Strength158_g39558 ) * temp_output_60_0_g39558.x );
				float3 m_Active74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 m_ActiveReconstructed74_g39558 = HEIGHT_DEFAULT162_g39558;
				float3 localfloat3switch74_g39558 = float3switch74_g39558( m_switch74_g39558 , m_Off74_g39558 , m_Active74_g39558 , m_ActiveReconstructed74_g39558 );
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord8 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38551 + localfloat3switch74_g39558 );
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
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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

				int SURFACE_MAP_MODE122_g39591 = _EnableDetailMap;
				int m_switch125_g39591 = SURFACE_MAP_MODE122_g39591;
				float2 appendResult150_g38551 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38551 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = IN.ase_texcoord7.xy * appendResult150_g38551 + appendResult151_g38551;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38551 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38551;
				float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
				float4 OUT_ALBEDO_RGBA1177_g38551 = tex2DNode63_g39580;
				float3 temp_output_7_0_g38551 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38551).rgb * _Brightness );
				float4 temp_output_39_0_g39591 = ( float4( temp_output_7_0_g38551 , 0.0 ) + float4(0,0,0,0) );
				float4 ALBEDO_IN_RGBA40_g39591 = temp_output_39_0_g39591;
				float4 m_Off125_g39591 = ALBEDO_IN_RGBA40_g39591;
				int m_switch226_g39591 = _EnableDetailMask;
				float2 appendResult132_g39591 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g39591 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g39591 = IN.ase_texcoord7.xy * appendResult132_g39591 + appendResult114_g39591;
				float4 tex2DNode45_g39591 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g39591 );
				float4 ALBEDO_OUT255_g39591 = ( _ColorDetail * tex2DNode45_g39591 * _Brightness );
				float4 m_Off226_g39591 = ALBEDO_OUT255_g39591;
				float2 appendResult219_g39591 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g39591 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g39591 = IN.ase_texcoord7.xy * appendResult219_g39591 + appendResult206_g39591;
				float temp_output_15_0_g39595 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g39591 ).r );
				float temp_output_26_0_g39595 = _Detail_BlendAmountMask;
				float temp_output_24_0_g39595 = _Detail_BlendHardnessMask;
				float saferPower2_g39595 = max( max( saturate( (0.0 + (temp_output_15_0_g39595 - ( 1.0 - temp_output_26_0_g39595 )) * (temp_output_24_0_g39595 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g39595 ))) ) , 0.0 ) , 0.0001 );
				float temp_output_22_0_g39595 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g39591 = saturate( pow( saferPower2_g39595 , ( 1.0 - temp_output_22_0_g39595 ) ) );
				float4 lerpResult225_g39591 = lerp( ALBEDO_IN_RGBA40_g39591 , ALBEDO_OUT255_g39591 , temp_output_403_0_g39591);
				float4 m_Active226_g39591 = lerpResult225_g39591;
				float saferPower11_g39595 = max( max( saturate( (1.0 + (temp_output_15_0_g39595 - temp_output_26_0_g39595) * (( 1.0 - temp_output_24_0_g39595 ) - 1.0) / (0.0 - temp_output_26_0_g39595)) ) , 0.0 ) , 0.0001 );
				float temp_output_403_21_g39591 = saturate( pow( saferPower11_g39595 , temp_output_22_0_g39595 ) );
				float4 lerpResult408_g39591 = lerp( ALBEDO_OUT255_g39591 , ALBEDO_IN_RGBA40_g39591 , temp_output_403_21_g39591);
				float4 m_ActiveInverted226_g39591 = lerpResult408_g39591;
				float4 localfloat4switch226_g39591 = float4switch226_g39591( m_switch226_g39591 , m_Off226_g39591 , m_Active226_g39591 , m_ActiveInverted226_g39591 );
				float4 MASK_ALBEDO_OUT258_g39591 = localfloat4switch226_g39591;
				float4 break48_g39591 = temp_output_39_0_g39591;
				float ALBEDO_IN_RGB300_g39591 = ( break48_g39591.x + break48_g39591.y + break48_g39591.z );
				int m_switch319_g39591 = _BlendColor;
				float m_Red319_g39591 = IN.ase_color.r;
				float m_Green319_g39591 = IN.ase_color.g;
				float m_Blue319_g39591 = IN.ase_color.b;
				float localfloatswitch319_g39591 = floatswitch319_g39591( m_switch319_g39591 , m_Red319_g39591 , m_Green319_g39591 , m_Blue319_g39591 );
				float clampResult47_g39591 = clamp( ( ( ( ( ALBEDO_IN_RGB300_g39591 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localfloatswitch319_g39591 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DETAIL_BLEND43_g39591 = clampResult47_g39591;
				float4 lerpResult58_g39591 = lerp( MASK_ALBEDO_OUT258_g39591 , ALBEDO_IN_RGBA40_g39591 , DETAIL_BLEND43_g39591);
				float4 m_Active125_g39591 = lerpResult58_g39591;
				float4 localfloat4switch125_g39591 = float4switch125_g39591( m_switch125_g39591 , m_Off125_g39591 , m_Active125_g39591 );
				float4 temp_output_746_0_g39622 = localfloat4switch125_g39591;
				
				int m_switch103_g39622 = _Vertical_RainMode;
				int m_switch127_g39591 = SURFACE_MAP_MODE122_g39591;
				int _Displacement_Mode1309_g38551 = _Displacement_Mode;
				int m_switch1310_g38551 = _Displacement_Mode1309_g38551;
				float4 OUT_NORMAL1178_g38551 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_output_1_0_g39549 = OUT_NORMAL1178_g38551;
				float temp_output_8_0_g39549 = _NormalStrength;
				float3 unpack52_g39549 = UnpackNormalScale( temp_output_1_0_g39549, temp_output_8_0_g39549 );
				unpack52_g39549.z = lerp( 1, unpack52_g39549.z, saturate(temp_output_8_0_g39549) );
				float3 temp_output_1478_59_g38551 = unpack52_g39549;
				float3 m_Off1310_g38551 = temp_output_1478_59_g38551;
				float3 m_Active1310_g38551 = temp_output_1478_59_g38551;
				float temp_output_1334_0_g38551 = ( _NormalStrength * 2.0 );
				float temp_output_29_0_g39545 = temp_output_1334_0_g38551;
				float Strength31_g39545 = temp_output_29_0_g39545;
				float localCalculateUVsSmooth19_g39545 = ( 0.0 );
				float2 temp_output_96_0_g39545 = OUT_UV431_g38551;
				float2 UV19_g39545 = temp_output_96_0_g39545;
				float4 TexelSize19_g39545 = _ParallaxMap_TexelSize;
				float2 UV019_g39545 = float2( 0,0 );
				float2 UV119_g39545 = float2( 0,0 );
				float2 UV219_g39545 = float2( 0,0 );
				float2 UV319_g39545 = float2( 0,0 );
				float2 UV419_g39545 = float2( 0,0 );
				float2 UV519_g39545 = float2( 0,0 );
				float2 UV619_g39545 = float2( 0,0 );
				float2 UV719_g39545 = float2( 0,0 );
				float2 UV819_g39545 = float2( 0,0 );
				CalculateUVsSmooth19_g39545( UV19_g39545 , TexelSize19_g39545 , UV019_g39545 , UV119_g39545 , UV219_g39545 , UV319_g39545 , UV419_g39545 , UV519_g39545 , UV619_g39545 , UV719_g39545 , UV819_g39545 );
				float4 break13_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV019_g39545 );
				float S031_g39545 = break13_g39545.r;
				float4 break8_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV119_g39545 );
				float S131_g39545 = break8_g39545.r;
				float4 break5_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV219_g39545 );
				float S231_g39545 = break5_g39545.r;
				float4 break3_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV319_g39545 );
				float S331_g39545 = break3_g39545.r;
				float4 break12_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV419_g39545 );
				float S431_g39545 = break12_g39545.r;
				float4 break23_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV519_g39545 );
				float S531_g39545 = break23_g39545.r;
				float4 break44_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV619_g39545 );
				float S631_g39545 = break44_g39545.r;
				float4 break42_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV719_g39545 );
				float S731_g39545 = break42_g39545.r;
				float4 break40_g39545 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV819_g39545 );
				float S831_g39545 = break40_g39545.r;
				float3 localCombineSamplesSmooth31_g39545 = CombineSamplesSmooth31_g39545( Strength31_g39545 , S031_g39545 , S131_g39545 , S231_g39545 , S331_g39545 , S431_g39545 , S531_g39545 , S631_g39545 , S731_g39545 , S831_g39545 );
				float3 m_ActiveReconstructed1310_g38551 = localCombineSamplesSmooth31_g39545;
				float3 localfloat3switch1310_g38551 = float3switch1310_g38551( m_switch1310_g38551 , m_Off1310_g38551 , m_Active1310_g38551 , m_ActiveReconstructed1310_g38551 );
				float3 NORMAL_OUT314_g38551 = localfloat3switch1310_g38551;
				float3 temp_output_16_0_g39547 = NORMAL_OUT314_g38551;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal134_g39547 = temp_output_16_0_g39547;
				float3 worldNormal134_g39547 = float3(dot(tanToWorld0,tanNormal134_g39547), dot(tanToWorld1,tanNormal134_g39547), dot(tanToWorld2,tanNormal134_g39547));
				float3 NORMAL_TANGENTSPACE135_g39547 = worldNormal134_g39547;
				float3 WorldPosition63_g39547 = NORMAL_TANGENTSPACE135_g39547;
				float4 shadowMaskValue77_g39547 = float4(1,1,1,1);
				float4 ShadowMask63_g39547 = shadowMaskValue77_g39547;
				float3 localAdditionalLightsFlatMask63_g39547 = AdditionalLightsFlatMask( WorldPosition63_g39547 , ShadowMask63_g39547 );
				float3 ADDITIONAL_LIGHT1342_g38551 = localAdditionalLightsFlatMask63_g39547;
				float3 temp_output_38_0_g39591 = ( localfloat3switch1310_g38551 + ADDITIONAL_LIGHT1342_g38551 );
				float3 NORMAL_IN260_g39591 = temp_output_38_0_g39591;
				float3 m_Off127_g39591 = NORMAL_IN260_g39591;
				int EnableDetailMask216_g39591 = _EnableDetailMask;
				int m_switch221_g39591 = EnableDetailMask216_g39591;
				float4 temp_output_1_0_g39596 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, texCoord67_g39591 );
				float temp_output_8_0_g39596 = _DetailNormalMapScale;
				float3 unpack52_g39596 = UnpackNormalScale( temp_output_1_0_g39596, temp_output_8_0_g39596 );
				unpack52_g39596.z = lerp( 1, unpack52_g39596.z, saturate(temp_output_8_0_g39596) );
				float3 NORMAL_OUT199_g39591 = unpack52_g39596;
				float3 m_Off221_g39591 = NORMAL_OUT199_g39591;
				float3 lerpResult205_g39591 = lerp( NORMAL_IN260_g39591 , NORMAL_OUT199_g39591 , temp_output_403_0_g39591);
				float3 m_Active221_g39591 = saturate( lerpResult205_g39591 );
				float3 lerpResult406_g39591 = lerp( NORMAL_OUT199_g39591 , NORMAL_IN260_g39591 , temp_output_403_21_g39591);
				float3 m_ActiveInverted221_g39591 = saturate( lerpResult406_g39591 );
				float3 localfloat3switch221_g39591 = float3switch221_g39591( m_switch221_g39591 , m_Off221_g39591 , m_Active221_g39591 , m_ActiveInverted221_g39591 );
				float3 MASK_NORMAL_OUT222_g39591 = localfloat3switch221_g39591;
				float3 lerpResult62_g39591 = lerp( MASK_NORMAL_OUT222_g39591 , NORMAL_IN260_g39591 , DETAIL_BLEND43_g39591);
				float3 temp_output_318_0_g39591 = ( NORMAL_IN260_g39591 + saturate( lerpResult62_g39591 ) );
				float3 m_Active127_g39591 = temp_output_318_0_g39591;
				float3 localfloat3switch127_g39591 = float3switch127_g39591( m_switch127_g39591 , m_Off127_g39591 , m_Active127_g39591 );
				float3 temp_output_19_0_g39622 = localfloat3switch127_g39591;
				float3 NORMAL_IN105_g39622 = temp_output_19_0_g39622;
				float3 m_Off103_g39622 = NORMAL_IN105_g39622;
				int m_switch914_g39622 = _Vertical_ModeUV;
				float3 _MASK_VECTOR1485_g39622 = float3(0.001,0.001,0.001);
				float2 appendResult259_g39622 = (float2(_Vertical_TilingX , _Vertical_TilingY));
				float2 VERTICAL_UV_TILING377_g39622 = appendResult259_g39622;
				float2 UV_TILING88_g39633 = VERTICAL_UV_TILING377_g39622;
				float3 objToWorld137_g39633 = mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord8.xyz, 1 ) ).xyz;
				float2 appendResult129_g39633 = (float2(-objToWorld137_g39633.x , objToWorld137_g39633.y));
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float temp_output_52_0_g39633 = _Vertical_Columns;
				float temp_output_53_0_g39633 = _Vertical_Rows;
				float2 appendResult1_g39633 = (float2(temp_output_52_0_g39633 , temp_output_53_0_g39633));
				float VERTICAL_FRAMES15_g39633 = ( temp_output_52_0_g39633 * temp_output_53_0_g39633 );
				float2 appendResult49_g39633 = (float2(VERTICAL_FRAMES15_g39633 , temp_output_53_0_g39633));
				float clampResult37_g39633 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39633 - 1.0 ) );
				float temp_output_36_0_g39633 = frac( ( ( ( _TimeParameters.x * _Vertical_Speed ) + clampResult37_g39633 ) / VERTICAL_FRAMES15_g39633 ) );
				float2 appendResult31_g39633 = (float2(temp_output_36_0_g39633 , ( 1.0 - temp_output_36_0_g39633 )));
				float2 _UV_VERTICAL_X_DOWN863_g39622 = ( ( ( ( UV_TILING88_g39633 * appendResult129_g39633 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g39633 ) + ( floor( ( appendResult49_g39633 * appendResult31_g39633 ) ) / appendResult1_g39633 ) );
				int _Global_Rain_Enabled1178_g39622 = _Global_Rain_Enabled;
				int m_switch1190_g39622 = _Global_Rain_Enabled1178_g39622;
				float m_Off1190_g39622 = _Vertical_Intensity;
				float _Global_Rain_Intensity1174_g39622 = _Global_Rain_Intensity;
				float m_Active1190_g39622 = ( _Vertical_Intensity * _Global_Rain_Intensity1174_g39622 );
				float localfloatswitch1190_g39622 = floatswitch1190_g39622( m_switch1190_g39622 , m_Off1190_g39622 , m_Active1190_g39622 );
				float _VERTICAL_INTENSITY861_g39622 = saturate( localfloatswitch1190_g39622 );
				float3 unpack908_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_X_DOWN863_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack908_g39622.z = lerp( 1, unpack908_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float3 temp_cast_8 = (0.5).xxx;
				float3 break149_g39622 = ( abs( WorldNormal ) - temp_cast_8 );
				float smoothstepResult1521_g39622 = smoothstep( _Vertical_SmoothEdge , 1.0 , ( break149_g39622.z + 0.5 ));
				float _MASK_VERTICAL_Z1241_g39622 = smoothstepResult1521_g39622;
				float3 lerpResult1138_g39622 = lerp( _MASK_VECTOR1485_g39622 , unpack908_g39622 , _MASK_VERTICAL_Z1241_g39622);
				float2 UV_TILING88_g39623 = VERTICAL_UV_TILING377_g39622;
				float3 objToWorld137_g39623 = mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord8.xyz, 1 ) ).xyz;
				float2 appendResult115_g39623 = (float2(objToWorld137_g39623.z , objToWorld137_g39623.y));
				float temp_output_52_0_g39623 = _Vertical_Columns;
				float temp_output_53_0_g39623 = _Vertical_Rows;
				float2 appendResult1_g39623 = (float2(temp_output_52_0_g39623 , temp_output_53_0_g39623));
				float VERTICAL_FRAMES15_g39623 = ( temp_output_52_0_g39623 * temp_output_53_0_g39623 );
				float2 appendResult49_g39623 = (float2(VERTICAL_FRAMES15_g39623 , temp_output_53_0_g39623));
				float clampResult37_g39623 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39623 - 1.0 ) );
				float temp_output_36_0_g39623 = frac( ( ( ( _TimeParameters.x * _Vertical_Speed ) + clampResult37_g39623 ) / VERTICAL_FRAMES15_g39623 ) );
				float2 appendResult31_g39623 = (float2(temp_output_36_0_g39623 , ( 1.0 - temp_output_36_0_g39623 )));
				float2 _UV_VERTICAL_Y_DOWN870_g39622 = ( ( ( ( UV_TILING88_g39623 * appendResult115_g39623 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g39623 ) + ( floor( ( appendResult49_g39623 * appendResult31_g39623 ) ) / appendResult1_g39623 ) );
				float3 unpack925_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_Y_DOWN870_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack925_g39622.z = lerp( 1, unpack925_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float2 _SmoothX = float2(0,1);
				float smoothstepResult1523_g39622 = smoothstep( _SmoothX.x , _SmoothX.y , ( break149_g39622.x + 0.45 ));
				float _MASK_VERTICAL_X151_g39622 = smoothstepResult1523_g39622;
				float3 lerpResult1261_g39622 = lerp( _MASK_VECTOR1485_g39622 , unpack925_g39622 , _MASK_VERTICAL_X151_g39622);
				float2 _SmoothY = float2(0,1);
				float smoothstepResult1519_g39622 = smoothstep( _SmoothY.x , _SmoothY.y , ( -break149_g39622.y + 0.45 ));
				float _MASK_VERTICAL_Y1216_g39622 = smoothstepResult1519_g39622;
				float3 lerpResult1390_g39622 = lerp( lerpResult1138_g39622 , BlendNormal( lerpResult1138_g39622 , lerpResult1261_g39622 ) , _MASK_VERTICAL_Y1216_g39622);
				float3 m_Standard914_g39622 = lerpResult1390_g39622;
				float localStochasticTiling895_g39622 = ( 0.0 );
				float2 UV895_g39622 = _UV_VERTICAL_X_DOWN863_g39622;
				float2 UV1895_g39622 = float2( 0,0 );
				float2 UV2895_g39622 = float2( 0,0 );
				float2 UV3895_g39622 = float2( 0,0 );
				float W1895_g39622 = 0.0;
				float W2895_g39622 = 0.0;
				float W3895_g39622 = 0.0;
				StochasticTiling( UV895_g39622 , UV1895_g39622 , UV2895_g39622 , UV3895_g39622 , W1895_g39622 , W2895_g39622 , W3895_g39622 );
				float2 temp_output_906_0_g39622 = ddx( _UV_VERTICAL_X_DOWN863_g39622 );
				float2 temp_output_886_0_g39622 = ddy( _UV_VERTICAL_X_DOWN863_g39622 );
				float3 unpack913_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1895_g39622, temp_output_906_0_g39622, temp_output_886_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack913_g39622.z = lerp( 1, unpack913_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V1_W1887_g39622 = W1895_g39622;
				float3 unpack920_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2895_g39622, temp_output_906_0_g39622, temp_output_886_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack920_g39622.z = lerp( 1, unpack920_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V1_W2897_g39622 = W2895_g39622;
				float3 unpack892_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3895_g39622, temp_output_906_0_g39622, temp_output_886_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack892_g39622.z = lerp( 1, unpack892_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V1_W3926_g39622 = W3895_g39622;
				float3 lerpResult950_g39622 = lerp( _MASK_VECTOR1485_g39622 , ( ( unpack913_g39622 * UV1_V1_W1887_g39622 ) + ( ( unpack920_g39622 * UV1_V1_W2897_g39622 ) + ( unpack892_g39622 * UV1_V1_W3926_g39622 ) ) ) , _MASK_VERTICAL_Z1241_g39622);
				float localStochasticTiling865_g39622 = ( 0.0 );
				float2 UV865_g39622 = _UV_VERTICAL_Y_DOWN870_g39622;
				float2 UV1865_g39622 = float2( 0,0 );
				float2 UV2865_g39622 = float2( 0,0 );
				float2 UV3865_g39622 = float2( 0,0 );
				float W1865_g39622 = 0.0;
				float W2865_g39622 = 0.0;
				float W3865_g39622 = 0.0;
				StochasticTiling( UV865_g39622 , UV1865_g39622 , UV2865_g39622 , UV3865_g39622 , W1865_g39622 , W2865_g39622 , W3865_g39622 );
				float2 temp_output_883_0_g39622 = ddx( _UV_VERTICAL_Y_DOWN870_g39622 );
				float2 temp_output_894_0_g39622 = ddy( _UV_VERTICAL_Y_DOWN870_g39622 );
				float3 unpack904_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1865_g39622, temp_output_883_0_g39622, temp_output_894_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack904_g39622.z = lerp( 1, unpack904_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V2_W1866_g39622 = W1865_g39622;
				float3 unpack922_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2865_g39622, temp_output_883_0_g39622, temp_output_894_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack922_g39622.z = lerp( 1, unpack922_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V2_W2884_g39622 = W2865_g39622;
				float3 unpack910_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3865_g39622, temp_output_883_0_g39622, temp_output_894_0_g39622 ), _VERTICAL_INTENSITY861_g39622 );
				unpack910_g39622.z = lerp( 1, unpack910_g39622.z, saturate(_VERTICAL_INTENSITY861_g39622) );
				float UV1_V2_W3871_g39622 = W3865_g39622;
				float3 lerpResult946_g39622 = lerp( _MASK_VECTOR1485_g39622 , ( ( unpack904_g39622 * UV1_V2_W1866_g39622 ) + ( ( unpack922_g39622 * UV1_V2_W2884_g39622 ) + ( unpack910_g39622 * UV1_V2_W3871_g39622 ) ) ) , _MASK_VERTICAL_X151_g39622);
				float3 lerpResult1400_g39622 = lerp( lerpResult950_g39622 , BlendNormal( lerpResult950_g39622 , lerpResult946_g39622 ) , _MASK_VERTICAL_Y1216_g39622);
				float3 m_Stochastic914_g39622 = lerpResult1400_g39622;
				float3 localfloat3switch914_g39622 = float3switch914_g39622( m_switch914_g39622 , m_Standard914_g39622 , m_Stochastic914_g39622 );
				float3 RAIN_VERTICAL127_g39622 = localfloat3switch914_g39622;
				int m_switch99_g39551 = _SmoothnessModeSurface;
				int m_switch170_g39551 = _SmoothnessType;
				float4 temp_cast_9 = (_SmoothnessStrength).xxxx;
				float4 m_Smoothness170_g39551 = temp_cast_9;
				float4 temp_cast_10 = (( 1.0 - _SmoothnessStrength )).xxxx;
				float4 m_Roughness170_g39551 = temp_cast_10;
				float4 localfloat4switch170_g39551 = float4switch170_g39551( m_switch170_g39551 , m_Smoothness170_g39551 , m_Roughness170_g39551 );
				float4 FINAL_STANDARD111_g39551 = localfloat4switch170_g39551;
				float4 m_Standard99_g39551 = FINAL_STANDARD111_g39551;
				int m_switch1387_g38551 = _Displacement_Mode1309_g38551;
				float3 tanNormal67_g39549 = unpack52_g39549;
				float3 worldNormal67_g39549 = float3(dot(tanToWorld0,tanNormal67_g39549), dot(tanToWorld1,tanNormal67_g39549), dot(tanToWorld2,tanNormal67_g39549));
				float3 temp_output_1478_66_g38551 = worldNormal67_g39549;
				float3 m_Off1387_g38551 = temp_output_1478_66_g38551;
				float3 m_Active1387_g38551 = temp_output_1478_66_g38551;
				float3x3 ase_tangentToWorldFast = float3x3(WorldTangent.x,WorldBiTangent.x,WorldNormal.x,WorldTangent.y,WorldBiTangent.y,WorldNormal.y,WorldTangent.z,WorldBiTangent.z,WorldNormal.z);
				float3 tangentToWorldDir104_g39545 = mul( ase_tangentToWorldFast, localCombineSamplesSmooth31_g39545 );
				float3 m_ActiveReconstructed1387_g38551 = tangentToWorldDir104_g39545;
				float3 localfloat3switch1387_g38551 = float3switch1387_g38551( m_switch1387_g38551 , m_Off1387_g38551 , m_Active1387_g38551 , m_ActiveReconstructed1387_g38551 );
				float3 NORMAL_WORLD_OUT164_g38551 = localfloat3switch1387_g38551;
				float3 temp_output_4_0_g39551 = NORMAL_WORLD_OUT164_g38551;
				float3 temp_output_23_0_g39551 = ddx( temp_output_4_0_g39551 );
				float dotResult25_g39551 = dot( temp_output_23_0_g39551 , temp_output_23_0_g39551 );
				float3 temp_output_7_0_g39551 = ddy( temp_output_4_0_g39551 );
				float dotResult27_g39551 = dot( temp_output_7_0_g39551 , temp_output_7_0_g39551 );
				float temp_output_28_0_g39551 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult25_g39551 + dotResult27_g39551 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
				float4 break377_g38551 = OUT_ALBEDO_RGBA1177_g38551;
				float ALBEDO_R169_g38551 = break377_g38551.r;
				float4 temp_cast_11 = (ALBEDO_R169_g38551).xxxx;
				float4 FINAL_GEOMETRIC114_g39551 = ( temp_output_28_0_g39551 * ( 1.0 - temp_cast_11 ) );
				float4 m_Geometric99_g39551 = FINAL_GEOMETRIC114_g39551;
				int SMOOTHNESS_TYPE173_g39551 = _SmoothnessType;
				int m_switch167_g39551 = SMOOTHNESS_TYPE173_g39551;
				float4 _MASK_G1438_g38551 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_output_83_0_g39551 = _MASK_G1438_g38551;
				float4 m_Smoothness167_g39551 = temp_output_83_0_g39551;
				float4 m_Roughness167_g39551 = ( 1.0 - temp_output_83_0_g39551 );
				float4 localfloat4switch167_g39551 = float4switch167_g39551( m_switch167_g39551 , m_Smoothness167_g39551 , m_Roughness167_g39551 );
				float4 FINAL_SMOOTHNESS_TEXTURE117_g39551 = ( temp_output_28_0_g39551 * localfloat4switch167_g39551 );
				float4 m_Texture99_g39551 = FINAL_SMOOTHNESS_TEXTURE117_g39551;
				float4 localfloat4switch99_g39551 = float4switch99_g39551( m_switch99_g39551 , m_Standard99_g39551 , m_Geometric99_g39551 , m_Texture99_g39551 );
				float4 temp_output_1267_33_g38551 = localfloat4switch99_g39551;
				float4 color301_g38551 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 _MASK_R1439_g38551 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_cast_13 = (IN.ase_color.a).xxxx;
				float4 lerpResult11_g38551 = lerp( _MASK_R1439_g38551 , temp_cast_13 , (float)_OcclusionSourceMode);
				float4 lerpResult14_g38551 = lerp( color301_g38551 , lerpResult11_g38551 , _OcclusionStrengthAO);
				float4 temp_output_23_0_g39622 = ( temp_output_1267_33_g38551 * lerpResult14_g38551 );
				float4 lerpResult144_g39622 = lerp( temp_output_23_0_g39622 , ( temp_output_23_0_g39622 * 0.05 ) , IN.ase_color.r);
				float4 temp_cast_16 = (0.7).xxxx;
				float4 SMOOTHNESS94_g39622 = step( step( lerpResult144_g39622 , temp_cast_16 ) , float4( 0,0,0,0 ) );
				float3 lerpResult42_g39622 = lerp( RAIN_VERTICAL127_g39622 , float3( 0,0,0 ) , SMOOTHNESS94_g39622.xyz);
				float3 temp_output_26_0_g39628 = float3( 0,0,0 );
				float3 m_Active103_g39622 = BlendNormal( temp_output_19_0_g39622 , ( ( lerpResult42_g39622 - temp_output_26_0_g39628 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39628 ) ) );
				float3 localfloat3switch103_g39622 = float3switch( m_switch103_g39622 , m_Off103_g39622 , m_Active103_g39622 );
				int m_switch1010_g39622 = _Static_RainMode;
				float3 m_Off1010_g39622 = NORMAL_IN105_g39622;
				int m_switch992_g39622 = _Static_ModeUV;
				float2 appendResult737_g39622 = (float2(_Static_TilingX , _Static_TilingY));
				float2 appendResult738_g39622 = (float2(_Static_OffsetX , _Static_OffsetY));
				float2 texCoord736_g39622 = IN.ase_texcoord7.xy * appendResult737_g39622 + appendResult738_g39622;
				float2 appendResult731_g39622 = (float2(frac( texCoord736_g39622.x ) , frac( texCoord736_g39622.y )));
				float2 _STATIC_UV01_OUT990_g39622 = ( appendResult731_g39622 + ( (ase_screenPosNorm).xy * _Static_ScreenContribution ) );
				int m_switch1186_g39622 = _Global_Rain_Enabled1178_g39622;
				float m_Off1186_g39622 = _Static_Intensity;
				float m_Active1186_g39622 = ( _Static_Intensity * _Global_Rain_Intensity1174_g39622 );
				float localfloatswitch1186_g39622 = floatswitch1186_g39622( m_switch1186_g39622 , m_Off1186_g39622 , m_Active1186_g39622 );
				float _STATIC_INTENSITY991_g39622 = saturate( localfloatswitch1186_g39622 );
				float3 unpack727_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Static_RainMap, sampler_trilinear_repeat, _STATIC_UV01_OUT990_g39622 ), _STATIC_INTENSITY991_g39622 );
				unpack727_g39622.z = lerp( 1, unpack727_g39622.z, saturate(_STATIC_INTENSITY991_g39622) );
				float3 m_Standard992_g39622 = unpack727_g39622;
				float localStochasticTiling973_g39622 = ( 0.0 );
				float2 UV973_g39622 = _STATIC_UV01_OUT990_g39622;
				float2 UV1973_g39622 = float2( 0,0 );
				float2 UV2973_g39622 = float2( 0,0 );
				float2 UV3973_g39622 = float2( 0,0 );
				float W1973_g39622 = 0.0;
				float W2973_g39622 = 0.0;
				float W3973_g39622 = 0.0;
				StochasticTiling( UV973_g39622 , UV1973_g39622 , UV2973_g39622 , UV3973_g39622 , W1973_g39622 , W2973_g39622 , W3973_g39622 );
				float2 temp_output_977_0_g39622 = ddx( _STATIC_UV01_OUT990_g39622 );
				float2 temp_output_978_0_g39622 = ddy( _STATIC_UV01_OUT990_g39622 );
				float3 unpack974_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV1973_g39622, temp_output_977_0_g39622, temp_output_978_0_g39622 ), _STATIC_INTENSITY991_g39622 );
				unpack974_g39622.z = lerp( 1, unpack974_g39622.z, saturate(_STATIC_INTENSITY991_g39622) );
				float UV1_S1_W1975_g39622 = W1973_g39622;
				float3 unpack970_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV2973_g39622, temp_output_977_0_g39622, temp_output_978_0_g39622 ), _STATIC_INTENSITY991_g39622 );
				unpack970_g39622.z = lerp( 1, unpack970_g39622.z, saturate(_STATIC_INTENSITY991_g39622) );
				float UV1_S1_W2972_g39622 = W2973_g39622;
				float3 unpack971_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV3973_g39622, temp_output_977_0_g39622, temp_output_978_0_g39622 ), _STATIC_INTENSITY991_g39622 );
				unpack971_g39622.z = lerp( 1, unpack971_g39622.z, saturate(_STATIC_INTENSITY991_g39622) );
				float UV1_S1_W3976_g39622 = W3973_g39622;
				float3 m_Stochastic992_g39622 = ( ( unpack974_g39622 * UV1_S1_W1975_g39622 ) + ( ( unpack970_g39622 * UV1_S1_W2972_g39622 ) + ( unpack971_g39622 * UV1_S1_W3976_g39622 ) ) );
				float3 localfloat3switch992_g39622 = float3switch992_g39622( m_switch992_g39622 , m_Standard992_g39622 , m_Stochastic992_g39622 );
				float3 RAIN_STATIC743_g39622 = localfloat3switch992_g39622;
				float3 lerpResult1005_g39622 = lerp( RAIN_STATIC743_g39622 , float3( 0,0,0 ) , SMOOTHNESS94_g39622.xyz);
				float3 temp_output_26_0_g39639 = float3( 0,0,0 );
				float3 m_Active1010_g39622 = BlendNormal( temp_output_19_0_g39622 , ( ( lerpResult1005_g39622 - temp_output_26_0_g39639 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39639 ) ) );
				float3 localfloat3switch1010_g39622 = float3switch( m_switch1010_g39622 , m_Off1010_g39622 , m_Active1010_g39622 );
				int m_switch1009_g39622 = _Horizontal_RainMode;
				float3 m_Off1009_g39622 = NORMAL_IN105_g39622;
				int m_switch1505_g39622 = _Horizontal_ModeUV;
				float2 appendResult269_g39622 = (float2(_Horizontal_TilingX , _Horizontal_TilingY));
				float2 HORIZONTAL_UV_TILING158_g39622 = appendResult269_g39622;
				float2 UV_TILING88_g39637 = HORIZONTAL_UV_TILING158_g39622;
				float2 appendResult271_g39622 = (float2(_Horizontal_OffsetX , _Horizontal_OffsetY));
				float2 HORIZONTAL_UV_OFFSET159_g39622 = appendResult271_g39622;
				float2 UV_OFFSET94_g39637 = HORIZONTAL_UV_OFFSET159_g39622;
				float2 texCoord87_g39637 = IN.ase_texcoord7.xy * UV_TILING88_g39637 + UV_OFFSET94_g39637;
				float2 appendResult86_g39637 = (float2(frac( texCoord87_g39637.x ) , frac( texCoord87_g39637.y )));
				float temp_output_52_0_g39637 = _Horizontal_Columns;
				float temp_output_53_0_g39637 = _Horizontal_Rows;
				float2 appendResult1_g39637 = (float2(temp_output_52_0_g39637 , temp_output_53_0_g39637));
				float VERTICAL_FRAMES15_g39637 = ( temp_output_52_0_g39637 * temp_output_53_0_g39637 );
				float2 appendResult49_g39637 = (float2(VERTICAL_FRAMES15_g39637 , temp_output_53_0_g39637));
				float clampResult37_g39637 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39637 - 1.0 ) );
				float temp_output_36_0_g39637 = frac( ( ( ( _TimeParameters.x * _Horizontal_Speed ) + clampResult37_g39637 ) / VERTICAL_FRAMES15_g39637 ) );
				float2 appendResult31_g39637 = (float2(temp_output_36_0_g39637 , ( 1.0 - temp_output_36_0_g39637 )));
				float2 UV_HORIZONTAL_DEFAULT_01817_g39622 = ( ( ( appendResult86_g39637 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g39637 ) + ( floor( ( appendResult49_g39637 * appendResult31_g39637 ) ) / appendResult1_g39637 ) );
				int m_switch1179_g39622 = _Global_Rain_Enabled1178_g39622;
				float m_Off1179_g39622 = _Horizontal_Intensity;
				float m_Active1179_g39622 = ( _Horizontal_Intensity * _Global_Rain_Intensity1174_g39622 );
				float localfloatswitch1179_g39622 = floatswitch1179_g39622( m_switch1179_g39622 , m_Off1179_g39622 , m_Active1179_g39622 );
				float _HORIZONTAL_INTENSITY814_g39622 = saturate( localfloatswitch1179_g39622 );
				float3 unpack9_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_01817_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack9_g39622.z = lerp( 1, unpack9_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float2 UV_TILING88_g39625 = ( HORIZONTAL_UV_TILING158_g39622 / float2( 0.6,0.6 ) );
				float2 UV_OFFSET94_g39625 = ( HORIZONTAL_UV_OFFSET159_g39622 + float2( 0.3,0.3 ) );
				float2 texCoord87_g39625 = IN.ase_texcoord7.xy * UV_TILING88_g39625 + UV_OFFSET94_g39625;
				float2 appendResult86_g39625 = (float2(frac( texCoord87_g39625.x ) , frac( texCoord87_g39625.y )));
				float temp_output_52_0_g39625 = _Horizontal_Columns;
				float temp_output_53_0_g39625 = _Horizontal_Rows;
				float2 appendResult1_g39625 = (float2(temp_output_52_0_g39625 , temp_output_53_0_g39625));
				float VERTICAL_FRAMES15_g39625 = ( temp_output_52_0_g39625 * temp_output_53_0_g39625 );
				float2 appendResult49_g39625 = (float2(VERTICAL_FRAMES15_g39625 , temp_output_53_0_g39625));
				float clampResult37_g39625 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39625 - 1.0 ) );
				float temp_output_36_0_g39625 = frac( ( ( ( _TimeParameters.x * _Horizontal_Speed ) + clampResult37_g39625 ) / VERTICAL_FRAMES15_g39625 ) );
				float2 appendResult31_g39625 = (float2(temp_output_36_0_g39625 , ( 1.0 - temp_output_36_0_g39625 )));
				float2 UV_HORIZONTAL_DEFAULT_02818_g39622 = ( ( ( appendResult86_g39625 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g39625 ) + ( floor( ( appendResult49_g39625 * appendResult31_g39625 ) ) / appendResult1_g39625 ) );
				float3 unpack339_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_02818_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack339_g39622.z = lerp( 1, unpack339_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float3 m_Standard1505_g39622 = BlendNormal( unpack9_g39622 , unpack339_g39622 );
				float localStochasticTiling800_g39622 = ( 0.0 );
				float2 UV800_g39622 = UV_HORIZONTAL_DEFAULT_01817_g39622;
				float2 UV1800_g39622 = float2( 0,0 );
				float2 UV2800_g39622 = float2( 0,0 );
				float2 UV3800_g39622 = float2( 0,0 );
				float W1800_g39622 = 0.0;
				float W2800_g39622 = 0.0;
				float W3800_g39622 = 0.0;
				StochasticTiling( UV800_g39622 , UV1800_g39622 , UV2800_g39622 , UV3800_g39622 , W1800_g39622 , W2800_g39622 , W3800_g39622 );
				float2 temp_output_804_0_g39622 = ddx( UV_HORIZONTAL_DEFAULT_01817_g39622 );
				float2 temp_output_797_0_g39622 = ddy( UV_HORIZONTAL_DEFAULT_01817_g39622 );
				float3 unpack809_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1800_g39622, temp_output_804_0_g39622, temp_output_797_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack809_g39622.z = lerp( 1, unpack809_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H1_W1805_g39622 = W1800_g39622;
				float3 unpack810_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2800_g39622, temp_output_804_0_g39622, temp_output_797_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack810_g39622.z = lerp( 1, unpack810_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H1_W2803_g39622 = W2800_g39622;
				float3 unpack811_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3800_g39622, temp_output_804_0_g39622, temp_output_797_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack811_g39622.z = lerp( 1, unpack811_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H1_W3812_g39622 = W3800_g39622;
				float localStochasticTiling781_g39622 = ( 0.0 );
				float2 UV781_g39622 = UV_HORIZONTAL_DEFAULT_02818_g39622;
				float2 UV1781_g39622 = float2( 0,0 );
				float2 UV2781_g39622 = float2( 0,0 );
				float2 UV3781_g39622 = float2( 0,0 );
				float W1781_g39622 = 0.0;
				float W2781_g39622 = 0.0;
				float W3781_g39622 = 0.0;
				StochasticTiling( UV781_g39622 , UV1781_g39622 , UV2781_g39622 , UV3781_g39622 , W1781_g39622 , W2781_g39622 , W3781_g39622 );
				float2 temp_output_788_0_g39622 = ddx( UV_HORIZONTAL_DEFAULT_02818_g39622 );
				float2 temp_output_777_0_g39622 = ddy( UV_HORIZONTAL_DEFAULT_02818_g39622 );
				float3 unpack782_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1781_g39622, temp_output_788_0_g39622, temp_output_777_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack782_g39622.z = lerp( 1, unpack782_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H2_W1789_g39622 = W1781_g39622;
				float3 unpack783_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2781_g39622, temp_output_788_0_g39622, temp_output_777_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack783_g39622.z = lerp( 1, unpack783_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H2_W2787_g39622 = W2781_g39622;
				float3 unpack779_g39622 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3781_g39622, temp_output_788_0_g39622, temp_output_777_0_g39622 ), _HORIZONTAL_INTENSITY814_g39622 );
				unpack779_g39622.z = lerp( 1, unpack779_g39622.z, saturate(_HORIZONTAL_INTENSITY814_g39622) );
				float UV1_H2_W3785_g39622 = W3781_g39622;
				float3 m_Stochastic1505_g39622 = BlendNormal( ( ( unpack809_g39622 * UV1_H1_W1805_g39622 ) + ( ( unpack810_g39622 * UV1_H1_W2803_g39622 ) + ( unpack811_g39622 * UV1_H1_W3812_g39622 ) ) ) , ( ( unpack782_g39622 * UV1_H2_W1789_g39622 ) + ( ( unpack783_g39622 * UV1_H2_W2787_g39622 ) + ( unpack779_g39622 * UV1_H2_W3785_g39622 ) ) ) );
				float3 localfloat3switch1505_g39622 = float3switch1505_g39622( m_switch1505_g39622 , m_Standard1505_g39622 , m_Stochastic1505_g39622 );
				float2 _SmoothH = float2(0,1);
				float smoothstepResult1517_g39622 = smoothstep( _SmoothH.x , _SmoothH.y , ( WorldNormal.y + 0.02 ));
				float _MASK_HORIZONTAL152_g39622 = smoothstepResult1517_g39622;
				float3 lerpResult279_g39622 = lerp( _MASK_VECTOR1485_g39622 , localfloat3switch1505_g39622 , _MASK_HORIZONTAL152_g39622);
				float3 RAIN_HORIZONTAL123_g39622 = lerpResult279_g39622;
				float3 lerpResult1002_g39622 = lerp( RAIN_HORIZONTAL123_g39622 , float3( 0,0,0 ) , SMOOTHNESS94_g39622.xyz);
				float3 temp_output_26_0_g39630 = float3( 0,0,0 );
				float3 m_Active1009_g39622 = BlendNormal( temp_output_19_0_g39622 , ( ( lerpResult1002_g39622 - temp_output_26_0_g39630 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39630 ) ) );
				float3 localfloat3switch1009_g39622 = float3switch( m_switch1009_g39622 , m_Off1009_g39622 , m_Active1009_g39622 );
				
				float4 _MASK_B1440_g38551 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g39580 );
				
				int m_switch23_g39627 = _Rain_GlobalWetnessMode;
				float4 temp_output_17_0_g39627 = temp_output_23_0_g39622;
				float4 m_Off23_g39627 = temp_output_17_0_g39627;
				int m_switch12_g39627 = _Global_Wetness_Enabled;
				float4 m_Off12_g39627 = temp_output_17_0_g39627;
				float4 m_Active12_g39627 = saturate( ( temp_output_17_0_g39627 + _Global_Wetness_Intensity ) );
				float4 localfloat4switch12_g39627 = float4switch12_g39627( m_switch12_g39627 , m_Off12_g39627 , m_Active12_g39627 );
				float4 m_Active23_g39627 = localfloat4switch12_g39627;
				float4 localfloat4switch23_g39627 = float4switch23_g39627( m_switch23_g39627 , m_Off23_g39627 , m_Active23_g39627 );
				
				float3 Albedo = ( temp_output_746_0_g39622 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
				float3 Normal = ( localfloat3switch103_g39622 + localfloat3switch1010_g39622 + localfloat3switch1009_g39622 );
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( _MetallicStrength * _MASK_B1440_g38551 ).r;
				float Smoothness = localfloat4switch23_g39627.x;
				float Occlusion = saturate( lerpResult14_g38551 ).r;
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
4;29.33333;1436.667;767.6667;-328.4589;1191.525;1.147258;True;False
Node;AmplifyShaderEditor.FunctionNode;398;384.9523,-677.055;Inherit;False;DESF Core Surface;4;;38551;c3df20d62907cd04086a1eacc41e29d1;19,1352,2,183,2,1382,1,1432,1,1433,1,1434,1,1491,0,1284,0,1446,0,307,0,312,0,1318,1,249,1,1319,1,1336,0,1337,0,1407,0,1443,0,1444,0;2;309;FLOAT3;0,0,0;False;1262;FLOAT4;0,0,0,0;False;10;FLOAT4;42;FLOAT3;39;FLOAT3;1473;COLOR;0;FLOAT4;41;COLOR;43;FLOAT;180;FLOAT;55;FLOAT;281;FLOAT3;313
Node;AmplifyShaderEditor.CommentaryNode;295;1370.783,-1020.665;Inherit;False;182;121;GLOBAL SETTINGS ;1;379;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;384;1063.915,-1022.551;Inherit;False;296.1923;328.7019;Tessellation;4;388;385;387;386;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;396;1375.005,-393.0649;Inherit;False;333.6667;125;DESF Common ASE Compile Shaders;1;397;;0,0.2047877,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;290;1370.96,-887.2607;Inherit;False;347.5028;185.4201;DEBUG SETTINGS ;3;293;353;291;;0,0,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;394;780.0298,-677.3619;Inherit;False;DESF Module Detail;71;;39591;49c077198be2bdb409ab6ad879c0ca28;4,200,1,201,1,347,0,346,0;2;39;FLOAT4;0,0,0,0;False;38;FLOAT3;0,0,1;False;2;FLOAT4;73;FLOAT3;72
Node;AmplifyShaderEditor.CommentaryNode;401;1369.707,-1171.923;Inherit;False;271;139;_RECEIVE_SHADOWS_OFF;1;402;;0,0,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;386;1085.915,-982.8434;Half;False;Property;_TessellationStrength;Tessellation Strength;67;0;Create;False;1;;0;0;True;1;Header(TESSELLATION URP);False;6;0.5;0.001;32;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1384.431,-774.1531;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;388;1081.402,-771.1226;Half;False;Property;_TessellationPhong;Tessellation Phong;68;0;Create;False;1;;0;0;True;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;387;1084.414,-913.6283;Half;False;Property;_TessellationDistanceMin;Tessellation Distance Min;69;0;Create;False;1;;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;291;1380.189,-845.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;395;1037.696,-679.1122;Inherit;False;DESF Module Rain;98;;39622;58c64a46e00b7044aaf191f7451a976c;1,1532,1;3;746;FLOAT4;0,0,0,0;False;19;FLOAT3;0,0,1;False;23;FLOAT4;1,0,0,0;False;3;FLOAT4;747;FLOAT3;0;FLOAT4;1536
Node;AmplifyShaderEditor.IntNode;379;1387.669,-982.5179;Inherit;False;Property;_CullMode;Cull Mode;3;2;[Header];[Enum];Create;False;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;293;1565.695,-843.718;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;385;1085.231,-842.4491;Half;False;Property;_TessellationDistanceMax;Tessellation Distance Max ;70;0;Create;False;1;;0;0;True;0;False;5;2000;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;397;1388.005,-351.0649;Inherit;False;DESF Common ASE Compile Shaders;-1;;39621;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;402;1377.707,-1132.923;Inherit;False;Property;_RECEIVE_SHADOWS_OFF;Receive Shadows;2;0;Create;False;0;0;0;True;0;False;0;0;0;True;_RECEIVE_SHADOWS_OFF;Toggle;2;Key0;Key1;Fetch;True;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;392;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;374;1374.904,-680.6909;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;DEC/Rain/Rain Surface Height Detail Tessellation;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;2;True;379;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=-10;NatureRendererInstancing=True;True;2;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;2;LightMode=UniversalForward;NatureRendererInstancing=True;False;False;6;Include;;False;;Native;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;ed9205546b797304ea7576ba0b32877e;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;Pragma;shader_feature_local _RECEIVE_SHADOWS_OFF;False;;Custom; ;0;0;Standard;38;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,False,-1;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;1;  Phong;1;  Strength;0.5,True,388;  Type;1;  Tess;16,True,386;  Min;10,True,387;  Max;25,True,385;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Write Depth;0;  Early Z;0;Vertex Position,InvertActionOnDeselection;1;0;8;False;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;373;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;377;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;375;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;378;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;False;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;376;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;391;1374.904,-620.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;394;39;398;42
WireConnection;394;38;398;39
WireConnection;395;746;394;73
WireConnection;395;19;394;72
WireConnection;395;23;398;41
WireConnection;374;0;395;747
WireConnection;374;1;395;0
WireConnection;374;3;398;0
WireConnection;374;4;395;1536
WireConnection;374;5;398;43
WireConnection;374;8;398;313
ASEEND*/
//CHKSM=5EAD28C781480A1152E58D2BA2FA45B0CB3410EE