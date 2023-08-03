import checkCircleBlue from '../../../assets/icon/check-circle-lifecycle-blue.svg';
import { LifeStyleRadioProps } from '../../../global/type';
import LifeStyleTag from './LifeStyleTag';

function LifeStyleRadioSelected({
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
        <div className='h-[180px] p-5 rounded-lg border-[1.5px] border-primary relative mb-[44px] cursor-pointer'>
          <img
            src={data.profileImage}
            alt='lifeStyleProfile1'
            className='absolute right-[20px] -top-[40px] w-[88px] h-[88px] rounded-full border-[1.5px] border-primary'
          />
          <div className='flex gap-2'>
            {data.tags.map(item => (
              <LifeStyleTag tagType='selected' text={item} key={item} />
            ))}
          </div>
          <div className='mt-2.5 flex justify-between items-center'>
            <div className='font-body2-medium text-primary whitespace-pre-line'>
              {data.description}
            </div>
            <img src={checkCircleBlue} alt='checkCircleBlue' />
          </div>
          <hr className='h-px mt-5 bg-grey-700 border-0' />
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

export default LifeStyleRadioSelected;
