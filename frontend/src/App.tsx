import { Route, Routes } from "react-router-dom";
import Header from "./Components/Common/Header/Header";
import LandingPage from "./Pages/LandingPage";
import RecommendQuestionPage from "./Pages/RecommendQuestionPage";

function App() {
  return (
    <div>
      <Header />
      <Routes>
        <Route path="/" element={<LandingPage />} />
        <Route path="/recommendQuestion" element={<RecommendQuestionPage />} />
      </Routes>
    </div>
  );
}

export default App;
