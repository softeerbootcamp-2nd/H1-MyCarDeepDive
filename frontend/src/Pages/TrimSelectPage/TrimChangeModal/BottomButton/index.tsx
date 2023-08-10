import Button from '@/Components/Button';
import { TrimChangeButtonProps } from '@/global/type';
import { closeModalHandler } from '@/utils';

function BottomButton({ mycarTrimHandler }: TrimChangeButtonProps) {
  return (
    <div className='flex justify-end gap-2.5'>
      <Button
        width='w-[120px]'
        height='h-[46px]'
        variant='secondary'
        text='취소하기'
        onClick={closeModalHandler}
      />
      <Button
        width='w-[120px]'
        height='h-[46px]'
        variant='primary'
        text='변경하기'
        onClick={() => mycarTrimHandler('')}
      />
    </div>
  );
}

export default BottomButton;
