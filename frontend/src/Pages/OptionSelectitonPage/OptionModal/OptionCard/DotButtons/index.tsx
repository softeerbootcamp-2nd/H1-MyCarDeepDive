import Button from './Button';

interface DotButtonsProps {
  index: number;
  length: number;
  jumpPage: (page: number) => void;
}

function DotButtons({ index, length, jumpPage }: DotButtonsProps) {
  return (
    <div className='mt-7 ml-2.5 flex gap-2'>
      {[...Array(length)].map((_, order) => (
        <Button index={index} order={order} key={order} jumpPage={jumpPage} />
      ))}
    </div>
  );
}

export default DotButtons;
