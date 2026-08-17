// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// variables which are empty, they need just to avoid crashing shader
uniform vec4 iMouse;

// end of ShadertoyToFlixel header

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    //vec2 muv = iMouse.xy/iResolution.xy;
    
    float t = fract(iTime/0.5);
    
    uv.x -= t;
    uv.x /= 2.0*((1.0-t)-0.5);
    
    uv.y -= 0.5;
    //uv.y /= (pow(t-0.5, 2.0)*4.0+0.5);
    uv.y /= (1.0-((pow(t-0.5, 2.0)*-4.0+1.0)*uv.x))+0.5;
    uv.y *= 1.5;
    uv.y += 0.5;
    
    vec3 col;
    
    float wv = fract(iTime);
    if (wv>0.0&&wv<0.25) {
        col = texture(iChannel0, uv).xyz;
    } else if (wv>0.25&&wv<0.5) {
        col = texture(iChannel0, uv).xyz;
    } else if (wv>0.5&&wv<0.75) {
        uv.x -= 0.5;
        uv.x *= -1.0;
        uv.x += 0.5;
        col = texture(iChannel0, fract(uv)).xyz;
    } else {
        uv.x -= 0.5;
        uv.x *= -1.0;
        uv.x += 0.5;
        col = texture(iChannel0, fract(uv)).xyz;
    }
    //vec3 col = vec3(1.0, uv.x, 0.0);
    if (uv.x>1.0||uv.x<0.0||uv.y>1.0||uv.y<0.0) {col*=0.0;}
    
    fragColor = vec4(col, texture(iChannel0, fragCoord / iResolution.xy).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}