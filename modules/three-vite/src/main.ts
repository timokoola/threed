import "./style.css";
import { setupCanvas } from "./canvas";

document.querySelector<HTMLDivElement>("#app")!.innerHTML = `
 <canvas id="canvas"></canvas>
`;

setupCanvas(document.querySelector<HTMLCanvasElement>("#canvas")!);
