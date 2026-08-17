#pragma header

float zoom = 1;
uniform vec4 _camSize;
void main()
{
    vec2 uv = openfl_TextureCoordv;
    uv = (uv-.5)*2.;
    uv *= zoom;
    
    uv.x *= 1. + pow(abs(uv.y/2.),3.6);
    uv.y *= 1. + pow(abs(uv.x/2.),3.6);
    uv = (uv + 1.)*.5;
    
    vec4 tex = vec4( 
        texture2D(bitmap, uv+.0007).r,
        texture2D(bitmap, uv).g,
        texture2D(bitmap, uv-.0007).b, 
        1.0
    );
    
    tex *= smoothstep(uv.x,uv.x+0.01,1.)*smoothstep(uv.y,uv.y+0.01,1.)*smoothstep(-0.01,0.,uv.x)*smoothstep(-0.01,0.,uv.y);
    
    float bri = 0.8 + (1.0 * uv.x * uv.y) * (1.0 - uv.x) * (1.0 - uv.y);
    float lum = (0.2126 * tex.x + 0.7152 * tex.y + 0.0722 * tex.z);
    bri *= 1 + 0.02 * lum + sin(uv.y * 3.14 * 180.0) * 0.07 * (1.0 - lum);

    tex.x *= bri;
    tex.y *= bri;
    tex.z *= bri;

    float avg = (tex.r+tex.g+tex.b)/3.6;
    gl_FragColor = tex + pow(avg,3.);
}