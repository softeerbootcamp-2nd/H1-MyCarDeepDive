import { WrapperProps } from '@/global/type';
import { BrowserRouter } from 'react-router-dom';
import CarProvider from '@/context/CarProvider';

function Wrapper({ children }: WrapperProps) {
  return (
    <BrowserRouter>
      <CarProvider>{children}</CarProvider>
    </BrowserRouter>
  );
}

export default Wrapper;
