#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;                // Time in seconds
uniform float zoom;                 // Overall zoom level
uniform float x;                    // X position
uniform float y;                    // Y position
uniform float zoomAngle;            // Zoom rotation in degrees
uniform float showBorderX;          // 0 no vertical border   1 vertical border on
uniform float showBorderY;          // 0 no horizontal border 1 horizontal border on
uniform float borderHue;            // Border hue in HSV 
uniform float borderBrightness;     // Border brightness 
uniform float animationMode;        // Animation mode
uniform float inverseAnim;          // 0 normal direction, 1 inverse 
uniform float stopAnim;             // 0 no stop, 1 stop group1, 2 stop group2, 3 stop group3
uniform float speed;                // Animation speed control
uniform float borderSize;           // Border thickness (If you put <0.05 this is really big)


#define iChannel0 bitmap
#define texture flixel_texture2D

vec3 hsv2rgb(vec3 c) {
    vec3 rgb = clamp(abs(mod(c.x*6.0 + vec3(0.0,4.0,2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0);
    rgb = rgb*rgb*(3.0 - 2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

mat2 rotate2d(float angle) {
    float rad = radians(angle);
    float c = cos(rad);
    float s = sin(rad);
    return mat2(c, -s, s, c);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 padding = vec2(0.0);
    float aspect = 16.0 / 9.0;

    float time = fract(iTime * speed);

    vec2 center = vec2(0.5, 0.5);
    vec2 uv = openfl_TextureCoordv.xy;

    mat2 scaling = mat2(zoom - 0.5, 0.0, 0.0, zoom - 0.5);
    float angInRad = radians(zoomAngle);
    mat2 rotation = mat2(cos(angInRad), -sin(angInRad), sin(angInRad), cos(angInRad));
    mat2 aspectRatioMat = mat2(0.5625, 0.0, 0.0, 1.0);

    vec2 fragCoordAdj = iResolution.xy * uv;
    uv = (fragCoordAdj - 0.5 * iResolution.xy) / iResolution.y;
    uv = scaling * uv;
    uv = aspectRatioMat * (rotation * uv);
    uv += center;

    uv.x += x * 0.5 + 0.25;
    uv.y += y * 0.5 + 0.25;

    uv = (uv - 0.5) * 2.0;

    vec2 uvPad;
    vec2 uvRepeat;
    float oddEven;

    float animOffsetX = 0.0;
    float animOffsetY = 0.0;

    if (animationMode < 0.5) {
        uvPad = uv;
        uvRepeat = fract(uvPad);
    } else if (animationMode < 1.5) {
        float rows = 1.0;
        float rowIndex = floor(uv.y * rows);
        oddEven = mod(rowIndex, 2.0);
        uvPad = uv * rows - vec2(padding.x * 2.0, padding.y * 2.0);
        uvRepeat = fract(uvPad);
        float dirAnim = inverseAnim < 0.5 ? 1.0 : -1.0;
        float animSpeed = time;
        if(stopAnim == 1.0 && oddEven == 0.0) animSpeed = 0.0;
        if(stopAnim == 2.0 && oddEven == 1.0) animSpeed = 0.0;
        animOffsetX = (oddEven == 1.0) ? animSpeed * dirAnim : -animSpeed * dirAnim;
    } else if (animationMode < 2.5) {
        float columns = 1.0;
        float columnIndex = floor(uv.x * columns);
        oddEven = mod(columnIndex, 2.0);
        uvPad = uv * columns - vec2(padding.x * 2.0, padding.y * 2.0);
        uvRepeat = fract(uvPad);
        float dirAnim = inverseAnim < 0.5 ? 1.0 : -1.0;
        float animSpeed = time;
        if(stopAnim == 1.0 && oddEven == 0.0) animSpeed = 0.0;
        if(stopAnim == 2.0 && oddEven == 1.0) animSpeed = 0.0;
        animOffsetY = (oddEven == 1.0) ? -animSpeed * dirAnim : animSpeed * dirAnim;
    } else if (animationMode < 3.5) {
        float columns = 1.0;
        float columnIndex = floor(uv.x * columns);
        oddEven = mod(columnIndex, 2.0);
        uvPad = uv * columns - vec2(padding.x * 2.0, padding.y * 2.0);
        uvRepeat = fract(uvPad);
        float dirAnim = inverseAnim < 0.5 ? 1.0 : -1.0;
        float animSpeed = time;
        if(stopAnim == 1.0 && oddEven == 0.0) animSpeed = 0.0;
        if(stopAnim == 2.0 && oddEven == 1.0) animSpeed = 0.0;
        animOffsetY = (oddEven == 1.0) ? animSpeed * dirAnim : -animSpeed * dirAnim;
    } else if (animationMode < 4.5) {
        uvPad = uv;
        uvRepeat = fract(uvPad);
        float dirAnim = inverseAnim < 0.5 ? 1.0 : -1.0;
        float animSpeed = time;
        if(stopAnim == 1.0) animSpeed = 0.0;
        if(stopAnim == 2.0) animSpeed = 0.0;
        animOffsetX = animSpeed * dirAnim;
    } else if (animationMode < 5.5) {
        float rows = 1.0;
        float rowIndex = floor(uv.y * rows);
        float groupMod3 = mod(rowIndex, 3.0);
        uvPad = uv * rows - vec2(padding.x * 2.0, padding.y * 2.0);
        uvRepeat = fract(uvPad);
        float dirAnimGroup;
        if (groupMod3 == 0.0) {
            dirAnimGroup = (inverseAnim < 0.5) ? 1.0 : -1.0;
        } else if (groupMod3 == 1.0) {
            dirAnimGroup = (inverseAnim < 0.5) ? -1.0 : 1.0;
        } else {
            dirAnimGroup = 1.0;
        }
        float animSpeed = time;
        if(stopAnim == 1.0 && groupMod3 == 0.0) animSpeed = 0.0;
        if(stopAnim == 2.0 && groupMod3 == 1.0) animSpeed = 0.0;
        if(stopAnim == 3.0 && groupMod3 == 2.0) animSpeed = 0.0;
        animOffsetX = animSpeed * dirAnimGroup;
    } else {
        float columns = 1.0;
        float columnIndex = floor(uv.x * columns);
        float groupMod3 = mod(columnIndex, 3.0);
        uvPad = uv * columns - vec2(padding.x * 2.0, padding.y * 2.0);
        uvRepeat = fract(uvPad);
        float dirAnimGroup;
        if (groupMod3 == 0.0) {
            dirAnimGroup = (inverseAnim < 0.5) ? 1.0 : -1.0;
        } else if (groupMod3 == 1.0) {
            dirAnimGroup = (inverseAnim < 0.5) ? -1.0 : 1.0;
        } else {
            dirAnimGroup = 1.0;
        }
        float animSpeed = time;
        if(stopAnim == 1.0 && groupMod3 == 0.0) animSpeed = 0.0;
        if(stopAnim == 2.0 && groupMod3 == 1.0) animSpeed = 0.0;
        if(stopAnim == 3.0 && groupMod3 == 2.0) animSpeed = 0.0;
        animOffsetY = animSpeed * dirAnimGroup;
    }

    uvRepeat = fract(uvRepeat + vec2(animOffsetX, animOffsetY));

    uvRepeat.x = uvRepeat.x * (1.0 - 2.0 * padding.x) + padding.x;
    uvRepeat.y = uvRepeat.y * (1.0 - 2.0 * padding.y) + padding.y;

    float distX = abs(uvRepeat.x - 0.5);
    float distY = abs(uvRepeat.y - 0.5);

    float borderThickness = max(borderSize, 0.001);
    float innerEdge = 0.5 - borderThickness;
    float smoothness = borderThickness * 0.25;

    float alphaX = smoothstep(innerEdge, innerEdge + smoothness, distX) * showBorderX;
    float alphaY = smoothstep(innerEdge, innerEdge + smoothness, distY) * showBorderY;
    float alpha = max(alphaX, alphaY);

    float sat = (borderBrightness > 1.0) ? 0.0 : 1.0;
    float val = clamp(borderBrightness, 0.0, 1.0);

    vec3 borderRgb = hsv2rgb(vec3(borderHue, sat, val));
    vec4 borderColor = vec4(borderRgb, 1.0);

    vec4 texColor = texture(iChannel0, uvRepeat);
    fragColor = mix(texColor, borderColor, alpha);
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}