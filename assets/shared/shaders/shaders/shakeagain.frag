// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

#define FactorA vec2(100.0,100.0)
#define FactorB vec2(1.0,1.0)
#define FactorScale vec2(0.001,0.001)

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
	vec2 uniA = FactorA;
    vec2 uniB = FactorB;
    vec2 uniScale = FactorScale;
    
    vec2 dt = vec2(0.0, 0.0);
    dt.x = sin(iTime * uniA.x + uniB.x) * uniScale.x;
    dt.y = cos(iTime * uniA.y + uniB.y) * uniScale.y;

    // Output to screen
    fragColor = texture(iChannel0,uv+dt);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}