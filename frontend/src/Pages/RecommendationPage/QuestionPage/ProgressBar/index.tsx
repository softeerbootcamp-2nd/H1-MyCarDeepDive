import { useEffect, useState } from 'react';

interface ProgressBarProps {
  step: string;
  prevStep: string | undefined;
}

function ProgressBar({ step, prevStep }: ProgressBarProps) {
  const [reverse, setReverse] = useState(false);

  useEffect(() => {
    if (step === '1') setReverse(prevStep === '2');
    else if (step === '2')
      setReverse(
        prevStep === 'basic' || prevStep === 'addition' || prevStep === '2',
      );
    else setReverse(false);
  }, [step]);

  if (step === 'addition') return;
  return (
    <div className='w-full h-1 bg-grey-800 overflow-hidden fixed top-[92px]'>
      <div
        className={`${step === '1' ? 'w-1/2' : 'w-full'} h-full bg-secondary ${
          reverse ? `progress-bar-${step}-reverse` : `progress-bar-${step}`
        }`}
      ></div>
    </div>
  );
}

export default ProgressBar;
