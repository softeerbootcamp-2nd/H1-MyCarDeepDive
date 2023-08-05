import BackgroundVideo from './BackgroundVideo';
import Buttons from './Buttons';
import Comment from './Comment';
import Gradient from './Gradient';

function LandingPage() {
  return (
    <div className='relative w-full h-screen'>
      <Gradient />
      <Comment />
      <Buttons />
      <BackgroundVideo />
    </div>
  );
}

export default LandingPage;
