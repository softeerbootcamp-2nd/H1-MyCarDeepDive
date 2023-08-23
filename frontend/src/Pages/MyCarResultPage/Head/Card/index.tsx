import Logo from '@/assets/icon/logo.svg';
import myCarPalisade from '@/assets/image/my-car-palisade.png';
import carShare from '@/assets/icon/car-share.svg';

interface Props {
  setShowShareModal: React.Dispatch<React.SetStateAction<boolean>>;
  car_name: string;
  trim_name: string;
}

function Card({ setShowShareModal, car_name, trim_name }: Props) {
  return (
    <div className='w-[320px] mt-8 relative'>
      <img src={myCarPalisade} alt='palisade' className='rounded-t-lg' />
      <div className='triangle' />

      <button
        className='absolute top-4 right-5 w-10 h-10 bg-grey-1000 bg-opacity-50 rounded-full z-20 flex justify-center items-center'
        onClick={() => setShowShareModal(true)}
      >
        <img src={carShare} alt='share-icon' />
      </button>

      <div className='w-full h-[76px] bg-grey-1000 rounded-b-lg px-4 py-3 relative'>
        <div className='flex justify-between items-center'>
          <span className='font-body4-medium text-grey-300'>{car_name}</span>
          <img src={Logo} alt='hyundai' className='w-[70px] object-cover' />
        </div>
        <div className='mt-0.5 font-h4-medium text-grey-0'>{trim_name}</div>
        <div className='triangle-bottom' />
      </div>
    </div>
  );
}

export default Card;
