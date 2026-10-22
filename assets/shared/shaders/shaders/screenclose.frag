#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

        uniform vec3 iRes;

        vec4 FADE_COLOR = vec4(5.0/255., 5.0/255., 5.0/255., 1.0);
        float BUFFER = 2.0f;
        float SCALE_SPEED = 1.5f;
        
        void main()
        {
            float onePixelScale = (openfl_TextureSize.y - 1.0f) / openfl_TextureSize.y;
            
            float time = mod(iTime * 4.0f, 1.0f / SCALE_SPEED + 1.0f + BUFFER * 2.0f);
            time = clamp(time- BUFFER, 0.0, 1.0f / SCALE_SPEED + 1.0f);
            
            float scaleTime = clamp(time * SCALE_SPEED, 0.0f, onePixelScale);
            float fadeTime = clamp(time - onePixelScale / SCALE_SPEED, 0.0f, 1.0f);
                
            vec2 uv = openfl_TextureCoordv;
            vec2 scaledUV = vec2(
                (uv.x - 0.5f) * (1.0f - scaleTime) + 0.5f,
                (uv.y - 0.5f) / (1.0f - scaleTime) + 0.5f
            );
            
            vec4 textureColor = flixel_texture2D(bitmap, scaledUV) + vec4(scaleTime, scaleTime, scaleTime, 0);
            float fadeOutLevel = 1.0f - fadeTime;
            float cropPixel = min(
                clamp(
                    sign(
                        abs(scaleTime / 2.0f - 0.5) 
                        - abs(uv.y - 0.5f)
                    )
                    , 0.0f, 1.0f
                ), 
                clamp(
                    sign(
                        1.0f - fadeTime
                        - abs(uv.x - 0.5f)
                    ),
                    0.0f, 
                    1.0f
                )
            );
            
            gl_FragColor = mix(
                FADE_COLOR, 
                mix(FADE_COLOR, textureColor, fadeOutLevel), 
                cropPixel
            );
        }