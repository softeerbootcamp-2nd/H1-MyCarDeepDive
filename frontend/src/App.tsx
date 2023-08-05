import { Route, Routes } from 'react-router-dom';
import Header from '@/Components/Header';
import LandingPage from '@/Pages/LandingPage';
import RecommendPage from '@/Pages/RecommendPage';

function App() {
  return (
    <div>
      <Header />
      <Routes>
        <Route path='/' element={<LandingPage />} />
        <Route path='/recommend/:status/:step?' element={<RecommendPage />} />
      </Routes>
    </div>
  );
}

export default App;
