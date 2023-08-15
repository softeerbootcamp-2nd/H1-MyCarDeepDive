import { Outlet, Route, Routes } from 'react-router-dom';
import Header from '@/Components/Header';
import LandingPage from '@/Pages/LandingPage';
import ColorSelectionPage from './Pages/ColorSelectionPage';
import OptionSelectitonPage from './Pages/OptionSelectitonPage';
import RecommendationPage from '@/Pages/RecommendationPage';
import TrimSelectionPage from './Pages/TrimSelectionPage';
import MyCarResultPage from './Pages/MyCarResultPage';

function App() {
  return (
    <div>
      <Header />
      <Routes>
        <Route path='/' element={<LandingPage />} />

        <Route
          path='/recommend/:status/:step'
          element={<RecommendationPage />}
        />
        <Route path='/select' element={<Outlet />}>
          <Route path='trim' element={<TrimSelectionPage />} />
          <Route path='color' element={<ColorSelectionPage />} />
          <Route path='option' element={<OptionSelectitonPage />} />
        </Route>

        <Route path='/mycar/result' element={<MyCarResultPage />} />
      </Routes>
    </div>
  );
}

export default App;
