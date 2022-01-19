// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Grunge/Grunge Surface Mask Color"
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
		[Enum(Off,0,Active,1,Active Inverted,2)]_Gradient_Mode("Gradient Mode", Int) = 0
		[HDR]_Gradient_Top("Gradient Tint Top", Color) = (0.7259277,0.7647059,0.06185123,0)
		[HDR]_Gradient_TopSide("Gradient Tint Top Side", Color) = (0.2569204,0.5525266,0.7279412,0)
		[HDR]_Gradient_Bottom("Gradient Tint Bottom", Color) = (0.3877363,0.5955882,0.188311,0)
		[HDR]_Gradient_BottomSide("Gradient Tint Bottom Side", Color) = (0.7058823,0.2024221,0.2024221,0)
		[HDR]_Gradient_TintCurvature("Gradient Tint Curvature", Color) = (1,0,0.444931,0)
		_Gradient_Ramp("Gradient Ramp", Range( 0 , 1)) = 0
		_Gradient_Contrast("Gradient Contrast", Range( 0 , 1)) = 0
		_Gradient_Height("Gradient Height", Range( 0 , 20)) = 17.80307
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
		[Header(GRUNGE HORIZONTAL )][Enum(Off,0,Active,1,Active Inverted,2)]_Horizontalwear_Mode("Mode", Int) = 0
		_Horizontalwear_Tint("Tint", Color) = (1,1,1,0)
		[SingleLineTexture]_Horizontalwear_GrungeMap("Grunge Map", 2D) = "white" {}
		[Normal][SingleLineTexture]_Horizontalwear_GrungeNormal("Grunge Normal", 2D) = "bump" {}
		_Horizontalwear_TilingX("Tiling X", Float) = 1
		_Horizontalwear_TilingY("Tiling Y", Float) = 1
		_Horizontalwear_OffsetX("Offset X", Float) = 0
		_Horizontalwear_OffsetY("Offset Y", Float) = 0
		_Horizontalwear_Metallic("Metallic", Range( 0 , 1)) = 0
		_Horizontalwear_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Horizontalwear_Saturation("Saturation", Range( -1 , 5)) = 1
		_Horizontalwear_NormalMultiplier("Normal Multiplier", Range( 0 , 10)) = 1
		[Enum(Map Grunge,0,Map Albedo,1)]_Horizontalwear_MaskingSource("Masking Source", Int) = 0
		_Horizontalwear_MaskingColor("Masking Color", Color) = (0.5019608,0,0,0)
		_Horizontalwear_MaskingColorRange("Masking Color Range", Range( 0 , 1)) = 0.2
		_Horizontalwear_MaskingColorFuzziness("Masking Color Fuzziness", Range( 0 , 1)) = 0.1
		_Horizontalwear_BlendStrength("Blend Strength", Range( 0 , 0.99)) = 0.5
		_Horizontalwear_BlendMix("Blend Mix", Range( 0 , 1.5)) = 1
		[Header(GRUNGE VERTICAL)][Enum(Off,0,Active,1,Active Inverted,2)]_Verticalwear_Mode("Mode", Int) = 0
		_Verticalwear_Tint("Tint", Color) = (1,1,1,1)
		[SingleLineTexture]_Verticalwear_GrungeMap("Grunge Map", 2D) = "white" {}
		[Normal][SingleLineTexture]_Verticalwear_GrungeNormal("Grunge Normal", 2D) = "bump" {}
		_Verticalwear_TilingX("Tiling X", Float) = 1
		_Verticalwear_TilingY("Tiling Y", Float) = 1
		_Verticalwear_OffsetX("Offset X", Float) = 0
		_Verticalwear_OffsetY("Offset Y", Float) = 0
		_Verticalwear_Metallic("Metallic", Range( 0 , 1)) = 0
		_Verticalwear_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Verticalwear_Saturation("Saturation", Range( -1 , 5)) = 1
		_Verticalwear_NormalMultiplier("Normal Strength", Range( 0 , 10)) = 1
		[Enum(Map Grunge,0,Map Albedo,1)]_Verticalwear_MaskingSource("Masking Source", Int) = 0
		_Verticalwear_MaskingColor("Masking Color", Color) = (0.5019608,0,0,0)
		_Verticalwear_MaskingColorRange("Masking Color Range", Range( 0 , 1)) = 0.2
		_Verticalwear_MaskingColorFuzziness("Masking Color Fuzziness", Range( 0 , 1)) = 0.1
		_Verticalwear_BlendMix("Blend Mix", Range( 0 , 1.5)) = 1
		_Verticalwear_BlendStrength("Blend Strength", Range( 0 , 0.99)) = 0.5
		[Header(GRUNGE CURVATURE WEAR)][Enum(Off,0,Active,1,Active Inverted,2)]_Curvaturewear_Mode("Mode", Int) = 0
		_Curvaturewear_Tint("Tint", Color) = (1,1,1,1)
		[SingleLineTexture]_Curvaturewear_GrungeMap("Grunge Map", 2D) = "white" {}
		[Normal][SingleLineTexture]_Curvaturewear_GrungeNormal("Grunge Normal", 2D) = "bump" {}
		_Curvaturewear_TilingX("Tiling X", Float) = 1
		_Curvaturewear_TilingY("Tiling Y", Float) = 1
		_Curvaturewear_OffsetX("Offset X", Float) = 0
		_Curvaturewear_OffsetY("Offset Y", Float) = 0
		_Curvaturewear_Metallic("Metallic", Range( 0 , 1)) = 0
		_Curvaturewear_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Curvaturewear_Saturation("Saturation", Range( -1 , 5)) = 1
		_Curvaturewear_NormalMultiplier("Normal Multiplier", Range( 0 , 10)) = 1
		[Enum(Map Grunge,0,Map Albedo,1)]_Curvaturewear_MaskingSource("Masking Source", Int) = 0
		_Curvaturewear_MaskingColor("Masking Color", Color) = (0.5019608,0,0,0)
		_Curvaturewear_MaskingColorRange("Masking Color Range", Range( 0 , 1)) = 0.2
		_Curvaturewear_MaskingColorFuzziness("Masking Color Fuzziness", Range( 0 , 1)) = 0.1
		_Curvaturewear_BlendMix("Blend Mix", Range( 0 , 1)) = 0
		_Curvaturewear_BlendStrength("Blend Strength", Range( 0 , 0.99)) = 0.5
		[ASEEnd]_Curvaturewear_BlendHardness("Blend Hardness", Range( 0.75 , 2)) = 2

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

			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
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
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Gradient_TopSide;
			float4 _Verticalwear_MaskingColor;
			float4 _Curvaturewear_Tint;
			float4 _Horizontalwear_Tint;
			float4 _Horizontalwear_MaskingColor;
			float4 _Color;
			float4 _Gradient_TintCurvature;
			float4 _Gradient_BottomSide;
			float4 _Gradient_Bottom;
			float4 _Gradient_Top;
			float4 _Verticalwear_Tint;
			float4 _Curvaturewear_MaskingColor;
			half _Curvaturewear_MaskingColorFuzziness;
			half _Curvaturewear_MaskingColorRange;
			int _Curvaturewear_MaskingSource;
			int _ColorMask;
			half _Curvaturewear_Saturation;
			float _Curvaturewear_BlendStrength;
			float _Curvaturewear_OffsetY;
			float _Curvaturewear_OffsetX;
			float _Curvaturewear_TilingY;
			float _Curvaturewear_TilingX;
			float _Curvaturewear_BlendMix;
			float _Curvaturewear_BlendHardness;
			float _Verticalwear_NormalMultiplier;
			float _Horizontalwear_NormalMultiplier;
			float _Horizontalwear_Smoothness;
			float _OcclusionStrengthAO;
			int _OcclusionSourceMode;
			float _SmoothnessThreshold;
			float _SmoothnessVariance;
			float _SmoothnessStrength;
			half _NormalStrength;
			int _SmoothnessType;
			float _Curvaturewear_Metallic;
			float _Verticalwear_Metallic;
			float _Horizontalwear_Metallic;
			float _MetallicStrength;
			float _Curvaturewear_NormalMultiplier;
			float _Verticalwear_BlendMix;
			int _SmoothnessModeSurface;
			float _Verticalwear_BlendStrength;
			float _Verticalwear_OffsetY;
			half _Verticalwear_MaskingColorRange;
			int _CullMode;
			int _ZWriteMode;
			int _Curvaturewear_Mode;
			int _Verticalwear_Mode;
			int _Horizontalwear_Mode;
			int _Gradient_Mode;
			float _Gradient_Height;
			float _Gradient_Ramp;
			float _Gradient_Contrast;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			half _Verticalwear_MaskingColorFuzziness;
			float _Horizontalwear_TilingX;
			float _Horizontalwear_OffsetX;
			float _Horizontalwear_OffsetY;
			half _Horizontalwear_Saturation;
			int _Horizontalwear_MaskingSource;
			half _Horizontalwear_MaskingColorRange;
			half _Horizontalwear_MaskingColorFuzziness;
			float _Horizontalwear_BlendStrength;
			float _Horizontalwear_BlendMix;
			float _Verticalwear_TilingX;
			float _Verticalwear_TilingY;
			float _Verticalwear_OffsetX;
			float _Verticalwear_Smoothness;
			half _Verticalwear_Saturation;
			int _Verticalwear_MaskingSource;
			float _Horizontalwear_TilingY;
			float _Curvaturewear_Smoothness;
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
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_Horizontalwear_GrungeMap);
			TEXTURE2D(_Verticalwear_GrungeMap);
			TEXTURE2D(_Curvaturewear_GrungeMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_Horizontalwear_GrungeNormal);
			TEXTURE2D(_Verticalwear_GrungeNormal);
			TEXTURE2D(_Curvaturewear_GrungeNormal);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);


			float4 float4switch143_g39556( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1506_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1476_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1269_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1512_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1400_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1377_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1516_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1491_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1380_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float3 float3switch1329_g39591( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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
			
			float3 float3switch1413_g39591( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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
			
			float3 float3switch1416_g39591( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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
			
			float floatswitch1434_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
			}
			
			float floatswitch1435_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
			}
			
			float floatswitch1436_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
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
			
			float floatswitch1075_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
			}
			
			float floatswitch1432_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
			}
			
			float floatswitch1433_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7 = v.vertex;
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
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

				int m_switch1380_g39591 = _Curvaturewear_Mode;
				int m_switch1377_g39591 = _Verticalwear_Mode;
				int m_switch1269_g39591 = _Horizontalwear_Mode;
				int _Gradient_Mode161_g39556 = _Gradient_Mode;
				int m_switch143_g39556 = _Gradient_Mode161_g39556;
				float4 TINT147_g39556 = _Color;
				float4 m_Off143_g39556 = TINT147_g39556;
				float4 _Vector0 = float4(0.001,0.001,0.001,0.001);
				float3 temp_output_275_0_g39556 = abs( WorldNormal );
				float WN_HORIZONTAL284_g39556 = ( ( temp_output_275_0_g39556 * temp_output_275_0_g39556 ).y + 0.07 );
				float4 lerpResult341_g39556 = lerp( _Gradient_TintCurvature , _Vector0 , WN_HORIZONTAL284_g39556);
				float4 VECTOR_IN_MASKED343_g39556 = lerpResult341_g39556;
				float4 Vect_001349_g39556 = _Vector0;
				float2 _Vector3 = float2(0,0.45);
				float3 temp_cast_2 = (0.5).xxx;
				float3 break277_g39556 = ( temp_output_275_0_g39556 - temp_cast_2 );
				float WN_X280_g39556 = break277_g39556.x;
				float smoothstepResult303_g39556 = smoothstep( _Vector3.x , _Vector3.y , ( WN_X280_g39556 + 1.25 ));
				float smoothstepResult299_g39556 = smoothstep( _Vector3.x , _Vector3.y , ( -WN_X280_g39556 + 0.02 ));
				float lerpResult306_g39556 = lerp( 0.0 , smoothstepResult303_g39556 , smoothstepResult299_g39556);
				float4 lerpResult301_g39556 = lerp( VECTOR_IN_MASKED343_g39556 , Vect_001349_g39556 , lerpResult306_g39556);
				float4 MASK_VERTICAL_X307_g39556 = lerpResult301_g39556;
				float2 _Vector1 = float2(0,0.85);
				float WN_Y281_g39556 = break277_g39556.y;
				float smoothstepResult334_g39556 = smoothstep( _Vector1.x , _Vector1.y , ( -WN_Y281_g39556 + 0.35 ));
				float4 lerpResult333_g39556 = lerp( VECTOR_IN_MASKED343_g39556 , Vect_001349_g39556 , smoothstepResult334_g39556);
				float4 MASK_VERTICAL_Y320_g39556 = lerpResult333_g39556;
				float2 _HelloRicardo = float2(1.8,1.4);
				float WN_Z282_g39556 = break277_g39556.z;
				float smoothstepResult331_g39556 = smoothstep( _HelloRicardo.x , _HelloRicardo.y , ( WN_Z282_g39556 + 2.06 ));
				float lerpResult327_g39556 = lerp( smoothstepResult331_g39556 , 0.0 , ( -WN_Z282_g39556 + 2.05 ));
				float4 lerpResult314_g39556 = lerp( Vect_001349_g39556 , VECTOR_IN_MASKED343_g39556 , lerpResult327_g39556);
				float4 MASK_VERTICAL_Z315_g39556 = lerpResult314_g39556;
				float4 Curvature353_g39556 = saturate( ( MASK_VERTICAL_X307_g39556 + MASK_VERTICAL_Y320_g39556 + MASK_VERTICAL_Z315_g39556 ) );
				float4 lerpResult117_g39556 = lerp( _Gradient_BottomSide , _Gradient_Bottom , WN_HORIZONTAL284_g39556);
				float4 lerpResult111_g39556 = lerp( _Gradient_TopSide , _Gradient_Top , WN_HORIZONTAL284_g39556);
				float clampResult106_g39556 = clamp( ( IN.ase_texcoord7.xyz.y / _Gradient_Height ) , 0.0 , 1.0 );
				float4 lerpResult113_g39556 = lerp( lerpResult117_g39556 , lerpResult111_g39556 , clampResult106_g39556);
				float3 temp_output_145_0_g39556 = (( Curvature353_g39556 + lerpResult113_g39556 )).xyz;
				float _Gradient_Ramp154_g39556 = _Gradient_Ramp;
				float _Gradient_Contrast157_g39556 = _Gradient_Contrast;
				float2 appendResult150_g38079 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38079 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = IN.ase_texcoord8.xy * appendResult150_g38079 + appendResult151_g38079;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38079 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38079;
				float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
				float4 OUT_ALBEDO_RGBA1177_g38079 = tex2DNode63_g39580;
				float4 ALBEDO151_g39556 = OUT_ALBEDO_RGBA1177_g38079;
				float smoothstepResult142_g39556 = smoothstep( ( _Gradient_Ramp154_g39556 - ( _Gradient_Ramp154_g39556 * ( 1.0 - _Gradient_Contrast157_g39556 ) ) ) , ALBEDO151_g39556.x , _Gradient_Ramp154_g39556);
				float4 lerpResult139_g39556 = lerp( TINT147_g39556 , float4( temp_output_145_0_g39556 , 0.0 ) , smoothstepResult142_g39556);
				float4 m_Active143_g39556 = lerpResult139_g39556;
				float4 lerpResult141_g39556 = lerp( float4( temp_output_145_0_g39556 , 0.0 ) , TINT147_g39556 , smoothstepResult142_g39556);
				float4 m_ActiveInverted143_g39556 = lerpResult141_g39556;
				float4 localfloat4switch143_g39556 = float4switch143_g39556( m_switch143_g39556 , m_Off143_g39556 , m_Active143_g39556 , m_ActiveInverted143_g39556 );
				float4 temp_output_7_0_g38079 = ( localfloat4switch143_g39556 * float4( (OUT_ALBEDO_RGBA1177_g38079).rgb , 0.0 ) * _Brightness );
				float4 temp_output_6_0_g39591 = ( temp_output_7_0_g38079 + float4(0,0,0,0) );
				float4 m_Off1269_g39591 = temp_output_6_0_g39591;
				float2 appendResult1344_g39591 = (float2(_Horizontalwear_TilingX , _Horizontalwear_TilingY));
				float2 appendResult1343_g39591 = (float2(_Horizontalwear_OffsetX , _Horizontalwear_OffsetY));
				float2 texCoord1342_g39591 = IN.ase_texcoord8.xy * appendResult1344_g39591 + appendResult1343_g39591;
				float4 tex2DNode1327_g39591 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMap, sampler_trilinear_repeat, texCoord1342_g39591 );
				float4 temp_output_12_0_g39594 = ( float4( (_Horizontalwear_Tint).rgb , 0.0 ) * tex2DNode1327_g39591 );
				float3 desaturateInitialColor10_g39594 = temp_output_12_0_g39594.xyz;
				float desaturateDot10_g39594 = dot( desaturateInitialColor10_g39594, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39594 = lerp( desaturateInitialColor10_g39594, desaturateDot10_g39594.xxx, ( 1.0 - ( _Horizontalwear_Saturation + 1.0 ) ) );
				float3 FINAL_MASK_HORIZONTAL804_g39591 = desaturateVar10_g39594;
				float4 temp_cast_15 = (0.5).xxxx;
				float4 temp_cast_16 = (0.75).xxxx;
				int _Horizontalwear_Mode1003_g39591 = _Horizontalwear_Mode;
				int m_switch1476_g39591 = _Horizontalwear_Mode1003_g39591;
				float4 break91_g39617 = _Horizontalwear_MaskingColor;
				float3 appendResult87_g39617 = (float3(break91_g39617.r , break91_g39617.g , break91_g39617.b));
				int m_switch1506_g39591 = _Horizontalwear_MaskingSource;
				float4 _Horizontalwear_GrungeMap1508_g39591 = tex2DNode1327_g39591;
				float4 m_MapGrunge1506_g39591 = _Horizontalwear_GrungeMap1508_g39591;
				float4 ALBEDO_IN1447_g39591 = temp_output_6_0_g39591;
				float4 m_MapAlbedo1506_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1506_g39591 = float4switch1506_g39591( m_switch1506_g39591 , m_MapGrunge1506_g39591 , m_MapAlbedo1506_g39591 );
				float4 break89_g39617 = localfloat4switch1506_g39591;
				float3 appendResult88_g39617 = (float3(break89_g39617.x , break89_g39617.y , break89_g39617.z));
				float4 temp_cast_18 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1476_g39591 = temp_cast_18;
				float4 temp_cast_19 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1476_g39591 = temp_cast_19;
				float4 temp_cast_20 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1476_g39591 = temp_cast_20;
				float4 localfloat4switch1476_g39591 = float4switch1476_g39591( m_switch1476_g39591 , m_Off1476_g39591 , m_Active1476_g39591 , m_ActiveInverted1476_g39591 );
				float4 temp_output_44_0_g39621 = localfloat4switch1476_g39591;
				float4 VECTOR_IN212_g39621 = temp_output_44_0_g39621;
				float4 _Vec = float4(0.001,0.001,0.001,0.001);
				float4 Vect_0019_g39621 = _Vec;
				float2 _SmoothHorizontal = float2(0,0.5);
				float3 temp_output_40_0_g39621 = abs( WorldNormal );
				float WN_HORIZONTAL141_g39621 = ( ( temp_output_40_0_g39621 * temp_output_40_0_g39621 ).y + 0.07 );
				float smoothstepResult205_g39621 = smoothstep( _SmoothHorizontal.x , _SmoothHorizontal.y , ( ( 1.0 - WN_HORIZONTAL141_g39621 ) + -0.1 ));
				float4 lerpResult200_g39621 = lerp( VECTOR_IN212_g39621 , Vect_0019_g39621 , smoothstepResult205_g39621);
				float4 MASK_HORIZONTAL204_g39621 = lerpResult200_g39621;
				float4 temp_cast_21 = (_Horizontalwear_BlendStrength).xxxx;
				float4 temp_cast_22 = (-1.0).xxxx;
				float4 smoothstepResult75_g39621 = smoothstep( temp_cast_15 , temp_cast_16 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_HORIZONTAL204_g39621 ) - temp_cast_21) * (temp_cast_22 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_21)));
				float4 _MinOldVect4 = float4(0,0,0,0);
				float MASK_HORIZONTAL808_g39591 = ( (( ( smoothstepResult75_g39621 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Horizontalwear_BlendMix );
				float4 lerpResult861_g39591 = lerp( temp_output_6_0_g39591 , float4( FINAL_MASK_HORIZONTAL804_g39591 , 0.0 ) , MASK_HORIZONTAL808_g39591);
				float4 m_Active1269_g39591 = lerpResult861_g39591;
				float4 m_ActiveInverted1269_g39591 = lerpResult861_g39591;
				float4 localfloat4switch1269_g39591 = float4switch1269_g39591( m_switch1269_g39591 , m_Off1269_g39591 , m_Active1269_g39591 , m_ActiveInverted1269_g39591 );
				float4 m_Off1377_g39591 = localfloat4switch1269_g39591;
				float2 appendResult1384_g39591 = (float2(_Verticalwear_TilingX , _Verticalwear_TilingY));
				float2 appendResult1386_g39591 = (float2(_Verticalwear_OffsetX , _Verticalwear_OffsetY));
				float2 texCoord1388_g39591 = IN.ase_texcoord8.xy * appendResult1384_g39591 + appendResult1386_g39591;
				float4 tex2DNode1397_g39591 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeMap, sampler_trilinear_repeat, texCoord1388_g39591 );
				float4 temp_output_12_0_g39606 = ( float4( (_Verticalwear_Tint).rgb , 0.0 ) * tex2DNode1397_g39591 );
				float3 desaturateInitialColor10_g39606 = temp_output_12_0_g39606.xyz;
				float desaturateDot10_g39606 = dot( desaturateInitialColor10_g39606, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39606 = lerp( desaturateInitialColor10_g39606, desaturateDot10_g39606.xxx, ( 1.0 - ( _Verticalwear_Saturation + 1.0 ) ) );
				float3 FINAL_MASK_VERTICAL394_g39591 = desaturateVar10_g39606;
				float4 temp_cast_27 = (0.5).xxxx;
				float4 temp_cast_28 = (0.75).xxxx;
				int _Verticalwear_Mode1004_g39591 = _Verticalwear_Mode;
				int m_switch1400_g39591 = _Verticalwear_Mode1004_g39591;
				float4 break91_g39612 = _Verticalwear_MaskingColor;
				float3 appendResult87_g39612 = (float3(break91_g39612.r , break91_g39612.g , break91_g39612.b));
				int m_switch1512_g39591 = _Verticalwear_MaskingSource;
				float4 _Verticalwear_GrungeMap1509_g39591 = tex2DNode1397_g39591;
				float4 m_MapGrunge1512_g39591 = _Verticalwear_GrungeMap1509_g39591;
				float4 m_MapAlbedo1512_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1512_g39591 = float4switch1512_g39591( m_switch1512_g39591 , m_MapGrunge1512_g39591 , m_MapAlbedo1512_g39591 );
				float4 break89_g39612 = localfloat4switch1512_g39591;
				float3 appendResult88_g39612 = (float3(break89_g39612.x , break89_g39612.y , break89_g39612.z));
				float4 temp_cast_30 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1400_g39591 = temp_cast_30;
				float4 temp_cast_31 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1400_g39591 = temp_cast_31;
				float4 temp_cast_32 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1400_g39591 = temp_cast_32;
				float4 localfloat4switch1400_g39591 = float4switch1400_g39591( m_switch1400_g39591 , m_Off1400_g39591 , m_Active1400_g39591 , m_ActiveInverted1400_g39591 );
				float4 temp_output_44_0_g39592 = localfloat4switch1400_g39591;
				float3 temp_output_40_0_g39592 = abs( WorldNormal );
				float WN_HORIZONTAL141_g39592 = ( ( temp_output_40_0_g39592 * temp_output_40_0_g39592 ).y + 0.07 );
				float4 lerpResult2_g39592 = lerp( temp_output_44_0_g39592 , _Vec , WN_HORIZONTAL141_g39592);
				float4 VECTOR_IN_MASKED112_g39592 = lerpResult2_g39592;
				float4 Vect_0019_g39592 = _Vec;
				float3 break349_g39592 = WorldNormal;
				float WN_NY173_g39592 = break349_g39592.y;
				float WN_NZ184_g39592 = break349_g39592.z;
				float WN_NX186_g39592 = break349_g39592.x;
				float temp_output_175_0_g39592 = ( -WN_NY173_g39592 + WN_NZ184_g39592 + -WN_NX186_g39592 );
				float4 lerpResult133_g39592 = lerp( VECTOR_IN_MASKED112_g39592 , Vect_0019_g39592 , ( temp_output_175_0_g39592 + -temp_output_175_0_g39592 + 0.07 ));
				float4 MASK_SIDE163_g39592 = lerpResult133_g39592;
				float4 temp_cast_33 = (_Verticalwear_BlendStrength).xxxx;
				float4 temp_cast_34 = (-2.0).xxxx;
				float4 smoothstepResult75_g39592 = smoothstep( temp_cast_27 , temp_cast_28 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_SIDE163_g39592 ) - temp_cast_33) * (temp_cast_34 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_33)));
				float MASK_VERTICAL602_g39591 = ( (( ( smoothstepResult75_g39592 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Verticalwear_BlendMix );
				float4 lerpResult1227_g39591 = lerp( localfloat4switch1269_g39591 , float4( FINAL_MASK_VERTICAL394_g39591 , 0.0 ) , MASK_VERTICAL602_g39591);
				float4 m_Active1377_g39591 = lerpResult1227_g39591;
				float4 m_ActiveInverted1377_g39591 = lerpResult1227_g39591;
				float4 localfloat4switch1377_g39591 = float4switch1377_g39591( m_switch1377_g39591 , m_Off1377_g39591 , m_Active1377_g39591 , m_ActiveInverted1377_g39591 );
				float4 m_Off1380_g39591 = localfloat4switch1377_g39591;
				float2 appendResult1393_g39591 = (float2(_Curvaturewear_TilingX , _Curvaturewear_TilingY));
				float2 appendResult1390_g39591 = (float2(_Curvaturewear_OffsetX , _Curvaturewear_OffsetY));
				float2 texCoord1389_g39591 = IN.ase_texcoord8.xy * appendResult1393_g39591 + appendResult1390_g39591;
				float4 tex2DNode1396_g39591 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMap, sampler_trilinear_repeat, texCoord1389_g39591 );
				float4 temp_output_12_0_g39598 = ( float4( (_Curvaturewear_Tint).rgb , 0.0 ) * tex2DNode1396_g39591 );
				float3 desaturateInitialColor10_g39598 = temp_output_12_0_g39598.xyz;
				float desaturateDot10_g39598 = dot( desaturateInitialColor10_g39598, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39598 = lerp( desaturateInitialColor10_g39598, desaturateDot10_g39598.xxx, ( 1.0 - ( _Curvaturewear_Saturation + 1.0 ) ) );
				float4 lerpResult1544_g39591 = lerp( ALBEDO_IN1447_g39591 , float4( desaturateVar10_g39598 , 0.0 ) , _Curvaturewear_BlendMix);
				float4 FINAL_MASK_CURVATURE586_g39591 = lerpResult1544_g39591;
				float4 temp_cast_39 = (0.5).xxxx;
				float4 temp_cast_40 = (0.75).xxxx;
				int _Curvaturewear_Mode398_g39591 = _Curvaturewear_Mode;
				int m_switch1491_g39591 = _Curvaturewear_Mode398_g39591;
				float4 break91_g39619 = _Curvaturewear_MaskingColor;
				float3 appendResult87_g39619 = (float3(break91_g39619.r , break91_g39619.g , break91_g39619.b));
				int m_switch1516_g39591 = _Curvaturewear_MaskingSource;
				float4 _Curvaturewear_GrungeMap1510_g39591 = tex2DNode1396_g39591;
				float4 m_MapGrunge1516_g39591 = _Curvaturewear_GrungeMap1510_g39591;
				float4 m_MapAlbedo1516_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1516_g39591 = float4switch1516_g39591( m_switch1516_g39591 , m_MapGrunge1516_g39591 , m_MapAlbedo1516_g39591 );
				float4 break89_g39619 = localfloat4switch1516_g39591;
				float3 appendResult88_g39619 = (float3(break89_g39619.x , break89_g39619.y , break89_g39619.z));
				float4 temp_cast_42 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1491_g39591 = temp_cast_42;
				float4 temp_cast_43 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1491_g39591 = temp_cast_43;
				float4 temp_cast_44 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1491_g39591 = temp_cast_44;
				float4 localfloat4switch1491_g39591 = float4switch1491_g39591( m_switch1491_g39591 , m_Off1491_g39591 , m_Active1491_g39591 , m_ActiveInverted1491_g39591 );
				float4 temp_output_44_0_g39600 = localfloat4switch1491_g39591;
				float3 temp_output_40_0_g39600 = abs( WorldNormal );
				float WN_HORIZONTAL141_g39600 = ( ( temp_output_40_0_g39600 * temp_output_40_0_g39600 ).y + 0.07 );
				float4 lerpResult2_g39600 = lerp( temp_output_44_0_g39600 , _Vec , WN_HORIZONTAL141_g39600);
				float4 VECTOR_IN_MASKED112_g39600 = lerpResult2_g39600;
				float4 Vect_0019_g39600 = _Vec;
				float2 _SmoothX = float2(0,0.45);
				float3 temp_cast_45 = (0.5).xxx;
				float3 break24_g39600 = ( temp_output_40_0_g39600 - temp_cast_45 );
				float WN_X134_g39600 = break24_g39600.x;
				float smoothstepResult8_g39600 = smoothstep( _SmoothX.x , _SmoothX.y , ( WN_X134_g39600 + 1.25 ));
				float smoothstepResult22_g39600 = smoothstep( _SmoothX.x , _SmoothX.y , ( -WN_X134_g39600 + 0.02 ));
				float lerpResult11_g39600 = lerp( 0.0 , smoothstepResult8_g39600 , smoothstepResult22_g39600);
				float4 lerpResult14_g39600 = lerp( VECTOR_IN_MASKED112_g39600 , Vect_0019_g39600 , lerpResult11_g39600);
				float4 MASK_VERTICAL_X159_g39600 = lerpResult14_g39600;
				float2 _SmoothY = float2(0,0.85);
				float WN_Y135_g39600 = break24_g39600.y;
				float smoothstepResult29_g39600 = smoothstep( _SmoothY.x , _SmoothY.y , ( -WN_Y135_g39600 + 0.35 ));
				float4 lerpResult6_g39600 = lerp( VECTOR_IN_MASKED112_g39600 , Vect_0019_g39600 , smoothstepResult29_g39600);
				float4 MASK_VERTICAL_Y157_g39600 = lerpResult6_g39600;
				float2 _SmoothZ = float2(1.8,1.4);
				float WN_Z136_g39600 = break24_g39600.z;
				float smoothstepResult26_g39600 = smoothstep( _SmoothZ.x , _SmoothZ.y , ( WN_Z136_g39600 + 2.06 ));
				float lerpResult34_g39600 = lerp( smoothstepResult26_g39600 , 0.0 , ( -WN_Z136_g39600 + 2.05 ));
				float4 lerpResult5_g39600 = lerp( Vect_0019_g39600 , VECTOR_IN_MASKED112_g39600 , lerpResult34_g39600);
				float4 MASK_VERTICAL_Z155_g39600 = lerpResult5_g39600;
				float4 temp_cast_46 = (_Curvaturewear_BlendStrength).xxxx;
				float4 temp_cast_47 = (_Curvaturewear_BlendHardness).xxxx;
				float4 smoothstepResult75_g39600 = smoothstep( temp_cast_39 , temp_cast_40 , (float4( 0,0,0,0 ) + (( 1.0 - ( MASK_VERTICAL_X159_g39600 + MASK_VERTICAL_Y157_g39600 + MASK_VERTICAL_Z155_g39600 ) ) - temp_cast_46) * (temp_cast_47 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_46)));
				float MASK_CURVATURE401_g39591 = (( ( smoothstepResult75_g39600 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x;
				float4 lerpResult860_g39591 = lerp( FINAL_MASK_CURVATURE586_g39591 , localfloat4switch1377_g39591 , MASK_CURVATURE401_g39591);
				float4 m_Active1380_g39591 = lerpResult860_g39591;
				float4 m_ActiveInverted1380_g39591 = lerpResult860_g39591;
				float4 localfloat4switch1380_g39591 = float4switch1380_g39591( m_switch1380_g39591 , m_Off1380_g39591 , m_Active1380_g39591 , m_ActiveInverted1380_g39591 );
				
				int m_switch1416_g39591 = _Curvaturewear_Mode;
				int m_switch1413_g39591 = _Verticalwear_Mode;
				int m_switch1329_g39591 = _Horizontalwear_Mode;
				float4 OUT_NORMAL1178_g38079 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_output_1_0_g39549 = OUT_NORMAL1178_g38079;
				float temp_output_8_0_g39549 = _NormalStrength;
				float3 unpack52_g39549 = UnpackNormalScale( temp_output_1_0_g39549, temp_output_8_0_g39549 );
				unpack52_g39549.z = lerp( 1, unpack52_g39549.z, saturate(temp_output_8_0_g39549) );
				float3 temp_output_1478_59_g38079 = unpack52_g39549;
				float3 NORMAL_OUT314_g38079 = temp_output_1478_59_g38079;
				float3 temp_output_16_0_g39547 = NORMAL_OUT314_g38079;
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
				float3 ADDITIONAL_LIGHT1342_g38079 = localAdditionalLightsFlatMask63_g39547;
				float3 temp_output_8_0_g39591 = ( temp_output_1478_59_g38079 + ADDITIONAL_LIGHT1342_g38079 );
				float3 m_Off1329_g39591 = temp_output_8_0_g39591;
				float4 temp_output_1_0_g39604 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeNormal, sampler_trilinear_repeat, texCoord1342_g39591 );
				float temp_output_8_0_g39604 = ( _Horizontalwear_NormalMultiplier * _Horizontalwear_BlendStrength );
				float3 unpack52_g39604 = UnpackNormalScale( temp_output_1_0_g39604, temp_output_8_0_g39604 );
				unpack52_g39604.z = lerp( 1, unpack52_g39604.z, saturate(temp_output_8_0_g39604) );
				float3 FINAL_MASKNORMAL_HORIZONTAL803_g39591 = unpack52_g39604;
				float3 lerpResult1335_g39591 = lerp( temp_output_8_0_g39591 , FINAL_MASKNORMAL_HORIZONTAL803_g39591 , MASK_HORIZONTAL808_g39591);
				float3 m_Active1329_g39591 = lerpResult1335_g39591;
				float3 m_ActiveInverted1329_g39591 = lerpResult1335_g39591;
				float3 localfloat3switch1329_g39591 = float3switch1329_g39591( m_switch1329_g39591 , m_Off1329_g39591 , m_Active1329_g39591 , m_ActiveInverted1329_g39591 );
				float3 m_Off1413_g39591 = localfloat3switch1329_g39591;
				float4 temp_output_1_0_g39602 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeNormal, sampler_trilinear_repeat, texCoord1388_g39591 );
				float temp_output_8_0_g39602 = ( _Verticalwear_NormalMultiplier * _Verticalwear_BlendStrength );
				float3 unpack52_g39602 = UnpackNormalScale( temp_output_1_0_g39602, temp_output_8_0_g39602 );
				unpack52_g39602.z = lerp( 1, unpack52_g39602.z, saturate(temp_output_8_0_g39602) );
				float3 FINAL_MASKNORMAL_VERTICAL630_g39591 = unpack52_g39602;
				float3 lerpResult1414_g39591 = lerp( localfloat3switch1329_g39591 , FINAL_MASKNORMAL_VERTICAL630_g39591 , MASK_VERTICAL602_g39591);
				float3 m_Active1413_g39591 = lerpResult1414_g39591;
				float3 m_ActiveInverted1413_g39591 = lerpResult1414_g39591;
				float3 localfloat3switch1413_g39591 = float3switch1413_g39591( m_switch1413_g39591 , m_Off1413_g39591 , m_Active1413_g39591 , m_ActiveInverted1413_g39591 );
				float3 m_Off1416_g39591 = localfloat3switch1413_g39591;
				float3 NORMAL_IN1546_g39591 = temp_output_8_0_g39591;
				float4 temp_output_1_0_g39596 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeNormal, sampler_trilinear_repeat, texCoord1389_g39591 );
				float temp_output_8_0_g39596 = ( _Curvaturewear_NormalMultiplier * _Curvaturewear_BlendStrength );
				float3 unpack52_g39596 = UnpackNormalScale( temp_output_1_0_g39596, temp_output_8_0_g39596 );
				unpack52_g39596.z = lerp( 1, unpack52_g39596.z, saturate(temp_output_8_0_g39596) );
				float3 lerpResult1537_g39591 = lerp( NORMAL_IN1546_g39591 , unpack52_g39596 , _Curvaturewear_BlendMix);
				float3 FINAL_MASKNORMAL_CURVATURE599_g39591 = lerpResult1537_g39591;
				float3 lerpResult1417_g39591 = lerp( FINAL_MASKNORMAL_CURVATURE599_g39591 , localfloat3switch1413_g39591 , MASK_CURVATURE401_g39591);
				float3 m_Active1416_g39591 = lerpResult1417_g39591;
				float3 m_ActiveInverted1416_g39591 = lerpResult1417_g39591;
				float3 localfloat3switch1416_g39591 = float3switch1416_g39591( m_switch1416_g39591 , m_Off1416_g39591 , m_Active1416_g39591 , m_ActiveInverted1416_g39591 );
				
				int m_switch1436_g39591 = _Curvaturewear_Mode;
				int m_switch1435_g39591 = _Verticalwear_Mode;
				int m_switch1434_g39591 = _Horizontalwear_Mode;
				float4 _MASK_B1440_g38079 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_output_977_0_g39591 = ( _MetallicStrength * _MASK_B1440_g38079 );
				float m_Off1434_g39591 = temp_output_977_0_g39591.x;
				float FINAL_MASKMETALLIC_HORIZONTAL1026_g39591 = _Horizontalwear_Metallic;
				float4 temp_cast_55 = (FINAL_MASKMETALLIC_HORIZONTAL1026_g39591).xxxx;
				float4 lerpResult1439_g39591 = lerp( temp_output_977_0_g39591 , temp_cast_55 , MASK_HORIZONTAL808_g39591);
				float m_Active1434_g39591 = lerpResult1439_g39591.x;
				float m_ActiveInverted1434_g39591 = lerpResult1439_g39591.x;
				float localfloatswitch1434_g39591 = floatswitch1434_g39591( m_switch1434_g39591 , m_Off1434_g39591 , m_Active1434_g39591 , m_ActiveInverted1434_g39591 );
				float m_Off1435_g39591 = localfloatswitch1434_g39591;
				float FINAL_MASKMETALLIC_VERTICAL1024_g39591 = _Verticalwear_Metallic;
				float lerpResult1438_g39591 = lerp( localfloatswitch1434_g39591 , FINAL_MASKMETALLIC_VERTICAL1024_g39591 , MASK_VERTICAL602_g39591);
				float m_Active1435_g39591 = lerpResult1438_g39591;
				float m_ActiveInverted1435_g39591 = lerpResult1438_g39591;
				float localfloatswitch1435_g39591 = floatswitch1435_g39591( m_switch1435_g39591 , m_Off1435_g39591 , m_Active1435_g39591 , m_ActiveInverted1435_g39591 );
				float m_Off1436_g39591 = localfloatswitch1435_g39591;
				float4 METALLIC_IN1555_g39591 = temp_output_977_0_g39591;
				float4 temp_cast_58 = (_Curvaturewear_Metallic).xxxx;
				float4 lerpResult1553_g39591 = lerp( METALLIC_IN1555_g39591 , temp_cast_58 , _Curvaturewear_BlendMix);
				float4 FINAL_MASKMETALLIC_CURVATURE1022_g39591 = lerpResult1553_g39591;
				float4 temp_cast_59 = (localfloatswitch1435_g39591).xxxx;
				float4 lerpResult1437_g39591 = lerp( FINAL_MASKMETALLIC_CURVATURE1022_g39591 , temp_cast_59 , MASK_CURVATURE401_g39591);
				float m_Active1436_g39591 = lerpResult1437_g39591.x;
				float m_ActiveInverted1436_g39591 = lerpResult1437_g39591.x;
				float localfloatswitch1436_g39591 = floatswitch1436_g39591( m_switch1436_g39591 , m_Off1436_g39591 , m_Active1436_g39591 , m_ActiveInverted1436_g39591 );
				
				int m_switch1433_g39591 = _Curvaturewear_Mode;
				int m_switch1432_g39591 = _Verticalwear_Mode;
				int m_switch1075_g39591 = _Horizontalwear_Mode;
				int m_switch99_g39551 = _SmoothnessModeSurface;
				int m_switch170_g39551 = _SmoothnessType;
				float4 temp_cast_62 = (_SmoothnessStrength).xxxx;
				float4 m_Smoothness170_g39551 = temp_cast_62;
				float4 temp_cast_63 = (( 1.0 - _SmoothnessStrength )).xxxx;
				float4 m_Roughness170_g39551 = temp_cast_63;
				float4 localfloat4switch170_g39551 = float4switch170_g39551( m_switch170_g39551 , m_Smoothness170_g39551 , m_Roughness170_g39551 );
				float4 FINAL_STANDARD111_g39551 = localfloat4switch170_g39551;
				float4 m_Standard99_g39551 = FINAL_STANDARD111_g39551;
				float3 NORMAL_WORLD_OUT164_g38079 = temp_output_1478_59_g38079;
				float3 temp_output_4_0_g39551 = NORMAL_WORLD_OUT164_g38079;
				float3 temp_output_23_0_g39551 = ddx( temp_output_4_0_g39551 );
				float dotResult25_g39551 = dot( temp_output_23_0_g39551 , temp_output_23_0_g39551 );
				float3 temp_output_7_0_g39551 = ddy( temp_output_4_0_g39551 );
				float dotResult27_g39551 = dot( temp_output_7_0_g39551 , temp_output_7_0_g39551 );
				float temp_output_28_0_g39551 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult25_g39551 + dotResult27_g39551 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
				float4 break377_g38079 = OUT_ALBEDO_RGBA1177_g38079;
				float ALBEDO_R169_g38079 = break377_g38079.r;
				float4 temp_cast_64 = (ALBEDO_R169_g38079).xxxx;
				float4 FINAL_GEOMETRIC114_g39551 = ( temp_output_28_0_g39551 * ( 1.0 - temp_cast_64 ) );
				float4 m_Geometric99_g39551 = FINAL_GEOMETRIC114_g39551;
				int SMOOTHNESS_TYPE173_g39551 = _SmoothnessType;
				int m_switch167_g39551 = SMOOTHNESS_TYPE173_g39551;
				float4 _MASK_G1438_g38079 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_output_83_0_g39551 = _MASK_G1438_g38079;
				float4 m_Smoothness167_g39551 = temp_output_83_0_g39551;
				float4 m_Roughness167_g39551 = ( 1.0 - temp_output_83_0_g39551 );
				float4 localfloat4switch167_g39551 = float4switch167_g39551( m_switch167_g39551 , m_Smoothness167_g39551 , m_Roughness167_g39551 );
				float4 FINAL_SMOOTHNESS_TEXTURE117_g39551 = ( temp_output_28_0_g39551 * localfloat4switch167_g39551 );
				float4 m_Texture99_g39551 = FINAL_SMOOTHNESS_TEXTURE117_g39551;
				float4 localfloat4switch99_g39551 = float4switch99_g39551( m_switch99_g39551 , m_Standard99_g39551 , m_Geometric99_g39551 , m_Texture99_g39551 );
				float4 temp_output_1267_33_g38079 = localfloat4switch99_g39551;
				float4 color301_g38079 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 _MASK_R1439_g38079 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_cast_66 = (IN.ase_color.a).xxxx;
				float4 lerpResult11_g38079 = lerp( _MASK_R1439_g38079 , temp_cast_66 , (float)_OcclusionSourceMode);
				float4 lerpResult14_g38079 = lerp( color301_g38079 , lerpResult11_g38079 , _OcclusionStrengthAO);
				float4 temp_output_989_0_g39591 = ( temp_output_1267_33_g38079 * lerpResult14_g38079 );
				float m_Off1075_g39591 = temp_output_989_0_g39591.x;
				float FINAL_MASKSMOOTHNESS_HORIZONTAL1025_g39591 = _Horizontalwear_Smoothness;
				float4 temp_cast_70 = (FINAL_MASKSMOOTHNESS_HORIZONTAL1025_g39591).xxxx;
				float4 lerpResult1030_g39591 = lerp( temp_output_989_0_g39591 , temp_cast_70 , MASK_HORIZONTAL808_g39591);
				float m_Active1075_g39591 = lerpResult1030_g39591.x;
				float m_ActiveInverted1075_g39591 = lerpResult1030_g39591.x;
				float localfloatswitch1075_g39591 = floatswitch1075_g39591( m_switch1075_g39591 , m_Off1075_g39591 , m_Active1075_g39591 , m_ActiveInverted1075_g39591 );
				float m_Off1432_g39591 = localfloatswitch1075_g39591;
				float FINAL_MASKSMOOTHNESS_VERTICAL1023_g39591 = _Verticalwear_Smoothness;
				float lerpResult1028_g39591 = lerp( localfloatswitch1075_g39591 , FINAL_MASKSMOOTHNESS_VERTICAL1023_g39591 , MASK_VERTICAL602_g39591);
				float m_Active1432_g39591 = lerpResult1028_g39591;
				float m_ActiveInverted1432_g39591 = lerpResult1028_g39591;
				float localfloatswitch1432_g39591 = floatswitch1432_g39591( m_switch1432_g39591 , m_Off1432_g39591 , m_Active1432_g39591 , m_ActiveInverted1432_g39591 );
				float m_Off1433_g39591 = localfloatswitch1432_g39591;
				float4 SMOOTHNESS_IN1554_g39591 = temp_output_989_0_g39591;
				float4 temp_cast_73 = (_Curvaturewear_Smoothness).xxxx;
				float4 lerpResult1552_g39591 = lerp( SMOOTHNESS_IN1554_g39591 , temp_cast_73 , _Curvaturewear_BlendMix);
				float4 FINAL_MASKSMOOTHNESS_CURVATURE1021_g39591 = lerpResult1552_g39591;
				float4 temp_cast_74 = (localfloatswitch1432_g39591).xxxx;
				float4 lerpResult1031_g39591 = lerp( FINAL_MASKSMOOTHNESS_CURVATURE1021_g39591 , temp_cast_74 , MASK_CURVATURE401_g39591);
				float m_Active1433_g39591 = lerpResult1031_g39591.x;
				float m_ActiveInverted1433_g39591 = lerpResult1031_g39591.x;
				float localfloatswitch1433_g39591 = floatswitch1433_g39591( m_switch1433_g39591 , m_Off1433_g39591 , m_Active1433_g39591 , m_ActiveInverted1433_g39591 );
				
				float3 Albedo = localfloat4switch1380_g39591.xyz;
				float3 Normal = localfloat3switch1416_g39591;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = localfloatswitch1436_g39591;
				float Smoothness = localfloatswitch1433_g39591;
				float Occlusion = saturate( lerpResult14_g38079 ).r;
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

			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
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
			float4 _Gradient_TopSide;
			float4 _Verticalwear_MaskingColor;
			float4 _Curvaturewear_Tint;
			float4 _Horizontalwear_Tint;
			float4 _Horizontalwear_MaskingColor;
			float4 _Color;
			float4 _Gradient_TintCurvature;
			float4 _Gradient_BottomSide;
			float4 _Gradient_Bottom;
			float4 _Gradient_Top;
			float4 _Verticalwear_Tint;
			float4 _Curvaturewear_MaskingColor;
			half _Curvaturewear_MaskingColorFuzziness;
			half _Curvaturewear_MaskingColorRange;
			int _Curvaturewear_MaskingSource;
			int _ColorMask;
			half _Curvaturewear_Saturation;
			float _Curvaturewear_BlendStrength;
			float _Curvaturewear_OffsetY;
			float _Curvaturewear_OffsetX;
			float _Curvaturewear_TilingY;
			float _Curvaturewear_TilingX;
			float _Curvaturewear_BlendMix;
			float _Curvaturewear_BlendHardness;
			float _Verticalwear_NormalMultiplier;
			float _Horizontalwear_NormalMultiplier;
			float _Horizontalwear_Smoothness;
			float _OcclusionStrengthAO;
			int _OcclusionSourceMode;
			float _SmoothnessThreshold;
			float _SmoothnessVariance;
			float _SmoothnessStrength;
			half _NormalStrength;
			int _SmoothnessType;
			float _Curvaturewear_Metallic;
			float _Verticalwear_Metallic;
			float _Horizontalwear_Metallic;
			float _MetallicStrength;
			float _Curvaturewear_NormalMultiplier;
			float _Verticalwear_BlendMix;
			int _SmoothnessModeSurface;
			float _Verticalwear_BlendStrength;
			float _Verticalwear_OffsetY;
			half _Verticalwear_MaskingColorRange;
			int _CullMode;
			int _ZWriteMode;
			int _Curvaturewear_Mode;
			int _Verticalwear_Mode;
			int _Horizontalwear_Mode;
			int _Gradient_Mode;
			float _Gradient_Height;
			float _Gradient_Ramp;
			float _Gradient_Contrast;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			half _Verticalwear_MaskingColorFuzziness;
			float _Horizontalwear_TilingX;
			float _Horizontalwear_OffsetX;
			float _Horizontalwear_OffsetY;
			half _Horizontalwear_Saturation;
			int _Horizontalwear_MaskingSource;
			half _Horizontalwear_MaskingColorRange;
			half _Horizontalwear_MaskingColorFuzziness;
			float _Horizontalwear_BlendStrength;
			float _Horizontalwear_BlendMix;
			float _Verticalwear_TilingX;
			float _Verticalwear_TilingY;
			float _Verticalwear_OffsetX;
			float _Verticalwear_Smoothness;
			half _Verticalwear_Saturation;
			int _Verticalwear_MaskingSource;
			float _Horizontalwear_TilingY;
			float _Curvaturewear_Smoothness;
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

			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
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
			float4 _Gradient_TopSide;
			float4 _Verticalwear_MaskingColor;
			float4 _Curvaturewear_Tint;
			float4 _Horizontalwear_Tint;
			float4 _Horizontalwear_MaskingColor;
			float4 _Color;
			float4 _Gradient_TintCurvature;
			float4 _Gradient_BottomSide;
			float4 _Gradient_Bottom;
			float4 _Gradient_Top;
			float4 _Verticalwear_Tint;
			float4 _Curvaturewear_MaskingColor;
			half _Curvaturewear_MaskingColorFuzziness;
			half _Curvaturewear_MaskingColorRange;
			int _Curvaturewear_MaskingSource;
			int _ColorMask;
			half _Curvaturewear_Saturation;
			float _Curvaturewear_BlendStrength;
			float _Curvaturewear_OffsetY;
			float _Curvaturewear_OffsetX;
			float _Curvaturewear_TilingY;
			float _Curvaturewear_TilingX;
			float _Curvaturewear_BlendMix;
			float _Curvaturewear_BlendHardness;
			float _Verticalwear_NormalMultiplier;
			float _Horizontalwear_NormalMultiplier;
			float _Horizontalwear_Smoothness;
			float _OcclusionStrengthAO;
			int _OcclusionSourceMode;
			float _SmoothnessThreshold;
			float _SmoothnessVariance;
			float _SmoothnessStrength;
			half _NormalStrength;
			int _SmoothnessType;
			float _Curvaturewear_Metallic;
			float _Verticalwear_Metallic;
			float _Horizontalwear_Metallic;
			float _MetallicStrength;
			float _Curvaturewear_NormalMultiplier;
			float _Verticalwear_BlendMix;
			int _SmoothnessModeSurface;
			float _Verticalwear_BlendStrength;
			float _Verticalwear_OffsetY;
			half _Verticalwear_MaskingColorRange;
			int _CullMode;
			int _ZWriteMode;
			int _Curvaturewear_Mode;
			int _Verticalwear_Mode;
			int _Horizontalwear_Mode;
			int _Gradient_Mode;
			float _Gradient_Height;
			float _Gradient_Ramp;
			float _Gradient_Contrast;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			half _Verticalwear_MaskingColorFuzziness;
			float _Horizontalwear_TilingX;
			float _Horizontalwear_OffsetX;
			float _Horizontalwear_OffsetY;
			half _Horizontalwear_Saturation;
			int _Horizontalwear_MaskingSource;
			half _Horizontalwear_MaskingColorRange;
			half _Horizontalwear_MaskingColorFuzziness;
			float _Horizontalwear_BlendStrength;
			float _Horizontalwear_BlendMix;
			float _Verticalwear_TilingX;
			float _Verticalwear_TilingY;
			float _Verticalwear_OffsetX;
			float _Verticalwear_Smoothness;
			half _Verticalwear_Saturation;
			int _Verticalwear_MaskingSource;
			float _Horizontalwear_TilingY;
			float _Curvaturewear_Smoothness;
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

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Gradient_TopSide;
			float4 _Verticalwear_MaskingColor;
			float4 _Curvaturewear_Tint;
			float4 _Horizontalwear_Tint;
			float4 _Horizontalwear_MaskingColor;
			float4 _Color;
			float4 _Gradient_TintCurvature;
			float4 _Gradient_BottomSide;
			float4 _Gradient_Bottom;
			float4 _Gradient_Top;
			float4 _Verticalwear_Tint;
			float4 _Curvaturewear_MaskingColor;
			half _Curvaturewear_MaskingColorFuzziness;
			half _Curvaturewear_MaskingColorRange;
			int _Curvaturewear_MaskingSource;
			int _ColorMask;
			half _Curvaturewear_Saturation;
			float _Curvaturewear_BlendStrength;
			float _Curvaturewear_OffsetY;
			float _Curvaturewear_OffsetX;
			float _Curvaturewear_TilingY;
			float _Curvaturewear_TilingX;
			float _Curvaturewear_BlendMix;
			float _Curvaturewear_BlendHardness;
			float _Verticalwear_NormalMultiplier;
			float _Horizontalwear_NormalMultiplier;
			float _Horizontalwear_Smoothness;
			float _OcclusionStrengthAO;
			int _OcclusionSourceMode;
			float _SmoothnessThreshold;
			float _SmoothnessVariance;
			float _SmoothnessStrength;
			half _NormalStrength;
			int _SmoothnessType;
			float _Curvaturewear_Metallic;
			float _Verticalwear_Metallic;
			float _Horizontalwear_Metallic;
			float _MetallicStrength;
			float _Curvaturewear_NormalMultiplier;
			float _Verticalwear_BlendMix;
			int _SmoothnessModeSurface;
			float _Verticalwear_BlendStrength;
			float _Verticalwear_OffsetY;
			half _Verticalwear_MaskingColorRange;
			int _CullMode;
			int _ZWriteMode;
			int _Curvaturewear_Mode;
			int _Verticalwear_Mode;
			int _Horizontalwear_Mode;
			int _Gradient_Mode;
			float _Gradient_Height;
			float _Gradient_Ramp;
			float _Gradient_Contrast;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			half _Verticalwear_MaskingColorFuzziness;
			float _Horizontalwear_TilingX;
			float _Horizontalwear_OffsetX;
			float _Horizontalwear_OffsetY;
			half _Horizontalwear_Saturation;
			int _Horizontalwear_MaskingSource;
			half _Horizontalwear_MaskingColorRange;
			half _Horizontalwear_MaskingColorFuzziness;
			float _Horizontalwear_BlendStrength;
			float _Horizontalwear_BlendMix;
			float _Verticalwear_TilingX;
			float _Verticalwear_TilingY;
			float _Verticalwear_OffsetX;
			float _Verticalwear_Smoothness;
			half _Verticalwear_Saturation;
			int _Verticalwear_MaskingSource;
			float _Horizontalwear_TilingY;
			float _Curvaturewear_Smoothness;
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
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_Horizontalwear_GrungeMap);
			TEXTURE2D(_Verticalwear_GrungeMap);
			TEXTURE2D(_Curvaturewear_GrungeMap);


			float4 float4switch143_g39556( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1506_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1476_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1269_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1512_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1400_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1377_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1516_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1491_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1380_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				
				o.ase_texcoord3 = v.vertex;
				o.ase_texcoord4.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord4.zw = 0;
				
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

				int m_switch1380_g39591 = _Curvaturewear_Mode;
				int m_switch1377_g39591 = _Verticalwear_Mode;
				int m_switch1269_g39591 = _Horizontalwear_Mode;
				int _Gradient_Mode161_g39556 = _Gradient_Mode;
				int m_switch143_g39556 = _Gradient_Mode161_g39556;
				float4 TINT147_g39556 = _Color;
				float4 m_Off143_g39556 = TINT147_g39556;
				float4 _Vector0 = float4(0.001,0.001,0.001,0.001);
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 temp_output_275_0_g39556 = abs( ase_worldNormal );
				float WN_HORIZONTAL284_g39556 = ( ( temp_output_275_0_g39556 * temp_output_275_0_g39556 ).y + 0.07 );
				float4 lerpResult341_g39556 = lerp( _Gradient_TintCurvature , _Vector0 , WN_HORIZONTAL284_g39556);
				float4 VECTOR_IN_MASKED343_g39556 = lerpResult341_g39556;
				float4 Vect_001349_g39556 = _Vector0;
				float2 _Vector3 = float2(0,0.45);
				float3 temp_cast_2 = (0.5).xxx;
				float3 break277_g39556 = ( temp_output_275_0_g39556 - temp_cast_2 );
				float WN_X280_g39556 = break277_g39556.x;
				float smoothstepResult303_g39556 = smoothstep( _Vector3.x , _Vector3.y , ( WN_X280_g39556 + 1.25 ));
				float smoothstepResult299_g39556 = smoothstep( _Vector3.x , _Vector3.y , ( -WN_X280_g39556 + 0.02 ));
				float lerpResult306_g39556 = lerp( 0.0 , smoothstepResult303_g39556 , smoothstepResult299_g39556);
				float4 lerpResult301_g39556 = lerp( VECTOR_IN_MASKED343_g39556 , Vect_001349_g39556 , lerpResult306_g39556);
				float4 MASK_VERTICAL_X307_g39556 = lerpResult301_g39556;
				float2 _Vector1 = float2(0,0.85);
				float WN_Y281_g39556 = break277_g39556.y;
				float smoothstepResult334_g39556 = smoothstep( _Vector1.x , _Vector1.y , ( -WN_Y281_g39556 + 0.35 ));
				float4 lerpResult333_g39556 = lerp( VECTOR_IN_MASKED343_g39556 , Vect_001349_g39556 , smoothstepResult334_g39556);
				float4 MASK_VERTICAL_Y320_g39556 = lerpResult333_g39556;
				float2 _HelloRicardo = float2(1.8,1.4);
				float WN_Z282_g39556 = break277_g39556.z;
				float smoothstepResult331_g39556 = smoothstep( _HelloRicardo.x , _HelloRicardo.y , ( WN_Z282_g39556 + 2.06 ));
				float lerpResult327_g39556 = lerp( smoothstepResult331_g39556 , 0.0 , ( -WN_Z282_g39556 + 2.05 ));
				float4 lerpResult314_g39556 = lerp( Vect_001349_g39556 , VECTOR_IN_MASKED343_g39556 , lerpResult327_g39556);
				float4 MASK_VERTICAL_Z315_g39556 = lerpResult314_g39556;
				float4 Curvature353_g39556 = saturate( ( MASK_VERTICAL_X307_g39556 + MASK_VERTICAL_Y320_g39556 + MASK_VERTICAL_Z315_g39556 ) );
				float4 lerpResult117_g39556 = lerp( _Gradient_BottomSide , _Gradient_Bottom , WN_HORIZONTAL284_g39556);
				float4 lerpResult111_g39556 = lerp( _Gradient_TopSide , _Gradient_Top , WN_HORIZONTAL284_g39556);
				float clampResult106_g39556 = clamp( ( IN.ase_texcoord3.xyz.y / _Gradient_Height ) , 0.0 , 1.0 );
				float4 lerpResult113_g39556 = lerp( lerpResult117_g39556 , lerpResult111_g39556 , clampResult106_g39556);
				float3 temp_output_145_0_g39556 = (( Curvature353_g39556 + lerpResult113_g39556 )).xyz;
				float _Gradient_Ramp154_g39556 = _Gradient_Ramp;
				float _Gradient_Contrast157_g39556 = _Gradient_Contrast;
				float2 appendResult150_g38079 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38079 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = IN.ase_texcoord4.xy * appendResult150_g38079 + appendResult151_g38079;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38079 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38079;
				float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
				float4 OUT_ALBEDO_RGBA1177_g38079 = tex2DNode63_g39580;
				float4 ALBEDO151_g39556 = OUT_ALBEDO_RGBA1177_g38079;
				float smoothstepResult142_g39556 = smoothstep( ( _Gradient_Ramp154_g39556 - ( _Gradient_Ramp154_g39556 * ( 1.0 - _Gradient_Contrast157_g39556 ) ) ) , ALBEDO151_g39556.x , _Gradient_Ramp154_g39556);
				float4 lerpResult139_g39556 = lerp( TINT147_g39556 , float4( temp_output_145_0_g39556 , 0.0 ) , smoothstepResult142_g39556);
				float4 m_Active143_g39556 = lerpResult139_g39556;
				float4 lerpResult141_g39556 = lerp( float4( temp_output_145_0_g39556 , 0.0 ) , TINT147_g39556 , smoothstepResult142_g39556);
				float4 m_ActiveInverted143_g39556 = lerpResult141_g39556;
				float4 localfloat4switch143_g39556 = float4switch143_g39556( m_switch143_g39556 , m_Off143_g39556 , m_Active143_g39556 , m_ActiveInverted143_g39556 );
				float4 temp_output_7_0_g38079 = ( localfloat4switch143_g39556 * float4( (OUT_ALBEDO_RGBA1177_g38079).rgb , 0.0 ) * _Brightness );
				float4 temp_output_6_0_g39591 = ( temp_output_7_0_g38079 + float4(0,0,0,0) );
				float4 m_Off1269_g39591 = temp_output_6_0_g39591;
				float2 appendResult1344_g39591 = (float2(_Horizontalwear_TilingX , _Horizontalwear_TilingY));
				float2 appendResult1343_g39591 = (float2(_Horizontalwear_OffsetX , _Horizontalwear_OffsetY));
				float2 texCoord1342_g39591 = IN.ase_texcoord4.xy * appendResult1344_g39591 + appendResult1343_g39591;
				float4 tex2DNode1327_g39591 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMap, sampler_trilinear_repeat, texCoord1342_g39591 );
				float4 temp_output_12_0_g39594 = ( float4( (_Horizontalwear_Tint).rgb , 0.0 ) * tex2DNode1327_g39591 );
				float3 desaturateInitialColor10_g39594 = temp_output_12_0_g39594.xyz;
				float desaturateDot10_g39594 = dot( desaturateInitialColor10_g39594, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39594 = lerp( desaturateInitialColor10_g39594, desaturateDot10_g39594.xxx, ( 1.0 - ( _Horizontalwear_Saturation + 1.0 ) ) );
				float3 FINAL_MASK_HORIZONTAL804_g39591 = desaturateVar10_g39594;
				float4 temp_cast_15 = (0.5).xxxx;
				float4 temp_cast_16 = (0.75).xxxx;
				int _Horizontalwear_Mode1003_g39591 = _Horizontalwear_Mode;
				int m_switch1476_g39591 = _Horizontalwear_Mode1003_g39591;
				float4 break91_g39617 = _Horizontalwear_MaskingColor;
				float3 appendResult87_g39617 = (float3(break91_g39617.r , break91_g39617.g , break91_g39617.b));
				int m_switch1506_g39591 = _Horizontalwear_MaskingSource;
				float4 _Horizontalwear_GrungeMap1508_g39591 = tex2DNode1327_g39591;
				float4 m_MapGrunge1506_g39591 = _Horizontalwear_GrungeMap1508_g39591;
				float4 ALBEDO_IN1447_g39591 = temp_output_6_0_g39591;
				float4 m_MapAlbedo1506_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1506_g39591 = float4switch1506_g39591( m_switch1506_g39591 , m_MapGrunge1506_g39591 , m_MapAlbedo1506_g39591 );
				float4 break89_g39617 = localfloat4switch1506_g39591;
				float3 appendResult88_g39617 = (float3(break89_g39617.x , break89_g39617.y , break89_g39617.z));
				float4 temp_cast_18 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1476_g39591 = temp_cast_18;
				float4 temp_cast_19 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1476_g39591 = temp_cast_19;
				float4 temp_cast_20 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1476_g39591 = temp_cast_20;
				float4 localfloat4switch1476_g39591 = float4switch1476_g39591( m_switch1476_g39591 , m_Off1476_g39591 , m_Active1476_g39591 , m_ActiveInverted1476_g39591 );
				float4 temp_output_44_0_g39621 = localfloat4switch1476_g39591;
				float4 VECTOR_IN212_g39621 = temp_output_44_0_g39621;
				float4 _Vec = float4(0.001,0.001,0.001,0.001);
				float4 Vect_0019_g39621 = _Vec;
				float2 _SmoothHorizontal = float2(0,0.5);
				float3 temp_output_40_0_g39621 = abs( ase_worldNormal );
				float WN_HORIZONTAL141_g39621 = ( ( temp_output_40_0_g39621 * temp_output_40_0_g39621 ).y + 0.07 );
				float smoothstepResult205_g39621 = smoothstep( _SmoothHorizontal.x , _SmoothHorizontal.y , ( ( 1.0 - WN_HORIZONTAL141_g39621 ) + -0.1 ));
				float4 lerpResult200_g39621 = lerp( VECTOR_IN212_g39621 , Vect_0019_g39621 , smoothstepResult205_g39621);
				float4 MASK_HORIZONTAL204_g39621 = lerpResult200_g39621;
				float4 temp_cast_21 = (_Horizontalwear_BlendStrength).xxxx;
				float4 temp_cast_22 = (-1.0).xxxx;
				float4 smoothstepResult75_g39621 = smoothstep( temp_cast_15 , temp_cast_16 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_HORIZONTAL204_g39621 ) - temp_cast_21) * (temp_cast_22 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_21)));
				float4 _MinOldVect4 = float4(0,0,0,0);
				float MASK_HORIZONTAL808_g39591 = ( (( ( smoothstepResult75_g39621 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Horizontalwear_BlendMix );
				float4 lerpResult861_g39591 = lerp( temp_output_6_0_g39591 , float4( FINAL_MASK_HORIZONTAL804_g39591 , 0.0 ) , MASK_HORIZONTAL808_g39591);
				float4 m_Active1269_g39591 = lerpResult861_g39591;
				float4 m_ActiveInverted1269_g39591 = lerpResult861_g39591;
				float4 localfloat4switch1269_g39591 = float4switch1269_g39591( m_switch1269_g39591 , m_Off1269_g39591 , m_Active1269_g39591 , m_ActiveInverted1269_g39591 );
				float4 m_Off1377_g39591 = localfloat4switch1269_g39591;
				float2 appendResult1384_g39591 = (float2(_Verticalwear_TilingX , _Verticalwear_TilingY));
				float2 appendResult1386_g39591 = (float2(_Verticalwear_OffsetX , _Verticalwear_OffsetY));
				float2 texCoord1388_g39591 = IN.ase_texcoord4.xy * appendResult1384_g39591 + appendResult1386_g39591;
				float4 tex2DNode1397_g39591 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeMap, sampler_trilinear_repeat, texCoord1388_g39591 );
				float4 temp_output_12_0_g39606 = ( float4( (_Verticalwear_Tint).rgb , 0.0 ) * tex2DNode1397_g39591 );
				float3 desaturateInitialColor10_g39606 = temp_output_12_0_g39606.xyz;
				float desaturateDot10_g39606 = dot( desaturateInitialColor10_g39606, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39606 = lerp( desaturateInitialColor10_g39606, desaturateDot10_g39606.xxx, ( 1.0 - ( _Verticalwear_Saturation + 1.0 ) ) );
				float3 FINAL_MASK_VERTICAL394_g39591 = desaturateVar10_g39606;
				float4 temp_cast_27 = (0.5).xxxx;
				float4 temp_cast_28 = (0.75).xxxx;
				int _Verticalwear_Mode1004_g39591 = _Verticalwear_Mode;
				int m_switch1400_g39591 = _Verticalwear_Mode1004_g39591;
				float4 break91_g39612 = _Verticalwear_MaskingColor;
				float3 appendResult87_g39612 = (float3(break91_g39612.r , break91_g39612.g , break91_g39612.b));
				int m_switch1512_g39591 = _Verticalwear_MaskingSource;
				float4 _Verticalwear_GrungeMap1509_g39591 = tex2DNode1397_g39591;
				float4 m_MapGrunge1512_g39591 = _Verticalwear_GrungeMap1509_g39591;
				float4 m_MapAlbedo1512_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1512_g39591 = float4switch1512_g39591( m_switch1512_g39591 , m_MapGrunge1512_g39591 , m_MapAlbedo1512_g39591 );
				float4 break89_g39612 = localfloat4switch1512_g39591;
				float3 appendResult88_g39612 = (float3(break89_g39612.x , break89_g39612.y , break89_g39612.z));
				float4 temp_cast_30 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1400_g39591 = temp_cast_30;
				float4 temp_cast_31 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1400_g39591 = temp_cast_31;
				float4 temp_cast_32 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1400_g39591 = temp_cast_32;
				float4 localfloat4switch1400_g39591 = float4switch1400_g39591( m_switch1400_g39591 , m_Off1400_g39591 , m_Active1400_g39591 , m_ActiveInverted1400_g39591 );
				float4 temp_output_44_0_g39592 = localfloat4switch1400_g39591;
				float3 temp_output_40_0_g39592 = abs( ase_worldNormal );
				float WN_HORIZONTAL141_g39592 = ( ( temp_output_40_0_g39592 * temp_output_40_0_g39592 ).y + 0.07 );
				float4 lerpResult2_g39592 = lerp( temp_output_44_0_g39592 , _Vec , WN_HORIZONTAL141_g39592);
				float4 VECTOR_IN_MASKED112_g39592 = lerpResult2_g39592;
				float4 Vect_0019_g39592 = _Vec;
				float3 break349_g39592 = ase_worldNormal;
				float WN_NY173_g39592 = break349_g39592.y;
				float WN_NZ184_g39592 = break349_g39592.z;
				float WN_NX186_g39592 = break349_g39592.x;
				float temp_output_175_0_g39592 = ( -WN_NY173_g39592 + WN_NZ184_g39592 + -WN_NX186_g39592 );
				float4 lerpResult133_g39592 = lerp( VECTOR_IN_MASKED112_g39592 , Vect_0019_g39592 , ( temp_output_175_0_g39592 + -temp_output_175_0_g39592 + 0.07 ));
				float4 MASK_SIDE163_g39592 = lerpResult133_g39592;
				float4 temp_cast_33 = (_Verticalwear_BlendStrength).xxxx;
				float4 temp_cast_34 = (-2.0).xxxx;
				float4 smoothstepResult75_g39592 = smoothstep( temp_cast_27 , temp_cast_28 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_SIDE163_g39592 ) - temp_cast_33) * (temp_cast_34 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_33)));
				float MASK_VERTICAL602_g39591 = ( (( ( smoothstepResult75_g39592 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Verticalwear_BlendMix );
				float4 lerpResult1227_g39591 = lerp( localfloat4switch1269_g39591 , float4( FINAL_MASK_VERTICAL394_g39591 , 0.0 ) , MASK_VERTICAL602_g39591);
				float4 m_Active1377_g39591 = lerpResult1227_g39591;
				float4 m_ActiveInverted1377_g39591 = lerpResult1227_g39591;
				float4 localfloat4switch1377_g39591 = float4switch1377_g39591( m_switch1377_g39591 , m_Off1377_g39591 , m_Active1377_g39591 , m_ActiveInverted1377_g39591 );
				float4 m_Off1380_g39591 = localfloat4switch1377_g39591;
				float2 appendResult1393_g39591 = (float2(_Curvaturewear_TilingX , _Curvaturewear_TilingY));
				float2 appendResult1390_g39591 = (float2(_Curvaturewear_OffsetX , _Curvaturewear_OffsetY));
				float2 texCoord1389_g39591 = IN.ase_texcoord4.xy * appendResult1393_g39591 + appendResult1390_g39591;
				float4 tex2DNode1396_g39591 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMap, sampler_trilinear_repeat, texCoord1389_g39591 );
				float4 temp_output_12_0_g39598 = ( float4( (_Curvaturewear_Tint).rgb , 0.0 ) * tex2DNode1396_g39591 );
				float3 desaturateInitialColor10_g39598 = temp_output_12_0_g39598.xyz;
				float desaturateDot10_g39598 = dot( desaturateInitialColor10_g39598, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39598 = lerp( desaturateInitialColor10_g39598, desaturateDot10_g39598.xxx, ( 1.0 - ( _Curvaturewear_Saturation + 1.0 ) ) );
				float4 lerpResult1544_g39591 = lerp( ALBEDO_IN1447_g39591 , float4( desaturateVar10_g39598 , 0.0 ) , _Curvaturewear_BlendMix);
				float4 FINAL_MASK_CURVATURE586_g39591 = lerpResult1544_g39591;
				float4 temp_cast_39 = (0.5).xxxx;
				float4 temp_cast_40 = (0.75).xxxx;
				int _Curvaturewear_Mode398_g39591 = _Curvaturewear_Mode;
				int m_switch1491_g39591 = _Curvaturewear_Mode398_g39591;
				float4 break91_g39619 = _Curvaturewear_MaskingColor;
				float3 appendResult87_g39619 = (float3(break91_g39619.r , break91_g39619.g , break91_g39619.b));
				int m_switch1516_g39591 = _Curvaturewear_MaskingSource;
				float4 _Curvaturewear_GrungeMap1510_g39591 = tex2DNode1396_g39591;
				float4 m_MapGrunge1516_g39591 = _Curvaturewear_GrungeMap1510_g39591;
				float4 m_MapAlbedo1516_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1516_g39591 = float4switch1516_g39591( m_switch1516_g39591 , m_MapGrunge1516_g39591 , m_MapAlbedo1516_g39591 );
				float4 break89_g39619 = localfloat4switch1516_g39591;
				float3 appendResult88_g39619 = (float3(break89_g39619.x , break89_g39619.y , break89_g39619.z));
				float4 temp_cast_42 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1491_g39591 = temp_cast_42;
				float4 temp_cast_43 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1491_g39591 = temp_cast_43;
				float4 temp_cast_44 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1491_g39591 = temp_cast_44;
				float4 localfloat4switch1491_g39591 = float4switch1491_g39591( m_switch1491_g39591 , m_Off1491_g39591 , m_Active1491_g39591 , m_ActiveInverted1491_g39591 );
				float4 temp_output_44_0_g39600 = localfloat4switch1491_g39591;
				float3 temp_output_40_0_g39600 = abs( ase_worldNormal );
				float WN_HORIZONTAL141_g39600 = ( ( temp_output_40_0_g39600 * temp_output_40_0_g39600 ).y + 0.07 );
				float4 lerpResult2_g39600 = lerp( temp_output_44_0_g39600 , _Vec , WN_HORIZONTAL141_g39600);
				float4 VECTOR_IN_MASKED112_g39600 = lerpResult2_g39600;
				float4 Vect_0019_g39600 = _Vec;
				float2 _SmoothX = float2(0,0.45);
				float3 temp_cast_45 = (0.5).xxx;
				float3 break24_g39600 = ( temp_output_40_0_g39600 - temp_cast_45 );
				float WN_X134_g39600 = break24_g39600.x;
				float smoothstepResult8_g39600 = smoothstep( _SmoothX.x , _SmoothX.y , ( WN_X134_g39600 + 1.25 ));
				float smoothstepResult22_g39600 = smoothstep( _SmoothX.x , _SmoothX.y , ( -WN_X134_g39600 + 0.02 ));
				float lerpResult11_g39600 = lerp( 0.0 , smoothstepResult8_g39600 , smoothstepResult22_g39600);
				float4 lerpResult14_g39600 = lerp( VECTOR_IN_MASKED112_g39600 , Vect_0019_g39600 , lerpResult11_g39600);
				float4 MASK_VERTICAL_X159_g39600 = lerpResult14_g39600;
				float2 _SmoothY = float2(0,0.85);
				float WN_Y135_g39600 = break24_g39600.y;
				float smoothstepResult29_g39600 = smoothstep( _SmoothY.x , _SmoothY.y , ( -WN_Y135_g39600 + 0.35 ));
				float4 lerpResult6_g39600 = lerp( VECTOR_IN_MASKED112_g39600 , Vect_0019_g39600 , smoothstepResult29_g39600);
				float4 MASK_VERTICAL_Y157_g39600 = lerpResult6_g39600;
				float2 _SmoothZ = float2(1.8,1.4);
				float WN_Z136_g39600 = break24_g39600.z;
				float smoothstepResult26_g39600 = smoothstep( _SmoothZ.x , _SmoothZ.y , ( WN_Z136_g39600 + 2.06 ));
				float lerpResult34_g39600 = lerp( smoothstepResult26_g39600 , 0.0 , ( -WN_Z136_g39600 + 2.05 ));
				float4 lerpResult5_g39600 = lerp( Vect_0019_g39600 , VECTOR_IN_MASKED112_g39600 , lerpResult34_g39600);
				float4 MASK_VERTICAL_Z155_g39600 = lerpResult5_g39600;
				float4 temp_cast_46 = (_Curvaturewear_BlendStrength).xxxx;
				float4 temp_cast_47 = (_Curvaturewear_BlendHardness).xxxx;
				float4 smoothstepResult75_g39600 = smoothstep( temp_cast_39 , temp_cast_40 , (float4( 0,0,0,0 ) + (( 1.0 - ( MASK_VERTICAL_X159_g39600 + MASK_VERTICAL_Y157_g39600 + MASK_VERTICAL_Z155_g39600 ) ) - temp_cast_46) * (temp_cast_47 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_46)));
				float MASK_CURVATURE401_g39591 = (( ( smoothstepResult75_g39600 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x;
				float4 lerpResult860_g39591 = lerp( FINAL_MASK_CURVATURE586_g39591 , localfloat4switch1377_g39591 , MASK_CURVATURE401_g39591);
				float4 m_Active1380_g39591 = lerpResult860_g39591;
				float4 m_ActiveInverted1380_g39591 = lerpResult860_g39591;
				float4 localfloat4switch1380_g39591 = float4switch1380_g39591( m_switch1380_g39591 , m_Off1380_g39591 , m_Active1380_g39591 , m_ActiveInverted1380_g39591 );
				
				
				float3 Albedo = localfloat4switch1380_g39591.xyz;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Gradient_TopSide;
			float4 _Verticalwear_MaskingColor;
			float4 _Curvaturewear_Tint;
			float4 _Horizontalwear_Tint;
			float4 _Horizontalwear_MaskingColor;
			float4 _Color;
			float4 _Gradient_TintCurvature;
			float4 _Gradient_BottomSide;
			float4 _Gradient_Bottom;
			float4 _Gradient_Top;
			float4 _Verticalwear_Tint;
			float4 _Curvaturewear_MaskingColor;
			half _Curvaturewear_MaskingColorFuzziness;
			half _Curvaturewear_MaskingColorRange;
			int _Curvaturewear_MaskingSource;
			int _ColorMask;
			half _Curvaturewear_Saturation;
			float _Curvaturewear_BlendStrength;
			float _Curvaturewear_OffsetY;
			float _Curvaturewear_OffsetX;
			float _Curvaturewear_TilingY;
			float _Curvaturewear_TilingX;
			float _Curvaturewear_BlendMix;
			float _Curvaturewear_BlendHardness;
			float _Verticalwear_NormalMultiplier;
			float _Horizontalwear_NormalMultiplier;
			float _Horizontalwear_Smoothness;
			float _OcclusionStrengthAO;
			int _OcclusionSourceMode;
			float _SmoothnessThreshold;
			float _SmoothnessVariance;
			float _SmoothnessStrength;
			half _NormalStrength;
			int _SmoothnessType;
			float _Curvaturewear_Metallic;
			float _Verticalwear_Metallic;
			float _Horizontalwear_Metallic;
			float _MetallicStrength;
			float _Curvaturewear_NormalMultiplier;
			float _Verticalwear_BlendMix;
			int _SmoothnessModeSurface;
			float _Verticalwear_BlendStrength;
			float _Verticalwear_OffsetY;
			half _Verticalwear_MaskingColorRange;
			int _CullMode;
			int _ZWriteMode;
			int _Curvaturewear_Mode;
			int _Verticalwear_Mode;
			int _Horizontalwear_Mode;
			int _Gradient_Mode;
			float _Gradient_Height;
			float _Gradient_Ramp;
			float _Gradient_Contrast;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			half _Verticalwear_MaskingColorFuzziness;
			float _Horizontalwear_TilingX;
			float _Horizontalwear_OffsetX;
			float _Horizontalwear_OffsetY;
			half _Horizontalwear_Saturation;
			int _Horizontalwear_MaskingSource;
			half _Horizontalwear_MaskingColorRange;
			half _Horizontalwear_MaskingColorFuzziness;
			float _Horizontalwear_BlendStrength;
			float _Horizontalwear_BlendMix;
			float _Verticalwear_TilingX;
			float _Verticalwear_TilingY;
			float _Verticalwear_OffsetX;
			float _Verticalwear_Smoothness;
			half _Verticalwear_Saturation;
			int _Verticalwear_MaskingSource;
			float _Horizontalwear_TilingY;
			float _Curvaturewear_Smoothness;
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
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_Horizontalwear_GrungeMap);
			TEXTURE2D(_Verticalwear_GrungeMap);
			TEXTURE2D(_Curvaturewear_GrungeMap);


			float4 float4switch143_g39556( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1506_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1476_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1269_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1512_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1400_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1377_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1516_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1491_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1380_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				
				o.ase_texcoord3 = v.vertex;
				o.ase_texcoord4.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord4.zw = 0;
				
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

				int m_switch1380_g39591 = _Curvaturewear_Mode;
				int m_switch1377_g39591 = _Verticalwear_Mode;
				int m_switch1269_g39591 = _Horizontalwear_Mode;
				int _Gradient_Mode161_g39556 = _Gradient_Mode;
				int m_switch143_g39556 = _Gradient_Mode161_g39556;
				float4 TINT147_g39556 = _Color;
				float4 m_Off143_g39556 = TINT147_g39556;
				float4 _Vector0 = float4(0.001,0.001,0.001,0.001);
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 temp_output_275_0_g39556 = abs( ase_worldNormal );
				float WN_HORIZONTAL284_g39556 = ( ( temp_output_275_0_g39556 * temp_output_275_0_g39556 ).y + 0.07 );
				float4 lerpResult341_g39556 = lerp( _Gradient_TintCurvature , _Vector0 , WN_HORIZONTAL284_g39556);
				float4 VECTOR_IN_MASKED343_g39556 = lerpResult341_g39556;
				float4 Vect_001349_g39556 = _Vector0;
				float2 _Vector3 = float2(0,0.45);
				float3 temp_cast_2 = (0.5).xxx;
				float3 break277_g39556 = ( temp_output_275_0_g39556 - temp_cast_2 );
				float WN_X280_g39556 = break277_g39556.x;
				float smoothstepResult303_g39556 = smoothstep( _Vector3.x , _Vector3.y , ( WN_X280_g39556 + 1.25 ));
				float smoothstepResult299_g39556 = smoothstep( _Vector3.x , _Vector3.y , ( -WN_X280_g39556 + 0.02 ));
				float lerpResult306_g39556 = lerp( 0.0 , smoothstepResult303_g39556 , smoothstepResult299_g39556);
				float4 lerpResult301_g39556 = lerp( VECTOR_IN_MASKED343_g39556 , Vect_001349_g39556 , lerpResult306_g39556);
				float4 MASK_VERTICAL_X307_g39556 = lerpResult301_g39556;
				float2 _Vector1 = float2(0,0.85);
				float WN_Y281_g39556 = break277_g39556.y;
				float smoothstepResult334_g39556 = smoothstep( _Vector1.x , _Vector1.y , ( -WN_Y281_g39556 + 0.35 ));
				float4 lerpResult333_g39556 = lerp( VECTOR_IN_MASKED343_g39556 , Vect_001349_g39556 , smoothstepResult334_g39556);
				float4 MASK_VERTICAL_Y320_g39556 = lerpResult333_g39556;
				float2 _HelloRicardo = float2(1.8,1.4);
				float WN_Z282_g39556 = break277_g39556.z;
				float smoothstepResult331_g39556 = smoothstep( _HelloRicardo.x , _HelloRicardo.y , ( WN_Z282_g39556 + 2.06 ));
				float lerpResult327_g39556 = lerp( smoothstepResult331_g39556 , 0.0 , ( -WN_Z282_g39556 + 2.05 ));
				float4 lerpResult314_g39556 = lerp( Vect_001349_g39556 , VECTOR_IN_MASKED343_g39556 , lerpResult327_g39556);
				float4 MASK_VERTICAL_Z315_g39556 = lerpResult314_g39556;
				float4 Curvature353_g39556 = saturate( ( MASK_VERTICAL_X307_g39556 + MASK_VERTICAL_Y320_g39556 + MASK_VERTICAL_Z315_g39556 ) );
				float4 lerpResult117_g39556 = lerp( _Gradient_BottomSide , _Gradient_Bottom , WN_HORIZONTAL284_g39556);
				float4 lerpResult111_g39556 = lerp( _Gradient_TopSide , _Gradient_Top , WN_HORIZONTAL284_g39556);
				float clampResult106_g39556 = clamp( ( IN.ase_texcoord3.xyz.y / _Gradient_Height ) , 0.0 , 1.0 );
				float4 lerpResult113_g39556 = lerp( lerpResult117_g39556 , lerpResult111_g39556 , clampResult106_g39556);
				float3 temp_output_145_0_g39556 = (( Curvature353_g39556 + lerpResult113_g39556 )).xyz;
				float _Gradient_Ramp154_g39556 = _Gradient_Ramp;
				float _Gradient_Contrast157_g39556 = _Gradient_Contrast;
				float2 appendResult150_g38079 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38079 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = IN.ase_texcoord4.xy * appendResult150_g38079 + appendResult151_g38079;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38079 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38079;
				float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
				float4 OUT_ALBEDO_RGBA1177_g38079 = tex2DNode63_g39580;
				float4 ALBEDO151_g39556 = OUT_ALBEDO_RGBA1177_g38079;
				float smoothstepResult142_g39556 = smoothstep( ( _Gradient_Ramp154_g39556 - ( _Gradient_Ramp154_g39556 * ( 1.0 - _Gradient_Contrast157_g39556 ) ) ) , ALBEDO151_g39556.x , _Gradient_Ramp154_g39556);
				float4 lerpResult139_g39556 = lerp( TINT147_g39556 , float4( temp_output_145_0_g39556 , 0.0 ) , smoothstepResult142_g39556);
				float4 m_Active143_g39556 = lerpResult139_g39556;
				float4 lerpResult141_g39556 = lerp( float4( temp_output_145_0_g39556 , 0.0 ) , TINT147_g39556 , smoothstepResult142_g39556);
				float4 m_ActiveInverted143_g39556 = lerpResult141_g39556;
				float4 localfloat4switch143_g39556 = float4switch143_g39556( m_switch143_g39556 , m_Off143_g39556 , m_Active143_g39556 , m_ActiveInverted143_g39556 );
				float4 temp_output_7_0_g38079 = ( localfloat4switch143_g39556 * float4( (OUT_ALBEDO_RGBA1177_g38079).rgb , 0.0 ) * _Brightness );
				float4 temp_output_6_0_g39591 = ( temp_output_7_0_g38079 + float4(0,0,0,0) );
				float4 m_Off1269_g39591 = temp_output_6_0_g39591;
				float2 appendResult1344_g39591 = (float2(_Horizontalwear_TilingX , _Horizontalwear_TilingY));
				float2 appendResult1343_g39591 = (float2(_Horizontalwear_OffsetX , _Horizontalwear_OffsetY));
				float2 texCoord1342_g39591 = IN.ase_texcoord4.xy * appendResult1344_g39591 + appendResult1343_g39591;
				float4 tex2DNode1327_g39591 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMap, sampler_trilinear_repeat, texCoord1342_g39591 );
				float4 temp_output_12_0_g39594 = ( float4( (_Horizontalwear_Tint).rgb , 0.0 ) * tex2DNode1327_g39591 );
				float3 desaturateInitialColor10_g39594 = temp_output_12_0_g39594.xyz;
				float desaturateDot10_g39594 = dot( desaturateInitialColor10_g39594, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39594 = lerp( desaturateInitialColor10_g39594, desaturateDot10_g39594.xxx, ( 1.0 - ( _Horizontalwear_Saturation + 1.0 ) ) );
				float3 FINAL_MASK_HORIZONTAL804_g39591 = desaturateVar10_g39594;
				float4 temp_cast_15 = (0.5).xxxx;
				float4 temp_cast_16 = (0.75).xxxx;
				int _Horizontalwear_Mode1003_g39591 = _Horizontalwear_Mode;
				int m_switch1476_g39591 = _Horizontalwear_Mode1003_g39591;
				float4 break91_g39617 = _Horizontalwear_MaskingColor;
				float3 appendResult87_g39617 = (float3(break91_g39617.r , break91_g39617.g , break91_g39617.b));
				int m_switch1506_g39591 = _Horizontalwear_MaskingSource;
				float4 _Horizontalwear_GrungeMap1508_g39591 = tex2DNode1327_g39591;
				float4 m_MapGrunge1506_g39591 = _Horizontalwear_GrungeMap1508_g39591;
				float4 ALBEDO_IN1447_g39591 = temp_output_6_0_g39591;
				float4 m_MapAlbedo1506_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1506_g39591 = float4switch1506_g39591( m_switch1506_g39591 , m_MapGrunge1506_g39591 , m_MapAlbedo1506_g39591 );
				float4 break89_g39617 = localfloat4switch1506_g39591;
				float3 appendResult88_g39617 = (float3(break89_g39617.x , break89_g39617.y , break89_g39617.z));
				float4 temp_cast_18 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1476_g39591 = temp_cast_18;
				float4 temp_cast_19 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1476_g39591 = temp_cast_19;
				float4 temp_cast_20 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1476_g39591 = temp_cast_20;
				float4 localfloat4switch1476_g39591 = float4switch1476_g39591( m_switch1476_g39591 , m_Off1476_g39591 , m_Active1476_g39591 , m_ActiveInverted1476_g39591 );
				float4 temp_output_44_0_g39621 = localfloat4switch1476_g39591;
				float4 VECTOR_IN212_g39621 = temp_output_44_0_g39621;
				float4 _Vec = float4(0.001,0.001,0.001,0.001);
				float4 Vect_0019_g39621 = _Vec;
				float2 _SmoothHorizontal = float2(0,0.5);
				float3 temp_output_40_0_g39621 = abs( ase_worldNormal );
				float WN_HORIZONTAL141_g39621 = ( ( temp_output_40_0_g39621 * temp_output_40_0_g39621 ).y + 0.07 );
				float smoothstepResult205_g39621 = smoothstep( _SmoothHorizontal.x , _SmoothHorizontal.y , ( ( 1.0 - WN_HORIZONTAL141_g39621 ) + -0.1 ));
				float4 lerpResult200_g39621 = lerp( VECTOR_IN212_g39621 , Vect_0019_g39621 , smoothstepResult205_g39621);
				float4 MASK_HORIZONTAL204_g39621 = lerpResult200_g39621;
				float4 temp_cast_21 = (_Horizontalwear_BlendStrength).xxxx;
				float4 temp_cast_22 = (-1.0).xxxx;
				float4 smoothstepResult75_g39621 = smoothstep( temp_cast_15 , temp_cast_16 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_HORIZONTAL204_g39621 ) - temp_cast_21) * (temp_cast_22 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_21)));
				float4 _MinOldVect4 = float4(0,0,0,0);
				float MASK_HORIZONTAL808_g39591 = ( (( ( smoothstepResult75_g39621 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Horizontalwear_BlendMix );
				float4 lerpResult861_g39591 = lerp( temp_output_6_0_g39591 , float4( FINAL_MASK_HORIZONTAL804_g39591 , 0.0 ) , MASK_HORIZONTAL808_g39591);
				float4 m_Active1269_g39591 = lerpResult861_g39591;
				float4 m_ActiveInverted1269_g39591 = lerpResult861_g39591;
				float4 localfloat4switch1269_g39591 = float4switch1269_g39591( m_switch1269_g39591 , m_Off1269_g39591 , m_Active1269_g39591 , m_ActiveInverted1269_g39591 );
				float4 m_Off1377_g39591 = localfloat4switch1269_g39591;
				float2 appendResult1384_g39591 = (float2(_Verticalwear_TilingX , _Verticalwear_TilingY));
				float2 appendResult1386_g39591 = (float2(_Verticalwear_OffsetX , _Verticalwear_OffsetY));
				float2 texCoord1388_g39591 = IN.ase_texcoord4.xy * appendResult1384_g39591 + appendResult1386_g39591;
				float4 tex2DNode1397_g39591 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeMap, sampler_trilinear_repeat, texCoord1388_g39591 );
				float4 temp_output_12_0_g39606 = ( float4( (_Verticalwear_Tint).rgb , 0.0 ) * tex2DNode1397_g39591 );
				float3 desaturateInitialColor10_g39606 = temp_output_12_0_g39606.xyz;
				float desaturateDot10_g39606 = dot( desaturateInitialColor10_g39606, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39606 = lerp( desaturateInitialColor10_g39606, desaturateDot10_g39606.xxx, ( 1.0 - ( _Verticalwear_Saturation + 1.0 ) ) );
				float3 FINAL_MASK_VERTICAL394_g39591 = desaturateVar10_g39606;
				float4 temp_cast_27 = (0.5).xxxx;
				float4 temp_cast_28 = (0.75).xxxx;
				int _Verticalwear_Mode1004_g39591 = _Verticalwear_Mode;
				int m_switch1400_g39591 = _Verticalwear_Mode1004_g39591;
				float4 break91_g39612 = _Verticalwear_MaskingColor;
				float3 appendResult87_g39612 = (float3(break91_g39612.r , break91_g39612.g , break91_g39612.b));
				int m_switch1512_g39591 = _Verticalwear_MaskingSource;
				float4 _Verticalwear_GrungeMap1509_g39591 = tex2DNode1397_g39591;
				float4 m_MapGrunge1512_g39591 = _Verticalwear_GrungeMap1509_g39591;
				float4 m_MapAlbedo1512_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1512_g39591 = float4switch1512_g39591( m_switch1512_g39591 , m_MapGrunge1512_g39591 , m_MapAlbedo1512_g39591 );
				float4 break89_g39612 = localfloat4switch1512_g39591;
				float3 appendResult88_g39612 = (float3(break89_g39612.x , break89_g39612.y , break89_g39612.z));
				float4 temp_cast_30 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1400_g39591 = temp_cast_30;
				float4 temp_cast_31 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1400_g39591 = temp_cast_31;
				float4 temp_cast_32 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1400_g39591 = temp_cast_32;
				float4 localfloat4switch1400_g39591 = float4switch1400_g39591( m_switch1400_g39591 , m_Off1400_g39591 , m_Active1400_g39591 , m_ActiveInverted1400_g39591 );
				float4 temp_output_44_0_g39592 = localfloat4switch1400_g39591;
				float3 temp_output_40_0_g39592 = abs( ase_worldNormal );
				float WN_HORIZONTAL141_g39592 = ( ( temp_output_40_0_g39592 * temp_output_40_0_g39592 ).y + 0.07 );
				float4 lerpResult2_g39592 = lerp( temp_output_44_0_g39592 , _Vec , WN_HORIZONTAL141_g39592);
				float4 VECTOR_IN_MASKED112_g39592 = lerpResult2_g39592;
				float4 Vect_0019_g39592 = _Vec;
				float3 break349_g39592 = ase_worldNormal;
				float WN_NY173_g39592 = break349_g39592.y;
				float WN_NZ184_g39592 = break349_g39592.z;
				float WN_NX186_g39592 = break349_g39592.x;
				float temp_output_175_0_g39592 = ( -WN_NY173_g39592 + WN_NZ184_g39592 + -WN_NX186_g39592 );
				float4 lerpResult133_g39592 = lerp( VECTOR_IN_MASKED112_g39592 , Vect_0019_g39592 , ( temp_output_175_0_g39592 + -temp_output_175_0_g39592 + 0.07 ));
				float4 MASK_SIDE163_g39592 = lerpResult133_g39592;
				float4 temp_cast_33 = (_Verticalwear_BlendStrength).xxxx;
				float4 temp_cast_34 = (-2.0).xxxx;
				float4 smoothstepResult75_g39592 = smoothstep( temp_cast_27 , temp_cast_28 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_SIDE163_g39592 ) - temp_cast_33) * (temp_cast_34 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_33)));
				float MASK_VERTICAL602_g39591 = ( (( ( smoothstepResult75_g39592 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Verticalwear_BlendMix );
				float4 lerpResult1227_g39591 = lerp( localfloat4switch1269_g39591 , float4( FINAL_MASK_VERTICAL394_g39591 , 0.0 ) , MASK_VERTICAL602_g39591);
				float4 m_Active1377_g39591 = lerpResult1227_g39591;
				float4 m_ActiveInverted1377_g39591 = lerpResult1227_g39591;
				float4 localfloat4switch1377_g39591 = float4switch1377_g39591( m_switch1377_g39591 , m_Off1377_g39591 , m_Active1377_g39591 , m_ActiveInverted1377_g39591 );
				float4 m_Off1380_g39591 = localfloat4switch1377_g39591;
				float2 appendResult1393_g39591 = (float2(_Curvaturewear_TilingX , _Curvaturewear_TilingY));
				float2 appendResult1390_g39591 = (float2(_Curvaturewear_OffsetX , _Curvaturewear_OffsetY));
				float2 texCoord1389_g39591 = IN.ase_texcoord4.xy * appendResult1393_g39591 + appendResult1390_g39591;
				float4 tex2DNode1396_g39591 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMap, sampler_trilinear_repeat, texCoord1389_g39591 );
				float4 temp_output_12_0_g39598 = ( float4( (_Curvaturewear_Tint).rgb , 0.0 ) * tex2DNode1396_g39591 );
				float3 desaturateInitialColor10_g39598 = temp_output_12_0_g39598.xyz;
				float desaturateDot10_g39598 = dot( desaturateInitialColor10_g39598, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39598 = lerp( desaturateInitialColor10_g39598, desaturateDot10_g39598.xxx, ( 1.0 - ( _Curvaturewear_Saturation + 1.0 ) ) );
				float4 lerpResult1544_g39591 = lerp( ALBEDO_IN1447_g39591 , float4( desaturateVar10_g39598 , 0.0 ) , _Curvaturewear_BlendMix);
				float4 FINAL_MASK_CURVATURE586_g39591 = lerpResult1544_g39591;
				float4 temp_cast_39 = (0.5).xxxx;
				float4 temp_cast_40 = (0.75).xxxx;
				int _Curvaturewear_Mode398_g39591 = _Curvaturewear_Mode;
				int m_switch1491_g39591 = _Curvaturewear_Mode398_g39591;
				float4 break91_g39619 = _Curvaturewear_MaskingColor;
				float3 appendResult87_g39619 = (float3(break91_g39619.r , break91_g39619.g , break91_g39619.b));
				int m_switch1516_g39591 = _Curvaturewear_MaskingSource;
				float4 _Curvaturewear_GrungeMap1510_g39591 = tex2DNode1396_g39591;
				float4 m_MapGrunge1516_g39591 = _Curvaturewear_GrungeMap1510_g39591;
				float4 m_MapAlbedo1516_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1516_g39591 = float4switch1516_g39591( m_switch1516_g39591 , m_MapGrunge1516_g39591 , m_MapAlbedo1516_g39591 );
				float4 break89_g39619 = localfloat4switch1516_g39591;
				float3 appendResult88_g39619 = (float3(break89_g39619.x , break89_g39619.y , break89_g39619.z));
				float4 temp_cast_42 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1491_g39591 = temp_cast_42;
				float4 temp_cast_43 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1491_g39591 = temp_cast_43;
				float4 temp_cast_44 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1491_g39591 = temp_cast_44;
				float4 localfloat4switch1491_g39591 = float4switch1491_g39591( m_switch1491_g39591 , m_Off1491_g39591 , m_Active1491_g39591 , m_ActiveInverted1491_g39591 );
				float4 temp_output_44_0_g39600 = localfloat4switch1491_g39591;
				float3 temp_output_40_0_g39600 = abs( ase_worldNormal );
				float WN_HORIZONTAL141_g39600 = ( ( temp_output_40_0_g39600 * temp_output_40_0_g39600 ).y + 0.07 );
				float4 lerpResult2_g39600 = lerp( temp_output_44_0_g39600 , _Vec , WN_HORIZONTAL141_g39600);
				float4 VECTOR_IN_MASKED112_g39600 = lerpResult2_g39600;
				float4 Vect_0019_g39600 = _Vec;
				float2 _SmoothX = float2(0,0.45);
				float3 temp_cast_45 = (0.5).xxx;
				float3 break24_g39600 = ( temp_output_40_0_g39600 - temp_cast_45 );
				float WN_X134_g39600 = break24_g39600.x;
				float smoothstepResult8_g39600 = smoothstep( _SmoothX.x , _SmoothX.y , ( WN_X134_g39600 + 1.25 ));
				float smoothstepResult22_g39600 = smoothstep( _SmoothX.x , _SmoothX.y , ( -WN_X134_g39600 + 0.02 ));
				float lerpResult11_g39600 = lerp( 0.0 , smoothstepResult8_g39600 , smoothstepResult22_g39600);
				float4 lerpResult14_g39600 = lerp( VECTOR_IN_MASKED112_g39600 , Vect_0019_g39600 , lerpResult11_g39600);
				float4 MASK_VERTICAL_X159_g39600 = lerpResult14_g39600;
				float2 _SmoothY = float2(0,0.85);
				float WN_Y135_g39600 = break24_g39600.y;
				float smoothstepResult29_g39600 = smoothstep( _SmoothY.x , _SmoothY.y , ( -WN_Y135_g39600 + 0.35 ));
				float4 lerpResult6_g39600 = lerp( VECTOR_IN_MASKED112_g39600 , Vect_0019_g39600 , smoothstepResult29_g39600);
				float4 MASK_VERTICAL_Y157_g39600 = lerpResult6_g39600;
				float2 _SmoothZ = float2(1.8,1.4);
				float WN_Z136_g39600 = break24_g39600.z;
				float smoothstepResult26_g39600 = smoothstep( _SmoothZ.x , _SmoothZ.y , ( WN_Z136_g39600 + 2.06 ));
				float lerpResult34_g39600 = lerp( smoothstepResult26_g39600 , 0.0 , ( -WN_Z136_g39600 + 2.05 ));
				float4 lerpResult5_g39600 = lerp( Vect_0019_g39600 , VECTOR_IN_MASKED112_g39600 , lerpResult34_g39600);
				float4 MASK_VERTICAL_Z155_g39600 = lerpResult5_g39600;
				float4 temp_cast_46 = (_Curvaturewear_BlendStrength).xxxx;
				float4 temp_cast_47 = (_Curvaturewear_BlendHardness).xxxx;
				float4 smoothstepResult75_g39600 = smoothstep( temp_cast_39 , temp_cast_40 , (float4( 0,0,0,0 ) + (( 1.0 - ( MASK_VERTICAL_X159_g39600 + MASK_VERTICAL_Y157_g39600 + MASK_VERTICAL_Z155_g39600 ) ) - temp_cast_46) * (temp_cast_47 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_46)));
				float MASK_CURVATURE401_g39591 = (( ( smoothstepResult75_g39600 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x;
				float4 lerpResult860_g39591 = lerp( FINAL_MASK_CURVATURE586_g39591 , localfloat4switch1377_g39591 , MASK_CURVATURE401_g39591);
				float4 m_Active1380_g39591 = lerpResult860_g39591;
				float4 m_ActiveInverted1380_g39591 = lerpResult860_g39591;
				float4 localfloat4switch1380_g39591 = float4switch1380_g39591( m_switch1380_g39591 , m_Off1380_g39591 , m_Active1380_g39591 , m_ActiveInverted1380_g39591 );
				
				
				float3 Albedo = localfloat4switch1380_g39591.xyz;
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

			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
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
			float4 _Gradient_TopSide;
			float4 _Verticalwear_MaskingColor;
			float4 _Curvaturewear_Tint;
			float4 _Horizontalwear_Tint;
			float4 _Horizontalwear_MaskingColor;
			float4 _Color;
			float4 _Gradient_TintCurvature;
			float4 _Gradient_BottomSide;
			float4 _Gradient_Bottom;
			float4 _Gradient_Top;
			float4 _Verticalwear_Tint;
			float4 _Curvaturewear_MaskingColor;
			half _Curvaturewear_MaskingColorFuzziness;
			half _Curvaturewear_MaskingColorRange;
			int _Curvaturewear_MaskingSource;
			int _ColorMask;
			half _Curvaturewear_Saturation;
			float _Curvaturewear_BlendStrength;
			float _Curvaturewear_OffsetY;
			float _Curvaturewear_OffsetX;
			float _Curvaturewear_TilingY;
			float _Curvaturewear_TilingX;
			float _Curvaturewear_BlendMix;
			float _Curvaturewear_BlendHardness;
			float _Verticalwear_NormalMultiplier;
			float _Horizontalwear_NormalMultiplier;
			float _Horizontalwear_Smoothness;
			float _OcclusionStrengthAO;
			int _OcclusionSourceMode;
			float _SmoothnessThreshold;
			float _SmoothnessVariance;
			float _SmoothnessStrength;
			half _NormalStrength;
			int _SmoothnessType;
			float _Curvaturewear_Metallic;
			float _Verticalwear_Metallic;
			float _Horizontalwear_Metallic;
			float _MetallicStrength;
			float _Curvaturewear_NormalMultiplier;
			float _Verticalwear_BlendMix;
			int _SmoothnessModeSurface;
			float _Verticalwear_BlendStrength;
			float _Verticalwear_OffsetY;
			half _Verticalwear_MaskingColorRange;
			int _CullMode;
			int _ZWriteMode;
			int _Curvaturewear_Mode;
			int _Verticalwear_Mode;
			int _Horizontalwear_Mode;
			int _Gradient_Mode;
			float _Gradient_Height;
			float _Gradient_Ramp;
			float _Gradient_Contrast;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			half _Verticalwear_MaskingColorFuzziness;
			float _Horizontalwear_TilingX;
			float _Horizontalwear_OffsetX;
			float _Horizontalwear_OffsetY;
			half _Horizontalwear_Saturation;
			int _Horizontalwear_MaskingSource;
			half _Horizontalwear_MaskingColorRange;
			half _Horizontalwear_MaskingColorFuzziness;
			float _Horizontalwear_BlendStrength;
			float _Horizontalwear_BlendMix;
			float _Verticalwear_TilingX;
			float _Verticalwear_TilingY;
			float _Verticalwear_OffsetX;
			float _Verticalwear_Smoothness;
			half _Verticalwear_Saturation;
			int _Verticalwear_MaskingSource;
			float _Horizontalwear_TilingY;
			float _Curvaturewear_Smoothness;
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

			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
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
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Gradient_TopSide;
			float4 _Verticalwear_MaskingColor;
			float4 _Curvaturewear_Tint;
			float4 _Horizontalwear_Tint;
			float4 _Horizontalwear_MaskingColor;
			float4 _Color;
			float4 _Gradient_TintCurvature;
			float4 _Gradient_BottomSide;
			float4 _Gradient_Bottom;
			float4 _Gradient_Top;
			float4 _Verticalwear_Tint;
			float4 _Curvaturewear_MaskingColor;
			half _Curvaturewear_MaskingColorFuzziness;
			half _Curvaturewear_MaskingColorRange;
			int _Curvaturewear_MaskingSource;
			int _ColorMask;
			half _Curvaturewear_Saturation;
			float _Curvaturewear_BlendStrength;
			float _Curvaturewear_OffsetY;
			float _Curvaturewear_OffsetX;
			float _Curvaturewear_TilingY;
			float _Curvaturewear_TilingX;
			float _Curvaturewear_BlendMix;
			float _Curvaturewear_BlendHardness;
			float _Verticalwear_NormalMultiplier;
			float _Horizontalwear_NormalMultiplier;
			float _Horizontalwear_Smoothness;
			float _OcclusionStrengthAO;
			int _OcclusionSourceMode;
			float _SmoothnessThreshold;
			float _SmoothnessVariance;
			float _SmoothnessStrength;
			half _NormalStrength;
			int _SmoothnessType;
			float _Curvaturewear_Metallic;
			float _Verticalwear_Metallic;
			float _Horizontalwear_Metallic;
			float _MetallicStrength;
			float _Curvaturewear_NormalMultiplier;
			float _Verticalwear_BlendMix;
			int _SmoothnessModeSurface;
			float _Verticalwear_BlendStrength;
			float _Verticalwear_OffsetY;
			half _Verticalwear_MaskingColorRange;
			int _CullMode;
			int _ZWriteMode;
			int _Curvaturewear_Mode;
			int _Verticalwear_Mode;
			int _Horizontalwear_Mode;
			int _Gradient_Mode;
			float _Gradient_Height;
			float _Gradient_Ramp;
			float _Gradient_Contrast;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			half _Verticalwear_MaskingColorFuzziness;
			float _Horizontalwear_TilingX;
			float _Horizontalwear_OffsetX;
			float _Horizontalwear_OffsetY;
			half _Horizontalwear_Saturation;
			int _Horizontalwear_MaskingSource;
			half _Horizontalwear_MaskingColorRange;
			half _Horizontalwear_MaskingColorFuzziness;
			float _Horizontalwear_BlendStrength;
			float _Horizontalwear_BlendMix;
			float _Verticalwear_TilingX;
			float _Verticalwear_TilingY;
			float _Verticalwear_OffsetX;
			float _Verticalwear_Smoothness;
			half _Verticalwear_Saturation;
			int _Verticalwear_MaskingSource;
			float _Horizontalwear_TilingY;
			float _Curvaturewear_Smoothness;
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
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_Horizontalwear_GrungeMap);
			TEXTURE2D(_Verticalwear_GrungeMap);
			TEXTURE2D(_Curvaturewear_GrungeMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_Horizontalwear_GrungeNormal);
			TEXTURE2D(_Verticalwear_GrungeNormal);
			TEXTURE2D(_Curvaturewear_GrungeNormal);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);


			float4 float4switch143_g39556( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1506_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1476_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1269_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1512_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1400_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1377_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1516_g39591( int m_switch, float4 m_MapGrunge, float4 m_MapAlbedo )
			{
				if(m_switch ==0)
					return m_MapGrunge;
				else if(m_switch ==1)
					return m_MapAlbedo;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1491_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 float4switch1380_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float3 float3switch1329_g39591( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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
			
			float3 float3switch1413_g39591( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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
			
			float3 float3switch1416_g39591( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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
			
			float floatswitch1434_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
			}
			
			float floatswitch1435_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
			}
			
			float floatswitch1436_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
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
			
			float floatswitch1075_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
			}
			
			float floatswitch1432_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
			}
			
			float floatswitch1433_g39591( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7 = v.vertex;
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
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

				int m_switch1380_g39591 = _Curvaturewear_Mode;
				int m_switch1377_g39591 = _Verticalwear_Mode;
				int m_switch1269_g39591 = _Horizontalwear_Mode;
				int _Gradient_Mode161_g39556 = _Gradient_Mode;
				int m_switch143_g39556 = _Gradient_Mode161_g39556;
				float4 TINT147_g39556 = _Color;
				float4 m_Off143_g39556 = TINT147_g39556;
				float4 _Vector0 = float4(0.001,0.001,0.001,0.001);
				float3 temp_output_275_0_g39556 = abs( WorldNormal );
				float WN_HORIZONTAL284_g39556 = ( ( temp_output_275_0_g39556 * temp_output_275_0_g39556 ).y + 0.07 );
				float4 lerpResult341_g39556 = lerp( _Gradient_TintCurvature , _Vector0 , WN_HORIZONTAL284_g39556);
				float4 VECTOR_IN_MASKED343_g39556 = lerpResult341_g39556;
				float4 Vect_001349_g39556 = _Vector0;
				float2 _Vector3 = float2(0,0.45);
				float3 temp_cast_2 = (0.5).xxx;
				float3 break277_g39556 = ( temp_output_275_0_g39556 - temp_cast_2 );
				float WN_X280_g39556 = break277_g39556.x;
				float smoothstepResult303_g39556 = smoothstep( _Vector3.x , _Vector3.y , ( WN_X280_g39556 + 1.25 ));
				float smoothstepResult299_g39556 = smoothstep( _Vector3.x , _Vector3.y , ( -WN_X280_g39556 + 0.02 ));
				float lerpResult306_g39556 = lerp( 0.0 , smoothstepResult303_g39556 , smoothstepResult299_g39556);
				float4 lerpResult301_g39556 = lerp( VECTOR_IN_MASKED343_g39556 , Vect_001349_g39556 , lerpResult306_g39556);
				float4 MASK_VERTICAL_X307_g39556 = lerpResult301_g39556;
				float2 _Vector1 = float2(0,0.85);
				float WN_Y281_g39556 = break277_g39556.y;
				float smoothstepResult334_g39556 = smoothstep( _Vector1.x , _Vector1.y , ( -WN_Y281_g39556 + 0.35 ));
				float4 lerpResult333_g39556 = lerp( VECTOR_IN_MASKED343_g39556 , Vect_001349_g39556 , smoothstepResult334_g39556);
				float4 MASK_VERTICAL_Y320_g39556 = lerpResult333_g39556;
				float2 _HelloRicardo = float2(1.8,1.4);
				float WN_Z282_g39556 = break277_g39556.z;
				float smoothstepResult331_g39556 = smoothstep( _HelloRicardo.x , _HelloRicardo.y , ( WN_Z282_g39556 + 2.06 ));
				float lerpResult327_g39556 = lerp( smoothstepResult331_g39556 , 0.0 , ( -WN_Z282_g39556 + 2.05 ));
				float4 lerpResult314_g39556 = lerp( Vect_001349_g39556 , VECTOR_IN_MASKED343_g39556 , lerpResult327_g39556);
				float4 MASK_VERTICAL_Z315_g39556 = lerpResult314_g39556;
				float4 Curvature353_g39556 = saturate( ( MASK_VERTICAL_X307_g39556 + MASK_VERTICAL_Y320_g39556 + MASK_VERTICAL_Z315_g39556 ) );
				float4 lerpResult117_g39556 = lerp( _Gradient_BottomSide , _Gradient_Bottom , WN_HORIZONTAL284_g39556);
				float4 lerpResult111_g39556 = lerp( _Gradient_TopSide , _Gradient_Top , WN_HORIZONTAL284_g39556);
				float clampResult106_g39556 = clamp( ( IN.ase_texcoord7.xyz.y / _Gradient_Height ) , 0.0 , 1.0 );
				float4 lerpResult113_g39556 = lerp( lerpResult117_g39556 , lerpResult111_g39556 , clampResult106_g39556);
				float3 temp_output_145_0_g39556 = (( Curvature353_g39556 + lerpResult113_g39556 )).xyz;
				float _Gradient_Ramp154_g39556 = _Gradient_Ramp;
				float _Gradient_Contrast157_g39556 = _Gradient_Contrast;
				float2 appendResult150_g38079 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38079 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g39586 = IN.ase_texcoord8.xy * appendResult150_g38079 + appendResult151_g38079;
				float2 appendResult6_g39586 = (float2(texCoord2_g39586.x , texCoord2_g39586.y));
				float2 OUT_UV431_g38079 = appendResult6_g39586;
				float2 UV40_g39580 = OUT_UV431_g38079;
				float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
				float4 OUT_ALBEDO_RGBA1177_g38079 = tex2DNode63_g39580;
				float4 ALBEDO151_g39556 = OUT_ALBEDO_RGBA1177_g38079;
				float smoothstepResult142_g39556 = smoothstep( ( _Gradient_Ramp154_g39556 - ( _Gradient_Ramp154_g39556 * ( 1.0 - _Gradient_Contrast157_g39556 ) ) ) , ALBEDO151_g39556.x , _Gradient_Ramp154_g39556);
				float4 lerpResult139_g39556 = lerp( TINT147_g39556 , float4( temp_output_145_0_g39556 , 0.0 ) , smoothstepResult142_g39556);
				float4 m_Active143_g39556 = lerpResult139_g39556;
				float4 lerpResult141_g39556 = lerp( float4( temp_output_145_0_g39556 , 0.0 ) , TINT147_g39556 , smoothstepResult142_g39556);
				float4 m_ActiveInverted143_g39556 = lerpResult141_g39556;
				float4 localfloat4switch143_g39556 = float4switch143_g39556( m_switch143_g39556 , m_Off143_g39556 , m_Active143_g39556 , m_ActiveInverted143_g39556 );
				float4 temp_output_7_0_g38079 = ( localfloat4switch143_g39556 * float4( (OUT_ALBEDO_RGBA1177_g38079).rgb , 0.0 ) * _Brightness );
				float4 temp_output_6_0_g39591 = ( temp_output_7_0_g38079 + float4(0,0,0,0) );
				float4 m_Off1269_g39591 = temp_output_6_0_g39591;
				float2 appendResult1344_g39591 = (float2(_Horizontalwear_TilingX , _Horizontalwear_TilingY));
				float2 appendResult1343_g39591 = (float2(_Horizontalwear_OffsetX , _Horizontalwear_OffsetY));
				float2 texCoord1342_g39591 = IN.ase_texcoord8.xy * appendResult1344_g39591 + appendResult1343_g39591;
				float4 tex2DNode1327_g39591 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMap, sampler_trilinear_repeat, texCoord1342_g39591 );
				float4 temp_output_12_0_g39594 = ( float4( (_Horizontalwear_Tint).rgb , 0.0 ) * tex2DNode1327_g39591 );
				float3 desaturateInitialColor10_g39594 = temp_output_12_0_g39594.xyz;
				float desaturateDot10_g39594 = dot( desaturateInitialColor10_g39594, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39594 = lerp( desaturateInitialColor10_g39594, desaturateDot10_g39594.xxx, ( 1.0 - ( _Horizontalwear_Saturation + 1.0 ) ) );
				float3 FINAL_MASK_HORIZONTAL804_g39591 = desaturateVar10_g39594;
				float4 temp_cast_15 = (0.5).xxxx;
				float4 temp_cast_16 = (0.75).xxxx;
				int _Horizontalwear_Mode1003_g39591 = _Horizontalwear_Mode;
				int m_switch1476_g39591 = _Horizontalwear_Mode1003_g39591;
				float4 break91_g39617 = _Horizontalwear_MaskingColor;
				float3 appendResult87_g39617 = (float3(break91_g39617.r , break91_g39617.g , break91_g39617.b));
				int m_switch1506_g39591 = _Horizontalwear_MaskingSource;
				float4 _Horizontalwear_GrungeMap1508_g39591 = tex2DNode1327_g39591;
				float4 m_MapGrunge1506_g39591 = _Horizontalwear_GrungeMap1508_g39591;
				float4 ALBEDO_IN1447_g39591 = temp_output_6_0_g39591;
				float4 m_MapAlbedo1506_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1506_g39591 = float4switch1506_g39591( m_switch1506_g39591 , m_MapGrunge1506_g39591 , m_MapAlbedo1506_g39591 );
				float4 break89_g39617 = localfloat4switch1506_g39591;
				float3 appendResult88_g39617 = (float3(break89_g39617.x , break89_g39617.y , break89_g39617.z));
				float4 temp_cast_18 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1476_g39591 = temp_cast_18;
				float4 temp_cast_19 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1476_g39591 = temp_cast_19;
				float4 temp_cast_20 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39617 , appendResult88_g39617 ) - _Horizontalwear_MaskingColorRange ) / max( _Horizontalwear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1476_g39591 = temp_cast_20;
				float4 localfloat4switch1476_g39591 = float4switch1476_g39591( m_switch1476_g39591 , m_Off1476_g39591 , m_Active1476_g39591 , m_ActiveInverted1476_g39591 );
				float4 temp_output_44_0_g39621 = localfloat4switch1476_g39591;
				float4 VECTOR_IN212_g39621 = temp_output_44_0_g39621;
				float4 _Vec = float4(0.001,0.001,0.001,0.001);
				float4 Vect_0019_g39621 = _Vec;
				float2 _SmoothHorizontal = float2(0,0.5);
				float3 temp_output_40_0_g39621 = abs( WorldNormal );
				float WN_HORIZONTAL141_g39621 = ( ( temp_output_40_0_g39621 * temp_output_40_0_g39621 ).y + 0.07 );
				float smoothstepResult205_g39621 = smoothstep( _SmoothHorizontal.x , _SmoothHorizontal.y , ( ( 1.0 - WN_HORIZONTAL141_g39621 ) + -0.1 ));
				float4 lerpResult200_g39621 = lerp( VECTOR_IN212_g39621 , Vect_0019_g39621 , smoothstepResult205_g39621);
				float4 MASK_HORIZONTAL204_g39621 = lerpResult200_g39621;
				float4 temp_cast_21 = (_Horizontalwear_BlendStrength).xxxx;
				float4 temp_cast_22 = (-1.0).xxxx;
				float4 smoothstepResult75_g39621 = smoothstep( temp_cast_15 , temp_cast_16 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_HORIZONTAL204_g39621 ) - temp_cast_21) * (temp_cast_22 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_21)));
				float4 _MinOldVect4 = float4(0,0,0,0);
				float MASK_HORIZONTAL808_g39591 = ( (( ( smoothstepResult75_g39621 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Horizontalwear_BlendMix );
				float4 lerpResult861_g39591 = lerp( temp_output_6_0_g39591 , float4( FINAL_MASK_HORIZONTAL804_g39591 , 0.0 ) , MASK_HORIZONTAL808_g39591);
				float4 m_Active1269_g39591 = lerpResult861_g39591;
				float4 m_ActiveInverted1269_g39591 = lerpResult861_g39591;
				float4 localfloat4switch1269_g39591 = float4switch1269_g39591( m_switch1269_g39591 , m_Off1269_g39591 , m_Active1269_g39591 , m_ActiveInverted1269_g39591 );
				float4 m_Off1377_g39591 = localfloat4switch1269_g39591;
				float2 appendResult1384_g39591 = (float2(_Verticalwear_TilingX , _Verticalwear_TilingY));
				float2 appendResult1386_g39591 = (float2(_Verticalwear_OffsetX , _Verticalwear_OffsetY));
				float2 texCoord1388_g39591 = IN.ase_texcoord8.xy * appendResult1384_g39591 + appendResult1386_g39591;
				float4 tex2DNode1397_g39591 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeMap, sampler_trilinear_repeat, texCoord1388_g39591 );
				float4 temp_output_12_0_g39606 = ( float4( (_Verticalwear_Tint).rgb , 0.0 ) * tex2DNode1397_g39591 );
				float3 desaturateInitialColor10_g39606 = temp_output_12_0_g39606.xyz;
				float desaturateDot10_g39606 = dot( desaturateInitialColor10_g39606, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39606 = lerp( desaturateInitialColor10_g39606, desaturateDot10_g39606.xxx, ( 1.0 - ( _Verticalwear_Saturation + 1.0 ) ) );
				float3 FINAL_MASK_VERTICAL394_g39591 = desaturateVar10_g39606;
				float4 temp_cast_27 = (0.5).xxxx;
				float4 temp_cast_28 = (0.75).xxxx;
				int _Verticalwear_Mode1004_g39591 = _Verticalwear_Mode;
				int m_switch1400_g39591 = _Verticalwear_Mode1004_g39591;
				float4 break91_g39612 = _Verticalwear_MaskingColor;
				float3 appendResult87_g39612 = (float3(break91_g39612.r , break91_g39612.g , break91_g39612.b));
				int m_switch1512_g39591 = _Verticalwear_MaskingSource;
				float4 _Verticalwear_GrungeMap1509_g39591 = tex2DNode1397_g39591;
				float4 m_MapGrunge1512_g39591 = _Verticalwear_GrungeMap1509_g39591;
				float4 m_MapAlbedo1512_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1512_g39591 = float4switch1512_g39591( m_switch1512_g39591 , m_MapGrunge1512_g39591 , m_MapAlbedo1512_g39591 );
				float4 break89_g39612 = localfloat4switch1512_g39591;
				float3 appendResult88_g39612 = (float3(break89_g39612.x , break89_g39612.y , break89_g39612.z));
				float4 temp_cast_30 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1400_g39591 = temp_cast_30;
				float4 temp_cast_31 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1400_g39591 = temp_cast_31;
				float4 temp_cast_32 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39612 , appendResult88_g39612 ) - _Verticalwear_MaskingColorRange ) / max( _Verticalwear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1400_g39591 = temp_cast_32;
				float4 localfloat4switch1400_g39591 = float4switch1400_g39591( m_switch1400_g39591 , m_Off1400_g39591 , m_Active1400_g39591 , m_ActiveInverted1400_g39591 );
				float4 temp_output_44_0_g39592 = localfloat4switch1400_g39591;
				float3 temp_output_40_0_g39592 = abs( WorldNormal );
				float WN_HORIZONTAL141_g39592 = ( ( temp_output_40_0_g39592 * temp_output_40_0_g39592 ).y + 0.07 );
				float4 lerpResult2_g39592 = lerp( temp_output_44_0_g39592 , _Vec , WN_HORIZONTAL141_g39592);
				float4 VECTOR_IN_MASKED112_g39592 = lerpResult2_g39592;
				float4 Vect_0019_g39592 = _Vec;
				float3 break349_g39592 = WorldNormal;
				float WN_NY173_g39592 = break349_g39592.y;
				float WN_NZ184_g39592 = break349_g39592.z;
				float WN_NX186_g39592 = break349_g39592.x;
				float temp_output_175_0_g39592 = ( -WN_NY173_g39592 + WN_NZ184_g39592 + -WN_NX186_g39592 );
				float4 lerpResult133_g39592 = lerp( VECTOR_IN_MASKED112_g39592 , Vect_0019_g39592 , ( temp_output_175_0_g39592 + -temp_output_175_0_g39592 + 0.07 ));
				float4 MASK_SIDE163_g39592 = lerpResult133_g39592;
				float4 temp_cast_33 = (_Verticalwear_BlendStrength).xxxx;
				float4 temp_cast_34 = (-2.0).xxxx;
				float4 smoothstepResult75_g39592 = smoothstep( temp_cast_27 , temp_cast_28 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_SIDE163_g39592 ) - temp_cast_33) * (temp_cast_34 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_33)));
				float MASK_VERTICAL602_g39591 = ( (( ( smoothstepResult75_g39592 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Verticalwear_BlendMix );
				float4 lerpResult1227_g39591 = lerp( localfloat4switch1269_g39591 , float4( FINAL_MASK_VERTICAL394_g39591 , 0.0 ) , MASK_VERTICAL602_g39591);
				float4 m_Active1377_g39591 = lerpResult1227_g39591;
				float4 m_ActiveInverted1377_g39591 = lerpResult1227_g39591;
				float4 localfloat4switch1377_g39591 = float4switch1377_g39591( m_switch1377_g39591 , m_Off1377_g39591 , m_Active1377_g39591 , m_ActiveInverted1377_g39591 );
				float4 m_Off1380_g39591 = localfloat4switch1377_g39591;
				float2 appendResult1393_g39591 = (float2(_Curvaturewear_TilingX , _Curvaturewear_TilingY));
				float2 appendResult1390_g39591 = (float2(_Curvaturewear_OffsetX , _Curvaturewear_OffsetY));
				float2 texCoord1389_g39591 = IN.ase_texcoord8.xy * appendResult1393_g39591 + appendResult1390_g39591;
				float4 tex2DNode1396_g39591 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMap, sampler_trilinear_repeat, texCoord1389_g39591 );
				float4 temp_output_12_0_g39598 = ( float4( (_Curvaturewear_Tint).rgb , 0.0 ) * tex2DNode1396_g39591 );
				float3 desaturateInitialColor10_g39598 = temp_output_12_0_g39598.xyz;
				float desaturateDot10_g39598 = dot( desaturateInitialColor10_g39598, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g39598 = lerp( desaturateInitialColor10_g39598, desaturateDot10_g39598.xxx, ( 1.0 - ( _Curvaturewear_Saturation + 1.0 ) ) );
				float4 lerpResult1544_g39591 = lerp( ALBEDO_IN1447_g39591 , float4( desaturateVar10_g39598 , 0.0 ) , _Curvaturewear_BlendMix);
				float4 FINAL_MASK_CURVATURE586_g39591 = lerpResult1544_g39591;
				float4 temp_cast_39 = (0.5).xxxx;
				float4 temp_cast_40 = (0.75).xxxx;
				int _Curvaturewear_Mode398_g39591 = _Curvaturewear_Mode;
				int m_switch1491_g39591 = _Curvaturewear_Mode398_g39591;
				float4 break91_g39619 = _Curvaturewear_MaskingColor;
				float3 appendResult87_g39619 = (float3(break91_g39619.r , break91_g39619.g , break91_g39619.b));
				int m_switch1516_g39591 = _Curvaturewear_MaskingSource;
				float4 _Curvaturewear_GrungeMap1510_g39591 = tex2DNode1396_g39591;
				float4 m_MapGrunge1516_g39591 = _Curvaturewear_GrungeMap1510_g39591;
				float4 m_MapAlbedo1516_g39591 = ALBEDO_IN1447_g39591;
				float4 localfloat4switch1516_g39591 = float4switch1516_g39591( m_switch1516_g39591 , m_MapGrunge1516_g39591 , m_MapAlbedo1516_g39591 );
				float4 break89_g39619 = localfloat4switch1516_g39591;
				float3 appendResult88_g39619 = (float3(break89_g39619.x , break89_g39619.y , break89_g39619.z));
				float4 temp_cast_42 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Off1491_g39591 = temp_cast_42;
				float4 temp_cast_43 = (saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) )).xxxx;
				float4 m_Active1491_g39591 = temp_cast_43;
				float4 temp_cast_44 = (saturate( ( 1.0 - saturate( ( 1.0 - ( ( distance( appendResult87_g39619 , appendResult88_g39619 ) - _Curvaturewear_MaskingColorRange ) / max( _Curvaturewear_MaskingColorFuzziness , 1E-05 ) ) ) ) ) )).xxxx;
				float4 m_ActiveInverted1491_g39591 = temp_cast_44;
				float4 localfloat4switch1491_g39591 = float4switch1491_g39591( m_switch1491_g39591 , m_Off1491_g39591 , m_Active1491_g39591 , m_ActiveInverted1491_g39591 );
				float4 temp_output_44_0_g39600 = localfloat4switch1491_g39591;
				float3 temp_output_40_0_g39600 = abs( WorldNormal );
				float WN_HORIZONTAL141_g39600 = ( ( temp_output_40_0_g39600 * temp_output_40_0_g39600 ).y + 0.07 );
				float4 lerpResult2_g39600 = lerp( temp_output_44_0_g39600 , _Vec , WN_HORIZONTAL141_g39600);
				float4 VECTOR_IN_MASKED112_g39600 = lerpResult2_g39600;
				float4 Vect_0019_g39600 = _Vec;
				float2 _SmoothX = float2(0,0.45);
				float3 temp_cast_45 = (0.5).xxx;
				float3 break24_g39600 = ( temp_output_40_0_g39600 - temp_cast_45 );
				float WN_X134_g39600 = break24_g39600.x;
				float smoothstepResult8_g39600 = smoothstep( _SmoothX.x , _SmoothX.y , ( WN_X134_g39600 + 1.25 ));
				float smoothstepResult22_g39600 = smoothstep( _SmoothX.x , _SmoothX.y , ( -WN_X134_g39600 + 0.02 ));
				float lerpResult11_g39600 = lerp( 0.0 , smoothstepResult8_g39600 , smoothstepResult22_g39600);
				float4 lerpResult14_g39600 = lerp( VECTOR_IN_MASKED112_g39600 , Vect_0019_g39600 , lerpResult11_g39600);
				float4 MASK_VERTICAL_X159_g39600 = lerpResult14_g39600;
				float2 _SmoothY = float2(0,0.85);
				float WN_Y135_g39600 = break24_g39600.y;
				float smoothstepResult29_g39600 = smoothstep( _SmoothY.x , _SmoothY.y , ( -WN_Y135_g39600 + 0.35 ));
				float4 lerpResult6_g39600 = lerp( VECTOR_IN_MASKED112_g39600 , Vect_0019_g39600 , smoothstepResult29_g39600);
				float4 MASK_VERTICAL_Y157_g39600 = lerpResult6_g39600;
				float2 _SmoothZ = float2(1.8,1.4);
				float WN_Z136_g39600 = break24_g39600.z;
				float smoothstepResult26_g39600 = smoothstep( _SmoothZ.x , _SmoothZ.y , ( WN_Z136_g39600 + 2.06 ));
				float lerpResult34_g39600 = lerp( smoothstepResult26_g39600 , 0.0 , ( -WN_Z136_g39600 + 2.05 ));
				float4 lerpResult5_g39600 = lerp( Vect_0019_g39600 , VECTOR_IN_MASKED112_g39600 , lerpResult34_g39600);
				float4 MASK_VERTICAL_Z155_g39600 = lerpResult5_g39600;
				float4 temp_cast_46 = (_Curvaturewear_BlendStrength).xxxx;
				float4 temp_cast_47 = (_Curvaturewear_BlendHardness).xxxx;
				float4 smoothstepResult75_g39600 = smoothstep( temp_cast_39 , temp_cast_40 , (float4( 0,0,0,0 ) + (( 1.0 - ( MASK_VERTICAL_X159_g39600 + MASK_VERTICAL_Y157_g39600 + MASK_VERTICAL_Z155_g39600 ) ) - temp_cast_46) * (temp_cast_47 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_46)));
				float MASK_CURVATURE401_g39591 = (( ( smoothstepResult75_g39600 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x;
				float4 lerpResult860_g39591 = lerp( FINAL_MASK_CURVATURE586_g39591 , localfloat4switch1377_g39591 , MASK_CURVATURE401_g39591);
				float4 m_Active1380_g39591 = lerpResult860_g39591;
				float4 m_ActiveInverted1380_g39591 = lerpResult860_g39591;
				float4 localfloat4switch1380_g39591 = float4switch1380_g39591( m_switch1380_g39591 , m_Off1380_g39591 , m_Active1380_g39591 , m_ActiveInverted1380_g39591 );
				
				int m_switch1416_g39591 = _Curvaturewear_Mode;
				int m_switch1413_g39591 = _Verticalwear_Mode;
				int m_switch1329_g39591 = _Horizontalwear_Mode;
				float4 OUT_NORMAL1178_g38079 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_output_1_0_g39549 = OUT_NORMAL1178_g38079;
				float temp_output_8_0_g39549 = _NormalStrength;
				float3 unpack52_g39549 = UnpackNormalScale( temp_output_1_0_g39549, temp_output_8_0_g39549 );
				unpack52_g39549.z = lerp( 1, unpack52_g39549.z, saturate(temp_output_8_0_g39549) );
				float3 temp_output_1478_59_g38079 = unpack52_g39549;
				float3 NORMAL_OUT314_g38079 = temp_output_1478_59_g38079;
				float3 temp_output_16_0_g39547 = NORMAL_OUT314_g38079;
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
				float3 ADDITIONAL_LIGHT1342_g38079 = localAdditionalLightsFlatMask63_g39547;
				float3 temp_output_8_0_g39591 = ( temp_output_1478_59_g38079 + ADDITIONAL_LIGHT1342_g38079 );
				float3 m_Off1329_g39591 = temp_output_8_0_g39591;
				float4 temp_output_1_0_g39604 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeNormal, sampler_trilinear_repeat, texCoord1342_g39591 );
				float temp_output_8_0_g39604 = ( _Horizontalwear_NormalMultiplier * _Horizontalwear_BlendStrength );
				float3 unpack52_g39604 = UnpackNormalScale( temp_output_1_0_g39604, temp_output_8_0_g39604 );
				unpack52_g39604.z = lerp( 1, unpack52_g39604.z, saturate(temp_output_8_0_g39604) );
				float3 FINAL_MASKNORMAL_HORIZONTAL803_g39591 = unpack52_g39604;
				float3 lerpResult1335_g39591 = lerp( temp_output_8_0_g39591 , FINAL_MASKNORMAL_HORIZONTAL803_g39591 , MASK_HORIZONTAL808_g39591);
				float3 m_Active1329_g39591 = lerpResult1335_g39591;
				float3 m_ActiveInverted1329_g39591 = lerpResult1335_g39591;
				float3 localfloat3switch1329_g39591 = float3switch1329_g39591( m_switch1329_g39591 , m_Off1329_g39591 , m_Active1329_g39591 , m_ActiveInverted1329_g39591 );
				float3 m_Off1413_g39591 = localfloat3switch1329_g39591;
				float4 temp_output_1_0_g39602 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeNormal, sampler_trilinear_repeat, texCoord1388_g39591 );
				float temp_output_8_0_g39602 = ( _Verticalwear_NormalMultiplier * _Verticalwear_BlendStrength );
				float3 unpack52_g39602 = UnpackNormalScale( temp_output_1_0_g39602, temp_output_8_0_g39602 );
				unpack52_g39602.z = lerp( 1, unpack52_g39602.z, saturate(temp_output_8_0_g39602) );
				float3 FINAL_MASKNORMAL_VERTICAL630_g39591 = unpack52_g39602;
				float3 lerpResult1414_g39591 = lerp( localfloat3switch1329_g39591 , FINAL_MASKNORMAL_VERTICAL630_g39591 , MASK_VERTICAL602_g39591);
				float3 m_Active1413_g39591 = lerpResult1414_g39591;
				float3 m_ActiveInverted1413_g39591 = lerpResult1414_g39591;
				float3 localfloat3switch1413_g39591 = float3switch1413_g39591( m_switch1413_g39591 , m_Off1413_g39591 , m_Active1413_g39591 , m_ActiveInverted1413_g39591 );
				float3 m_Off1416_g39591 = localfloat3switch1413_g39591;
				float3 NORMAL_IN1546_g39591 = temp_output_8_0_g39591;
				float4 temp_output_1_0_g39596 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeNormal, sampler_trilinear_repeat, texCoord1389_g39591 );
				float temp_output_8_0_g39596 = ( _Curvaturewear_NormalMultiplier * _Curvaturewear_BlendStrength );
				float3 unpack52_g39596 = UnpackNormalScale( temp_output_1_0_g39596, temp_output_8_0_g39596 );
				unpack52_g39596.z = lerp( 1, unpack52_g39596.z, saturate(temp_output_8_0_g39596) );
				float3 lerpResult1537_g39591 = lerp( NORMAL_IN1546_g39591 , unpack52_g39596 , _Curvaturewear_BlendMix);
				float3 FINAL_MASKNORMAL_CURVATURE599_g39591 = lerpResult1537_g39591;
				float3 lerpResult1417_g39591 = lerp( FINAL_MASKNORMAL_CURVATURE599_g39591 , localfloat3switch1413_g39591 , MASK_CURVATURE401_g39591);
				float3 m_Active1416_g39591 = lerpResult1417_g39591;
				float3 m_ActiveInverted1416_g39591 = lerpResult1417_g39591;
				float3 localfloat3switch1416_g39591 = float3switch1416_g39591( m_switch1416_g39591 , m_Off1416_g39591 , m_Active1416_g39591 , m_ActiveInverted1416_g39591 );
				
				int m_switch1436_g39591 = _Curvaturewear_Mode;
				int m_switch1435_g39591 = _Verticalwear_Mode;
				int m_switch1434_g39591 = _Horizontalwear_Mode;
				float4 _MASK_B1440_g38079 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_output_977_0_g39591 = ( _MetallicStrength * _MASK_B1440_g38079 );
				float m_Off1434_g39591 = temp_output_977_0_g39591.x;
				float FINAL_MASKMETALLIC_HORIZONTAL1026_g39591 = _Horizontalwear_Metallic;
				float4 temp_cast_55 = (FINAL_MASKMETALLIC_HORIZONTAL1026_g39591).xxxx;
				float4 lerpResult1439_g39591 = lerp( temp_output_977_0_g39591 , temp_cast_55 , MASK_HORIZONTAL808_g39591);
				float m_Active1434_g39591 = lerpResult1439_g39591.x;
				float m_ActiveInverted1434_g39591 = lerpResult1439_g39591.x;
				float localfloatswitch1434_g39591 = floatswitch1434_g39591( m_switch1434_g39591 , m_Off1434_g39591 , m_Active1434_g39591 , m_ActiveInverted1434_g39591 );
				float m_Off1435_g39591 = localfloatswitch1434_g39591;
				float FINAL_MASKMETALLIC_VERTICAL1024_g39591 = _Verticalwear_Metallic;
				float lerpResult1438_g39591 = lerp( localfloatswitch1434_g39591 , FINAL_MASKMETALLIC_VERTICAL1024_g39591 , MASK_VERTICAL602_g39591);
				float m_Active1435_g39591 = lerpResult1438_g39591;
				float m_ActiveInverted1435_g39591 = lerpResult1438_g39591;
				float localfloatswitch1435_g39591 = floatswitch1435_g39591( m_switch1435_g39591 , m_Off1435_g39591 , m_Active1435_g39591 , m_ActiveInverted1435_g39591 );
				float m_Off1436_g39591 = localfloatswitch1435_g39591;
				float4 METALLIC_IN1555_g39591 = temp_output_977_0_g39591;
				float4 temp_cast_58 = (_Curvaturewear_Metallic).xxxx;
				float4 lerpResult1553_g39591 = lerp( METALLIC_IN1555_g39591 , temp_cast_58 , _Curvaturewear_BlendMix);
				float4 FINAL_MASKMETALLIC_CURVATURE1022_g39591 = lerpResult1553_g39591;
				float4 temp_cast_59 = (localfloatswitch1435_g39591).xxxx;
				float4 lerpResult1437_g39591 = lerp( FINAL_MASKMETALLIC_CURVATURE1022_g39591 , temp_cast_59 , MASK_CURVATURE401_g39591);
				float m_Active1436_g39591 = lerpResult1437_g39591.x;
				float m_ActiveInverted1436_g39591 = lerpResult1437_g39591.x;
				float localfloatswitch1436_g39591 = floatswitch1436_g39591( m_switch1436_g39591 , m_Off1436_g39591 , m_Active1436_g39591 , m_ActiveInverted1436_g39591 );
				
				int m_switch1433_g39591 = _Curvaturewear_Mode;
				int m_switch1432_g39591 = _Verticalwear_Mode;
				int m_switch1075_g39591 = _Horizontalwear_Mode;
				int m_switch99_g39551 = _SmoothnessModeSurface;
				int m_switch170_g39551 = _SmoothnessType;
				float4 temp_cast_62 = (_SmoothnessStrength).xxxx;
				float4 m_Smoothness170_g39551 = temp_cast_62;
				float4 temp_cast_63 = (( 1.0 - _SmoothnessStrength )).xxxx;
				float4 m_Roughness170_g39551 = temp_cast_63;
				float4 localfloat4switch170_g39551 = float4switch170_g39551( m_switch170_g39551 , m_Smoothness170_g39551 , m_Roughness170_g39551 );
				float4 FINAL_STANDARD111_g39551 = localfloat4switch170_g39551;
				float4 m_Standard99_g39551 = FINAL_STANDARD111_g39551;
				float3 NORMAL_WORLD_OUT164_g38079 = temp_output_1478_59_g38079;
				float3 temp_output_4_0_g39551 = NORMAL_WORLD_OUT164_g38079;
				float3 temp_output_23_0_g39551 = ddx( temp_output_4_0_g39551 );
				float dotResult25_g39551 = dot( temp_output_23_0_g39551 , temp_output_23_0_g39551 );
				float3 temp_output_7_0_g39551 = ddy( temp_output_4_0_g39551 );
				float dotResult27_g39551 = dot( temp_output_7_0_g39551 , temp_output_7_0_g39551 );
				float temp_output_28_0_g39551 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult25_g39551 + dotResult27_g39551 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
				float4 break377_g38079 = OUT_ALBEDO_RGBA1177_g38079;
				float ALBEDO_R169_g38079 = break377_g38079.r;
				float4 temp_cast_64 = (ALBEDO_R169_g38079).xxxx;
				float4 FINAL_GEOMETRIC114_g39551 = ( temp_output_28_0_g39551 * ( 1.0 - temp_cast_64 ) );
				float4 m_Geometric99_g39551 = FINAL_GEOMETRIC114_g39551;
				int SMOOTHNESS_TYPE173_g39551 = _SmoothnessType;
				int m_switch167_g39551 = SMOOTHNESS_TYPE173_g39551;
				float4 _MASK_G1438_g38079 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_output_83_0_g39551 = _MASK_G1438_g38079;
				float4 m_Smoothness167_g39551 = temp_output_83_0_g39551;
				float4 m_Roughness167_g39551 = ( 1.0 - temp_output_83_0_g39551 );
				float4 localfloat4switch167_g39551 = float4switch167_g39551( m_switch167_g39551 , m_Smoothness167_g39551 , m_Roughness167_g39551 );
				float4 FINAL_SMOOTHNESS_TEXTURE117_g39551 = ( temp_output_28_0_g39551 * localfloat4switch167_g39551 );
				float4 m_Texture99_g39551 = FINAL_SMOOTHNESS_TEXTURE117_g39551;
				float4 localfloat4switch99_g39551 = float4switch99_g39551( m_switch99_g39551 , m_Standard99_g39551 , m_Geometric99_g39551 , m_Texture99_g39551 );
				float4 temp_output_1267_33_g38079 = localfloat4switch99_g39551;
				float4 color301_g38079 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 _MASK_R1439_g38079 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g39580 );
				float4 temp_cast_66 = (IN.ase_color.a).xxxx;
				float4 lerpResult11_g38079 = lerp( _MASK_R1439_g38079 , temp_cast_66 , (float)_OcclusionSourceMode);
				float4 lerpResult14_g38079 = lerp( color301_g38079 , lerpResult11_g38079 , _OcclusionStrengthAO);
				float4 temp_output_989_0_g39591 = ( temp_output_1267_33_g38079 * lerpResult14_g38079 );
				float m_Off1075_g39591 = temp_output_989_0_g39591.x;
				float FINAL_MASKSMOOTHNESS_HORIZONTAL1025_g39591 = _Horizontalwear_Smoothness;
				float4 temp_cast_70 = (FINAL_MASKSMOOTHNESS_HORIZONTAL1025_g39591).xxxx;
				float4 lerpResult1030_g39591 = lerp( temp_output_989_0_g39591 , temp_cast_70 , MASK_HORIZONTAL808_g39591);
				float m_Active1075_g39591 = lerpResult1030_g39591.x;
				float m_ActiveInverted1075_g39591 = lerpResult1030_g39591.x;
				float localfloatswitch1075_g39591 = floatswitch1075_g39591( m_switch1075_g39591 , m_Off1075_g39591 , m_Active1075_g39591 , m_ActiveInverted1075_g39591 );
				float m_Off1432_g39591 = localfloatswitch1075_g39591;
				float FINAL_MASKSMOOTHNESS_VERTICAL1023_g39591 = _Verticalwear_Smoothness;
				float lerpResult1028_g39591 = lerp( localfloatswitch1075_g39591 , FINAL_MASKSMOOTHNESS_VERTICAL1023_g39591 , MASK_VERTICAL602_g39591);
				float m_Active1432_g39591 = lerpResult1028_g39591;
				float m_ActiveInverted1432_g39591 = lerpResult1028_g39591;
				float localfloatswitch1432_g39591 = floatswitch1432_g39591( m_switch1432_g39591 , m_Off1432_g39591 , m_Active1432_g39591 , m_ActiveInverted1432_g39591 );
				float m_Off1433_g39591 = localfloatswitch1432_g39591;
				float4 SMOOTHNESS_IN1554_g39591 = temp_output_989_0_g39591;
				float4 temp_cast_73 = (_Curvaturewear_Smoothness).xxxx;
				float4 lerpResult1552_g39591 = lerp( SMOOTHNESS_IN1554_g39591 , temp_cast_73 , _Curvaturewear_BlendMix);
				float4 FINAL_MASKSMOOTHNESS_CURVATURE1021_g39591 = lerpResult1552_g39591;
				float4 temp_cast_74 = (localfloatswitch1432_g39591).xxxx;
				float4 lerpResult1031_g39591 = lerp( FINAL_MASKSMOOTHNESS_CURVATURE1021_g39591 , temp_cast_74 , MASK_CURVATURE401_g39591);
				float m_Active1433_g39591 = lerpResult1031_g39591.x;
				float m_ActiveInverted1433_g39591 = lerpResult1031_g39591.x;
				float localfloatswitch1433_g39591 = floatswitch1433_g39591( m_switch1433_g39591 , m_Off1433_g39591 , m_Active1433_g39591 , m_ActiveInverted1433_g39591 );
				
				float3 Albedo = localfloat4switch1380_g39591.xyz;
				float3 Normal = localfloat3switch1416_g39591;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = localfloatswitch1436_g39591;
				float Smoothness = localfloatswitch1433_g39591;
				float Occlusion = saturate( lerpResult14_g38079 ).r;
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
4;29.33333;1436.667;767.6667;-647.9491;1191.851;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;290;1374.96,-878.2607;Inherit;False;357.5028;183.4201;DEBUG SETTINGS ;3;293;353;291;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;390;1381.371,-402.9673;Inherit;False;321.6667;123;DESF Common ASE Compile Shaders;1;391;;0,0.2047877,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;295;1376.783,-998.665;Inherit;False;177;113;GLOBAL SETTINGS ;1;379;;0,0,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;395;577.2878,-681.9943;Inherit;False;DESF Core Surface;4;;38079;c3df20d62907cd04086a1eacc41e29d1;19,1352,2,183,2,1382,1,1432,1,1433,1,1434,1,1491,0,1284,2,1446,0,307,0,312,0,1318,0,249,0,1319,0,1336,0,1337,0,1407,0,1443,0,1444,0;2;309;FLOAT3;0,0,0;False;1262;FLOAT4;0,0,0,0;False;10;FLOAT4;42;FLOAT3;39;FLOAT3;1473;COLOR;0;FLOAT4;41;COLOR;43;FLOAT;180;FLOAT;55;FLOAT;281;FLOAT3;313
Node;AmplifyShaderEditor.CommentaryNode;398;1087.032,-1000.518;Inherit;False;271;139;_RECEIVE_SHADOWS_OFF;1;399;;0,0,0,1;0;0
Node;AmplifyShaderEditor.StaticSwitch;399;1095.032,-961.5183;Inherit;False;Property;_RECEIVE_SHADOWS_OFF;Receive Shadows;2;0;Create;False;0;0;0;True;0;False;0;0;0;True;_RECEIVE_SHADOWS_OFF;Toggle;2;Key0;Key1;Fetch;True;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;391;1392.371,-361.9673;Inherit;False;DESF Common ASE Compile Shaders;-1;;39625;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;293;1575.695,-839.256;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;393;1003.359,-678.5361;Inherit;False;DESF Module Grunge;67;;39591;b0925d725c9bfd049b8ad9f4b41a5bd0;3,1487,1,1466,1,1473,1;4;6;FLOAT4;0,0,0,0;False;8;FLOAT3;0,0,0;False;977;FLOAT4;0,0,0,0;False;989;FLOAT4;0,0,0,0;False;4;FLOAT4;0;FLOAT3;9;FLOAT;991;FLOAT;990
Node;AmplifyShaderEditor.IntNode;379;1391.669,-961.5179;Inherit;False;Property;_CullMode;Cull Mode;3;2;[Header];[Enum];Create;False;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;291;1391.189,-838.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1393.431,-766.1531;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;373;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;385;1374.904,-620.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;378;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;False;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;386;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;377;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;375;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;376;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;374;1374.904,-680.6909;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;DEC/Grunge/Grunge Surface Mask Color;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;2;True;379;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=-10;NatureRendererInstancing=True;True;2;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;2;LightMode=UniversalForward;NatureRendererInstancing=True;False;False;6;Include;;False;;Native;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;ed9205546b797304ea7576ba0b32877e;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;Pragma;shader_feature_local _RECEIVE_SHADOWS_OFF;False;;Custom; ;0;0;Standard;38;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,False,-1;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Write Depth;0;  Early Z;0;Vertex Position,InvertActionOnDeselection;1;0;8;False;True;True;True;True;True;True;True;False;;True;0
WireConnection;393;6;395;42
WireConnection;393;8;395;39
WireConnection;393;977;395;0
WireConnection;393;989;395;41
WireConnection;374;0;393;0
WireConnection;374;1;393;9
WireConnection;374;3;393;991
WireConnection;374;4;393;990
WireConnection;374;5;395;43
ASEEND*/
//CHKSM=3208A71E41A7BD2A97EB641B2A7EE7E8166C7F4D