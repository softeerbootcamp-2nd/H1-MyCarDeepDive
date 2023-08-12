import CheckCircle from '@/assets/icon/check-circle-white.svg';

function ColorRadio({
  data,
  radioHandler,
  radioTarget,
  type,
}: {
  data: {
    name: string;
    chooseRate: number;
    url: string;
    trim?: string;
  }[];
  radioHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
  radioTarget: string;
  type: string;
}) {
  return (
    <div className='flex flex-wrap gap-x-4'>
      {data.map((color, index) => {
        return (
          <div
            key={index}
            className={`flex flex-col w-[68px] ${
              type === 'other' ? 'mb-3' : 'mb-6'
            }`}
          >
            <input
              type='radio'
              id={color.name}
              name={type}
              value={color.name}
              className='hidden'
              onChange={radioHandler}
            />
            <label htmlFor={color.name} className='cursor-pointer'>
              {type === 'other' && (
                <p className='font-body2-bold'>
                  <span className='text-[11px] leading-normal text-secondary'>
                    {color.trim}
                  </span>
                </p>
              )}
              <div className='relative mb-2 flex justify-center items-center'>
                <img
                  src={color.url}
                  alt={`{exterior-${color.name}}`}
                  className={`rounded
            ${
              color.name === '크리미 화이트 펄'
                ? 'border border-grey-700 rounded'
                : ''
            }
            `}
                />
                {color.name === radioTarget && (
                  <>
                    <div className='bg-primary absolute opacity-40 rounded top-0 left-0 w-full h-full z-10'></div>
                    <img src={CheckCircle} alt='' className='absolute z-20' />
                  </>
                )}

                {type === 'exterior' && index < 3 && (
                  <p className='font-caption1-medium bg-grey-300 text-grey-1000 w-10 h-5 flex justify-center items-center rounded-tl rounded-br absolute top-0 left-0'>
                    Top {index + 1}
                  </p>
                )}

                {type === 'interior' && index === 0 && (
                  <p className='font-caption1-medium bg-grey-300 text-grey-1000 w-10 h-5 flex justify-center items-center rounded-tl rounded-br absolute top-0 left-0'>
                    Best
                  </p>
                )}
              </div>
            </label>
            <p className='font-caption1-regular text-grey-100'>{color.name}</p>
          </div>
        );
      })}
    </div>
  );
}

export default ColorRadio;
