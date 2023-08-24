import { Suspense } from 'react';
import { BrowserRouter } from 'react-router-dom';
import Providers from './context';
import Loading from './Components/Loading';
import Router from './router';

function App() {
  return (
    <BrowserRouter>
      <Providers>
        <Suspense fallback={<Loading />}>
          <Router />
        </Suspense>
      </Providers>
    </BrowserRouter>
  );
}

export default App;
