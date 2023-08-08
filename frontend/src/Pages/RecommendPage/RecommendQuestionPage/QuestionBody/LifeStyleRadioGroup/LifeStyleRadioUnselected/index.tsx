import { LifeStyleRadioProps } from '@/global/type';
import LifeStyleTag from '../LifeStyleTag';
import checkCircleGrey from '@/assets/icon/check-circle-lifecycle-grey.svg';

function LifeStyleRadioUnselected({
  onChangeHandler,
  setShowLifeStyleModal,
  data,
}: LifeStyleRadioProps) {
  return (
    <>
      <input
        type='radio'
        id={data.value}
        name='lifeStyle'
        value={data.value}
        className='hidden'
        onChange={onChangeHandler}
      />
      <label htmlFor={data.value}>
        <div className='h-[180px] p-5 rounded-lg relative bg-primary bg-opacity-10 mb-11 cursor-pointer transition-all duration-200 ease-in hover:ring-2 hover:ring-primary hover:ring-inset'>
          <img
            src={data.profileImage}
            alt='lifeStyleProfile2'
            className='absolute right-5 -top-10 w-[88px] h-[88px] rounded-full'
          />
          <div className='flex gap-2'>
            {data.tags.map(item => (
              <LifeStyleTag tagType='unselected' text={item} key={item} />
            ))}
          </div>
          <div className='mt-2.5 flex justify-between items-center'>
            <div className='font-body2-medium text-grey-0 whitespace-pre-line'>
              {data.description}
            </div>
            <img src={checkCircleGrey} alt='checkCircleGrey' />
          </div>
          <hr className='h-px mt-5 bg-grey-900 border-0' />
          <button
            className='w-full pt-2.5 pb-3.5 font-body4-medium text-grey-200 text-center focus:outline-none'
            onClick={() => setShowLifeStyleModal(true)}
          >
            라이프스타일 엿보기
          </button>
        </div>
      </label>
    </>
  );
}

export default LifeStyleRadioUnselected;
