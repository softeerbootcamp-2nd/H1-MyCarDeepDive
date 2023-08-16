import moreInfo from '@/assets/icon/more-info.svg';
import SelectedButton from './SelectedButton';
import UnSelectedButton from './UnSelectedButton';

interface SelectedProps {
  image: string;
  name: string;
  description: string;
  price: string;
  adoptionRate?: number;
  tag?: string;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function Option({
  image,
  name,
  description,
  price,
  adoptionRate,
  tag,
  setShowOptionModal,
}: SelectedProps) {
  return (
    <div className='w-[244px] mb-11'>
      <div className='w-full h-[162px] relative'>
        <img
          src={image}
          alt={name}
          className='w-full rounded absolute top-0 left-0'
        />
        {adoptionRate && (
          <div className='absolute left-0 bottom-0 w-full py-2 pl-3 bg-secondary bg-opacity-60 rounded-lg font-caption1-regular text-grey-1000'>
            {`${adoptionRate}%의 사용자가 선택했습니다.`}
          </div>
        )}
        {tag === 'N Performance' && (
          <div className='absolute left-0 top-0 rounded-tl rounded-br bg-[#AE4747] font-caption1-medium px-1.5 py-1'>
            <span className='leading-[12px] text-grey-1000'>N Performance</span>
          </div>
        )}
        {tag === 'H Genuine Accessories' && (
          <div className='absolute left-0 top-0 rounded-tl rounded-br bg-[#558AC7] font-caption1-medium px-1.5 py-1'>
            <span className='leading-[12px] text-grey-1000'>
              H Genuine Accessories
            </span>
          </div>
        )}
      </div>
      <div className='mt-3 flex justify-between'>
        <div className='w-2/3 font-h4-medium text-grey-0'>{name}</div>
        <div
          className='w-1/3 h-[22px] font-body4-regular whitespace-nowrap text-secondary flex cursor-pointer'
          onClick={() => setShowOptionModal(true)}
        >
          더 알아보기
          <img src={moreInfo} alt='더 알아보기' className='w-4 h-full' />
        </div>
      </div>
      <div className='mt-1.5 mb-1 h-[44px] font-body4-regular text-grey-300'>
        {description}
      </div>
      <div className='mb-3 font-body3-medium text-grey-100'>{`${price}원`}</div>
      {name === '컴포트 II' || name === '사이드스텝' ? (
        <SelectedButton />
      ) : (
        <UnSelectedButton />
      )}
    </div>
  );
}

export default Option;
