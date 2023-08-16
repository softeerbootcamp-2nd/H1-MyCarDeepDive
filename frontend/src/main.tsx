import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App.tsx';
import './index.css';

import { BrowserRouter } from 'react-router-dom';
import CarProvider from './context/CarProvider.tsx';

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <CarProvider>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </CarProvider>
  </React.StrictMode>,
);
