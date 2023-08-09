import TrimSelectRadioGroup from './FeatureSelectRadioGroup';
import SelectionCarBackground from './SelecetionCarBackground';
import SelectionCarImage from './SelectionCarImage';
import FeatureGuideLink from './FeatureGuideLink';
import FeatureSelectRadioGroupWrapper from './FeatureSelectRadioGroupWrapper';
import SelectionCarWrapper from './SelectionCarWrapper';
import { Fragment, useState } from 'react';
import { trimList } from '@/global/data';
import UnderLine from '@/Components/UnderLine';
import Button from '@/Components/Button';
import checkCircleGrey from '@/assets/icon/trim-select-circle-grey.svg';
import checkCircleBlue from '@/assets/icon/check-circle-lifecycle-blue.svg';
import ReRecommendCardLink from './ReRecommendCarLink';

function SelectPage() {
  const [carFeature, setCarFeature] = useState({
    engine: '디젤 2.2',
    body: '7인승',
    operation: '2WD',
  });

  const [selectedTrim, setSelectedTrim] = useState('Le Blanc');

  const { engine, body, operation } = carFeature;

  const mycarFeatureHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = target;
    setCarFeature({ ...carFeature, [name]: value });
  };

  const onChangeHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    setSelectedTrim(target.value);
  };

  return (
    <>
      <SelectionCarWrapper>
        <ReRecommendCardLink />
        <SelectionCarBackground />
        <SelectionCarImage />
      </SelectionCarWrapper>

      <div className='absolute top-0 w-[416px] right-0 mt-[120px] px-12 py-[51px]'>
        <FeatureGuideLink />
        <FeatureSelectRadioGroupWrapper>
          <TrimSelectRadioGroup
            carFeature={carFeature}
            onChangeHandler={mycarFeatureHandler}
          />
        </FeatureSelectRadioGroupWrapper>

        <div className='mt-8 flex justify-between mb-[2px]'>
          <p className='font-h2-medium flex justify-center items-center'>
            트림
          </p>
          <div className='w-[65px] h-[30px] justify-center items-center gap-[10px] inline-flex rounded-[20px] border border-grey-700 font-caption1-regular text-grey-0'>
            <span className='leading-[22px] tracking-[-0.2px] cursor-pointer'>
              {' '}
              비교하기
            </span>
          </div>
        </div>
        {trimList.map((trim, index) => {
          const { name, description, basicOption, price } = trim;
          if (name === selectedTrim) {
            return (
              <Fragment key={index}>
                <input
                  type='radio'
                  name='selectedTrim'
                  id={name}
                  value={name}
                  className='hidden'
                  onChange={onChangeHandler}
                />
                <label htmlFor={name}>
                  <div key={index} className='relative cursor-pointer'>
                    <div className='flex justify-between pt-6 mb-1'>
                      <div className='flex justify-between items-center gap-2 '>
                        <p className='font-body4-medium text-grey-300'>
                          {name}
                        </p>
                        <p className='font-caption1-regular text-grey-500'>
                          {engine} &middot; {body} &middot; {operation}
                        </p>
                      </div>

                      <img src={checkCircleBlue}></img>
                    </div>
                    <p className='font-body3-regular text-grey-100 mb-2'>
                      {description}
                    </p>
                    <p className='font-h2-medium text-grey-0 mb-[14px]'>
                      {price.toLocaleString('en-US')}원
                    </p>

                    <div className='flex gap-3'>
                      <div className='font-body4-medium text-grey-300 whitespace-nowrap'>
                        기본 옵션
                      </div>

                      <div className='mb-6 flex flex-wrap gap-3'>
                        {basicOption.map((option, index) => (
                          <p
                            key={index}
                            className='gap-y-[6px] font-body4-regular text-secondary underline underline-offset-4 cursor-pointer'
                          >
                            {option}
                          </p>
                        ))}
                      </div>
                    </div>

                    {index !== trimList.length - 1 ? (
                      <UnderLine margin={'m-0'} />
                    ) : null}
                  </div>
                </label>
              </Fragment>
            );
          } else {
            return (
              <Fragment key={index}>
                <input
                  type='radio'
                  name='selectedTrim'
                  id={name}
                  value={name}
                  className='hidden'
                  onChange={onChangeHandler}
                />
                <label htmlFor={name}>
                  <div key={index} className='relative cursor-pointer'>
                    <div className='flex justify-between gap-2 pt-6 mb-1'>
                      <div className='flex justify-between items-center gap-2 '>
                        <p className='font-body4-medium text-grey-300'>
                          {name}
                        </p>
                        <p className='font-caption1-regular text-grey-500'>
                          {engine} &middot; {body} &middot; {operation}
                        </p>
                      </div>

                      <img src={checkCircleGrey}></img>
                    </div>
                    <p className='font-body3-regular text-grey-100 mb-2'>
                      {description}
                    </p>
                    <p className='font-h2-medium text-grey-0 mb-[14px]'>
                      {price.toLocaleString('en-US')}원
                    </p>

                    <div className='flex gap-3'>
                      <div className='font-body4-medium text-grey-300 whitespace-nowrap'>
                        기본 옵션
                      </div>

                      <div className='mb-6 flex flex-wrap gap-3'>
                        {basicOption.map((option, index) => (
                          <p
                            key={index}
                            className='gap-y-[6px] font-body4-regular text-secondary underline underline-offset-4 cursor-pointer'
                          >
                            {option}
                          </p>
                        ))}
                      </div>
                    </div>

                    {index !== trimList.length - 1 ? (
                      <UnderLine margin={'m-0'} />
                    ) : null}
                  </div>
                </label>
              </Fragment>
            );
          }
        })}
        <div className='mt-6'>
          <Button
            width='w-full'
            height='h-[52px]'
            variant='primary'
            text='색상 선택'
            onClick={() => console.log('primary')}
          />
        </div>
      </div>
    </>
  );
}

export default SelectPage;
