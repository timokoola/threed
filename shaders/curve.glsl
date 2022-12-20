// shader that draws a curve

//uniform vec3 iResolution;   
// viewport resolution (in pixels)
//uniform vec4 iMouse;        
// mouse pixel coords. xy: current, zw: click
//uniform float iTime;        
// shader playback time (in seconds)

float plot(vec2 st, float pct) {
    return smoothstep(pct - 0.02, pct, st.y) -
        smoothstep(pct, pct + 0.02, st.y);
}

float fuzzyPlot(vec2 st, float pct, float fuzziness) {
    return smoothstep(pct - fuzziness, pct, st.y) -
        smoothstep(pct, pct + fuzziness, st.y);
}

void main() {
    vec2 uv = (gl_FragCoord.xy / iResolution.xx);

    float y = pow(uv.x, 1.0 + abs(sin(mod(iTime, 8.0))));

    vec3 color = vec3(y);

    float pct = fuzzyPlot(uv, y, abs(sin(mod(iTime, 0.2))));
    float pct2 = fuzzyPlot(uv, y, abs(cos(mod(iTime, 1.2))));
    color = (1.0 - pct) * color + 0.8 * pct2 * vec3(0.0, 0.5, 0.8) + 0.2 * pct * vec3(0.8, 0.5, 0.0);

    gl_FragColor = vec4(color, 1.0);

}