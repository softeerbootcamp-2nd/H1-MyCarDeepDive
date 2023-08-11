import { Route, Routes } from 'react-router-dom';
import Header from '@/Components/Header';
import LandingPage from '@/Pages/LandingPage';
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
        <Route path='/select/' element={<TrimSelectionPage />} />
      </Routes>
    </div>
  );
}

export default App;
