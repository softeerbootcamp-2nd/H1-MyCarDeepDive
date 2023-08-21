import { useParams } from 'react-router-dom';

function Step() {
  const { step } = useParams();
  return (
    <div className='w-16 h-9 shrink-0 rounded-[22px] bg-grey-900 flex justify-center items-center'>
      <span className='font-h4-medium'>
        <span className='leading-6 tracking-[-0.2px] text-grey-400'>
          {step}/2
        </span>
      </span>
    </div>
  );
}

export default Step;
