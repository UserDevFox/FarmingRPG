//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_color;
uniform vec2 u_uv; // Left and right coordinates in texture

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}


void main()
{
	/* 
	// Color all sprite pixels the given color
	vec4 texColour = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(u_color.rgb, texColour.a);
	*/
	
	/*
	// Tint using u_color
	vec4 texColour = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(texColour.rgb * u_color.rgb, texColour.a);
	*/

	/*
	// Gray scale	
	vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    float gray = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
    gl_FragColor = vec4(gray, gray, gray, texColor.a);
	*/
	
	//*
	// Rainbow shader
	float res = (u_uv[1] - u_uv[0]);
	float x_pos = (v_vTexcoord.x - u_uv[0]) / res;
	float phase = 4.0; //4.0;
	float offset = 0.250;//.250;
	vec3 col = vec3(fract((x_pos * phase + offset)), 1.0, 1.0);
    vec4 texColour = texture2D( gm_BaseTexture, v_vTexcoord );

    gl_FragColor = vec4(texColour.rgb * hsv2rgb(col), texColour.a);
	//gl_FragColor = vec4(x_pos, x_pos, x_pos, 1.0);
    //gl_FragColor = vec4(hsv2rgb(col), 1.0);
	
}
