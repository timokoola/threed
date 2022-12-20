// draw a box

//uniform vec3 iResolution;   
// viewport resolution (in pixels)
//uniform vec4 iMouse;        
// mouse pixel coords. xy: current, zw: click
//uniform float iTime;        
// shader playback time (in seconds)

void main() {
  vec2 uv = (gl_FragCoord.xy / iResolution.xx) + sin(iTime);
  gl_FragColor = vec4(abs(sin(uv.x)), abs(cos(uv.y)), abs(sin(uv.x)), 1.0);
}