import * as THREE from "three";

export function setupCanvas(element: HTMLCanvasElement) {
  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(75, 2, 0.1, 2000);
  const renderer = new THREE.WebGLRenderer({ canvas: element });
  const geometry = new THREE.BoxGeometry(4, 0.1, 1);
  const material = new THREE.MeshBasicMaterial({ color: "white" });
  const cube = new THREE.Mesh(geometry, material);

  const light = new THREE.PointLight(0x0000ff, 10, 10);
  light.position.set(0, 0, 6);
  scene.add(light);

  scene.add(cube);
  camera.position.z = 2;
  renderer.render(scene, camera);
  const animate = () => {
    requestAnimationFrame(animate);
    cube.rotation.x += 0.01;
    cube.rotation.y += 0.005;
    renderer.render(scene, camera);
  };
  animate();
}
