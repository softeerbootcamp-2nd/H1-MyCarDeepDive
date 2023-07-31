type ButtonProps = {
  width: string;
  height: string;
  type?: "button" | "submit";
  variant: "primary" | "secondary" | "white" | "transparent";
  text: string;
  onClick: () => void;
};

function Button({ width, height, type, variant, text, onClick }: ButtonProps) {
  const setButtonStyle = (): string => {
    switch (variant) {
      case "primary":
        return "bg-primary font-body3-medium text-grey-1000";
      case "secondary":
        return "bg-transparent border border-grey-600 font-body3-medium text-grey-50";
      case "white":
        return "bg-grey-900 font-body3-medium text-primary";
      case "transparent":
        return "bg-transparent border border-grey-1000 font-body3-medium text-grey-900";
      default:
        return "";
    }
  };

  return (
    <button
      type={type || "button"}
      className={`${width} ${height} ${setButtonStyle()} rounded-md`}
      onClick={onClick}
    >
      {text}
    </button>
  );
}

export default Button;
