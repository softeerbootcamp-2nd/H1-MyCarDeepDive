import UnderLine from '@/Components/UnderLine';
import moreInfo from '@/assets/icon/car-buy-info.svg';

function PurchaseCar() {
  return (
    <>
      <div className='font-h3-medium text-grey-100 mb-6'>차량 구매</div>
      <div className='flex justify-between items-center'>
        <span className='font-body4-regular text-grey-300'>탁송</span>
        <img src={moreInfo} alt='more' />
      </div>
      <UnderLine margin='mt-3.5 mb-5' />
      <div className='flex justify-between items-center'>
        <span className='font-body4-regular text-grey-300'>할인/포인트</span>
        <img src={moreInfo} alt='more' />
      </div>
      <UnderLine margin='mt-3.5 mb-5' />
      <div className='flex justify-between items-center'>
        <span className='font-body4-regular text-grey-300'>결제방법</span>
        <img src={moreInfo} alt='more' />
      </div>
      <UnderLine margin='mt-3.5 mb-5' />
      <div className='flex justify-between items-center'>
        <span className='font-body4-regular text-grey-300'>
          면제 구분 및 등록비
        </span>
        <img src={moreInfo} alt='more' />
      </div>
      <UnderLine margin='mt-3.5 mb-5' />
    </>
  );
}

export default PurchaseCar;
