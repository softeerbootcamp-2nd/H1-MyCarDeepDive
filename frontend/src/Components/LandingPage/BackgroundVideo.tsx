import mainVideo from '../../assets/video/Home_mp4.mp4';

function BackgroundVideo() {
  return (
    <div className='absolute top-0 left-0 w-full h-full z-0'>
      <video
        autoPlay
        loop
        muted
        playsInline
        className='w-full h-full object-cover'
      >
        <source src={mainVideo} type='video/mp4' />
      </video>
    </div>
  );
}

export default BackgroundVideo;
