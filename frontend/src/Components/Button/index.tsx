interface ButtonProps {
  width: string;
  height: string;
  rounded?: string;
  type?: 'button' | 'submit';
  variant:
    | 'primary'
    | 'secondary'
    | 'white'
    | 'transparent'
    | 'grey400'
    | 'primaryBody4'
    | 'myCar';
  text: string;
  disabled?: boolean;
  onClick?: () => void;
}

const buttonStyle = {
  primary: 'bg-primary font-body3-medium text-grey-1000',
  primaryBody4: 'bg-primary font-body4-medium text-grey-1000',
  secondary:
    'bg-transparent border border-grey-600 font-body3-medium text-grey-50',
  white: 'bg-grey-900 font-body3-medium text-primary',
  transparent:
    'bg-transparent border border-grey-1000 font-body3-medium text-grey-900',
  grey400: 'border border-[#D9D9D9] font-body4-medium text-grey-400',
  myCar:
    'bg-transparent border border-[#D1D7DF] font-body3-medium text-grey-200',
};

function Button({
  width,
  height,
  rounded,
  type,
  variant,
  text,
  disabled,
  onClick,
}: ButtonProps) {
  return (
    <button
      type={type || 'button'}
      disabled={disabled}
      className={`${width} ${height} ${buttonStyle[variant]} ${
        rounded ? 'rounded' : 'rounded-md'
      } ${disabled && 'text-opacity-40'} `}
      onClick={onClick}
    >
      {text}
    </button>
  );
}

export default Button;
