import Button from "./Components/Common/Button/Button";
import Header from "./Components/Common/Header/Header";

function App() {
  return (
    <>
      <Header />
      <div className="px-20 mt-[300px]">
        <Button
          width="w-[300px]"
          height="h-[52px]"
          variant="primary"
          text="primary"
          onClick={() => console.log("primary")}
        />
      </div>
    </>
  );
}

export default App;
