import RadioSelected from "./RadioSelected";
import RadioUnselected from "./RadioUnselected";

type RadioGroupProps = {
  data: string[];
  name: string;
  value: string;
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
};

function RadioGroup({ data, name, value, onChangeHandler }: RadioGroupProps) {
  const result = data.map((item, index) => {
    return item === value ? (
      <RadioSelected
        key={index}
        name={name}
        value={item}
        onChangeHandler={onChangeHandler}
      />
    ) : (
      <RadioUnselected
        key={index}
        name={name}
        value={item}
        onChangeHandler={onChangeHandler}
      />
    );
  });

  return <>{result}</>;
}

export default RadioGroup;
