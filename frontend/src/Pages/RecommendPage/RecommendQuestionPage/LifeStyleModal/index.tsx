import { useEffect, useRef, useState } from 'react';
import Title from '@/Components/Title';
import UnderLine from '@/Components/UnderLine';
import Wrapper from './Wrapper';
import ContentWrapper from './ContentWrapper';
import Header from './Header';
import Profile from './Profile';
import Comment from './Comment';
import Option from './Option';
import Interview from './Interview';
import lifeStyleFamily from '@/assets/image/lifeStyle-family.png';
import logoWhite from '@/assets/icon/logo-white.svg';
import lifeStyleProfile from '@/assets/image/lifeStyle-profile1.png';
import comport from '@/assets/image/comport.png';
import smartSense from '@/assets/image/smartSense.png';
import Prestige from '@/assets/image/Prestige.png';

interface LifeStyleModalProps {
  showModal: boolean;
  setShowModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function LifeStyleModal({ showModal, setShowModal }: LifeStyleModalProps) {
  const modalRef = useRef<HTMLDivElement>(null);
  const [isAnimating, setIsAnimating] = useState(false);

  const modalOutSideClick = (e: React.MouseEvent<HTMLElement>) => {
    if (modalRef.current === e.target) setIsAnimating(false);
  };

  const eventHandler = (e: KeyboardEvent) => {
    if (e.key === 'Escape') setIsAnimating(false);
  };

  useEffect(() => {
    if (showModal) {
      document.body.classList.add('overflow-hidden');
      document.addEventListener('keydown', eventHandler);
      setTimeout(() => setIsAnimating(true), 10);
    }
  }, [showModal]);

  useEffect(() => {
    if (!isAnimating) {
      document.body.classList.remove('overflow-hidden');
      document.addEventListener('keydown', eventHandler);
      setTimeout(() => setShowModal(false), 1010);
    }
  }, [isAnimating, setShowModal]);

  useEffect(() => {
    return () => {
      document.body.classList.remove('overflow-hidden');
    };
  }, []);

  if (!showModal) return null;
  return (
    <div
      ref={modalRef}
      onClick={e => modalOutSideClick(e)}
      className={`fixed top-0 left-0 z-50 overflow-y-auto md:inset-0 min-h-screen bg-bgModal scale-100 transition-opacity duration-1000 ${
        isAnimating ? 'active opacity-100' : 'opacity-0'
      }`}
    >
      <Wrapper>
        <Header lifeStyleFamily={lifeStyleFamily} logoWhite={logoWhite} />
        <ContentWrapper>
          <Profile lifeStyleProfile={lifeStyleProfile} />
          <Comment
            comment={
              '“우리 아이들과 함께 타는 차는 항상\n안전해야 한다고 생각해요.”'
            }
          />
          <Title title={'For You'} />
          <Option
            trim={'Le Blanc(르블랑)'}
            attribute={'가솔린 8인승 2WD'}
            carImage={Prestige}
            options={[
              { image: comport, name: '컴포트 II' },
              { image: smartSense, name: '현대 스마트 센스 I' },
            ]}
          />
          <UnderLine margin={'my-8'} />
          <Title title={'Interview'} />
          <Interview
            question={'어떤 용도로 차를 사용하세요?'}
            answer={
              '저는 차를 타고 출퇴근도 하지만 주중에 아이들 픽업하거나 마트 갈 때도 자주 타곤 합니다.'
            }
          />
          <Interview
            question={'차를 살 때 가장 중요하게 생각하는 부분이 뭔가요?'}
            answer={
              '저는 차를 살 때 안전을 중요하게 생각해요. 가족들이 같이 타는 차라 항상 사고에 경각심을 갖고 있죠. 펠리세이드는 그 점에서 뒷좌석 에어백도 터지는 모델이라 안심이 되는 편이에요.'
            }
          />
        </ContentWrapper>
      </Wrapper>
    </div>
  );
}

export default LifeStyleModal;
