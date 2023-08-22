import OptionList from './OptionList';
import Precautions from './Precautions/indes';
import OptionInfo from './OptionInfo';
import getSituationOptions from '@/api/option/getSituationOptions';

interface Props {
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
  tag: string;
}

function SituationOption({ setShowOptionModal, tag }: Props) {
  const situationData = getSituationOptions(tag);

  if (!situationData) return null;
  return (
    <div className='max-w-5xl mx-auto'>
      <div className='w-full h-[490px] relative mt-6 mb-10'>
        <img
          src={'https://' + situationData.data.tag_img_url}
          alt='situationDriving'
          className='w-full absolute top-0 left-0 object-cover'
        />
        {situationData.data.options.map(option => (
          <OptionInfo
            setShowOptionModal={setShowOptionModal}
            tag={tag}
            {...option}
            key={option.additional_option_id}
          />
        ))}
      </div>
      <OptionList
        setShowOptionModal={setShowOptionModal}
        optionData={situationData.data.options}
      />
      <Precautions />
    </div>
  );
}

export default SituationOption;
