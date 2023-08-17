import { Suspense } from 'react';
import Loading from './Components/Loading';
import Header from '@/Components/Header';
import Router from './router';

function App() {
  return (
    <Suspense fallback={<Loading />}>
      <Header />
      <Router />
    </Suspense>
  );
}

export default App;
