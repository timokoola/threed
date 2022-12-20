// From book of shaders, simple step function

float plot(vec2 st, float pct) {
    return smoothstep(pct - 0.02, pct, st.y) -
        smoothstep(pct, pct + 0.02, st.y);
}

float fuzzyPlot(vec2 st, float pct, float fuzziness) {
    return smoothstep(pct - fuzziness, pct, st.y) -
        smoothstep(pct, pct + fuzziness, st.y);
}

void main() {
    vec2 uv = gl_FragCoord.xy / iResolution.xy;

    // Step will return 0.0 unless the value is over 0.5,
    // in that case it will return 1.0
    float y = step(0.5, uv.x);

    vec3 color = vec3(y);

    //float pct = plot(uv, y);
    float pct = fuzzyPlot(uv, y, abs(sin(mod(iTime, 0.2))));
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    gl_FragColor = vec4(color, 1.0);
}