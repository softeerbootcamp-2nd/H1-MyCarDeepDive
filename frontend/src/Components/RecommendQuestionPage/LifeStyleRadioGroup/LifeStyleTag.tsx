type LifeStyleTagProps = {
  text: string;
  tagType: 'selected' | 'unselected';
};

function LifeStyleTag({ text, tagType }: LifeStyleTagProps) {
  const style =
    tagType === 'selected'
      ? 'px-2.5 py-1.5 bg-secondary bg-opacity-10 font-caption1-medium text-secondary rounded-full'
      : 'px-2.5 py-1.5 bg-grey-1000 font-caption1-medium text-secondary rounded-full';

  return <span className={style}>{text}</span>;
}

export default LifeStyleTag;
