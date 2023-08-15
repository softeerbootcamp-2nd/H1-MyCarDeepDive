import Button from '@/Components/Button';
import UnderLine from '@/Components/UnderLine';

interface Props {
  setShowMailModal: React.Dispatch<React.SetStateAction<boolean>>;
  setShowLoginModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function SaveButtons({ setShowMailModal, setShowLoginModal }: Props) {
  return (
    <>
      <div className='flex justify-center gap-2'>
        <Button
          width='w-full'
          height='h-[52px]'
          variant='myCar'
          text='내 계정에 저장'
          onClick={() => setShowLoginModal(true)}
        />
        <Button
          width='w-full'
          height='h-[52px]'
          variant='myCar'
          text='PDF로 저장'
          onClick={() => console.log('견적내기')}
        />
        <Button
          width='w-full'
          height='h-[52px]'
          variant='myCar'
          text='메일로 발송'
          onClick={() => setShowMailModal(true)}
        />
      </div>
      <UnderLine margin='mt-[52px] mb-8' />
    </>
  );
}

export default SaveButtons;
