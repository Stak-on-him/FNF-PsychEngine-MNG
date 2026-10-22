#pragma header

// BLOOM/BLUR SHADER BY BBPANZU (editied by GENZU)

float dim = 1.8;
float Directions = 20.0;
float Quality = 7.0; 
float Size = 12.0;

void main(void)
{ 
    vec2 uv = openfl_TextureCoordv.xy;
    vec2 Radius = Size / openfl_TextureSize.xy;

    float Pi = 6.28318530718; // Pi*2
    vec4 Color = texture2D(bitmap, uv);
    
    for (float d = 0.0; d < Pi; d += Pi / Directions) {
        for (float i = 1.0 / Quality; i <= 1.0; i += 1.0 / Quality) {
            float ex = cos(d) * Radius.x * i;
            float why = sin(d) * Radius.y * i;
            Color += flixel_texture2D(bitmap, uv + vec2(ex, why));
        }
    }
    
    Color /= (dim * Quality) * Directions - 15.0;
    vec4 bloom = (flixel_texture2D(bitmap, uv) / dim) + Color;
    gl_FragColor = bloom;
}
