import { useNavigate } from 'react-router-dom';
import Card from './Card';
import Phrases from './Phrases';
import Logo from '@/assets/icon/logo.svg';

interface Props {
  setShowShareModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function Head({ setShowShareModal }: Props) {
  const navigation = useNavigate();

  return (
    <div className='w-full h-[506px] bg-[#E6EAEF] relative'>
      <img
        src={Logo}
        alt='hyundai-logo'
        className='absolute top-8 left-10 cursor-pointer'
        onClick={() => navigation('/')}
      />
      <div className='absolute top-[89px] left-1/2 -translate-x-1/2 font-h1-medium'>
        <Phrases />
        <Card setShowShareModal={setShowShareModal} />
      </div>
    </div>
  );
}

export default Head;
