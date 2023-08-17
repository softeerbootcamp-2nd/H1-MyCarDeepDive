import { Suspense } from 'react';
import { Outlet, Route, Routes } from 'react-router-dom';
import Loading from './Components/Loading';
import Header from '@/Components/Header';
import LandingPage from '@/Pages/LandingPage';
import QuestionPage from './Pages/RecommendationPage/QuestionPage';
import ResultPage from './Pages/RecommendationPage/ResultPage';
import ColorSelectionPage from './Pages/ColorSelectionPage';
import OptionSelectitonPage from './Pages/OptionSelectitonPage';
import RecommendationPage from '@/Pages/RecommendationPage';
import TrimSelectionPage from './Pages/TrimSelectionPage';
import MyCarResultPage from './Pages/MyCarResultPage';

function App() {
  return (
    <Suspense fallback={<Loading />}>
      <div>
        <Header />
        <Routes>
          <Route path='/' element={<LandingPage />} />
          <Route path='/recommend' element={<RecommendationPage />}>
            <Route path='question/:step' element={<QuestionPage />} />
            <Route path='result/:step' element={<ResultPage />} />
          </Route>
          <Route path='/select' element={<Outlet />}>
            <Route path='trim' element={<TrimSelectionPage />} />
            <Route path='color' element={<ColorSelectionPage />} />
            <Route path='option' element={<OptionSelectitonPage />} />
          </Route>

          <Route path='/mycar/result' element={<MyCarResultPage />} />
        </Routes>
      </div>
    </Suspense>
  );
}

export default App;
