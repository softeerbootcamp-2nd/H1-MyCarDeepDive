import UnderLine from '@/Components/UnderLine';
import TrimWrapper from './TrimWrapper';
import ExteriorColor from './ExteriorColor';
import InteriorColor from './InteriorColor';
import BasicOption from './BasicOption';
import TrimCarImage from './TrimCarImage';
import TrimInformation from './TrimInformation';
import TrimWheel from './TrimWheel';
import TrimSheet from './TrimSheet';
import TrimNavigation from './TrimNavigation';
import TrimCluster from './TrimCluster';

interface TrimProps {
  carImage: string;
  forYou: string;
  trimName: string;
  price: string;
  exteriorColor: string[];
  interiorColor: string;
  interiorColor2?: string;
  wheelImage: string;
  wheelSize: string;
  wheelName: string;
  sheetImage: string;
  sheetName: string;
  navigationImage: string;
  navigationSize: string;
  navigationName: string;
  clusterImage: string;
  clusterSize: string;
  clusterName: string;
  basicOption: string[];
}

function Trim(props: TrimProps) {
  return (
    <TrimWrapper>
      <TrimCarImage carImage={props.carImage} trimName={props.trimName} />
      <TrimInformation
        forYou={props.forYou}
        trimName={props.trimName}
        price={props.price}
      />

      <ExteriorColor exteriorColor={props.exteriorColor} />
      <InteriorColor
        interiorColor={props.interiorColor}
        interiorColor2={props.interiorColor2}
      />

      <UnderLine
        margin={`${props.interiorColor2 ? 'mt-[7px]' : 'mt-[33px]'} mb-[23px]`}
      />

      <TrimWheel
        wheelImage={props.wheelImage}
        wheelName={props.wheelName}
        wheelSize={props.wheelSize}
      />
      <TrimSheet sheetImage={props.sheetImage} sheetName={props.sheetName} />
      <TrimNavigation
        navigationImage={props.navigationImage}
        navigationName={props.navigationName}
        navigationSize={props.navigationSize}
        sheetName={props.sheetName}
      />
      <TrimCluster
        clusterImage={props.clusterImage}
        clusterName={props.clusterName}
        clusterSize={props.clusterSize}
      />

      <UnderLine margin='mt-[44px] mb-6' />

      <BasicOption basicOption={props.basicOption} />
    </TrimWrapper>
  );
}

export default Trim;
