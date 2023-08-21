import { Outlet } from 'react-router-dom';
import QuestionProvider from '@/context/QuestionProvider';

function RecommendPage() {
  return (
    <QuestionProvider>
      <Outlet />
    </QuestionProvider>
  );
}

export default RecommendPage;
