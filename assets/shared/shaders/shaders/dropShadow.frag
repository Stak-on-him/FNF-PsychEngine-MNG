#pragma header

uniform float offsetX;
uniform float offsetY;
uniform float shadowAlpha;

void main() {
    vec4 baseColor = flixel_texture2D(bitmap, openfl_TextureCoordv);
    vec4 shadowColor = flixel_texture2D(
        bitmap,
        openfl_TextureCoordv + vec2(offsetX / openfl_TextureSize.x, offsetY / openfl_TextureSize.y)
    );

    shadowColor.rgb = vec3(0.0, 0.0, 0.0);
    shadowColor.a *= shadowAlpha;

    gl_FragColor = mix(shadowColor, baseColor, baseColor.a);
}