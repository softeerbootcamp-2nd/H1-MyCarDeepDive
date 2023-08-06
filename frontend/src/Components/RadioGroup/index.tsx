import RadioSelected from './RadioSelected';
import RadioUnselected from './RadioUnselected';

interface RadioGroupProps {
  data: string[];
  name: string;
  value: string;
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

function RadioGroup({ data, name, value, onChangeHandler }: RadioGroupProps) {
  const result = data.map((item, index) => {
    const isLong =
      index === data.length - 1 && data.length % 2 === 1 ? true : false;
    return item === value ? (
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
    <div className='flex flex-wrap justify-center items-center gap-[12px] mb-[52px]'>
      {result}
    </div>
  );
}

export default RadioGroup;
