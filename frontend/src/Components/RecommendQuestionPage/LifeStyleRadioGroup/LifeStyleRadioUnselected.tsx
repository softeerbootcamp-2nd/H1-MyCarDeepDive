import checkCircleGrey from '../../../assets/icon/check-circle-lifecycle-grey.svg';
import { LifeStyleRadioProps } from '../../../global/type';
import LifeStyleTag from './LifeStyleTag';

function LifeStyleRadioUnselected({
  onChangeHandler,
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
        <div className='h-[180px] p-5 rounded-lg relative bg-primary bg-opacity-10 mb-[44px] cursor-pointer'>
          <img
            src={data.profileImage}
            alt='lifeStyleProfile2'
            className='absolute right-[20px] -top-[40px] w-[88px] h-[88px] rounded-full'
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
          <hr className='h-px mt-5 mb-2.5 bg-grey-900 border-0' />
          <div className='font-body4-medium text-grey-200 text-center'>
            라이프스타일 엿보기
          </div>
        </div>
      </label>
    </>
  );
}

export default LifeStyleRadioUnselected;
