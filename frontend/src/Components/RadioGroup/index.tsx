import RadioSelected from './RadioSelected';
import RadioUnselected from './RadioUnselected';

interface Props {
  data: string[];
  name: string;
  selectedValue: string;
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

function RadioGroup({ data, name, selectedValue, onChangeHandler }: Props) {
  const result = data.map((item, index) => {
    const isLong = index === data.length - 1 && data.length % 2 === 1;

    return item === selectedValue ? (
      <RadioSelected
        key={index}
        name={name}
        value={item}
        isLong={isLong}
        onChangeHandler={onChangeHandler}
      />
    ) : (
      <RadioUnselected
        key={index}
        name={name}
        value={item}
        isLong={isLong}
        onChangeHandler={onChangeHandler}
      />
    );
  });

  return (
    <div className='flex flex-wrap justify-center items-center gap-3 mb-[52px]'>
      {result}
    </div>
  );
}

export default RadioGroup;
