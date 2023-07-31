import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button
          onClick={() => setCount((count) => count + 1)}
          className="bg-primaryd text-primary"
        >
          count is {count}
        </button>
        <p className="font-body4-regular">
          Editand save <span className="font-bold">to test HMR</span>
        </p>
      </div>
      <p className="font-body4-regular">
        Click on the Vite and React{" "}
        <span className="font-h1-bold">logos to learn more</span>
      </p>
    </>
  );
}

export default App;
