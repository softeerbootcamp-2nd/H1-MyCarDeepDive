interface TagButtonProps {
  tagName: string;
  blackIcon: string;
  primaryIcon: string;
  tag: string;
  setTag: React.Dispatch<React.SetStateAction<string>>;
  setPage: React.Dispatch<React.SetStateAction<number>>;
}

function TagButton({
  tagName,
  blackIcon,
  primaryIcon,
  tag,
  setTag,
  setPage,
}: TagButtonProps) {
  const getStyle = (ischecked: boolean) => {
    if (ischecked)
      return 'px-2.5 py-1.5 rounded border-[1.5px] border-primary font-body4-medium text-primary bg-grey-1000 flex gap-2';
    else
      return 'px-2.5 py-1.5 rounded border-[1.5px] border-grey-1000 font-body4-regular text-grey-400 bg-grey-800 flex gap-2';
  };

  return (
    <button
      className={getStyle(tag === tagName)}
      onClick={() => {
        setTag(tagName);
        setPage(1);
      }}
    >
      <img src={tag === tagName ? primaryIcon : blackIcon} alt={tagName} />
      <span>{tagName}</span>
    </button>
  );
}

export default TagButton;
