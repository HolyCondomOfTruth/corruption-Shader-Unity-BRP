// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SirCondomShaders/Armor/Nazgul 0.1"
{
	Properties
	{
		_Texture0("Texture 0", 2D) = "white" {}
		[Normal]_Texture1("Texture 1", 2D) = "white" {}
		_Float0("Float 0", Range( 0 , 1)) = 1
		_Scrollspeed("Scroll speed", Float) = 0.1
		_Hot("Hot", Color) = (0,0,0,1)
		_warm("warm", Color) = (0.4141153,0.8867924,0.5513453,0.3843137)
		_Opacity("Opacity", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 5.0
		#pragma surface surf StandardCustomLighting alpha:fade keepalpha noshadow exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float _Opacity;
		uniform sampler2D _Texture0;
		uniform float4 _Texture0_ST;
		uniform float4 _warm;
		uniform float4 _Hot;
		uniform sampler2D _Texture1;
		uniform float4 _Texture1_ST;
		uniform float _Float0;
		uniform float _Scrollspeed;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 uv_Texture0 = i.uv_texcoord * _Texture0_ST.xy + _Texture0_ST.zw;
			float4 temp_output_53_0 = ( _Opacity * tex2D( _Texture0, uv_Texture0 ) );
			float2 uv_Texture1 = i.uv_texcoord * _Texture1_ST.xy + _Texture1_ST.zw;
			float2 panner16 = ( ( _Time.y * _Scrollspeed ) * float2( 0.1,-0.1 ) + float2( 0,0 ));
			float2 uv_TexCoord15 = i.uv_texcoord + panner16;
			float4 lerpResult24 = lerp( _warm , _Hot , tex2D( _Texture0, ( ( (UnpackNormal( tex2D( _Texture1, uv_Texture1 ) )).xy * _Float0 ) + uv_TexCoord15 ) ));
			float4 temp_cast_4 = (6.78).xxxx;
			float4 Color29 = ( pow( lerpResult24 , temp_cast_4 ) * 6.78 );
			float4 temp_output_48_0 = Color29;
			c.rgb = temp_output_48_0.rgb;
			c.a = temp_output_53_0.r;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			float2 uv_Texture0 = i.uv_texcoord * _Texture0_ST.xy + _Texture0_ST.zw;
			float4 temp_output_53_0 = ( _Opacity * tex2D( _Texture0, uv_Texture0 ) );
			o.Albedo = temp_output_53_0.rgb;
			float2 uv_Texture1 = i.uv_texcoord * _Texture1_ST.xy + _Texture1_ST.zw;
			float2 panner16 = ( ( _Time.y * _Scrollspeed ) * float2( 0.1,-0.1 ) + float2( 0,0 ));
			float2 uv_TexCoord15 = i.uv_texcoord + panner16;
			float4 lerpResult24 = lerp( _warm , _Hot , tex2D( _Texture0, ( ( (UnpackNormal( tex2D( _Texture1, uv_Texture1 ) )).xy * _Float0 ) + uv_TexCoord15 ) ));
			float4 temp_cast_1 = (6.78).xxxx;
			float4 Color29 = ( pow( lerpResult24 , temp_cast_1 ) * 6.78 );
			float4 temp_output_48_0 = Color29;
			o.Emission = temp_output_48_0.rgb;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18935
201;73;480;557;2083.751;560.0457;4.15545;False;False
Node;AmplifyShaderEditor.TexturePropertyNode;5;-4055.534,-181.9569;Inherit;True;Property;_Texture1;Texture 1;1;1;[Normal];Create;True;0;0;0;False;0;False;5b4e56cbe10b0ab48ba4a4f8e21be893;5b4e56cbe10b0ab48ba4a4f8e21be893;True;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;20;-3699.402,539.8199;Inherit;False;Property;_Scrollspeed;Scroll speed;3;0;Create;True;0;0;0;False;0;False;0.1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;18;-3684.191,360.6554;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;6;-3707.606,-27.43014;Inherit;True;Property;_TextureSample1;Texture Sample 1;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-3489.813,465.4497;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-3385.747,211.0533;Inherit;False;Property;_Float0;Float 0;2;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;7;-3275.959,22.96766;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;16;-3263.774,384.3025;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,-0.1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-2957.712,137.8664;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;15;-2986.501,283.7457;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;3;-2769.893,-177.6871;Inherit;True;Property;_Texture0;Texture 0;0;0;Create;True;0;0;0;False;0;False;3f0ebc93eb910fa4e83d2dbdc92fedb7;5b4e56cbe10b0ab48ba4a4f8e21be893;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleAddOpNode;14;-2707.601,150.8369;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;4;-2420.173,41.34348;Inherit;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;23;-2018.796,-183.0042;Inherit;False;Property;_Hot;Hot;4;0;Create;True;0;0;0;False;0;False;0,0,0,1;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;22;-2034.817,-355.9847;Inherit;False;Property;_warm;warm;5;0;Create;True;0;0;0;False;0;False;0.4141153,0.8867924,0.5513453,0.3843137;0.4720406,0.7547169,0.3951583,0.2117647;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;28;-1313.987,-107.8112;Inherit;False;Constant;_Float1;Float 1;7;0;Create;True;0;0;0;False;0;False;6.78;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;24;-1600.872,-128.3387;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;26;-1368.733,-361.4049;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-1012.431,-370.0986;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;-665.6935,-329.9603;Inherit;False;Color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;52;-457.1706,431.4333;Inherit;True;Property;_TextureSample2;Texture Sample 2;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;4;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;49;-375.3385,303.1015;Inherit;False;Property;_Opacity;Opacity;6;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;-84.03853,332.7774;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;48;-225.09,161.7137;Inherit;False;29;Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;126.2837,139.8472;Float;False;True;-1;7;ASEMaterialInspector;0;0;CustomLighting;SirCondomShaders/Armor/Nazgul 0.1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;ForwardOnly;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;5;0
WireConnection;19;0;18;0
WireConnection;19;1;20;0
WireConnection;7;0;6;0
WireConnection;16;1;19;0
WireConnection;8;0;7;0
WireConnection;8;1;9;0
WireConnection;15;1;16;0
WireConnection;14;0;8;0
WireConnection;14;1;15;0
WireConnection;4;0;3;0
WireConnection;4;1;14;0
WireConnection;24;0;22;0
WireConnection;24;1;23;0
WireConnection;24;2;4;0
WireConnection;26;0;24;0
WireConnection;26;1;28;0
WireConnection;27;0;26;0
WireConnection;27;1;28;0
WireConnection;29;0;27;0
WireConnection;53;0;49;0
WireConnection;53;1;52;0
WireConnection;0;0;53;0
WireConnection;0;2;48;0
WireConnection;0;9;53;0
WireConnection;0;13;48;0
ASEEND*/
//CHKSM=E3DF623320BADED6D811F64778C6782E8BAF4582