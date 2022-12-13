import * as THREE from "three";

function getVertexShader() {
  return `
    varying vec3 vUv; 

    void main() {
      vUv = position; 

      vec4 modelViewPosition = modelViewMatrix * vec4(position, 1.0);
      gl_Position = projectionMatrix * modelViewPosition; 
    }
  `;
}

function getFragmentShader() {
  return `
  uniform vec3 colorA; 
  uniform vec3 colorB; 
  uniform float u_time;
  varying vec3 vUv;

  void main() {
    gl_FragColor = vec4(abs(cos(u_time)), 0.4, abs(sin(u_time)), 1.0);
  }
    `;
}

export function setupCanvas(element: HTMLCanvasElement) {
  const canvasSizes = {
    width: 600,
    height: 400,
  };
  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(
    75,
    canvasSizes.width / canvasSizes.height
  );
  const renderer = new THREE.WebGLRenderer({ canvas: element });
  const geometry = new THREE.BoxGeometry(2, 0.1, 1);
  const material = new THREE.MeshBasicMaterial({ color: "white" });
  const cube = new THREE.Mesh(geometry, material);

  scene.add(cube);
  camera.position.z = 3;
  camera.position.y = 0.3;

  // shader cube
  let uniforms = {
    colorB: { type: "vec3", value: new THREE.Color(0xacb6e5) },
    colorA: { type: "vec3", value: new THREE.Color(0x74ebd5) },
    u_time: { type: "f", value: 1.0 },
  };

  let geometry2 = new THREE.BoxGeometry(1, 1, 1);
  let material2 = new THREE.ShaderMaterial({
    uniforms: uniforms,
    fragmentShader: getFragmentShader(),
    vertexShader: getVertexShader(),
  });

  let mesh = new THREE.Mesh(geometry2, material2);
  mesh.position.x = 2;
  scene.add(mesh);

  const axesHelper = new THREE.AxesHelper(5);
  scene.add(axesHelper);

  let time = 0;

  renderer.render(scene, camera);
  renderer.setSize(canvasSizes.width, canvasSizes.height);
  const animate = () => {
    requestAnimationFrame(animate);
    mesh.rotation.x -= 0.01;
    mesh.rotation.y -= 0.005;
    cube.rotation.x = 1;
    uniforms.u_time.value = time;
    time += 0.01;
    renderer.render(scene, camera);
  };
  animate();
}
