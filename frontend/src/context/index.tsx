import { WrapperProps } from '@/global/type';
import CarProvider from './CarProvider';
import OptionProvider from './OptionProvider';
import QuestionProvider from './QuestionProvider';

function Providers({ children }: WrapperProps) {
  return (
    <CarProvider>
      <OptionProvider>
        <QuestionProvider>{children}</QuestionProvider>
      </OptionProvider>
    </CarProvider>
  );
}

export default Providers;
