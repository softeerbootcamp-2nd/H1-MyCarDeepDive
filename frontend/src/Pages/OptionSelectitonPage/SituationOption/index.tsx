import OptionList from './OptionList';
import Precautions from './Precautions/indes';
import OptionInfo from './OptionInfo';
import situationDriving from '@/assets/image/situation-driving.png';

interface Props {
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function SituationOption({ setShowOptionModal }: Props) {
  return (
    <div className='max-w-5xl mx-auto'>
      <div className='w-full h-[490px] relative mt-6 mb-10'>
        <img
          src={situationDriving}
          alt='situationDriving'
          className='w-full absolute top-0 left-0 object-cover'
        />
        <OptionInfo setShowOptionModal={setShowOptionModal} />
      </div>
      <OptionList setShowOptionModal={setShowOptionModal} />
      <Precautions />
    </div>
  );
}

export default SituationOption;
