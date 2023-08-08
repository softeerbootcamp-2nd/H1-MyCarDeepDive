import TrimSelectRadioGroup from './FeatureSelectRadioGroup';
import SelectionCarBackground from './SelecetionCarBackground';
import SelectionCarImage from './SelectionCarImage';
import FeatureGuideLink from './FeatureGuideLink';
import TrimSelectRadioGroupWrapper from './FeatureSelectRadioGroupWrapper';
import SelectionCarWrapper from './SelectionCarWrapper';

function SelectPage() {
  return (
    <>
      <SelectionCarWrapper>
        <SelectionCarBackground />
        <SelectionCarImage />
      </SelectionCarWrapper>

      <div className='absolute top-0 w-[416px] right-0 mt-[120px] px-12 py-[51px]'>
        <FeatureGuideLink />
        <TrimSelectRadioGroupWrapper>
          <TrimSelectRadioGroup />
        </TrimSelectRadioGroupWrapper>

        <div className='mt-8 flex justify-between mb-[2px]'>
          <p className='font-h2-medium'>트림</p>
          <div className='w-[65px] h-[30px] justify-center items-center gap-[10px] inline-flex rounded-[20px] border border-grey-700 font-caption1-regular text-grey-0'>
            <span className='leading-[22px] tracking-[-0.2px]'> 비교하기</span>
          </div>
        </div>
      </div>
    </>
  );
}

export default SelectPage;
