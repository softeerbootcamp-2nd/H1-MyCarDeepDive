import BackgroundVideo from "../Components/LandingPage/BackgroundVideo";
import Buttons from "../Components/LandingPage/Buttons";
import Comment from "../Components/LandingPage/Comment";
import Gradient from "../Components/LandingPage/Gradient";

function LandingPage() {
  return (
    <div className="relative w-full h-screen">
      <Gradient />
      <Comment />
      <Buttons />
      <BackgroundVideo />
    </div>
  );
}

export default LandingPage;
