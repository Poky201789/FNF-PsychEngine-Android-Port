#pragma header
vec2 uv = openfl_TextureCoordv.xy;
uniform float force;

void main() {
    float blurAmount = force * 4.0;
    vec4 color = vec4(0.0);
    vec2 texelSize = 1.0 / openfl_TextureSize.xy;

    // Apply a simple box blur
    for (float x = -1.0; x <= 1.0; x += 1.0) {
        for (float y = -1.0; y <= 1.0; y += 1.0) {
            vec2 offset = vec2(x, y) * blurAmount;
            color += texture2D(bitmap, uv + offset * texelSize);
        }
    }

    gl_FragColor = color / 9.0;
}