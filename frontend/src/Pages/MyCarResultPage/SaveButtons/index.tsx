import Button from '@/Components/Button';
import UnderLine from '@/Components/UnderLine';

interface Props {
  setShowMailModal: React.Dispatch<React.SetStateAction<boolean>>;
  setShowLoginModal: React.Dispatch<React.SetStateAction<boolean>>;
  pdf_url: string;
}

function SaveButtons({ setShowMailModal, setShowLoginModal, pdf_url }: Props) {
  const pdfDownload = () => {
    const link = document.createElement('a');
    link.href = 'https://' + pdf_url;
    link.target = '_blank';
    link.download = 'palisade.pdf';
    link.click();
  };

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
          onClick={pdfDownload}
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
