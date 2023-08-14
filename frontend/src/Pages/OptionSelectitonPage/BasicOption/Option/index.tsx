import moreInfo from '@/assets/icon/more-info.svg';

interface OptionProps {
  image: string;
  name: string;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function Option({ image, name, setShowOptionModal }: OptionProps) {
  return (
    <div className='w-[244px] mb-11'>
      <div className='w-full h-[162px] relative'>
        <img
          src={image}
          alt={name}
          className='w-full rounded absolute top-0 left-0'
        />
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
    </div>
  );
}

export default Option;
