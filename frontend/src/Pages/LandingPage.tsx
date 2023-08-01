import Button from "../Components/Common/Button/Button";
import mainVideo from "../assets/video/Home_mp4.mp4";

function LandingPage() {
  return (
    <div className="relative w-full h-screen">
      <div className="fixed top-[143px] left-0 w-full z-10 font-body2-regular text-grey-1000">
        <div className="max-w-5xl mx-auto">
          <p className="text-[28px] leading-[42px]">
            당신의{" "}
            <span className="font-h2-medium">
              <span className=" text-[28px] leading-[42px]">라이프스타일</span>
            </span>
            에 맞게 <br />
            차량을 추천해드려요
          </p>
        </div>
      </div>
      <div className="fixed bottom-[36px] left-0 z-10 w-full flex justify-center gap-2">
        <Button
          width="w-[300px]"
          height="h-[52px]"
          variant="transparent"
          text="직접 만들래요"
          onClick={() => console.log("transparent")}
        />
        <Button
          width="w-[300px]"
          height="h-[52px]"
          variant="white"
          text="추천받기"
          onClick={() => console.log("white")}
        />
      </div>
      <div className="absolute top-0 left-0 w-full h-full z-0">
        <video
          autoPlay
          loop
          muted
          playsInline
          className="w-full h-full object-cover"
        >
          <source src={mainVideo} type="video/mp4" />
        </video>
      </div>
    </div>
  );
}

export default LandingPage;
