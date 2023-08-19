import { Suspense } from 'react';
import { BrowserRouter } from 'react-router-dom';
import CarProvider from './context/CarProvider';
import Loading from './Components/Loading';
import Router from './router';

function App() {
  return (
    <BrowserRouter>
      <CarProvider>
        <Suspense fallback={<Loading />}>
          <Router />
        </Suspense>
      </CarProvider>
    </BrowserRouter>
  );
}

export default App;
