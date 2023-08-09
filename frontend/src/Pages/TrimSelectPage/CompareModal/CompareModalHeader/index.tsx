import CloseModal from '@/Components/Modal/CloseModal';

function CompareModalHeader() {
  return (
    <div className='w-full h-[100px] relative'>
      <div className='w-full absolute left-0 top-6 flex justify-center'>
        <span className='font-h1-medium text-grey-50'>비교하기</span>
      </div>
      <CloseModal />
    </div>
  );
}

export default CompareModalHeader;
