import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import Button from "./Components/Common/Button/Button";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <div className="ml-12">
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
      <div className="ml-12 mt-12 p-12 bg-grey-300 flex flex-col gap-3">
        <Button
          width="w-[300px]"
          height="h-[52px]"
          variant="primary"
          text="primary"
          onClick={() => console.log("primary")}
        />
        <Button
          width="w-[300px]"
          height="h-[52px]"
          variant="secondary"
          text="secondary"
          onClick={() => console.log("secondary")}
        />
        <Button
          width="w-[300px]"
          height="h-[52px]"
          variant="white"
          text="white"
          onClick={() => console.log("white")}
        />
        <Button
          width="w-[300px]"
          height="h-[52px]"
          variant="transparent"
          text="transparent"
          onClick={() => console.log("transparent")}
        />
      </div>
    </>
  );
}

export default App;
