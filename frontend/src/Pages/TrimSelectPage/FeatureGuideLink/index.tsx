import QuestionMarkImg from '@/assets/icon/question-mark.svg';
function FeatureGuideLink() {
  return (
    <div className='flex mb-4 gap-[2px]'>
      <img src={QuestionMarkImg} alt='물음표' />
      <p className='font-body4-medium'>
        <span className='leading-4 tracking-[-0.07px] text-secondary text-right underline underline-offset-[3px] cursor-pointer'>
          고르기 어렵다면?
        </span>
      </p>
    </div>
  );
}

export default FeatureGuideLink;
