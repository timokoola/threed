const scene = new THREE.Scene();

// Geometry
const geometry = new THREE.BoxGeometry(10, 0.11, 4);

// Material
const material = new THREE.MeshBasicMaterial({ color: "lightblue" });

// Mesh
const mesh = new THREE.Mesh(geometry, material);

scene.add(mesh);

const sizes = { width: 800, height: 600 };

// Camera
const camera = new THREE.PerspectiveCamera(75, sizes.width / sizes.height);
camera.position.z = 8;
camera.position.x = 0;
camera.position.y = 3;
scene.add(camera);

// Renderer
const canvas = document.querySelector("canvas.webgl");
console.log(canvas);
const renderer = new THREE.WebGLRenderer({ canvas: canvas });
renderer.setSize(sizes.width, sizes.height);
renderer.render(scene, camera);
