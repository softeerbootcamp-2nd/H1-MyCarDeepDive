import { WrapperProps } from '@/global/type';
import CarProvider from './CarProvider';
import OptionProvider from './OptionProvider';
import QuestionProvider from './QuestionProvider';
import CacheProvider from './CacheProvider';

function Providers({ children }: WrapperProps) {
  return (
    <CarProvider>
      <OptionProvider>
        <QuestionProvider>
          <CacheProvider>{children}</CacheProvider>
        </QuestionProvider>
      </OptionProvider>
    </CarProvider>
  );
}

export default Providers;
