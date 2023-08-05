import { Route, Routes } from 'react-router-dom';
import Header from '@/Components/Header';
import LandingPage from '@/Pages/LandingPage';
import RecommendQuestionPage from '@/Pages/RecommendQuestionPage';
import RecommendResultPage from '@/Pages/RecommendResultPage';

function App() {
  return (
    <div>
      <Header />
      <Routes>
        <Route path='/' element={<LandingPage />} />
        <Route
          path='/recommend/question/:step'
          element={<RecommendQuestionPage />}
        />
        <Route path='/recommend/result' element={<RecommendResultPage />} />
      </Routes>
    </div>
  );
}

export default App;