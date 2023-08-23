import { Outlet, Route, Routes } from 'react-router-dom';
import Layout from '@/Components/Layout';
import LandingPage from '@/Pages/LandingPage';
import QuestionPage from '@/Pages/RecommendationPage/QuestionPage';
import ResultPage from '@/Pages/RecommendationPage/ResultPage';
import ColorSelectionPage from '@/Pages/ColorSelectionPage';
import OptionSelectitonPage from '@/Pages/OptionSelectitonPage';
import RecommendationPage from '@/Pages/RecommendationPage';
import TrimSelectionPage from '@/Pages/TrimSelectionPage';
import MyCarReady from '@/Pages/OptionSelectitonPage/MyCarReady';
import MyCarResultPage from '@/Pages/MyCarResultPage';
import ErrorPage from '@/Pages/ErrorPage';

function Router() {
  return (
    <Routes>
      <Route path='/' element={<Layout />}>
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
      </Route>

      <Route path='/mycar/ready' element={<MyCarReady />} />
      <Route path='/mycar/result' element={<MyCarResultPage />} />
      <Route path='/error/:status' element={<ErrorPage />} />
      <Route path='*' element={<ErrorPage />} />
    </Routes>
  );
}

export default Router;
