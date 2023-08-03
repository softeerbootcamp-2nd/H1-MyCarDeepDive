import logoSkyBlue from '../assets/icon/logo-skyblue.svg';
import palisade from '../assets/image/Palisade.png';
import whitePoint from '../assets/icon/white-point.svg';
import exteriorCrimi from '../assets/image/exterior-crimi.png';
import exteriorArtificialLeather from '../assets/image/exterior-artificial-leather.png';
import exteriorSmartsense from '../assets/image/exterior-smartsense.png';
import Button from '../Components/Common/Button/Button';

function RecommendResultPage() {
  return (
    <div className='mt-[92px]'>
      <div className='w-full h-[485px] relative flex items-center justify-center'>
        <div className='absolute top-0 left-0 -z-10 w-full h-full bg-gradient-to-t from-[#EDF2FE] to-[#A2B1D3]'></div>

        <div className='relative w-[300px] h-[419px] rounded-xl border-2 border-grey-1000 border-opacity-50 bg-grey-1000 bg-opacity-30'>
          <img
            src={logoSkyBlue}
            alt='Hyundai-logo'
            className='absolute top-[17px] left-[19px]'
          />
          <div className='w-[173px] h-[28px] mt-[29px] mx-auto bg-primary rounded-full px-[12px] py-[6px] font-caption1-medium'>
            <span className='leading-[16px] text-grey-1000'>
              펠리세이드 - Le Blanc(르블랑)
            </span>
          </div>
          <div className='w-[217px] mx-auto mt-[8px] font-body2-regular text-center'>
            <span className='text-primary text-[20px] leading-[28px] tracking-negative-03'>
              가족
            </span>
            <span className='text-grey-0 text-[20px] leading-[28px] tracking-negative-03'>
              을 생각하는 당신을 위한 펠리세이드
            </span>
          </div>

          <img
            src={palisade}
            alt='Palisade'
            className='absolute top-[91px] left-0 w-[496px] h-[246px] object-cover'
          />

          <div className='absolute bottom-[20px] left-0 w-full font-body4-regular'>
            <img src={whitePoint} alt='whitePoint' className='ml-[33px]' />
            <div className='bg-grey-1000 w-[257px] px-3 py-2 text-grey-400 mx-auto rounded-lg leading-[20px] tracking-negative-05'>
              우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요
            </div>
          </div>
        </div>
      </div>

      <div className='w-[608px] mt-[56px] mx-auto'>
        <div className='flex justify-between'>
          <div>
            <span className='font-h2-medium text-grey-50 mr-2'>펠리세이드</span>
            <span className='font-body2-medium text-grey-300'>
              <span className='leading-[22px]'>Le Blanc(르블랑)</span>
            </span>
          </div>
          <span className='font-h4-medium text-grey-100'>43,460,000원</span>
        </div>
        <p className='font-body4-regular text-grey-400 mt-[5px]'>
          가솔린 ・ 2WD ・ 8인승
        </p>
        <hr className='h-px mt-4 mb-[26px] bg-grey-700 border-0' />
        <div className='font-caption1-regular text-grey-300 mb-[6px]'>색상</div>
        <div className='flex justify-between gap-4'>
          <div className='w-full'>
            <div className='flex gap-4'>
              <img src={exteriorCrimi} alt='외장 - 크리미 화이트 펄' />
              <div className='flex flex-col gap-px'>
                <div className='font-body4-regular text-grey-200'>
                  외장 - 크리미 화이트 펄
                </div>
                <div className='font-h4-medium text-grey-100'>0원</div>
              </div>
            </div>
            <div className='w-full mt-3 p-3 bg-secondary bg-opacity-10 font-body4-regular text-secondary rounded-lg'>
              75%의 20~30대 구매자들이 선택했어요.
            </div>
          </div>
          <div className='w-full'>
            <div className='flex gap-4'>
              <img
                src={exteriorArtificialLeather}
                alt='내장 - 인조가죽 (블랙)'
              />
              <div className='flex flex-col gap-px'>
                <div className='font-body4-regular text-grey-200'>
                  내장 - 인조가죽 (블랙)
                </div>
                <div className='font-h4-medium text-grey-100'>0원</div>
              </div>
            </div>
            <div className='w-full mt-3 p-3 bg-secondary bg-opacity-10 font-body4-regular text-secondary rounded-lg'>
              65%의 20~30대 구매자들이 선택했어요.
            </div>
          </div>
        </div>
        <hr className='h-px mt-10 mb-6 bg-grey-700 border-0' />
        <div className='font-caption1-regular text-grey-300 mb-[6px]'>색상</div>
        <div className='flex justify-between gap-4'>
          <div className='w-full'>
            <div className='flex gap-4'>
              <img src={exteriorArtificialLeather} alt='컴포트 II' />
              <div className='flex flex-col gap-px'>
                <div className='font-body4-regular text-grey-200'>
                  컴포트 II
                </div>
                <div className='font-h4-medium text-grey-100'>1,090,000원</div>
              </div>
            </div>
            <div className='w-full mt-3 p-3 bg-secondary bg-opacity-10 font-body4-regular text-secondary rounded-lg'>
              해당 옵션이 후석 승객 알림이 있어서 좋아요. 뒷좌석 아이들을 확인할
              수 있거든요.
            </div>
          </div>
          <div className='w-full'>
            <div className='flex gap-4'>
              <img src={exteriorSmartsense} alt='현대 스마트센스 I' />
              <div className='flex flex-col gap-px'>
                <div className='font-body4-regular text-grey-200'>
                  현대 스마트센스 I
                </div>
                <div className='font-h4-medium text-grey-100'>790,000원</div>
              </div>
            </div>
            <div className='w-full mt-3 p-3 bg-secondary bg-opacity-10 font-body4-regular text-secondary rounded-lg'>
              전방 충돌 방지 보조 기능이 있어 안전을 위해서라면 꼭 추가해야 하는
              옵션이에요.
            </div>
          </div>
        </div>
        <hr className='h-px mt-10 mb-4 bg-grey-700 border-0' />
        <div className='flex justify-between items-center mb-[59px]'>
          <div className='font-body3-regular'>
            <span className='leading-[26px] text-grey-400'>총 금액</span>
          </div>
          <div className='font-h2-medium'>
            <span className='text-2xl leading-[30px] text-grey-0'>
              48,120,000원
            </span>
          </div>
        </div>
        <div className='flex justify-between mb-9'>
          <Button
            width='w-[298px]'
            height='h-[52px]'
            variant='secondary'
            text='커스텀하기'
            onClick={() => console.log('커스텀하기')}
          />
          <Button
            width='w-[298px]'
            height='h-[52px]'
            variant='primary'
            text='빠른 견적내기'
            onClick={() => console.log('빠른 견적내기')}
          />
        </div>
      </div>
    </div>
  );
}

export default RecommendResultPage;
