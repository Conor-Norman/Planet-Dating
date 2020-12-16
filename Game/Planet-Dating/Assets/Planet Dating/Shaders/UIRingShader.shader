// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "UIRingShader"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_color("color", Color) = (1,1,1,1)
		_background("background", Color) = (0.1960784,0.1960784,0.1960784,1)
		_edgeoffset("edge offset", Float) = 0.1
		_thickness("thickness", Float) = 0.1
		_Scale("Scale", Range( 1 , 100)) = 1
		_OrbitDisplay("Orbit Display", Range( 0 , 1)) = 1
		[Toggle]_UseOwnDisplayProperty("Use Own Display Property", Float) = 0
		[Toggle]_IsMiddleEmpty("IsMiddleEmpty", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _background;
		uniform float4 _color;
		uniform float _Scale;
		uniform float _edgeoffset;
		uniform float _thickness;
		uniform float _UseOwnDisplayProperty;
		uniform float OrbitUIDisplay;
		uniform float _OrbitDisplay;
		uniform float _IsMiddleEmpty;
		uniform float _Cutoff = 0.5;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 CenteredUV15_g3 = ( i.uv_texcoord - float2( 0.5,0.5 ) );
			float2 break17_g3 = CenteredUV15_g3;
			float2 appendResult23_g3 = (float2(( length( CenteredUV15_g3 ) * 1.0 * 2.0 ) , ( atan2( break17_g3.x , break17_g3.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float temp_output_22_0 = (appendResult23_g3).x;
			float temp_output_133_0 = ( ( _Scale - _edgeoffset ) / _Scale );
			float temp_output_30_0 = step( temp_output_22_0 , ( temp_output_133_0 - ( ( _thickness * (( _UseOwnDisplayProperty )?( _OrbitDisplay ):( OrbitUIDisplay )) ) / _Scale ) ) );
			float4 lerpResult98 = lerp( _background , _color , ( step( temp_output_22_0 , temp_output_133_0 ) - temp_output_30_0 ));
			o.Emission = lerpResult98.rgb;
			o.Alpha = 1;
			float temp_output_97_0 = ( 1.0 - floor( temp_output_22_0 ) );
			clip( (( _IsMiddleEmpty )?( ( temp_output_97_0 - temp_output_30_0 ) ):( temp_output_97_0 )) - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18500
281.5;73;1129;655;1032.312;147.6559;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;137;-2549.436,766.4409;Inherit;False;Global;OrbitUIDisplay;OrbitUIDisplay;7;0;Create;True;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;139;-2634.19,852.3315;Inherit;False;Property;_OrbitDisplay;Orbit Display;5;0;Create;True;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;131;-2311.257,515.6263;Inherit;False;Property;_Scale;Scale;4;0;Create;True;0;0;False;0;False;1;0;1;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-2208.212,654.6321;Inherit;False;Property;_thickness;thickness;3;0;Create;True;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;140;-2305.954,787.2703;Inherit;False;Property;_UseOwnDisplayProperty;Use Own Display Property;6;0;Create;True;0;0;False;0;False;0;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-2169.597,389.9915;Inherit;False;Property;_edgeoffset;edge offset;2;0;Create;True;0;0;False;0;False;0.1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;134;-1909.232,387.1872;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;138;-1915.425,684.5484;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;21;-1890.595,120.5984;Inherit;True;Polar Coordinates;-1;;3;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;132;-1662.269,581.6082;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;22;-1519.225,199.9644;Inherit;False;FLOAT;0;1;2;3;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;133;-1655.269,397.6078;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;34;-1425.575,485.7415;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;96;-1271.911,106.1072;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;30;-1230.587,461.6072;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;23;-1235.552,205.0215;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;97;-1142.911,107.1072;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;141;-829.3047,248.7593;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;6;-599.8828,-127.951;Inherit;False;Property;_color;color;0;0;Create;True;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;94;-597.9509,-305.6244;Inherit;False;Property;_background;background;1;0;Create;True;0;0;False;0;False;0.1960784,0.1960784,0.1960784,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;35;-807.0305,422.5558;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;98;-204.1401,-120.8675;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;142;-551.9465,104.5422;Inherit;False;Property;_IsMiddleEmpty;IsMiddleEmpty;7;0;Create;True;0;0;False;0;False;0;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;113;156.9815,21.00132;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;UIRingShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;140;0;137;0
WireConnection;140;1;139;0
WireConnection;134;0;131;0
WireConnection;134;1;7;0
WireConnection;138;0;8;0
WireConnection;138;1;140;0
WireConnection;132;0;138;0
WireConnection;132;1;131;0
WireConnection;22;0;21;0
WireConnection;133;0;134;0
WireConnection;133;1;131;0
WireConnection;34;0;133;0
WireConnection;34;1;132;0
WireConnection;96;0;22;0
WireConnection;30;0;22;0
WireConnection;30;1;34;0
WireConnection;23;0;22;0
WireConnection;23;1;133;0
WireConnection;97;0;96;0
WireConnection;141;0;97;0
WireConnection;141;1;30;0
WireConnection;35;0;23;0
WireConnection;35;1;30;0
WireConnection;98;0;94;0
WireConnection;98;1;6;0
WireConnection;98;2;35;0
WireConnection;142;0;97;0
WireConnection;142;1;141;0
WireConnection;113;2;98;0
WireConnection;113;10;142;0
ASEEND*/
//CHKSM=DE9955592A09719AA22F2DE1E90B447383644171