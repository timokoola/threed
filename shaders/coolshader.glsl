#define TAU 6.28318530718

//  color conversionFunction from Iñigo Quiles
//  https://www.shadertoy.com/view/MsS3Wc
vec3 hsb2rgb(in vec3 c) {
    vec3 rgb = clamp(abs(mod(c.x * 6.0 + vec3(0.0, 4.0, 2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0);
    rgb = rgb * rgb * (3.0 - 2.0 * rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void main() {
    vec2 uv = gl_FragCoord.xy / iResolution.xy;
    vec3 color = vec3(0.0);

    // Use polar coordinates instead of cartesian
    vec2 toCenter = vec2(cos(iTime) * 0.15 + 0.5, sin(iTime) * 0.15 + 0.5) - uv;
    float angle = atan(toCenter.y, toCenter.x);
    float radius = length(toCenter) * 2.0;

    // Map the angle (-PI to PI) to the Hue (from 0 to 1)
    // and the Saturation to the radius
    color = hsb2rgb(vec3((iTime * (sin(iTime) + angle) / TAU) + 0.5, radius, 1.0));
    color = hsb2rgb(vec3((20000.0 + iTime * angle / TAU) + 0.5, radius, 1.0));
    gl_FragColor = vec4(color, 1.0);
}