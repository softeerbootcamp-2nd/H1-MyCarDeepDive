import CloseModal from '@/Components/Modal/CloseModal';
import UnSelectedButton from '@/Pages/OptionSelectitonPage/AdditionalOption/Option/UnSelectedButton';
import CardTag from './CardTag';
import DetailOption from './DetailOption';
import DotButtons from './DotButtons';
import { optionDetailType } from '@/global/type';

interface OptionCardProps extends optionDetailType {
  detailOptions: string[] | undefined;
  index: number;
  length: number;
  jumpPage: (page: number) => void;
  isSet: boolean;
}

function OptionCard({
  // option_id,
  option_name,
  option_description,
  tag_list,
  price,
  option_img_url,
  detailOptions,
  index,
  length,
  jumpPage,
  isSet,
}: OptionCardProps) {
  return (
    <div
      className='w-[900px] h-[440px] bg-grey-1000 rounded-xl flex overflow-hidden flex-shrink-0 relative'
      style={{
        marginLeft: index === 0 ? (window.innerWidth - 900) / 2 : 0,
        marginRight: index === length - 1 ? (window.innerWidth - 900) / 2 : 0,
      }}
    >
      <img
        src={'https://' + option_img_url}
        alt={option_name}
        className='rounded-l-xl w-[556px] h-[440px]'
      />
      <div className='absolute top-6 left-6 flex gap-2'>
        {tag_list.map(item => (
          <CardTag tag={item.tag_name} key={item.tag_id} />
        ))}
      </div>
      <div className='w-full relative'>
        <CloseModal />
        <div className='mt-[50px] mx-7 '>
          <div className='w-full flex justify-between'>
            <div className='flex flex-col gap-1'>
              <div className='h-[18px] font-caption1-medium text-grey-400'>
                {isSet && option_name}
              </div>
              <div className='font-h2-medium text-grey-0'>{option_name}</div>
              <div className='font-body3-medium text-grey-200'>
                {`${price} 원`}
              </div>
            </div>
            <div className='mt-auto'>
              <UnSelectedButton />
            </div>
          </div>
          <div className='mt-5 mb-[190px] h-[90px] font-body4-regular text-grey-200 overflow-y-auto'>
            {option_description}
          </div>
        </div>
        {isSet && (
          <div className='w-[344px] h-[190px] absolute bottom-0 left-0 bg-grey-900 rounded-br-xl p-7'>
            <div className='grid grid-cols-2 gap-3.5'>
              {detailOptions &&
                detailOptions.map((item, idx) => (
                  <DetailOption
                    detailOption={item}
                    key={item}
                    detailOptionName={option_name}
                    order={idx}
                    jumpPage={jumpPage}
                  />
                ))}
            </div>
            <DotButtons index={index} length={length} jumpPage={jumpPage} />
          </div>
        )}
      </div>
    </div>
  );
}

export default OptionCard;
