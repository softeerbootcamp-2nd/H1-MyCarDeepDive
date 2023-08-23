import Option from './Option';

interface Props {
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
  optionData: {
    additional_option_id: number;
    option_name: string;
    option_description: string;
    option_img_url: string;
    price: number;
    position_x: number;
    position_y: number;
  }[];
}

function OptionList({ setShowOptionModal, optionData }: Props) {
  return (
    <div className='grid grid-cols-4 gap-4 max-w-5xl mx-auto'>
      {optionData.map(item => (
        <Option
          {...item}
          key={item.additional_option_id}
          setShowOptionModal={setShowOptionModal}
        />
      ))}
    </div>
  );
}

export default OptionList;
