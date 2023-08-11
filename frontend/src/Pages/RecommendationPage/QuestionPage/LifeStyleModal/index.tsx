import { ModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
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

function LifeStyleModal({ showModal, setShowModal }: ModalProps) {
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
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
    </Modal>
  );
}

export default LifeStyleModal;
