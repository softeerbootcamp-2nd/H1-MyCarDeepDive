interface ButtonProps {
  width: string;
  height: string;
  type?: 'button' | 'submit';
  variant: 'primary' | 'secondary' | 'white' | 'transparent';
  text: string;
  disabled?: boolean;
  onClick: () => void;
}

const buttonStyle = {
  primary: 'bg-primary font-body3-medium text-grey-1000',
  secondary:
    'bg-transparent border border-grey-600 font-body3-medium text-grey-50',
  white: 'bg-grey-900 font-body3-medium text-primary',
  transparent:
    'bg-transparent border border-grey-1000 font-body3-medium text-grey-900',
};

function Button({
  width,
  height,
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
      className={`${width} ${height} ${buttonStyle[variant]} rounded-md ${
        disabled && 'text-opacity-40'
      }`}
      onClick={onClick}
    >
      {text}
    </button>
  );
}

export default Button;