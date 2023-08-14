interface ButtonProps {
  index: number;
  order: number;
  jumpPage: (page: number) => void;
}

function Button({ index, order, jumpPage }: ButtonProps) {
  return (
    <button
      className={`w-2 h-2 rounded-full ${
        index === order ? 'bg-secondary' : 'bg-grey-700 hover:bg-grey-600'
      }`}
      onClick={() => jumpPage(order)}
    ></button>
  );
}

export default Button;
