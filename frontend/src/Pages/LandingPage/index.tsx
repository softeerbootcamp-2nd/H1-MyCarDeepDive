import LandingPageWrapper from './LandingPageWrapper';
import BackgroundVideo from './BackgroundVideo';
import Buttons from './Buttons';
import Comment from './Comment';
import Gradient from './Gradient';

function LandingPage() {
  return (
    <LandingPageWrapper>
      <Gradient />
      <Comment />
      <Buttons />
      <BackgroundVideo />
    </LandingPageWrapper>
  );
}

export default LandingPage;
