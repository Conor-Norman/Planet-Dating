// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "2DPlanet_Generated_SRP"
{
	Properties
	{
		_SurfaceAlbedo("Surface Albedo", 2D) = "white" {}
		[Normal]_SurfaceNormal("Surface Normal", 2D) = "gray" {}
		_NormalScale("Normal Scale", Float) = 1
		[Toggle]_FlipNormalY("Flip Normal Y", Float) = 0
		_SurfaceRoughness("Surface Roughness", 2D) = "white" {}
		[Toggle]_InvertRoughness("Invert Roughness", Float) = 0
		_SurfaceAO("Surface AO", 2D) = "black" {}
		[Toggle]_UseAlbedoLuminforEmis("Use Albedo Lumin for Emis", Float) = 1
		[HDR]_EmissionColor("Emission Color", Color) = (0,0,0,0)
		_SurfaceEmission("Surface Emission", 2D) = "white" {}
		[Toggle]_InvertEmission("Invert Emission", Float) = 0
		_EmissionPower("Emission Power", Float) = 4
		_Tiling_Offset("Tiling_Offset", Vector) = (1,1,0,0)
		_RotateSpeed("Rotate Speed", Float) = 0
		_Keyframe("Keyframe", Float) = 0
		[Toggle]_UseKeyframes("Use Keyframes", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		AlphaToMask On
		CGINCLUDE
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _FlipNormalY;
		uniform sampler2D _SurfaceNormal;
		uniform float _UseKeyframes;
		uniform float _RotateSpeed;
		uniform float _Keyframe;
		uniform float4 _Tiling_Offset;
		uniform float _NormalScale;
		uniform sampler2D _SurfaceAlbedo;
		uniform float _UseAlbedoLuminforEmis;
		uniform float _InvertEmission;
		uniform sampler2D _SurfaceEmission;
		uniform float _EmissionPower;
		uniform float4 _EmissionColor;
		uniform float _InvertRoughness;
		uniform sampler2D _SurfaceRoughness;
		uniform sampler2D _SurfaceAO;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float mulTime91 = _Time.y * _RotateSpeed;
			float2 CenteredUV15_g2 = ( i.uv_texcoord - float2( 0.5,0.5 ) );
			float2 break17_g2 = CenteredUV15_g2;
			float2 appendResult23_g2 = (float2(( length( CenteredUV15_g2 ) * 1.0 * 2.0 ) , ( atan2( break17_g2.x , break17_g2.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float2 break26 = appendResult23_g2;
			float temp_output_61_0 = sqrt( ( 1.0 - break26.x ) );
			float2 appendResult27 = (float2(( 1.0 - temp_output_61_0 ) , break26.y));
			float2 break12 = (float2( 0,0 ) + (appendResult27 - float2( 0,-0.5 )) * (float2( 1,1 ) - float2( 0,0 )) / (float2( 1,0.5 ) - float2( 0,-0.5 )));
			float temp_output_13_0 = ( break12.y * ( 2.0 * UNITY_PI ) );
			float2 appendResult77 = (float2(( ( ( (( _UseKeyframes )?( _Keyframe ):( mulTime91 )) + (-( break12.x * sin( temp_output_13_0 ) )).x ) * _Tiling_Offset.x ) + _Tiling_Offset.z ) , ( _Tiling_Offset.w + ( _Tiling_Offset.y * (0.0 + (-( break12.x * cos( temp_output_13_0 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) )));
			float2 planetUV127 = appendResult77;
			float3 tex2DNode101 = UnpackScaleNormal( tex2D( _SurfaceNormal, planetUV127 ), _NormalScale );
			float3 appendResult35 = (float3(-( break12.x * sin( temp_output_13_0 ) ) , -( break12.x * cos( temp_output_13_0 ) ) , temp_output_61_0));
			float3 normalizeResult68 = normalize( BlendNormals( (( _FlipNormalY )?( ( tex2DNode101 * float3( 1,-1,1 ) ) ):( tex2DNode101 )) , appendResult35 ) );
			o.Normal = normalizeResult68;
			float4 tex2DNode84 = tex2D( _SurfaceAlbedo, planetUV127 );
			o.Albedo = tex2DNode84.rgb;
			float4 tex2DNode146 = tex2D( _SurfaceEmission, planetUV127 );
			float4 temp_cast_1 = (pow( (( _InvertEmission )?( ( 1.0 - tex2DNode146.r ) ):( tex2DNode146.r )) , _EmissionPower )).xxxx;
			float luminance144 = Luminance(tex2DNode84.rgb);
			float temp_output_43_0 = step( break26.x , 1.0 );
			o.Emission = ( ( (( _UseAlbedoLuminforEmis )?( ( pow( luminance144 , _EmissionPower ) * tex2DNode84 ) ):( temp_cast_1 )) * _EmissionColor ) * temp_output_43_0 ).rgb;
			float4 tex2DNode125 = tex2D( _SurfaceRoughness, planetUV127 );
			o.Smoothness = (( _InvertRoughness )?( ( 1.0 - tex2DNode125.r ) ):( tex2DNode125.r ));
			o.Occlusion = tex2D( _SurfaceAO, planetUV127 ).r;
			o.Alpha = temp_output_43_0;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			AlphaToMask Off
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			sampler3D _DitherMaskLOD;
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				half alphaRef = tex3D( _DitherMaskLOD, float3( vpos.xy * 0.25, o.Alpha * 0.9375 ) ).a;
				clip( alphaRef - 0.01 );
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18712
340;73;1148;655;2760.28;1070.781;2.365801;True;False
Node;AmplifyShaderEditor.CommentaryNode;72;-6187.326,435.5507;Inherit;False;1339.335;683.4196;Sphere Shape/Mask;8;3;26;27;62;59;61;169;170;;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;3;-6148.554,622.2838;Inherit;False;Polar Coordinates;-1;;2;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;26;-5883.334,622.3206;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.OneMinusNode;59;-5605.486,859.4611;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SqrtOpNode;61;-5591.552,932.8607;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;62;-5609.502,1005.773;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;27;-5376.593,856.4852;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;170;-5187.189,801.1251;Inherit;False;286;288.0001;Comment;1;10;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCRemapNode;10;-5162.189,856.1251;Inherit;True;5;0;FLOAT2;0,0;False;1;FLOAT2;0,-0.5;False;2;FLOAT2;1,0.5;False;3;FLOAT2;0,0;False;4;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;71;-4260.683,1537.402;Inherit;False;1194.479;343.946;Normals;10;35;66;105;19;18;16;15;13;12;14;;0.5,0.5,1,1;0;0
Node;AmplifyShaderEditor.PiNode;14;-4189.856,1741.67;Inherit;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;12;-4227.285,1609.384;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-3970.569,1685.372;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;15;-3796.3,1633.112;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;83;-2618.455,1180.681;Inherit;False;1816.006;823.6034;BaseUVs;14;178;127;77;163;165;97;100;177;99;82;168;166;91;86;;0.5,0.5,0,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-3644.604,1606.469;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CosOpNode;18;-3792.178,1733.54;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;86;-2558.594,1262.799;Inherit;False;Property;_RotateSpeed;Rotate Speed;13;0;Create;True;0;0;0;False;0;False;0;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;166;-2318.772,1384.12;Inherit;False;Property;_Keyframe;Keyframe;15;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;105;-3481.818,1607.314;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;91;-2340.128,1300.597;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-3643.178,1707.541;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;168;-2138.221,1322.725;Inherit;False;Property;_UseKeyframes;Use Keyframes;16;0;Create;True;0;0;0;False;0;False;0;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;82;-2110.572,1458.431;Inherit;False;FLOAT;0;1;2;3;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;66;-3483.323,1707.23;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;178;-1963.747,1765.436;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;177;-1885.141,1540.767;Inherit;False;Property;_Tiling_Offset;Tiling_Offset;12;0;Create;True;0;0;0;False;0;False;1,1,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;99;-1891.706,1386.877;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;100;-1649.317,1734.753;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;97;-1648.529,1457.211;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;165;-1474.703,1649.545;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;163;-1475.846,1514.553;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;77;-1290.907,1573.554;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;143;-2610.367,-150.9895;Inherit;False;2153.546;1253.377;Texture Mapping;24;110;129;142;68;162;140;130;103;154;152;145;141;125;151;153;139;167;101;149;147;150;144;84;146;;0,0.6603774,0.08383965,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;127;-1025.709,1568.235;Inherit;False;planetUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;129;-2549.866,429.6411;Inherit;False;127;planetUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;146;-2120.396,-76.48294;Inherit;True;Property;_SurfaceEmission;Surface Emission;9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;84;-2128.718,156.6062;Inherit;True;Property;_SurfaceAlbedo;Surface Albedo;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;110;-2555.828,522.1165;Inherit;False;Property;_NormalScale;Normal Scale;2;0;Create;True;0;0;0;False;0;False;1;1.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LuminanceNode;144;-1776.331,126.2809;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;147;-1777.682,23.80996;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;150;-1806.544,244.4975;Inherit;False;Property;_EmissionPower;Emission Power;11;0;Create;True;0;0;0;False;0;False;4;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;167;-1589.955,-50.97122;Inherit;False;Property;_InvertEmission;Invert Emission;10;0;Create;True;0;0;0;False;0;False;0;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;149;-1556.472,166.3646;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;101;-2143.312,391.5782;Inherit;True;Property;_SurfaceNormal;Surface Normal;1;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;gray;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;2;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;139;-1802.535,467.0314;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1,-1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;151;-1331.857,126.3763;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;153;-1336.588,4.9157;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;169;-5186.56,482.9463;Inherit;False;285;304;Mask;1;43;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ToggleSwitchNode;145;-1136.057,-0.6084778;Inherit;False;Property;_UseAlbedoLuminforEmis;Use Albedo Lumin for Emis;7;0;Create;True;0;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;152;-1084.597,126.4592;Inherit;False;Property;_EmissionColor;Emission Color;8;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;125;-2132.441,635.6132;Inherit;True;Property;_SurfaceRoughness;Surface Roughness;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;141;-1629.511,392.516;Inherit;False;Property;_FlipNormalY;Flip Normal Y;3;0;Create;True;0;0;0;False;0;False;0;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;35;-3286.137,1635.989;Inherit;True;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StepOpNode;43;-5136.56,544.9463;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;103;-1355.344,467.9022;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;130;-1795.764,741.1129;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;154;-841.781,48.25858;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;162;-672.9493,132.8889;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.NormalizeNode;68;-1118.806,468.5571;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;140;-2133.167,874.8081;Inherit;True;Property;_SurfaceAO;Surface AO;6;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;142;-1598.676,656.1121;Inherit;False;Property;_InvertRoughness;Invert Roughness;5;0;Create;True;0;0;0;False;0;False;0;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;161;-256.6961,328.4984;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;2DPlanet_Generated_SRP;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;True;TransparentCutout;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;14;-1;-1;-1;0;True;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;26;0;3;0
WireConnection;59;0;26;0
WireConnection;61;0;59;0
WireConnection;62;0;61;0
WireConnection;27;0;62;0
WireConnection;27;1;26;1
WireConnection;10;0;27;0
WireConnection;12;0;10;0
WireConnection;13;0;12;1
WireConnection;13;1;14;0
WireConnection;15;0;13;0
WireConnection;16;0;12;0
WireConnection;16;1;15;0
WireConnection;18;0;13;0
WireConnection;105;0;16;0
WireConnection;91;0;86;0
WireConnection;19;0;12;0
WireConnection;19;1;18;0
WireConnection;168;0;91;0
WireConnection;168;1;166;0
WireConnection;82;0;105;0
WireConnection;66;0;19;0
WireConnection;178;0;66;0
WireConnection;99;0;168;0
WireConnection;99;1;82;0
WireConnection;100;0;177;2
WireConnection;100;1;178;0
WireConnection;97;0;99;0
WireConnection;97;1;177;1
WireConnection;165;0;177;4
WireConnection;165;1;100;0
WireConnection;163;0;97;0
WireConnection;163;1;177;3
WireConnection;77;0;163;0
WireConnection;77;1;165;0
WireConnection;127;0;77;0
WireConnection;146;1;129;0
WireConnection;84;1;129;0
WireConnection;144;0;84;0
WireConnection;147;0;146;1
WireConnection;167;0;146;1
WireConnection;167;1;147;0
WireConnection;149;0;144;0
WireConnection;149;1;150;0
WireConnection;101;1;129;0
WireConnection;101;5;110;0
WireConnection;139;0;101;0
WireConnection;151;0;149;0
WireConnection;151;1;84;0
WireConnection;153;0;167;0
WireConnection;153;1;150;0
WireConnection;145;0;153;0
WireConnection;145;1;151;0
WireConnection;125;1;129;0
WireConnection;141;0;101;0
WireConnection;141;1;139;0
WireConnection;35;0;105;0
WireConnection;35;1;66;0
WireConnection;35;2;61;0
WireConnection;43;0;26;0
WireConnection;103;0;141;0
WireConnection;103;1;35;0
WireConnection;130;0;125;1
WireConnection;154;0;145;0
WireConnection;154;1;152;0
WireConnection;162;0;154;0
WireConnection;162;1;43;0
WireConnection;68;0;103;0
WireConnection;140;1;129;0
WireConnection;142;0;125;1
WireConnection;142;1;130;0
WireConnection;161;0;84;0
WireConnection;161;1;68;0
WireConnection;161;2;162;0
WireConnection;161;4;142;0
WireConnection;161;5;140;1
WireConnection;161;9;43;0
ASEEND*/
//CHKSM=FE0434A169C3B4CAAC98E99715DFE37E7293E024