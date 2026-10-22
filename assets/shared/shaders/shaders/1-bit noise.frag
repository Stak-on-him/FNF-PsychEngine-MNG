#pragma header

uniform sampler2D tex1,tex2;

#define tex1 bitmap
uniform float iTime;
uniform float strength;

uniform float step1;
uniform float step2;

#define doAlpha tex1

float randF(vec2 co){
	return fract(sin(dot(co,vec2(12.9898,78.233)))*43758.5453);
}


void main() {

  vec2 uv = openfl_TextureCoordv;
	vec3 video = texture2D(bitmap, uv).rgb;
	float grey = (video.r + video.g + video.b) / 3.;

	// increase contrast (grey = smoothstep(0., 1., grey);) for cool inverted effect
	grey = smoothstep(step1, step2, grey);

	// convert to 1-bit based on noise
	grey = step(grey, randF(uv+iTime/1000.));

    vec3 c = vec3(grey);
    vec2 ogRes = openfl_TextureCoordv *1.002;
    vec4 Color1 = texture2D(bitmap, ogRes);
	c = mix(c.rgb, Color1.rgb, strength);

	gl_FragColor = vec4(c,1.0);
}