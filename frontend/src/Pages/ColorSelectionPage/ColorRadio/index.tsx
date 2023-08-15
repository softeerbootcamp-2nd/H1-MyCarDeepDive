import CheckCircle from '@/assets/icon/check-circle-white.svg';

interface colorProps {
  trim?: string;
  name: string;
  chooseRate: number;
  url: string;
}

interface Props {
  data: colorProps[];
  colorType: 'interior' | 'exterior' | 'other';
  clickHandler: (e: React.MouseEvent<HTMLButtonElement>) => void;
  selectedColor?: colorProps;
  setShowModal?: (value: boolean) => void;
}

function ColorRadio({
  data,
  colorType,
  selectedColor,
  setShowModal,
  clickHandler,
}: Props) {
  const showOtherColorChangePopup = (
    e: React.MouseEvent<HTMLButtonElement>,
  ) => {
    if (setShowModal && clickHandler) {
      clickHandler(e);
      setShowModal(true);
    }
  };
  return (
    <div className='flex flex-wrap gap-x-4'>
      {data.map((color, index) => {
        return (
          <div
            key={index}
            className={`flex flex-col w-[68px] ${
              colorType === 'other' ? 'mb-3' : 'mb-6'
            }`}
          >
            <div>
              {colorType === 'other' && (
                <p className='font-body2-bold flex items-start mb-1'>
                  <span className='text-[11px] leading-normal text-secondary'>
                    {color.trim}
                  </span>
                </p>
              )}
              <button
                className='relative mb-2 flex justify-center items-center cursor-pointer'
                value={color.name}
                onClick={
                  colorType === 'other'
                    ? showOtherColorChangePopup
                    : clickHandler
                }
                data-object={JSON.stringify(color)}
              >
                <img
                  src={color.url}
                  alt={`{exterior-${color.name}}`}
                  className={`rounded
            ${
              color.name === '크리미 화이트 펄'
                ? 'border border-grey-700 rounded'
                : ''
            }
            `}
                />
                {color.name === selectedColor?.name && (
                  <>
                    <div className='bg-primary absolute opacity-40 rounded top-0 left-0 w-full h-full z-10'></div>
                    <img src={CheckCircle} alt='' className='absolute z-20' />
                  </>
                )}

                {colorType === 'exterior' && index < 3 && (
                  <p className='font-caption1-medium bg-grey-300 text-grey-1000 w-10 h-5 flex justify-center items-center rounded-tl rounded-br absolute top-0 left-0'>
                    Top {index + 1}
                  </p>
                )}

                {colorType === 'interior' && index === 0 && (
                  <p className='font-caption1-medium bg-grey-300 text-grey-1000 w-10 h-5 flex justify-center items-center rounded-tl rounded-br absolute top-0 left-0'>
                    Best
                  </p>
                )}
              </button>
            </div>
            <p className='font-caption1-regular text-grey-100'>{color.name}</p>
          </div>
        );
      })}
    </div>
  );
}

export default ColorRadio;
