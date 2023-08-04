type LifeStyleModalInterviewProps = {
  question: string;
  answer: string;
  height: number;
};

function LifeStyleModalInterview({
  question,
  answer,
  height,
}: LifeStyleModalInterviewProps) {
  return (
    <div className='font-body3-medium mt-3 mb-8'>
      <span className='text-primary leading-[22px] mr-2'>Q.</span>
      <span className='text-grey-50'>{question}</span>
      <div
        className={`h-[${height}px] mt-2 flex items-center px-3 font-body4-regular text-secondary bg-secondary bg-opacity-10 rounded-l-lg rounded-tr-lg`}
      >
        {answer}
      </div>
    </div>
  );
}

export default LifeStyleModalInterview;
