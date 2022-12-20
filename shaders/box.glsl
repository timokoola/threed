// shader that draws a box borders

float plot(vec2 st) {
    return smoothstep(0.02, 0.0, abs(st.y - st.x));
}

void main() {
    vec2 uv = (gl_FragCoord.xy / iResolution.xx);
    float y = uv.x;
    vec3 color = vec3(y);

        // Plot a line
    float pct = plot(uv);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    gl_FragColor = vec4(color, 1.0);
}