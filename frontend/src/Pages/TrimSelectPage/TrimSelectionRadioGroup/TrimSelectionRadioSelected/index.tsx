import { TrimSelectionRadioGroupProps } from '@/global/type';
import checkCircleBlue from '@/assets/icon/check-circle-lifecycle-blue.svg';

function TrimSelectionRadioSelected({
  carFeature,
  trim,
  mycarTrimHandler,
}: TrimSelectionRadioGroupProps) {
  const { engine, body, operation } = carFeature;
  return (
    <>
      <input
        type='radio'
        name='selectedTrim'
        id={trim?.name}
        value={trim?.name}
        className='hidden'
        onChange={mycarTrimHandler}
      />
      <label htmlFor={trim?.name}>
        <div className='relative cursor-pointer'>
          <div className='flex justify-between pt-6 mb-1'>
            <div className='flex justify-between items-center gap-2 '>
              <p className='font-body4-medium text-grey-300'>{trim?.name}</p>
              <p className='font-caption1-regular text-grey-500'>
                {engine} &middot; {body} &middot; {operation}
              </p>
            </div>

            <img src={checkCircleBlue}></img>
          </div>
          <p className='font-body3-regular text-grey-100 mb-2'>
            {trim?.description}
          </p>
          <p className='font-h2-medium text-grey-0 mb-[14px]'>
            {trim?.price.toLocaleString('en-US')}원
          </p>

          <div className='flex gap-3'>
            <div className='font-body4-medium text-grey-300 whitespace-nowrap'>
              기본 옵션
            </div>

            <div className='mb-6 flex flex-wrap gap-3'>
              {trim?.basicOption.map((option, index) => (
                <p
                  key={index}
                  className='gap-y-[6px] font-body4-regular text-secondary underline underline-offset-4 cursor-pointer'
                >
                  {option}
                </p>
              ))}
            </div>
          </div>
        </div>
      </label>
    </>
  );
}

export default TrimSelectionRadioSelected;