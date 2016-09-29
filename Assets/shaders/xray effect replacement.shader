Shader "Unlit/xray "
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color("Color",Color) = (1,1,1,1)
	}

	SubShader
	{
		Tags { "RenderType"="Opaque" 
			   "Queue"="Transparent"
		}
		LOD 100
		Ztest always
		Zwrite off
		Blend one one 

		Pass
		{
			CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
           
            struct v2f {
            	float4 vertex : SV_POSITION;
            };

             v2f vert(appdata_full v) {
             	 v2f o;
             	 o.vertex = mul(UNITY_MATRIX_MVP,v.vertex);
             	 return o;
             }

             half4 _Color ;

             fixed4 frag(v2f i) : SV_TARGET {
             	return _Color*0.4;
             }
             ENDCG
		}
	}

	SubShader
	{
		Tags { "RenderType"="TransparentCutout" 
			   "Queue"="Transparent+5"
		}
		Blend one zero
		LOD 100
		Pass
		{
			CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
           
            struct v2f {
            	float4 vertex : SV_POSITION;
            };

             v2f vert(appdata_full v) {
             	 v2f o;
             	 o.vertex = mul(UNITY_MATRIX_MVP,v.vertex);
             	 return o;
             }

             half4 _Color ;

             fixed4 frag(v2f i) : SV_TARGET {
             	return _Color;
             }
             ENDCG
		}
	}
}
