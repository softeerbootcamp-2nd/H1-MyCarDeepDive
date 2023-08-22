import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App.tsx';
import './index.css';

import { BrowserRouter } from 'react-router-dom';
import CarProvider from './context/CarProvider';
import OptionProvider from './context/OptionProvider/index.tsx';

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <BrowserRouter>
      <CarProvider>
        <OptionProvider>
          <App />
        </OptionProvider>
      </CarProvider>
    </BrowserRouter>
  </React.StrictMode>,
);
