#pragma header
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define time iTime
uniform float xSpeed = 0.0f;
uniform float ySpeed = 0.0f;
uniform float timeMulti = 1.0f;

void main()
{

    vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
    vec2 iResolution = openfl_TextureSize;
    // Normalized pixel coordinates (from 0 to 1)
    //vec2 uv = fragCoord/iResolution.xy;
    
    float time = iTime * timeMulti;
    
    // no floor makes it squiqqly
    float xCoord = floor(fragCoord.x + time * xSpeed * iResolution.x);
    float yCoord = floor(fragCoord.y + time * ySpeed * iResolution.y);
    
    vec2 coord = vec2(xCoord, yCoord);
    coord = mod(coord, iResolution.xy);
 
    
    
    vec2 uv = coord/iResolution.xy;
    // Time varying pixel color
    //vec3 col = 0.5 + 0.5*cos(iTime+uv.xyx+vec3(0,2,4));
    vec4 color = texture(iChannel0, uv);
    
    // Output to screen
    fragColor = color;
}