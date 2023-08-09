import ReRecommendIcon from '@/assets/icon/re-recommend-icon.svg';
import { useNavigate } from 'react-router-dom';
function ReRecommendCardLink() {
  const navigation = useNavigate();
  return (
    <div
      className='absolute top-4 left-[15%] bg-opacity-80 bg-white z-20  py-[7px] px-[14px] rounded-[20px] text-secondary cursor-pointer'
      onClick={() => navigation('/')}
    >
      <img src={ReRecommendIcon} alt='' className='inline-block mr-1' />
      <span className='inline-block align-middle font-body4-medium'>
        <span className='leading-[100%] tracking-normal'>다시 추천받기</span>{' '}
      </span>
    </div>
  );
}

export default ReRecommendCardLink;
