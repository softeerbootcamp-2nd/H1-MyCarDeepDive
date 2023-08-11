import { Outlet, Route, Routes } from 'react-router-dom';
import Header from '@/Components/Header';
import LandingPage from '@/Pages/LandingPage';
import ColorSelectionPage from './Pages/ColorSelectionPage';
import OptionSelectitonPage from './Pages/OptionSelectitonPage';
import RecommendationPage from '@/Pages/RecommendationPage';
import TrimSelectionPage from './Pages/TrimSelectionPage';

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
      </Routes>
    </div>
  );
}

export default App;
