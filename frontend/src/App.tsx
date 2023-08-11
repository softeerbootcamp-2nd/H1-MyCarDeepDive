import { Outlet, Route, Routes } from 'react-router-dom';
import Header from '@/Components/Header';
import LandingPage from '@/Pages/LandingPage';
import RecommendPage from '@/Pages/RecommendPage';
import TrimSelectPage from './Pages/TrimSelectPage';
import ColorSelectPage from './Pages/ColorSelectPage';
import OptionSelectPage from './Pages/OptionSelectPage';

function App() {
  return (
    <div>
      <Header />
      <Routes>
        <Route path='/' element={<LandingPage />} />
        <Route path='/recommend/:status/:step' element={<RecommendPage />} />
        <Route path='/select' element={<Outlet />}>
          <Route path='trim' element={<TrimSelectPage />} />
          <Route path='color' element={<ColorSelectPage />} />
          <Route path='option' element={<OptionSelectPage />} />
        </Route>
      </Routes>
    </div>
  );
}

export default App;
