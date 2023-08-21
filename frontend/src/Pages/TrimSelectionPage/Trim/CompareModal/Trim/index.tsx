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

interface Props {
  trims_img_url: string;
  summary: string;
  trim_name: string;
  price: number;
  exterior_color_img_urls: string[];
  interior_color_names: string[];
  wheel_size: number;
  wheel_name: string;
  seat_name: string;
  navigation_size: number;
  cluster_size: number;
  basic_option_names: string[];
  basic_option_ids: number[];
}

function Trim({
  trims_img_url,
  summary,
  trim_name,
  price,
  exterior_color_img_urls,
  interior_color_names,
  wheel_size,
  wheel_name,
  seat_name,
  navigation_size,
  cluster_size,
  basic_option_names,
  basic_option_ids,
}: Props) {
  return (
    <TrimWrapper>
      <TrimCarImage trims_img_url={trims_img_url} trim_name={trim_name} />
      <TrimInformation summary={summary} trim_name={trim_name} price={price} />

      <ExteriorColor exterior_color_img_urls={exterior_color_img_urls} />
      <InteriorColor interior_color_names={interior_color_names} />

      <UnderLine
        margin={`${
          interior_color_names.length > 1 ? 'mt-[7px]' : 'mt-[33px]'
        } mb-[23px]`}
      />

      <TrimWheel wheel_name={wheel_name} wheel_size={wheel_size} />
      <TrimSheet seat_name={seat_name} />
      <TrimNavigation navigation_size={navigation_size} seat_name={seat_name} />
      <TrimCluster cluster_size={cluster_size} />

      <UnderLine margin='mt-[44px] mb-6' />

      <BasicOption
        basic_option_names={basic_option_names}
        basic_option_ids={basic_option_ids}
      />
    </TrimWrapper>
  );
}

export default Trim;
