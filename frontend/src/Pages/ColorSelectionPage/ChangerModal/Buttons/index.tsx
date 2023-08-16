import Button from '@/Components/Button';
import { closeModalHandler } from '@/utils';

interface colorProps {
  trim?: string;
  name: string;
  chooseRate: number;
  url: string;
}

interface Props {
  wantedOtherColor: colorProps;
  changerClickHandler: React.Dispatch<
    React.SetStateAction<colorProps | undefined>
  >;
  setTrim: React.Dispatch<React.SetStateAction<string>>;
}

function Buttons({ wantedOtherColor, changerClickHandler, setTrim }: Props) {
  return (
    <div className='flex justify-end gap-2.5 mt-[33px] mb-6'>
      <Button
        width='w-[120px]'
        height='h-[46px]'
        variant='secondary'
        text='아니오'
        onClick={closeModalHandler}
      />
      <Button
        width='w-[120px]'
        height='h-[46px]'
        variant='primary'
        text='변경하기'
        onClick={() => {
          changerClickHandler(wantedOtherColor);
          if (wantedOtherColor.trim) setTrim(wantedOtherColor.trim);
          closeModalHandler();
        }}
      />
    </div>
  );
}

export default Buttons;
